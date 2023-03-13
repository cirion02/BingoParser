module Requirement (module Requirement) where

import BingoModel

collectableToRCollectable :: Collectable -> [RCollectable]
collectableToRCollectable Cassette = [RCassette]
collectableToRCollectable Heart = [RHeart]
collectableToRCollectable BlueHeart = [RBlueHeart]
collectableToRCollectable RedHeart = [RBSide]
collectableToRCollectable BlueAndRedHeart = [RBlueHeart, RBSide]
collectableToRCollectable HeartAndCassette = [RHeart, RCassette]
collectableToRCollectable Berry = [RBerry]
collectableToRCollectable Bino = [RBino]
collectableToRCollectable Key = [RKey]
collectableToRCollectable TheoCutscene = [RTheoCutscene]
collectableToRCollectable WingedBerry = [RWinged]
collectableToRCollectable SeededBerry = [RSeeded]
collectableToRCollectable OneUp = [R1up]
collectableToRCollectable Gem = [RGem]
collectableToRCollectable AllCollectables = error "AllCollectables is not a valid RCollectable"
collectableToRCollectable WingedGolden = error "WingedGolden is not a valid RCollectable"

miscTaskToRCollectable :: MiscCountTask -> RCollectable
miscTaskToRCollectable JumpOnSnowballs = RSnowballBops
miscTaskToRCollectable StunOshiro = ROshiroStuns
miscTaskToRCollectable StunSeeker = RSeekerStuns
miscTaskToRCollectable KillSeeker = RSeekerKills

chapterTypeToRCollectable :: ChapterType -> [RCollectable]
chapterTypeToRCollectable ASide = [RASide]
chapterTypeToRCollectable BSide = [RBSide]
chapterTypeToRCollectable AAndBSide = [RASide, RBSide]

data RCollectable = RTheoCutscene | RBerry | R1up | RHeart | RBlueHeart | RASide | RBSide 
                  | RBino | RSeeded | RWinged | RCassette | RKey | RSeekerStuns | ROshiroStuns
                  | RSnowballBops | RSeekerKills | RGem
  deriving (Eq, Show)

data Requirement = RCollectableCount Int RCollectable 
                 | RCollectablesInChapter Bool Int Int RCollectable
                 | RCollectableCountInChapters Int Int RCollectable
                 | RCollectableCountInChapterType Bool Int RCollectable
                 | RPico8Berries Int
                 | RAllFlags
                 | RReachRockBottom
  deriving (Eq, Show)

allRCollectables :: [RCollectable]
allRCollectables = [RTheoCutscene , RBerry , R1up , RHeart , RBlueHeart , RASide , RBSide 
                  , RBino , RSeeded , RWinged , RCassette , RKey , RSeekerStuns , ROshiroStuns
                  , RSnowballBops , RSeekerKills , RGem]