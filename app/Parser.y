{
module Parser where

import BingoModel

import Data.List (intercalate)
import GHC.Float (int2Float)
}

%name happyParseTokens
%tokentype { Token }

%token
  newLine {TNewLine}      
  chapter  {TChapter $$}    
  chapterName {TChapterName $$}  

  readpoem {TReadPoem}
  findletter {TFindLetter}
  readdiary {TReadDiary}
  theophone {TFindTheoPhone}
  reflectioncutscene {TReflectionCutscene}
  picoorb {TGetPicoOrb}
  switchice {TSwitchIce}
  toproute {TTopRoute}
  bottomroute {TBottomRoute}
  easteregg {TEasterEggRoom}
  coreorb {TReachCoreOrb}
  introcar {TReachIntroCar}
  birdsnest {TBirdsNest}
  allflags {TAllFlags}

  kevin4 {TKevin4Sides}
  wingedgolden {TWingedGolden}
  reachrockbottom {TReachRockBottom}

  reflection {TReflection}
  pico8 {TPico8}
  epilogue {TEpilogue}
  bside {TBSide}
  aside {TASide}
  grabless  {TGrabless}
  jumping {TJumping}
  dashing {TDashing}
  cassette {TCassette}
  blueheart {TBlueHeart}
  blueandred {TBlueAndRedHeart}
  blue {TBlue}
  redheart {TRedHeart}
  heart {THeart}
  winged {TWinged}
  seeded {TSeeded}
  berry {TBerry}
  key {TKey}
  bino {TBino}
  gem {TGem}
  oneup {T1Up}
  collectables {TCollectables}
  theo {TTheo}
  checkpoint {TCheckpoint $$}
  chapters {TChapters}
  start {TStart}
  complete {TComplete}
  reach {TReach}
  jumpon {TJumpOn}
  stun {TStun}
  kill {TKill}
  seeker {TSeeker}
  oshiro {TOshiro}
  snowball {TSnowball}
  books {TBooks}
  towels {TTowels}
  chests {TChests}
  times {TTimes}
  without {TWithout}
  get {TGet}
  in {TIn}
  of {TOf}
  all {TAll}
  and {TAnd}
  use {TUse}
  num {TInt $$}
  text {TString $$}
  
%%

Program : Objectives                               {reverse $1}  --left recursion reverses lists

Objectives : Objective                             {[$1]}
           | Objectives newLine Objective          {$3 : $1}
           | Objectives newLine                    {$1}

Objective : EdgeCases                              {$1}
          | grabless Location                      {CompleteWithVariant $2 Grabless}
          | complete Location without jumping      {CompleteWithVariant $2 Jumpless}
          | complete Location without dashing      {CompleteWithVariant $2 Dashless}
          | Prefix Collectable in Location         {CollectablesAtLocation $4 $2}
          | Prefix num Collectable in num chapters {CollectablesAmountInChapters $2 $3 $5}
          | Prefix num Collectable in ChapterType  {CollectablesAmountInChapterType $2 $3 $5}
          | Prefix num Collectable in Location     {CollectablesAmountAtLocation $5 $2 $3}
          | Prefix num Collectable                 {CollectableAmount $3 $2}
          | Location and Location gem              {TwoGems $1 $3}
          | Location                               {Complete $1}
          | complete num ChapterType               {ChapterTypeAmount $3 $2}
          | complete Location                      {Complete $2}
          | Location Collectable                   {CollectablesAtLocation $1 $2}
          | reach Location                         {ReachLocation $2}
          | jumpon num snowball                    {MiscCountTaskAmount JumpOnSnowballs $2}
          | stun oshiro num times                  {MiscCountTaskAmount StunOshiro $3}
          | stun seeker num times                  {MiscCountTaskAmount StunSeeker $3}
          | kill num seeker                        {MiscCountTaskAmount KillSeeker $2}
          | checkpoint MessCP MessCP MessCP        {MessOrder $2 $3 $4}
          | SpecificThing Infix Location           {DoThingAtLocation $1 $3}

Infix : in                                         {}
      | of                                         {}

SpecificThing : readpoem                           {ReadPoem}
              | findletter                         {FindLetter}
              | readdiary                          {ReadDiary}
              | theophone                          {FindTheoPhone}
              | reflectioncutscene                 {ReflectionCutscene}
              | picoorb                            {GetPicoOrb}
              | switchice                          {SwitchIce}
              | toproute                           {TopRoute}
              | bottomroute                        {BottomRoute}
              | easteregg                          {EasterEggRoom}
              | coreorb                            {ReachCoreOrb}
              | introcar                           {ReachIntroCar}
              | birdsnest                          {BirdsNest}
              | allflags                           {AllFlags}


MessCP : books                                     {Books}
       | towels                                    {Towels}
       | chests                                    {Chests}

EdgeCases : reach chapterName in pico8             {ReachLocation LPico8OldSite}
          | kevin4                                 {DoThingAtLocation KevinOn4Sides (LCheckpoint (Checkpoint (Chapter 6 ASide) 2))}
          | easteregg in reflection                {DoThingAtLocation EasterEggRoom (LCheckpoint (Checkpoint (Chapter 6 ASide) 4))}
          | introcar in chapterName                {DoThingAtLocation ReachIntroCar (LCheckpoint (Checkpoint (Chapter 9 ASide) 4))}
          | wingedgolden                           {CollectablesAtLocation (LChapter (Chapter 1 ASide)) WingedGolden}
          | reachrockbottom                        {ReachLocation LRockBottom}


ChapterType : aside                                {ASide}
            | bside                                {BSide}
            | aside and num bside                  {AAndBSide}

Prefix : {- empty -}                               {}
       | all                                       {}
       | use all                                   {}
       | get                                       {}
       | use                                       {}

Location : Chapter                                 {LChapter $1}
         | Checkpoint                              {LCheckpoint $1}
         | pico8                                   {LPico8}
         | epilogue                                {LEpilogue}

Checkpoint : start Chapter                         {Checkpoint $2 1}
           | Chapter start                         {Checkpoint $1 1}
           | checkpoint                            {Checkpoint (Chapter (fst $ fst $1) (charToChapterType $ snd $1)) (snd $ fst $1)}

Chapter : chapter                                  {Chapter (read $ [head $1]) (charToChapterType $ head $ tail $1)}
        | chapterName bside                        {Chapter $1 BSide}
        | chapterName aside                        {Chapter $1 ASide}
        | chapterName                              {Chapter $1 ASide}
        | reflection bside                         {Chapter 6 BSide}
        | reflection aside                         {Chapter 6 ASide}
        | reflection                               {Chapter 6 ASide}
        

Collectable : heart and num cassette               {HeartAndCassette}
            | blue and num redheart                {BlueAndRedHeart}
            | cassette                             {Cassette}
            | blueheart                            {BlueHeart}
            | winged berry                         {WingedBerry}
            | seeded berry                         {SeededBerry}
            | berry                                {Berry}
            | theo                                 {TheoCutscene}
            | key                                  {Key}
            | collectables                         {AllCollectables}
            | oneup                                {OneUp}
            | blueandred                           {BlueAndRedHeart}
            | bino                                 {Bino}
            | gem                                  {Gem}
            | heart                                {Heart}

{

happyError _ = error "parse error"

}
