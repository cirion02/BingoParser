module FixedObjectiveRouter (foldFixedObjectives, Requirement (..)) where

import Route hiding (OtherLocations (..), Epilogue (..), Pico (..), Chapter (..), Checkpoint (..))
import BingoModel
import BingoData

import Data.List (intercalate)


foldFixedObjectives :: Objective -> (Route, [Requirement]) -> (Route, [Requirement])

foldFixedObjectives (CompleteWithVariant (LCheckpoint (Checkpoint (Chapter chapterNum side) checkpointNum)) variant) (r, rqs) = (routeCheckpointSetMultiple (sideToBool side) chapterNum checkpointNum [setComplete True, addTasks [variantToTask variant]] r, rqs)

foldFixedObjectives (CompleteWithVariant (LChapter (Chapter chapterNum side)) variant) (r, rqs) = (routeAllCheckpointsSetMultiple (sideToBool side) chapterNum [setComplete True, addTasks [variantToTask variant]] r, rqs)

foldFixedObjectives o@(CompleteWithVariant _ _) (_, _) = error $ "Unexpected objective " ++ show o



foldFixedObjectives (Complete (LCheckpoint (Checkpoint (Chapter chapterNum side) checkpointNum))) (r, rqs) = (routeCheckpointSet (sideToBool side) chapterNum checkpointNum (setComplete True) r, rqs)

foldFixedObjectives (Complete (LChapter (Chapter chapterNum side))) (r, rqs) = (routeAllCheckpointsSet (sideToBool side) chapterNum (setComplete True) r, rqs)

foldFixedObjectives (Complete LPico8) (r, rqs) = (setPicoComplete True r, rqs)

foldFixedObjectives o@(Complete _) (_, _) = error $ "Unexpected objective " ++ show o



foldFixedObjectives (CollectablesAtLocation (LChapter (Chapter chapterNum ASide)) BlueHeart) (r,rqs) = (routeCheckpointSet True chapterNum (getHeartCp chapterNum) (setHeart True) r, rqs)

foldFixedObjectives (CollectablesAtLocation (LChapter (Chapter chapterNum ASide)) BlueAndRedHeart) (r,rqs) = (routeAllCheckpointsSet False chapterNum (setComplete True) $ routeCheckpointSet True chapterNum (getHeartCp chapterNum) (setHeart True) r, rqs)

foldFixedObjectives (CollectablesAtLocation (LChapter (Chapter chapterNum ASide)) Cassette) (r,rqs) = (routeCheckpointSet True chapterNum (getCassetteCp chapterNum) (setCassette True) r, rqs)

foldFixedObjectives (CollectablesAtLocation (LChapter (Chapter chapterNum ASide)) AllCollectables) (r,rqs) = (
  setAllBerriesInChapter chapterNum $  
  routeCheckpointSet True chapterNum (getHeartCp chapterNum) (setHeart True) $ 
  routeCheckpointSet True chapterNum (getCassetteCp chapterNum) (setCassette True) r
  , rqs)

foldFixedObjectives (CollectablesAtLocation (LChapter (Chapter chapterNum side)) Bino) (r,rqs) = (setAllBinosInChapter (sideToBool side) chapterNum r, rqs)

foldFixedObjectives (CollectablesAtLocation (LChapter (Chapter 1 ASide)) WingedGolden) (r,rqs) = (
  routeCheckpointSet True 1 3 (addTasks [variantToTask Dashless, "Winged Golden Berry"]) $  
  routeCheckpointSet True 1 2 (addTasks [variantToTask Dashless]) $ 
  routeCheckpointSet True 1 1 (addTasks [variantToTask Dashless]) r
  , rqs)

foldFixedObjectives (CollectablesAtLocation (LCheckpoint (Checkpoint (Chapter chapterNum ASide) cpNum)) Berry) (r,rqs) = (routeCheckpointSet True chapterNum cpNum (addAllBerriesInCheckpoint $ berryCount chapterNum cpNum) r, rqs)

foldFixedObjectives (CollectablesAtLocation (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum)) Bino) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum cpNum (addAllBinosInCheckpoint $ binoCount (sideToBool side) chapterNum cpNum) r, rqs)

foldFixedObjectives (CollectablesAtLocation (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum)) TheoCutscene) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum cpNum (addTasks ["Talk to Theo"]) r, rqs)

foldFixedObjectives (CollectablesAtLocation (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum)) Key) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum cpNum (addTasks ["Get the key"]) r, rqs)

foldFixedObjectives o@(CollectablesAtLocation _ _) (_, _) = error $ "Unexpected objective " ++ show o



foldFixedObjectives (ReachLocation (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum))) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum (cpNum-1) (setComplete True) r, rqs)

foldFixedObjectives (ReachLocation LPico8OldSite) (r,rqs) = (setPicoSite True r, rqs)

foldFixedObjectives (ReachLocation LRockBottom) (r,rqs) = (r, (RReachRockBottom:rqs))

foldFixedObjectives o@(ReachLocation _) (_, _) = error $ "Unexpected objective " ++ show o




foldFixedObjectives (TwoGems (LCheckpoint (Checkpoint (Chapter 7 ASide) cpNum1)) (LCheckpoint (Checkpoint (Chapter 7 ASide) cpNum2))) (r,rqs) = (
  routeCheckpointSet True 7 cpNum2 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 cpNum1 (addTasks ["Get the Gem"]) r, rqs)

