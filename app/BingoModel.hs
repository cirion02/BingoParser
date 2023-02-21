module BingoModel where

data Token = 
    TNewLine                     |
    TKevin4Sides                 |
    TWingedGolden                |
    TReachRockBottom             |
    TReadPoem                    |
    TFindLetter                  |
    TReadDiary                   |
    TFindTheoPhone               |
    TReflectionCutscene          |
    TGetPicoOrb                  |
    TSwitchIce                   |
    TTopRoute                    |
    TBottomRoute                 |
    TEasterEggRoom               |
    TReachCoreOrb                |
    TReachIntroCar               |
    TBirdsNest                   |
    TAllFlags                    |
    TChapter String              |
    TChapterName Int             |
    TReflection                  |
    TPico8                       |
    TEpilogue                    |
    TBSide                       |
    TASide                       |
    TGrabless                    |
    TJumping                     |
    TDashing                     |
    TCassette                    |
    TBlueHeart                   |
    TBlueAndRedHeart             |
    TBlue                        |
    TRedHeart                    |
    THeart                       |
    TBerry                       |
    TTheo                        |
    TWinged                      |
    TSeeded                      |
    TKey                         |
    TBino                        |
    TGem                         |
    T1Up                         |
    TCollectables                |
    TChapters                    |
    TStart                       |
    TCheckpoint ((Int,Int),Char) |
    TComplete                    |
    TReach                       |
    TJumpOn                      |
    TStun                        |
    TKill                        |
    TSeeker                      |
    TOshiro                      |
    TSnowball                    |
    TBooks                       |
    TTowels                      |
    TChests                      |
    TTimes                       |
    TWithout                     |
    TGet                         |
    TAnd                         |
    TIn                          |
    TOf                          |
    TAll                         |
    TUse                         |
    TInt Int                     |
    TString String      
  deriving (Eq, Show)

data Variant = Grabless | Jumpless | Dashless
  deriving (Eq, Show)

data Collectable = Cassette | Heart | BlueHeart | RedHeart | BlueAndRedHeart | HeartAndCassette | Berry | Bino | Key 
                 | TheoCutscene | WingedBerry | SeededBerry | AllCollectables | OneUp | Gem | WingedGolden
  deriving (Eq, Show)

data ChapterType = ASide | BSide | AAndBSide
  deriving (Eq, Show)

data Chapter = Chapter Int ChapterType
  deriving (Eq, Show)

data Checkpoint = Checkpoint Chapter Int
  deriving (Eq, Show)

data Location = LChapter Chapter | LCheckpoint Checkpoint | LPico8 | LPico8OldSite | LEpilogue | LRockBottom
  deriving (Eq, Show)

data MiscCountTask = JumpOnSnowballs | StunOshiro | KillSeeker | StunSeeker 
  deriving (Eq, Show)

data MessSection = Books | Towels | Chests
  deriving (Eq, Show)

data DoSpecificThing = ReadPoem | FindLetter | ReadDiary | FindTheoPhone | ReflectionCutscene | GetPicoOrb | SwitchIce 
                     | TopRoute | BottomRoute | EasterEggRoom | ReachCoreOrb | ReachIntroCar | BirdsNest | AllFlags
  deriving (Eq, Show)

data Objective = 
    CompleteWithVariant Location Variant                        |
    CollectableAmount Collectable Int                           |
    CollectablesAtLocation Location Collectable                 |
    Complete Location                                           |
    CollectablesAmountInChapters Int Collectable Int            |
    CollectablesAmountAtLocation Location Int Collectable       |
    CollectablesAmountInChapterType Int Collectable ChapterType |
    ChapterTypeAmount ChapterType Int                           |
    ReachLocation Location                                      |
    MiscCountTaskAmount MiscCountTask Int                       |
    MessOrder MessSection MessSection MessSection               |
    DoThingAtLocation DoSpecificThing Location                  |
    TwoGems Location Location                                   |
    KevinOn4Sides
  deriving (Eq, Show)



charToChapterType :: Char -> ChapterType
charToChapterType 'A' = ASide
charToChapterType 'B' = BSide
charToChapterType _   = error "Invalid chapterType"