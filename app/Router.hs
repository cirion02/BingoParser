module Router where

import Route
import BingoModel



foldFixedObjectives :: Objective -> (Route, [Objective]) -> (Route, [Objective])

foldFixedObjectives (CompleteWithVariant (LCheckpoint (Checkpoint (Chapter chapterNum side) checkpointNum)) variant) (r, rqs) = (routeCheckpointSetMultiple (sideToBool side) chapterNum checkpointNum r [setComplete True, addTasks [variantToTask variant]], rqs)
foldFixedObjectives (CompleteWithVariant (LChapter (Chapter chapterNum side)) variant) (r, rqs) = (routeAllCheckpointsSetMultiple (sideToBool side) chapterNum r [setComplete True, addTasks [variantToTask variant]], rqs)
foldFixedObjectives (CompleteWithVariant l _) (_, _) = error $ "CompleteWithVariant has a location it does not understand: " ++ show l

foldFixedObjectives o@(CollectableAmount _ _) (r,rqs) = (r, o:rqs)


foldFixedObjectives _ (r, rqs) = (r, rqs)

sideToBool :: ChapterType -> Bool
sideToBool ASide = True
sideToBool BSide = False
sideToBool AAndBSide = error "Attemption to cast AAndBSide to Bool"

variantToTask :: Variant -> String
variantToTask Grabless = "Complete grabless"
variantToTask Jumpless = "Complete without jumping"
variantToTask Dashless = "Complete without dashing"

data Requirement = Nothing | Something