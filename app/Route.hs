module Route (blueHeartCount, showRouteBreakdown, 
routeCheckpointSet, routeCheckpointSetMultiple, 
routeAllCheckpointsSet, routeAllCheckpointsSetMultiple,
setCassette, setComplete, setHeart, addBerries, addBinos, addTasks,
setAllBerriesInChapter, addAllBerriesInCheckpoint, addAllBinosInCheckpoint,
addPicoBerries, setPicoComplete, setPicoOrb, setPicoSite, setBirdsNest,
emptyRoute, Route) where

import Helper
import BingoData

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


type ReachOrb = Bool
type ReachSite = Bool
type BirdsNest = Bool

data Pico = Pico Complete ReachOrb ReachSite Berries
data Epilogue = Epilogue BirdsNest 

data OtherLocations = OtherLocations Pico Epilogue

data Route = Route ASides BSides OtherLocations Time


type RouteAlgebra route asides bsides chap check name time ber bino cas hea com tasks orb site nest loc locs res = (
  route -> res,
  asides -> bsides -> locs -> time -> route,
  [chap] -> asides,
  [chap] -> bsides,
  loc -> loc -> locs,
  name -> [check] -> chap,
  name -> com -> ber -> cas -> hea -> bino -> tasks -> check,
  Name -> name,
  Time -> time,
  Berries -> ber,
  Cassette -> cas,
  Heart -> hea,
  Complete -> com,
  Binos -> bino,
  OtherTasks -> tasks,
  ReachOrb -> orb,
  ReachSite -> site,
  BirdsNest -> nest,
  com -> orb -> site -> ber -> loc,
  nest -> loc
  )

