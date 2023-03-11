module Route (blueHeartCount, showRouteBreakdown, 
routeCheckpointSet, routeCheckpointSetMultiple, 
routeAllCheckpointsSet, routeAllCheckpointsSetMultiple,
setCassette, setComplete, setHeart, addBerries, addBinos, addTasks,
emptyRoute, Route) where

import Helper
import Data.List (intercalate)
import qualified Data.Set as Set

type Berries = Set.Set Int
type Binos = Set.Set Int
type Cassette = Bool
type Heart = Bool
type Complete = Bool
type OtherTasks = Set.Set String

type Name = String
type Time = Float

type ASides = [Chapter]
type BSides = [Chapter]

data Checkpoint = Checkpoint Name Complete Berries Cassette Heart Binos OtherTasks

data Chapter = Chapter Name [Checkpoint]

data Route = Route ASides BSides Time


type RouteAlgebra route asides bsides chap check name time ber bino cas hea com tasks res = (
  route -> res,
  asides -> bsides -> time -> route,
  [chap] -> asides,
  [chap] -> bsides,
  name -> [check] -> chap,
  name -> com -> ber -> cas -> hea -> bino -> tasks -> check,
  Name -> name,
  Time -> time,
  Berries -> ber,
  Cassette -> cas,
  Heart -> hea,
  Complete -> com,
  Binos -> bino,
  OtherTasks -> tasks
  )

fold :: RouteAlgebra route asides bsides chap check name time ber bino cas hea com tasks res -> Route -> res
fold (resF, routeF, asideF, bsideF, chapF, checkF, nameF, timeF, berF, casF, heaF, comF, binoF, tasksF) = fres
  where
    fres (Route a b t) = resF $ routeF (asideF $ map fchap a) (bsideF $ map fchap b) (timeF t)

    fchap (Chapter n cps) = chapF (nameF n) (map fcheck cps)

    fcheck (Checkpoint n co be ca h bi t) = checkF (nameF n) (comF co) (berF be) (casF ca) (heaF h) (binoF bi) (tasksF t)

first3 :: a -> b -> c -> a
first3  x _ _ = x

second3 :: a -> b -> c -> b
second3 _ x _ = x

third3 :: a -> b -> c -> c
third3  _ _ x = x

ignore :: a -> ()
ignore _ = ()

ignore2 :: a -> b -> ()
ignore2 _ _ = () 

boolToInt :: Bool -> Int
boolToInt True  = 1
boolToInt False = 0

blueHeartCount :: Route -> Int
blueHeartCount = fold alg
  where
    alg :: RouteAlgebra Int Int () Int Int () () () () () Int () () Int
    alg = (
        id, 
        first3, 
        sum, 
        ignore,
        \_ xs -> sum xs,
        \_ _ _ _ x _ _ -> x,
        ignore, ignore, ignore, ignore,
        boolToInt,
        ignore,
        ignore,
        ignore
      )

showRouteBreakdown :: Route -> String
showRouteBreakdown = fold alg
  where
    alg :: RouteAlgebra String String String String String String String [String] [String] Bool Bool Bool [String] String
    alg = (
        id,
        \a b t -> a ++ "\n\n\n\n" ++ b ++ "\n\n\n\n" ++ t,
        \cs -> "A-sides:\n\n" ++ intercalate "\n\n" (filter (/= "") cs),
        \cs -> "B-sides:\n\n" ++ intercalate "\n\n" (filter (/= "") cs),
        showChapter,
        showCheckPoint,
        id,
        const "Estimated Time: Unknown",
        map show . Set.elems,
        id,
        id,
        id,
        map show . Set.elems,
        Set.elems
      )

    showChapter :: String -> [String] -> String
    showChapter n cs | not $ any (/= "") cs = ""
                     | otherwise            = n ++ ":\n" ++ intercalate "\n" (filter (/= "") cs)

    showCheckPoint :: String -> Bool -> [String] -> Bool -> Bool -> [String] -> [String] -> String
    showCheckPoint name complete berries cassette heart binos tasks | checkpointIsEmpty name complete berries cassette heart binos tasks = ""
                                                                    | checkpointOnlyComplete name complete berries cassette heart binos tasks = "-" ++ name
                                                                    | otherwise = 
      "-" ++ name ++ 
      if' complete "" " (Do not finish)" ++":\n  " ++ 
      intercalate "\n  " (filter (/= "") $ 
      [
        if' (null berries) "" ("Berries: " ++ unwords berries),
        if' cassette "Cassette" "",
        if' heart "Heart" "",
        if' (null binos) "" ("Binos: " ++ unwords binos)
      ] ++ tasks)
    
    checkpointIsEmpty :: String -> Bool -> [String] -> Bool -> Bool -> [String] -> [String] -> Bool
    checkpointIsEmpty _ True _ _ _ _ _ = False
    checkpointIsEmpty _ _ (_:_) _ _ _ _ = False
    checkpointIsEmpty _ _ _ True _ _ _ = False
    checkpointIsEmpty _ _ _ _ True _ _ = False
    checkpointIsEmpty _ _ _ _ _ (_:_) _ = False
    checkpointIsEmpty _ _ _ _ _ _ (_:_) = False
    checkpointIsEmpty _ _ _ _ _ _ _ = True

    checkpointOnlyComplete :: String -> Bool -> [String] -> Bool -> Bool -> [String] -> [String] -> Bool
    checkpointOnlyComplete _ _ [] False False [] [] = True
    checkpointOnlyComplete _ _ _ _ _ _ _ = False

