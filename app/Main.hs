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

  let res = foldr foldFixedObjectives (emptyRoute, []) parsedFile

  putStrLn $ showRouteBreakdown $ fst res

  mapM_ print $ snd res

  putStrLn ("Total Objectives: " ++ (show $ length parsedFile))
  putStrLn ("Objectives Routed: " ++ (show $ (length parsedFile) - (length $ snd res)))
  putStrLn ("Remaining Objectives: " ++ (show $ length $ snd res))


tempFilter :: BM.Objective -> Bool
tempFilter (BM.DoThingAtLocation _ _) = True
tempFilter _ = False