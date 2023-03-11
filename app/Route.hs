module Route where

import Helper
import Data.List (intercalate)

type Berries = [Int]
type Binos = [Int]
type Cassette = Bool
type Heart = Bool
type Complete = Bool
type OtherTasks = [String]

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
boolToInt False = 1

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
        (\a b t -> a ++ "\n\n\n\n" ++ b ++ "\n\n\n\n" ++ t),
        (\cs -> "A-sides:\n\n" ++ intercalate "\n\n" (filter (\a -> a /= "") cs)),
        (\cs -> "B-sides:\n\n" ++ intercalate "\n\n" (filter (\a -> a /= "") cs)),
        showChapter,
        showCheckPoint,
        id,
        (\_ -> "Estimated Time: Unknown"),
        map show,
        id,
        id,
        id,
        map show,
        id
      )

    showChapter :: String -> [String] -> String
    showChapter n cs | filter (\a -> a /= "") cs == [] = ""
                     | otherwise                       = n ++ ":\n" ++ intercalate "\n" (filter (\a -> a /= "") cs)

    showCheckPoint :: String -> Bool -> [String] -> Bool -> Bool -> [String] -> [String] -> String
    showCheckPoint name complete berries cassette heart binos tasks | checkpointIsEmpty name complete berries cassette heart binos tasks = ""
                                                                    | checkpointOnlyComplete name complete berries cassette heart binos tasks = "-" ++ name
                                                                    | otherwise = 
      "-" ++ name ++ 
      (if' complete "" " (Do not finish)") ++":\n  " ++ 
      intercalate "\n  " (filter (\a -> a /= "") $ 
      [
        (if' (length berries > 0) ("Berries: " ++ intercalate " " berries) ""),
        (if' cassette "Cassette" ""),
        (if' heart "Heart" ""),
        (if' (length binos > 0) ("Binos: " ++ intercalate " " binos) "")
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




{-
type ASides = [Chapter]
type BSides = [Chapter]

data Checkpoint = Checkpoint Name Complete Berries Cassette Heart Binos OtherTasks

data Chapter = Chapter Name [Checkpoint]

data Route = Route ASides BSides Time
-}

emptyCheckpoint :: Name -> Checkpoint
emptyCheckpoint name = Checkpoint name False [] False False [] []

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
    createEmptyChapter "Epilogue" ["Epilogue"],
    createEmptyChapter "Core" ["Start", "Into the Core", "Hot and Cold", "Heart of the Mountain"],
    createEmptyChapter "Farewell" ["Start", "Singular", "Power Source", "Remembered", "Event Horizon", "The rest of farewell"]
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
