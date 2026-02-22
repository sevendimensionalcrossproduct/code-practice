# Project Setup and Development Guide

---

### Starting the Server
**Click `cabal run` on root directory.**

---

## Development Environment

**First go to `/front_end` then click `pnpm install`, then go back to root directory and click `cabal run`. Dev environment recommends clicking `webpack --watch` on `/front_end` directory for more pleasurable coding experience.**

---

## Future plans

- **Add jisho's api to look up words and display them.**
- **Use tatoeba's api on the previous thing to look up entire sentences.**
- **Since the series fetch pulls kanji that arent on the db, add a way to identify them (eg painting them red like a nonexistent wikipedia link) and then add a form or something to easily implement them manually.**
- **Currently trying to fetch a character with null series will cause a server error.**
