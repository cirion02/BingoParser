module Main (main) where

import Lexer
import Parser
import Route

main :: IO ()
main = do
  bingoFile <- readFile "BingoGenerators\\lockout.txt"
  let temp = alexScanTokens bingoFile
  
  let parsedFile = happyParseTokens temp

  mapM_ print parsedFile

  putStrLn $ showRouteBreakdown emptyRoute
