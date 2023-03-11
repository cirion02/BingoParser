module Router where

import Route
import BingoModel



foldFixedObjectives :: Objective -> (Route, [Requirement]) -> (Route, [Requirement])
foldFixedObjectives (CompleteWithVariant (LCheckpoint (Checkpoint (Chapter chapterNum ASide) checkpointNum)) variant) (r, rqs) = (routeCheckpointSetMultiple True chapterNum checkpointNum r [setComplete True, addTasks [variantToTask variant]], rqs)
foldFixedObjectives (CompleteWithVariant (LCheckpoint (Checkpoint (Chapter chapterNum BSide) checkpointNum)) variant) (r, rqs) = (routeCheckpointSetMultiple False chapterNum checkpointNum r [setComplete True, addTasks [variantToTask variant]], rqs)
foldFixedObjectives _ (r, rqs) = (r, rqs)


variantToTask :: Variant -> String
variantToTask Grabless = "Complete grabless"
variantToTask Jumpless = "Complete without jumping"
variantToTask Dashless = "Complete without dashing"

data Requirement = Nothing | Something