fold :: RouteAlgebra route asides bsides chap check name time ber bino cas hea com tasks orb site nest loc locs res -> Route -> res
fold (resF, routeF, asideF, bsideF, olocF, chapF, checkF, nameF, timeF, berF, casF, heaF, comF, binoF, tasksF, orbF, siteF, nestF, picoF, epilF) = fres
  where
    fres (Route a b (OtherLocations p e) t) = resF $ routeF (asideF $ map fchap a) (bsideF $ map fchap b) (olocF (fpico p) (fepil e)) (timeF t)

    fchap (Chapter n cps) = chapF (nameF n) (map fcheck cps)

    fcheck (Checkpoint n co be ca h bi t) = checkF (nameF n) (comF co) (berF be) (casF ca) (heaF h) (binoF bi) (tasksF t)

    fpico (Pico c o s b) = picoF (comF c) (orbF o) (siteF s) (berF b)
    fepil (Epilogue n) = epilF (nestF n)

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
    alg :: RouteAlgebra Int Int () Int Int () () () () () Int () () () () () () () Int
    alg = (
        id, 
        \x _ _ _ -> x, 
        sum, 
        ignore,
        ignore2,
        \_ xs -> sum xs,
        \_ _ _ _ x _ _ -> x,
        ignore, 
        ignore, 
        ignore, 
        ignore,
        boolToInt,
        ignore,
        ignore,
        ignore,
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

showRouteBreakdown :: Route -> String
showRouteBreakdown = fold alg
  where
    alg :: RouteAlgebra String String String String String String String [String] [String] Bool Bool Bool [String] Bool Bool Bool String String String
    alg = (
        id,
        \a b o t -> a ++ "\n\n\n" ++ b ++ "\n\n\n" ++ if' (null o) "" (o ++ "\n\n\n") ++ t,
        \cs -> "A-sides:\n\n" ++ intercalate "\n\n" (filter (/= "") cs),
        \cs -> "B-sides:\n\n" ++ intercalate "\n\n" (filter (/= "") cs),
        \pic epi -> if' (any (/= "") [pic, epi]) ("Other Locations:\n\n" ++ intercalate "\n" (filter (/= "") [pic, epi])) "",
        showChapter,
        showCheckPoint,
        id,
        const "Estimated Time: Unknown",
        map show . Set.elems,
        id,
        id,
        id,
        map show . Set.elems,
        Set.elems,
        id,
        id,
        id,
        showPico,
        \n -> if' n "Epilogue:\n-Visit Birds Nest" ""
      )

      {-
      ReachOrb -> orb,
  ReachSite -> site,
  BirdsNest -> nest,
  com -> orb -> site -> ber -> loc,
  nest -> loc
  -}

    showChapter :: String -> [String] -> String
    showChapter n cs | any (/= "") cs = n ++ ":\n" ++ intercalate "\n" (filter (/= "") cs)
                     | otherwise      = ""

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

    showPico :: Bool -> Bool -> Bool -> [String] -> String
    showPico True _ _ berries       = "Pico-8:\n-Complete" ++ if' (null berries) "" ("Berries: " ++ unwords berries)
    showPico _ True _ berries       = "Pico-8:\n-Get the orb" ++ if' (null berries) "" ("Berries: " ++ unwords berries)
    showPico _ _ True berries       = "Pico-8:\n-Reach Old Site" ++ if' (null berries) "" ("Berries: " ++ unwords berries)
    showPico _ _ _    berries@(_:_) = "Pico-8:\nBerries: " ++ unwords berries
    showPico _ _ _    _             = ""
    
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

routeAllCheckpointsSetMultiple :: Bool -> Int -> [Checkpoint -> Checkpoint] -> Route -> Route
routeAllCheckpointsSetMultiple aside chapId = flip $ foldr routeSetFunc
  where
    routeSetFunc = routeAllCheckpointsSet aside chapId

routeAllCheckpointsSet :: Bool -> Int -> (Checkpoint -> Checkpoint) -> Route -> Route
routeAllCheckpointsSet True chapId cpFunc (Route asides bsides other time) = Route (setAllCheckpointsChapters' chapId cpFunc asides) bsides other time
routeAllCheckpointsSet False chapId cpFunc (Route asides bsides other time) = Route asides (setAllCheckpointsChapters' chapId cpFunc bsides) other time

setAllCheckpointsChapters' :: Int -> (Checkpoint -> Checkpoint) -> [Chapter] -> [Chapter]
setAllCheckpointsChapters' chapId cpFunc chaps = setAt (chapId-1) (setAllCheckpointsChapter' cpFunc (chaps !! (chapId-1))) chaps

setAllCheckpointsChapter' :: (Checkpoint -> Checkpoint) -> Chapter -> Chapter
setAllCheckpointsChapter' cpFunc (Chapter n cps) = Chapter n $ map cpFunc cps

routeCheckpointSetMultiple :: Bool -> Int -> Int -> [Checkpoint -> Checkpoint] -> Route -> Route
routeCheckpointSetMultiple aside chapId cpId = flip $ foldr routeSetFunc
  where
    routeSetFunc = routeCheckpointSet aside chapId cpId 

routeCheckpointSet :: Bool -> Int -> Int -> (Checkpoint -> Checkpoint) -> Route -> Route
routeCheckpointSet True chapId cpId cpFunc (Route asides bsides other time) = Route (setChapters' chapId cpId cpFunc asides) bsides other time
routeCheckpointSet False chapId cpId cpFunc (Route asides bsides other time) = Route asides (setChapters' chapId cpId cpFunc bsides) other time

setChapters' :: Int -> Int -> (Checkpoint -> Checkpoint) -> [Chapter] -> [Chapter]
setChapters' chapId cpId cpFunc chaps = setAt (chapId-1) (setChapter' cpId cpFunc (chaps !! (chapId-1))) chaps

setChapter' :: Int -> (Checkpoint -> Checkpoint) -> Chapter -> Chapter
setChapter' cpId cpFunc (Chapter n cps) = Chapter n $ setCheckpoints' cpId cpFunc cps

setCheckpoints' :: Int -> (Checkpoint -> Checkpoint) -> [Checkpoint] -> [Checkpoint]
setCheckpoints' cpId cpFunc cps = setAt (cpId-1) (cpFunc $ cps !! (cpId-1)) cps

setAllBerriesInChapter :: Int -> Route -> Route
setAllBerriesInChapter chapId (Route asides bsides other time) = (Route (setAt (chapId-1) (setChapterBerries (asides !! (chapId-1))) asides) bsides other time)
  where
    setChapterBerries :: Chapter -> Chapter
    setChapterBerries (Chapter n cps) = (Chapter n (foldr setCheckPointBerriesFold cps [1 .. length cps]))

    setCheckPointBerriesFold :: Int -> [Checkpoint] -> [Checkpoint]
    setCheckPointBerriesFold cpId = setCheckpoints' cpId (addAllBerriesInCheckpoint (berryCount chapId cpId))

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

addAllBerriesInCheckpoint :: Int -> Checkpoint -> Checkpoint 
addAllBerriesInCheckpoint count (Checkpoint n f _ c h bis ts) = (Checkpoint n f (Set.fromList [1 .. count]) c h bis ts)

addAllBinosInCheckpoint :: Int -> Checkpoint -> Checkpoint 
addAllBinosInCheckpoint count (Checkpoint n f b c h _ ts) = (Checkpoint n f b c h (Set.fromList [1 .. count]) ts)

addPicoBerries :: [Int] -> Route -> Route
addPicoBerries val (Route as bs (OtherLocations (Pico c o s bes) ep) t) = (Route as bs (OtherLocations (Pico c o s (Set.union bes $ Set.fromList val)) ep) t)

setPicoComplete :: Bool -> Route -> Route
setPicoComplete val (Route as bs (OtherLocations (Pico _ o s bes) ep) t) = (Route as bs (OtherLocations (Pico val o s bes) ep) t)

setPicoOrb :: Bool -> Route -> Route
setPicoOrb val (Route as bs (OtherLocations (Pico c _ s bes) ep) t) = (Route as bs (OtherLocations (Pico c val s bes) ep) t)

setPicoSite :: Bool -> Route -> Route
setPicoSite val (Route as bs (OtherLocations (Pico c o _ bes) ep) t) = (Route as bs (OtherLocations (Pico c o val bes) ep) t)

setBirdsNest :: Bool -> Route -> Route
setBirdsNest val (Route as bs (OtherLocations p (Epilogue _)) t) = (Route as bs (OtherLocations p (Epilogue val)) t)

{-
getCheckpointCount :: Int -> Bool -> Route -> Int
getCheckpointCount chapterNum True (Route as _ _ _) = (\Chapter _ cps -> length cps) $ as !! (chapterNum-1)
getCheckpointCount chapterNum False (Route _ bs _ _) = (\Chapter _ cps -> length cps) $ bs !! (chapterNum-1)
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

emptyOtherLocations :: OtherLocations
emptyOtherLocations = OtherLocations (Pico False False False Set.empty) (Epilogue False)
    
emptyRoute :: Route
emptyRoute = Route emptyASides emptyBSides emptyOtherLocations 0


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
