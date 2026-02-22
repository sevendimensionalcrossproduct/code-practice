package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"sync"
    "strconv"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/mattn/go-sqlite3"
)

var db *sql.DB

func initDB() {
	var err error
	db, err = sql.Open("sqlite3", "./data.db")
	if err != nil {
		log.Fatalf("failed to open database: %v", err)
	}
}

type Character struct {
	Character     string          `json:"character"`
	Charindex     int             `json:"charindex"`
	Readings      json.RawMessage `json:"readings,omitempty"`
	Series        json.RawMessage `json:"series,omitempty"`
	Grade         float64         `json:"grade"`
	JLPT          string          `json:"jlpt"`
	Kanken        float64         `json:"kanken"`
	Form          *string         `json:"form,omitempty"`
	Type          *string         `json:"type,omitempty"`
	Determinative *string         `json:"determinative,omitempty"`
}

type LookupResult struct {
	Character *Character
	Error     error
}

func LookupCharacter(char string, wg *sync.WaitGroup, ch chan<- LookupResult) {
	defer wg.Done()

	if char == "" {
		return
	}

	row := db.QueryRow(`SELECT * FROM characters WHERE character = ?`, char)

	var c Character
	var readings, series sql.NullString

	err := row.Scan(
		&c.Character, &c.Charindex, &readings, &series, &c.Grade,
		&c.JLPT, &c.Kanken, &c.Form, &c.Type, &c.Determinative,
	)
	if err != nil {
		if err == sql.ErrNoRows {
			ch <- LookupResult{Error: fmt.Errorf("no character found for %s", char)}
			return
		}
		ch <- LookupResult{Error: fmt.Errorf("query error for %s: %v", char, err)}
		return
	}

	if readings.Valid {
		c.Readings = json.RawMessage(readings.String)
	}
	if series.Valid {
		c.Series = json.RawMessage(series.String)
	}

	ch <- LookupResult{Character: &c}
}

func main() {
	initDB()
	defer db.Close()

	router := gin.Default()

	router.Use(cors.New(cors.Config{
		AllowOrigins: []string{"http://localhost:6969"},
		AllowMethods: []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders: []string{"Content-Type", "Authorization"},
	}))

	router.GET("/character/:chars", func(c *gin.Context) {
		param := c.Param("chars")
		if len(param) == 0 {
			c.JSON(http.StatusBadRequest, gin.H{"error": "no characters provided"})
			return
		}
		if len(c.Request.URL.Path) > 200 {
			c.JSON(http.StatusBadRequest, gin.H{"error": "URL too long"})
			return
		}

		chars := []rune(param)
		ch := make(chan LookupResult, len(chars))
		var wg sync.WaitGroup

		for _, r := range chars {
			wg.Add(1)
			go LookupCharacter(string(r), &wg, ch)
		}

		go func() {
			wg.Wait()
			close(ch)
		}()

		var results []Character
		var notFound []string
		for res := range ch {
			if res.Error != nil {
				notFound = append(notFound, res.Error.Error())
				continue
			}
			results = append(results, *res.Character)
		}

		if len(results) == 0 {
			c.JSON(http.StatusNotFound, gin.H{
				"error": "no characters found",
				"details": notFound,
			})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"Hit":  results,
			"Miss": notFound,
		})
	})

    router.GET("/index/:id", func(c *gin.Context) {
	idParam := c.Param("id")

	id, err := strconv.Atoi(idParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "invalid index"})
		return
	}

	var char Character
	var readings, series sql.NullString

	err = db.QueryRow(`SELECT * FROM characters WHERE charindex = ?`, id).Scan(
		&char.Character, &char.Charindex, &readings, &series, &char.Grade,
		&char.JLPT, &char.Kanken, &char.Form, &char.Type, &char.Determinative,
	)

    if err != nil {
        if err == sql.ErrNoRows {
            c.JSON(http.StatusNotFound, gin.H{
                "Hit":  []Character{},
                "Miss": []string{fmt.Sprintf("no character found for %d", id)},
            })
            return
        }
        c.JSON(http.StatusInternalServerError, gin.H{
            "Hit":  []Character{},
            "Miss": []string{fmt.Sprintf("query error: %v", err)},
        })
        return
    }

	if readings.Valid {
		char.Readings = json.RawMessage(readings.String)
	}
	if series.Valid {
		char.Series = json.RawMessage(series.String)
	}

	c.JSON(http.StatusOK, gin.H{
        "Hit":  []Character{char},
        "Miss": []string{},
    })
})

	router.Run(":4200")
}