routeAllCheckpointsSetMultiple :: Bool -> Int -> Route -> [Checkpoint -> Checkpoint] -> Route
routeAllCheckpointsSetMultiple aside chapId = foldr routeSetFunc
  where
    routeSetFunc = routeAllCheckpointsSet aside chapId

routeAllCheckpointsSet :: Bool -> Int -> (Checkpoint -> Checkpoint) -> Route -> Route
routeAllCheckpointsSet True chapId cpFunc (Route asides bsides time) = Route (setAllCheckpointsChapters' chapId cpFunc asides) bsides time
routeAllCheckpointsSet False chapId cpFunc (Route asides bsides time) = Route asides (setAllCheckpointsChapters' chapId cpFunc bsides) time

setAllCheckpointsChapters' :: Int -> (Checkpoint -> Checkpoint) -> [Chapter] -> [Chapter]
setAllCheckpointsChapters' chapId cpFunc chaps = setAt (chapId-1) (setAllCheckpointsChapter' cpFunc (chaps !! (chapId-1))) chaps

setAllCheckpointsChapter' :: (Checkpoint -> Checkpoint) -> Chapter -> Chapter
setAllCheckpointsChapter' cpFunc (Chapter n cps) = Chapter n $ map cpFunc cps

routeCheckpointSetMultiple :: Bool -> Int -> Int -> Route -> [Checkpoint -> Checkpoint] -> Route
routeCheckpointSetMultiple aside chapId cpId = foldr routeSetFunc
  where
    routeSetFunc = routeCheckpointSet aside chapId cpId 

routeCheckpointSet :: Bool -> Int -> Int -> (Checkpoint -> Checkpoint) -> Route -> Route
routeCheckpointSet True chapId cpId cpFunc (Route asides bsides time) = Route (setChapters' chapId cpId cpFunc asides) bsides time
routeCheckpointSet False chapId cpId cpFunc (Route asides bsides time) = Route asides (setChapters' chapId cpId cpFunc bsides) time

setChapters' :: Int -> Int -> (Checkpoint -> Checkpoint) -> [Chapter] -> [Chapter]
setChapters' chapId cpId cpFunc chaps = setAt (chapId-1) (setChapter' cpId cpFunc (chaps !! (chapId-1))) chaps

setChapter' :: Int -> (Checkpoint -> Checkpoint) -> Chapter -> Chapter
setChapter' cpId cpFunc (Chapter n cps) = Chapter n $ setCheckpoints' cpId cpFunc cps

setCheckpoints' :: Int -> (Checkpoint -> Checkpoint) -> [Checkpoint] -> [Checkpoint]
setCheckpoints' cpId cpFunc cps = setAt (cpId-1) (cpFunc $ cps !! (cpId-1)) cps

setComplete :: Bool -> Checkpoint -> Checkpoint
setComplete val (Checkpoint n _ bs c h bis ts) = Checkpoint n val bs c h bis ts

addBerries :: [Int] -> Checkpoint -> Checkpoint
addBerries val (Checkpoint n f bs c h bis ts) = Checkpoint n f (Set.union bs $ Set.fromList val) c h bis ts

setCassette :: Bool -> Checkpoint -> Checkpoint
setCassette val (Checkpoint n f bs _ h bis ts) = Checkpoint n f bs val h bis ts

setHeart :: Bool -> Checkpoint -> Checkpoint
setHeart val (Checkpoint n f bs c _ bis ts) = Checkpoint n f bs c val bis ts

addBinos :: [Int] -> Checkpoint -> Checkpoint
addBinos val (Checkpoint n f bs c h bis ts) = Checkpoint n f bs c h (Set.union bis $ Set.fromList val) ts

addTasks :: [String] -> Checkpoint -> Checkpoint
addTasks val (Checkpoint n f bs c h bis ts) = Checkpoint n f bs c h bis (Set.union ts $ Set.fromList val)

{-
type ASides = [Chapter]
type BSides = [Chapter]

data Checkpoint = Checkpoint Name Complete Berries Cassette Heart Binos OtherTasks

data Chapter = Chapter Name [Checkpoint]

data Route = Route ASides BSides Time
-}

emptyCheckpoint :: Name -> Checkpoint
emptyCheckpoint name = Checkpoint name False Set.empty False False Set.empty Set.empty

createEmptyChapter :: Name -> [Name] -> Chapter
createEmptyChapter chaptername cpNames = Chapter chaptername $ map emptyCheckpoint cpNames

emptyASides :: ASides
emptyASides = [
    createEmptyChapter "Forsaken City" ["Start", "Crossing", "Chasm"],
    createEmptyChapter "Old Site" ["Start", "Intervention", "Awake"],
    createEmptyChapter "Celestial Resort" ["Start", "Huge Mess", "Elevator Shaft", "Presidential Suite"],
    createEmptyChapter "Golden Ridge" ["Start", "Shrine", "Old Trail", "Cliff Face"],
    createEmptyChapter "Mirror Temple" ["Start", "Depths", "Unravelling", "Search", "Recue"],
    createEmptyChapter "Reflection" ["Start", "Lake", "Hollows", "Reflection", "Rock Bottom", "Resolution"],
    createEmptyChapter "Summit" ["0M", "500M", "1000M", "1500M", "2000M", "2500M", "3000M"],
    createEmptyChapter "Core" ["Start", "Into the Core", "Hot and Cold", "Heart of the Mountain"],
    createEmptyChapter "Farewell" ["Start", "Singular", "Power Source", "Remembered", "Event Horizon", "The rest of farewell"],
    createEmptyChapter "Epilogue" ["Epilogue"]
  ]

emptyBSides :: BSides
emptyBSides = [
    createEmptyChapter "Forsaken City" ["Start", "Contraption", "Scrap Pit"],
    createEmptyChapter "Old Site" ["Start", "Combination Lock", "Dream Altar"],
    createEmptyChapter "Celestial Resort" ["Start", "Staff Quarters", "Library", "Rooftop"],
    createEmptyChapter "Golden Ridge" ["Start", "Stepping Stones", "Gusty Canyon", "Eye of the Storm"],
    createEmptyChapter "Mirror Temple" ["Start", "Central Chamber", "Through the Mirror", "Mix Master"],
    createEmptyChapter "Reflection" ["Start", "Reflection", "Rock Bottom", "Reprieve"],
    createEmptyChapter "Summit" ["0M", "500M", "1000M", "1500M", "2000M", "2500M", "3000M"]
  ]
    
emptyRoute :: Route
emptyRoute = Route emptyASides emptyBSides 0


{-
exampleCheckpoint :: Int -> Checkpoint
exampleCheckpoint i = Checkpoint ("Checkpoint" ++ show i) True [1,2] True False [] []

exampleEmptyCheckpoint :: Int -> Checkpoint
exampleEmptyCheckpoint i = Checkpoint ("Checkpoint" ++ show i) False [] False False [] []

exampleChapter :: String -> Chapter
exampleChapter name = Chapter name [exampleCheckpoint 1, exampleCheckpoint 2, exampleEmptyCheckpoint 3]

exampleEmptyChapter :: String -> Chapter
exampleEmptyChapter name = Chapter name [exampleEmptyCheckpoint 1, exampleEmptyCheckpoint 2, exampleEmptyCheckpoint 3]

exmapleRoute :: Route
exmapleRoute = Route [exampleChapter "1a", exampleChapter "2a", exampleEmptyChapter "3a", exampleChapter "4a"] [exampleChapter "3b"] 1.7
-}
