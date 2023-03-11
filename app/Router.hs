module Router (foldFixedObjectives) where

import Route hiding (OtherLocations (..), Epilogue (..), Pico (..), Chapter (..), Checkpoint (..))
import BingoModel
import BingoData

import Data.List (intercalate)


foldFixedObjectives :: Objective -> (Route, [Objective]) -> (Route, [Objective])

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

foldFixedObjectives o@(ReachLocation LRockBottom) (r,rqs) = (r, (o:rqs))

foldFixedObjectives o@(ReachLocation _) (_, _) = error $ "Unexpected objective " ++ show o




foldFixedObjectives (TwoGems (LCheckpoint (Checkpoint (Chapter 7 ASide) cpNum1)) (LCheckpoint (Checkpoint (Chapter 7 ASide) cpNum2))) (r,rqs) = (
  routeCheckpointSet True 7 cpNum2 (addTasks ["Get the Gem"]) $
  routeCheckpointSet True 7 cpNum1 (addTasks ["Get the Gem"]) r, rqs)

foldFixedObjectives o@(TwoGems _ _) (_, _) = error $ "Unexpected objective " ++ show o



foldFixedObjectives (DoThingAtLocation BirdsNest LEpilogue) (r,rqs) = (setBirdsNest True r, rqs)

foldFixedObjectives (DoThingAtLocation GetPicoOrb LPico8) (r,rqs) = (setPicoOrb True r, rqs)

foldFixedObjectives o@(DoThingAtLocation AllFlags _) (r,rqs) = (r, (o:rqs))

foldFixedObjectives (DoThingAtLocation thing (LCheckpoint (Checkpoint (Chapter chapterNum side) cpNum))) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum cpNum (addTasks [doSpecificThingToTask thing]) r,rqs)

foldFixedObjectives (DoThingAtLocation thing (LChapter (Chapter chapterNum side))) (r,rqs) = (routeCheckpointSet (sideToBool side) chapterNum (getSpecificThingCp thing) (addTasks [doSpecificThingToTask thing]) r,rqs)

foldFixedObjectives o@(DoThingAtLocation _ _) (_, _) = error $ "Unexpected objective " ++ show o


foldFixedObjectives (MessOrder a b c) (r,rqs) = (routeCheckpointSet True 3 2 (addTasks [messOrderToTask a b c]) r, rqs)



foldFixedObjectives o (r, rqs) = (r, (o:rqs))

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
doSpecificThingToTask AllFlags = error "AllFlags should not be asked for it's name"
doSpecificThingToTask BirdsNest = error "BirdsNest should not be asked for it's name"
doSpecificThingToTask GetPicoOrb = error "GetPicoOrb should not be asked for it's name"

getSpecificThingCp :: DoSpecificThing -> Int
getSpecificThingCp ReadPoem = 3
getSpecificThingCp FindTheoPhone = 1
getSpecificThingCp t = error $ "getSpecificThing no suppoted for" ++ show t