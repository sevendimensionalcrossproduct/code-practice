import System.IO

main :: IO ()

fizzbuzz :: Int -> String
fizzbuzz n
	| n `mod` 3 == 0 && n `mod` 5 == 0 = show n <> " is divisible by 3 and 5 (FIZZBUZZ!!)"
	| n `mod` 3 == 0 = show n <> " is divisible by 3"
	| n `mod` 5 == 0 = show n <> " is divisible by 5"
	| otherwise = show n
main = mapM_ (putStrLn.fizzbuzz)[1..100]
