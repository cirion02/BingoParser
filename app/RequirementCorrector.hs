module RequirementCorrector (correctRedundantRequirement) where

import Requirement

import Data.List (nub)

correctRedundantRequirement :: [Requirement] -> [Requirement]
correctRedundantRequirement = removeLowerCollectableCountsThanTotalInChapters 
                              . removeLowerCollectableCounts 
                              . removeLowerCollectablesInChapterCount
                              . removeLowerCollectableCountInChapters
                              . removeLowerCollectableCountInChapterTypeCount
                              . removeLowerPico8BerriesCount
                              . removeDuplicates

removeDuplicates :: [Requirement] -> [Requirement]
removeDuplicates = nub

removeLowerCollectableCounts :: [Requirement] -> [Requirement]
removeLowerCollectableCounts rqs' = foldr typeFilter rqs' allRCollectables
  where
    typeFilter :: RCollectable -> [Requirement] -> [Requirement]
    typeFilter col rqs = filter (filterFunc col $ maxCount col rqs) rqs

    maxCount :: RCollectable -> [Requirement] -> Int
    maxCount col = maximum . (map $ reqCount col)

    reqCount :: RCollectable -> Requirement -> Int
    reqCount col (RCollectableCount i col') | col == col' = i
    reqCount _ _ = 0

    filterFunc :: RCollectable -> Int -> Requirement -> Bool
    filterFunc col m (RCollectableCount i col') | i < m && col == col' = False
    filterFunc _ _ _ = True

removeLowerCollectablesInChapterCount :: [Requirement] -> [Requirement]
removeLowerCollectablesInChapterCount rqs' = foldr sidesFilter rqs' [True, False]
  where
    sidesFilter :: Bool -> [Requirement] -> [Requirement]
    sidesFilter side rqs = foldr (chapterFilter side) rqs [1..9]

    chapterFilter :: Bool -> Int -> [Requirement] -> [Requirement]
    chapterFilter side cNum rqs = foldr (typeFilter side cNum) rqs allRCollectables 

    typeFilter :: Bool -> Int -> RCollectable -> [Requirement] -> [Requirement]
    typeFilter side cNum col rqs = filter (filterFunc side cNum col $ maxCount side cNum col rqs) rqs

    maxCount :: Bool -> Int -> RCollectable -> [Requirement] -> Int
    maxCount side cNum col = maximum . (map $ reqCount side cNum col)

    reqCount :: Bool -> Int -> RCollectable -> Requirement -> Int
    reqCount side cNum col (RCollectablesInChapter side' cNum' i col') | side == side' && cNum == cNum' && col == col' = i
    reqCount _ _ _ _ = 0

    filterFunc :: Bool -> Int -> RCollectable -> Int -> Requirement -> Bool
    filterFunc side cNum col m (RCollectablesInChapter side' cNum' i col') | i < m && side == side' && cNum == cNum' && col == col' = False
    filterFunc _ _ _ _ _ = True

removeLowerCollectableCountInChapters :: [Requirement] -> [Requirement]
removeLowerCollectableCountInChapters rqs' = foldr chaptersFilter rqs' [1..20]
  where
    chaptersFilter :: Int -> [Requirement] -> [Requirement]
    chaptersFilter cCount rqs = foldr (typeFilter cCount) rqs allRCollectables 

    typeFilter :: Int -> RCollectable -> [Requirement] -> [Requirement]
    typeFilter cCount col rqs = filter (filterFunc cCount col $ maxCount cCount col rqs) rqs

    maxCount :: Int -> RCollectable -> [Requirement] -> Int
    maxCount cCount col = maximum . (map $ reqCount cCount col)

    reqCount :: Int -> RCollectable -> Requirement -> Int
    reqCount cCount col (RCollectableCountInChapters i cCount' col') | cCount == cCount' && col == col' = i
    reqCount _ _ _ = 0

    filterFunc :: Int -> RCollectable -> Int -> Requirement -> Bool
    filterFunc cCount col m (RCollectableCountInChapters i cCount' col') | col == col' && ((i < m && cCount' <= cCount) || (i == m && cCount' < cCount)) = False
    filterFunc _ _ _ _ = True


removeLowerCollectableCountInChapterTypeCount :: [Requirement] -> [Requirement]
removeLowerCollectableCountInChapterTypeCount rqs' = foldr sidesFiler rqs' [True,False]
  where
    sidesFiler :: Bool -> [Requirement] -> [Requirement]
    sidesFiler sides rqs = foldr (typeFilter sides) rqs allRCollectables

    typeFilter :: Bool -> RCollectable -> [Requirement] -> [Requirement]
    typeFilter sides col rqs = filter (filterFunc sides col $ maxCount sides col rqs) rqs

    maxCount :: Bool -> RCollectable -> [Requirement] -> Int
    maxCount sides col = maximum . (map $ reqCount sides col)

    reqCount :: Bool -> RCollectable -> Requirement -> Int
    reqCount sides col (RCollectableCountInChapterType side' i col') | sides == side' && col == col' = i
    reqCount _ _ _ = 0

    filterFunc :: Bool -> RCollectable -> Int -> Requirement -> Bool
    filterFunc sides col m (RCollectableCountInChapterType side' i col') | i < m && sides == side' && col == col' = False
    filterFunc _ _ _ _ = True

removeLowerPico8BerriesCount :: [Requirement] -> [Requirement]
removeLowerPico8BerriesCount rqs = filter (filterFunc $ maxCount rqs) rqs
  where
    maxCount :: [Requirement] -> Int
    maxCount = maximum . (map reqCount)

    reqCount :: Requirement -> Int
    reqCount (RPico8Berries i) = i
    reqCount _ = 0

    filterFunc :: Int -> Requirement -> Bool
    filterFunc m (RPico8Berries i) | i < m = False
    filterFunc _ _ = True

removeLowerCollectableCountsThanTotalInChapters :: [Requirement] -> [Requirement]
removeLowerCollectableCountsThanTotalInChapters rqs = rqs