foldFixedObjectives o@(TwoGems _ _) (_, _) = error $ "Unexpected objective " ++ show o



foldFixedObjectives (DoThingAtLocation BirdsNest LEpilogue) (r,rqs) = (setBirdsNest True r, rqs)

foldFixedObjectives (DoThingAtLocation GetPicoOrb LPico8) (r,rqs) = (setPicoOrb True r, rqs)

foldFixedObjectives (DoThingAtLocation AllFlags _) (r,rqs) = (r, (RAllFlags:rqs))

foldFixedObjectives (DoThingAtLocation thing (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum))) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum cpNum (addTasks [doSpecificThingToTask thing]) r,rqs)

foldFixedObjectives (DoThingAtLocation thing (LChapter (Chapter chapterNum side))) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum (getSpecificThingCp thing) (addTasks [doSpecificThingToTask thing]) r,rqs)

foldFixedObjectives o@(DoThingAtLocation _ _) (_, _) = error $ "Unexpected objective " ++ show o

foldFixedObjectives (MessOrder a b c) (r,rqs) = (routeCheckpointSet True 3 2 (addTasks [messOrderToTask a b c]) r, rqs)


foldFixedObjectives (CollectablesAmountAtLocation (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum)) i Key) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum cpNum (addTasks ["Get " ++ show i ++ " keys"]) r, rqs)

foldFixedObjectives o@(CollectablesAmountAtLocation (LCheckpoint (Checkpoint (Chapter _ _) _)) _ _) (_,_) = error $ "Unexpected objective " ++ show o

foldFixedObjectives (CollectablesAmountAtLocation (LChapter (Chapter chapterNum side)) i c) (r,rqs) = (r, (map (RCollectablesInChapter (sideToBool side) chapterNum i) $ collectableToRCollectable c) ++ rqs)

foldFixedObjectives (CollectablesAmountAtLocation LPico8 i Berry) (r,rqs) = (r, (RPico8Berries i:rqs))


foldFixedObjectives (CollectableAmount c i) (r,rqs) = (r, (map (RCollectableCount i) $ collectableToRCollectable c) ++ rqs)


foldFixedObjectives (MiscCountTaskAmount t i) (r,rqs) = (r, (RCollectableCount i (miscTaskToRCollectable t) : rqs))


foldFixedObjectives (ChapterTypeAmount t i) (r,rqs) = (r, (map (RCollectableCount i) $ chapterTypeToRCollectable t) ++ rqs)

foldFixedObjectives (CollectablesAmountInChapters i c j) (r,rqs) = (r, (map (RCollectableCountInChapters i j) $ collectableToRCollectable c) ++ rqs)

foldFixedObjectives (CollectablesAmountInChapterType i c t) (r,rqs) = (r, (map (RCollectableCountInChapterType (sideToBool t) i) $ collectableToRCollectable c) ++ rqs)

foldFixedObjectives o (_, _) = error $ "Unexpected objective " ++ show o




sideToBool :: ChapterType -> Bool
sideToBool ASide = True
sideToBool BSide = False
sideToBool AAndBSide = error "Attemption to cast AAndBSide to Bool"

variantToTask :: Variant -> String
variantToTask Grabless = "Complete grabless"
variantToTask Jumpless = "Complete without jumping"
variantToTask Dashless = "Complete without dashing"

messOrderToTask :: MessSection -> MessSection -> MessSection -> String
messOrderToTask a b c = "Mess Order: " ++ (intercalate " -> " $ map show [a,b,c])

doSpecificThingToTask :: DoSpecificThing -> String
doSpecificThingToTask ReadPoem = "Read the poem"
doSpecificThingToTask FindLetter = "Reach PICO-8 and read the letter"
doSpecificThingToTask ReadDiary = "Read the diary"
doSpecificThingToTask FindTheoPhone = "Find Theo's Phone"
doSpecificThingToTask ReflectionCutscene = "Watch the Reflection cutscene"
doSpecificThingToTask SwitchIce = "Get the switch on the right"
doSpecificThingToTask TopRoute = "Only use top route rooms"
doSpecificThingToTask BottomRoute = "Only use bottom route rooms"
doSpecificThingToTask EasterEggRoom = "Visit easter egg room"
doSpecificThingToTask ReachCoreOrb = "Reach the badeline orb"
doSpecificThingToTask ReachIntroCar = "Reach intro car"
doSpecificThingToTask KevinOn4Sides = "Hit a kevin on all 4 sides"
doSpecificThingToTask TakeHiddenPath = "Take hidden path at the end"
doSpecificThingToTask DontSkipFinalCutscene = "Don't skip the final cutscene"
doSpecificThingToTask AllFlags = error "AllFlags should not be asked for it's name"
doSpecificThingToTask BirdsNest = error "BirdsNest should not be asked for it's name"
doSpecificThingToTask GetPicoOrb = error "GetPicoOrb should not be asked for it's name"

getSpecificThingCp :: DoSpecificThing -> Int
getSpecificThingCp ReadPoem = 3
getSpecificThingCp FindTheoPhone = 1
getSpecificThingCp t = error $ "getSpecificThing no suppoted for" ++ show t

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