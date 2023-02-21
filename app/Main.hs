module Main (main) where

import Lexer
import Parser

main :: IO ()
main = do
  bingoFile <- readFile "BingoGenerators\\lockout.txt"
  let temp = alexScanTokens bingoFile
  
  print temp
  
  let parsedFile = happyParseTokens temp

  mapM_ print parsedFile
