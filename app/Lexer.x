{
module Lexer where

import BingoModel
}

%wrapper "basic"

$newline = [\n]
$numbers = [0-9]
$chapterNumber = [1-8]
$chapterSide = [AB]
$stringChars = [a-zA-Z0-9\(\)\-\/\'\:]
$chars = [a-zA-Z0-9\-\/\'\:]

tokens :-
  $newline                      {\_ -> TNewLine}
  $newline$white+               {\_ -> TNewLine}
  $white+$newline               {\_ -> TNewLine}

  "Read the Poem"               {\_ -> TReadPoem}
  "Find Letter and PICO-8"      {\_ -> TFindLetter}
  "Read Diary"                  {\_ -> TReadDiary}
  "Find Theo's Phone"           {\_ -> TFindTheoPhone}
  "Reflection Cutscene"         {\_ -> TReflectionCutscene}
  "Get the Orb"                 {\_ -> TGetPicoOrb}
  "Switch to Ice on the right"  {\_ -> TSwitchIce}
  "Only top route"              {\_ -> TTopRoute}
  "Only bottom route"           {\_ -> TBottomRoute}
  "Easteregg Room"              {\_ -> TEasterEggRoom}
  "Reach the Orb"               {\_ -> TReachCoreOrb}
  "Reach an Intro Car"          {\_ -> TReachIntroCar}
  "Visit the Bird's Nest"       {\_ -> TBirdsNest}
  "All Flags"                   {\_ -> TAllFlags}

  "Hit a Kevin block from all 4 sides" {\_ -> TKevin4Sides}
  "Reach Rock Bottom (6A/6B Checkpoint)" {\_ -> TReachRockBottom}
  "Winged Golden Berry"         {\_ -> TWingedGolden}

  "2000M (7B Checkpoint)"       {\_ -> TCheckpoint ((7,5),'B')}
  "("($chars|$white)+")"        ;
  "Crossing"                    {\_ -> TCheckpoint ((1,2),'A')}
  "Chasm"                       {\_ -> TCheckpoint ((1,3),'A')}
  "Intervention"                {\_ -> TCheckpoint ((2,2),'A')}
  "Awake"                       {\_ -> TCheckpoint ((2,3),'A')}
  "Huge Mess"                   {\_ -> TCheckpoint ((3,2),'A')}
  "Elevator Shaft"              {\_ -> TCheckpoint ((3,3),'A')}
  "Presidential Suite"          {\_ -> TCheckpoint ((3,4),'A')}
  "Shrine"                      {\_ -> TCheckpoint ((4,2),'A')}
  "Old Trail"                   {\_ -> TCheckpoint ((4,3),'A')}
  "Cliff Face"                  {\_ -> TCheckpoint ((4,4),'A')}
  "Depths"                      {\_ -> TCheckpoint ((5,2),'A')}
  "Unraveling"                  {\_ -> TCheckpoint ((5,3),'A')}
  "Search"                      {\_ -> TCheckpoint ((5,4),'A')}
  "Rescue"                      {\_ -> TCheckpoint ((5,5),'A')}
  "Lake"                        {\_ -> TCheckpoint ((6,2),'A')}
  "Hollows"                     {\_ -> TCheckpoint ((6,3),'A')}
  --This space intentionally left blank
  "Rock Bottom"                 {\_ -> TCheckpoint ((6,5),'A')}
  "Resolution"                  {\_ -> TCheckpoint ((6,6),'A')}
  "0M"                          {\_ -> TCheckpoint ((7,1),'A')}
  "500M"                        {\_ -> TCheckpoint ((7,2),'A')}
  "1000M"                       {\_ -> TCheckpoint ((7,3),'A')}
  "1500M"                       {\_ -> TCheckpoint ((7,4),'A')}
  "2000M"                       {\_ -> TCheckpoint ((7,5),'A')}
  "2500M"                       {\_ -> TCheckpoint ((7,6),'A')}
  "3000M"                       {\_ -> TCheckpoint ((7,7),'A')}
  "Into the Core"               {\_ -> TCheckpoint ((8,2),'A')}
  "Hot and Cold"                {\_ -> TCheckpoint ((8,3),'A')}
  "Heart of the Mountain"       {\_ -> TCheckpoint ((8,4),'A')}
  "Power Source"                {\_ -> TCheckpoint ((9,3),'A')}
  "Event Horizon"               {\_ -> TCheckpoint ((9,5),'A')}
  "Library"                     {\_ -> TCheckpoint ((3,3),'B')}
  "Forsaken City"               {\_ -> TChapterName 1}
  "Old Site"                    {\_ -> TChapterName 2}
  "Celestial Resort"            {\_ -> TChapterName 3}
  "Golden Ridge"                {\_ -> TChapterName 4}
  "Mirror Temple"               {\_ -> TChapterName 5}
  "Reflection"                  {\_ -> TReflection}  --This is done differently because the name is used for things that aren't the chapter
  "The Summit"                  {\_ -> TChapterName 7}
  "Core"                        {\_ -> TChapterName 8}
  "Farewell"                    {\_ -> TChapterName 9}
  "Epilogue"                    {\_ -> TEpilogue}
  "PICO-8"                      {\_ -> TPico8}
  $chapterNumber$chapterSide    {\s -> TChapter s}
  [Gg]"rabless"                 {\_ -> TGrabless}
  "jumping"                     {\_ -> TJumping}
  "dashing"                     {\_ -> TDashing}
  [Cc]"assette"s?               {\_ -> TCassette}
  [Bb]"err"("ies" | "y")        {\_ -> TBerry}
  "Blue and Red Heart"          {\_ -> TBlueAndRedHeart}
  [Bb]"lue "[Hh]"eart"s?        {\_ -> TBlueHeart}
  [Hh]"eart"s?                  {\_ -> THeart}
  [Bb]"lue"                     {\_ -> TBlue}
  [Rr]"ed "[Hh]"eart"s?         {\_ -> TRedHeart}
  "optional Theo cutscenes"     {\_ -> TTheo}
  "Talk to Theo"                {\_ -> TTheo}
  [Ww]"inged"                   {\_ -> TWinged}
  [Ss]"eeded"                   {\_ -> TSeeded}
  [Tt]"he "[Kk]"ey"             {\_ -> TKey}
  [Kk]"ey"s?                    {\_ -> TKey}
  [Gg]"em"s?                    {\_ -> TGem}
  "1-"[Uu]"p"s?                 {\_ -> T1Up}
  [Bb]"inocular"s?              {\_ -> TBino}
  [Cc]"ollect"[ai]"bles"        {\_ -> TCollectables}
  "B-Side"s?                    {\_ -> TBSide}   
  "A-Side"s?                    {\_ -> TASide}
  [Cc]"hapter"s?                {\_ -> TChapters}
  [Ss]"tart of"                 {\_ -> TStart}
  [Ss]"tart"                    {\_ -> TStart}
  "Complete"                    {\_ -> TComplete}
  [Rr]"each"                    {\_ -> TReach}
  [Jj]"ump on"                  {\_ -> TJumpOn}
  [Ss]"tun"                     {\_ -> TStun}
  [Dd]"ifferent"                ;
  [Kk]"ill"                     {\_ -> TKill}
  [Ss]"eeker"s?                 {\_ -> TSeeker}
  [Oo]"shiro"                   {\_ -> TOshiro}
  [Ss]"nowball"s?               {\_ -> TSnowball}
  [Bb]"ook"s?                   {\_ -> TBooks}
  [Tt]"owel"s?                  {\_ -> TTowels}
  [Cc]"hest"s?                  {\_ -> TChests}
  [Tt]"ime"s?                   {\_ -> TTimes}
  "without"                     {\_ -> TWithout}
  "in"                          {\_ -> TIn}
  "of"                          {\_ -> TOf}
  "and"                         {\_ -> TAnd}
  [Gg]"et"                      {\_ -> TGet}
  [Aa]"ll"                      {\_ -> TAll}
  [Uu]"se"                      {\_ -> TUse}
  $numbers+                     {\i -> TInt $ read i}
  $white+                       ;
  ":"                           ;
  "a"                           {\_ -> TInt 1}
  "two"                         {\_ -> TInt 2}
  "three"                       {\_ -> TInt 3}
  $stringChars+                 {\s -> TString s}
  
  
{

mainn' = do
  s <- getContents
  print (alexScanTokens s)
}
