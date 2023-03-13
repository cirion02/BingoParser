module GetRouteValues where

import Route
import qualified Data.Set as Set

blueHeartCount :: Route -> Int
blueHeartCount = routeFold alg
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

{-

route asides bsides chap check name time ber bino cas hea com tasks orb site nest loc locs res

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
-}

gemCount :: Route -> Int
gemCount = routeFold alg
  where
    alg :: RouteAlgebra Int Int () Int Int () () () () () () () Int () () () () () Int
    alg = (
        id, 
        \x _ _ _ -> x, 
        sum, 
        ignore,
        ignore2,
        \_ xs -> sum xs,
        \_ _ _ _ _ _ t -> t,
        ignore, 
        ignore, 
        ignore, 
        ignore,
        ignore,
        ignore,
        ignore,
        boolToInt . (Set.member "Get the Gem"),
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

chapterBinoCount :: Route -> ([Int],[Int])
chapterBinoCount = routeFold alg
  where
    alg :: RouteAlgebra ([Int],[Int]) [Int] [Int] Int Int () () () Int () () () () () () () () () ([Int],[Int])
    alg = (
        id, 
        \x y _ _ -> (x,y), 
        id, 
        id,
        ignore2,
        \_ xs -> sum xs,
        \_ _ _ _ _ x _ -> x,
        ignore, 
        ignore, 
        ignore,
        ignore,
        ignore,
        ignore,
        Set.size,
        ignore,
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

chapterBerryCount :: Route -> [Int]
chapterBerryCount = routeFold alg
  where
    alg :: RouteAlgebra [Int] [Int] () Int Int () () Int () () () () Int () () () () () [Int]
    alg = (
        id, 
        \x _ _ _ -> x, 
        id, 
        ignore,
        ignore2,
        \_ xs -> sum xs,
        \_ _ x _ _ _ t -> x + t,
        ignore, 
        ignore, 
        Set.size, 
        ignore,
        ignore,
        ignore,
        ignore,
        boolToInt . (Set.member "Winged Golden Berry"),
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

aSideCount :: Route -> Int
aSideCount = routeFold alg
  where
    alg :: RouteAlgebra Int Int () Bool Bool () () () () () () Bool () () () () () () Int
    alg = (
        id, 
        \x _ _ _ -> x, 
        \x -> sum $ map boolToInt x, 
        ignore,
        ignore2,
        \_ xs -> last xs,
        \_ x _ _ _ _ _ -> x,
        ignore, 
        ignore, 
        ignore, 
        ignore,
        ignore,
        id,
        ignore,
        ignore,
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

bSideCount :: Route -> Int
bSideCount = routeFold alg
  where
    alg :: RouteAlgebra Int () Int Bool Bool () () () () () () Bool () () () () () () Int
    alg = (
        id, 
        \_ x _ _ -> x, 
        ignore,
        \x -> sum $ map boolToInt x, 
        ignore2,
        \_ xs -> last xs,
        \_ x _ _ _ _ _ -> x,
        ignore, 
        ignore, 
        ignore, 
        ignore,
        ignore,
        id,
        ignore,
        ignore,
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

heartCount :: Route -> Int
heartCount r = bSideCount r + blueHeartCount r

binoCount :: Route -> Int
binoCount = routeFold alg
  where
    alg :: RouteAlgebra Int Int Int Int Int () () () Int () () () () () () () () () Int
    alg = (
        id, 
        \x y _ _ -> x + y, 
        sum, 
        sum,
        ignore2,
        \_ xs -> sum xs,
        \_ _ _ _ _ x _ -> x,
        ignore, 
        ignore, 
        ignore, 
        ignore,
        ignore,
        ignore,
        Set.size,
        ignore,
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )

berryCount :: Route -> Int
berryCount = routeFold alg
  where
    alg :: RouteAlgebra Int Int () Int Int () () Int () () () () Int () () () () () Int
    alg = (
        id, 
        \x _ _ _ -> x, 
        sum, 
        ignore,
        ignore2,
        \_ xs -> sum xs,
        \_ _ x _ _ _ t -> x + t,
        ignore, 
        ignore, 
        Set.size, 
        ignore,
        ignore,
        ignore,
        ignore,
        boolToInt . (Set.member "Winged Golden Berry"),
        ignore,
        ignore,
        ignore,
        \_ _ _ _ -> (),
        ignore
      )