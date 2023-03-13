module RouteCorrector (correctImpossibleRoute) where

import Route
import BingoData

-- This does not fix routes that use multiple assist skips
correctImpossibleRoute :: Route -> Route
correctImpossibleRoute = correctCheckpointWithoutPrevious . correctBsideWithoutCassette . correctCoreCompleteWithoutHeart . correctCoreHeartWithoutComplete . correctSummitBlueWithoutGems . correctPicoWithoutMess


correctPicoWithoutMess :: Route -> Route
correctPicoWithoutMess r@(Route _ _ (OtherLocations (Pico False False False bs) _) _) | null bs = r
correctPicoWithoutMess r = routeCheckpointSet True 3 1 (setComplete True) r

correctSummitBlueWithoutGems :: Route -> Route
correctSummitBlueWithoutGems r | (\(Checkpoint _ _ _ _ h _ _) -> h) $ getCheckpoint True 7 7 r = 
  routeCheckpointSet True 7 6 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 5 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 4 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 3 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 2 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 1 (addTasks ["Get the Gem"]) r
                              | otherwise = r

correctCoreCompleteWithoutHeart :: Route -> Route
correctCoreCompleteWithoutHeart r | (\(Checkpoint _ c _ _ _ _ _) -> c) $ getCheckpoint True 8 4 r = routeCheckpointSet True 8 4 (setHeart True) r
                                  | otherwise = r

correctCoreHeartWithoutComplete :: Route -> Route
correctCoreHeartWithoutComplete r | (\(Checkpoint _ _ _ _ h _ _) -> h) $ getCheckpoint True 8 4 r = routeCheckpointSet True 8 4 (setComplete True) r
                                  | otherwise = r

correctBsideWithoutCassette :: Route -> Route
correctBsideWithoutCassette r = foldr correctBsideWithoutCassette' r [1..7]

correctBsideWithoutCassette' :: Int -> Route -> Route
correctBsideWithoutCassette' chapterNum r | chapterIsEmpty $ getChapter False chapterNum r = r
                                          | otherwise = routeCheckpointSet True chapterNum (getCassetteCp chapterNum) (setCassette True) r

correctCheckpointWithoutPrevious :: Route -> Route
correctCheckpointWithoutPrevious r = foldr (correctCheckpointWithoutPrevious' False) (foldr (correctCheckpointWithoutPrevious' True) r [1..9]) [1..7]

correctCheckpointWithoutPrevious' :: Bool -> Int -> Route -> Route
correctCheckpointWithoutPrevious' side chapterNum r = correctCheckpointWithoutPrevious'' side (getCheckpointCount side chapterNum r) chapterNum r

correctCheckpointWithoutPrevious'' :: Bool -> Int -> Int -> Route -> Route
correctCheckpointWithoutPrevious'' _ 0 _ r = r
correctCheckpointWithoutPrevious'' side cpNum chapterNum r | checkpointIsEmpty $ getCheckpoint side chapterNum cpNum r = correctCheckpointWithoutPrevious'' side (cpNum - 1) chapterNum r
                                                           | otherwise = correctCheckpointWithoutPrevious''' side chapterNum (cpNum - 1) r

correctCheckpointWithoutPrevious''' :: Bool -> Int -> Int -> Route -> Route
correctCheckpointWithoutPrevious''' side chapterNum 0 r = routeCheckpointSet side chapterNum 0 (setComplete True) r
correctCheckpointWithoutPrevious''' side chapterNum cpNum r = correctCheckpointWithoutPrevious''' side chapterNum (cpNum-1) $ routeCheckpointSet side chapterNum cpNum (setComplete True) r