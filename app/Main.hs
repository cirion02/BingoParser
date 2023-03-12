module Main (main) where

import Lexer
import Parser
import Route
import Router
import RouteCorrector

import BingoModel as BM

import Data.List (intercalate, sort)

main :: IO ()
main = do
  bingoFile <- readFile "BingoGenerators\\blackout.txt"
  let temp = alexScanTokens bingoFile

  print temp
  
  let parsedFile = happyParseTokens temp

  writeFile "output\\output.txt" $ intercalate "\n" $ sort $ map show parsedFile

  mapM_ print $ filter tempFilter parsedFile

  let res = foldr foldFixedObjectives (emptyRoute, []) parsedFile

  putStrLn $ showRouteBreakdown $ correctImpossibleRoute $ fst res

  mapM_ print $ snd res

  putStrLn ("Total Objectives: " ++ (show $ length parsedFile))
  putStrLn ("Objectives Routed: " ++ (show $ (length parsedFile) - (length $ snd res)))
  putStrLn ("Remaining Objectives: " ++ (show $ length $ snd res))


tempFilter :: BM.Objective -> Bool
tempFilter (BM.DoThingAtLocation _ _) = True
tempFilter _ = False 