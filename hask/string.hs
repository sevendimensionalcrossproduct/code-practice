import System.IO

main :: IO ()
main =  putStr "What is your first name? " >>
        getLine >>= \ first ->
        putStr "And your last name? " >>
        getLine >>= \ last ->
        let full = first ++ " " ++ last
        in putStrLn ("Pleased to meet you, " ++ full ++ "!")