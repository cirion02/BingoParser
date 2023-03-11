module Main (main) where

import Lexer
import Parser
import Route
import Router

import BingoModel as BM

main :: IO ()
main = do
  bingoFile <- readFile "BingoGenerators\\lockout.txt"
  let temp = alexScanTokens bingoFile
  
  let parsedFile = happyParseTokens temp

  mapM_ print $ filter tempFilter parsedFile

  putStrLn $ showRouteBreakdown $ fst $ foldr foldFixedObjectives (emptyRoute, []) parsedFile


tempFilter :: BM.Objective -> Bool
tempFilter (BM.MiscCountTaskAmount _ _) = True
tempFilter _ = False