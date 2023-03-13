module Main (main) where

import Lexer
import Parser
import Route
import FixedObjectiveRouter
import RouteCorrector
import RequirementCorrector
import GetRouteValues

import BingoModel as BM

import Data.List (intercalate, sort)

main :: IO ()
main = do
  bingoFile <- readFile "BingoGenerators\\lockout.txt"
  let temp = alexScanTokens bingoFile

  --print temp
  
  let parsedFile = happyParseTokens temp

  -- writeFile "output\\output.txt" $ intercalate "\n" $ sort $ map show parsedFile

  -- mapM_ print $ filter tempFilter parsedFile

  let res = foldr foldFixedObjectives (emptyRoute, []) parsedFile

  let route = correctImpossibleRoute $ fst res

  putStrLn $ showRouteBreakdown $ route

  let rqs = snd res

  mapM_ putStrLn $ sort $ map show $ correctRedundantRequirement rqs

  print $ binoCount route
  print $ berryCount route
  print $ blueHeartCount route
  print $ aSideCount route
  print $ bSideCount route
  print $ heartCount route
  print $ chapterBerryCount route
  print $ chapterBinoCount route
  print $ gemCount route

  putStrLn ("Total Objectives: " ++ (show $ length parsedFile))
  putStrLn ("Objectives Routed: " ++ (show $ (length parsedFile) - (length $ snd res)))
  putStrLn ("Remaining Objectives: " ++ (show $ length $ snd res))


{-
tempFilter :: BM.Objective -> Bool
tempFilter (BM.CollectablesAmountInChapters _ _ _) = True
tempFilter _ = False 
-}