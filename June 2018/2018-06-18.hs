import Data.List.Split
import Control.Monad
import System.Random

type DiceRoll = (Int, Int)
type InputLine = String
type Result = Int

main :: IO ()
main = do
  text <- readFile "dice.txt"
  rolls <- mapM (rollDice . parseRoll) $ lines text
  mapM_ format $ zip (lines text) rolls

format :: (InputLine, [Result]) -> IO ()
format (str, xs) = putStrLn $ str ++ " => " ++ show (sum xs) ++ ": " ++ show xs

rollDice :: DiceRoll -> IO [Result]
rollDice (x,y) = replicateM x $ randomRIO (1, y)

parseRoll :: InputLine -> DiceRoll
parseRoll = merge . map read . splitOn "d"
  where merge xs = (head xs, last xs)
