{-# OPTIONS_GHC -w #-}
module Parser where

import BingoModel

import Data.List (intercalate)
import GHC.Float (int2Float)
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,332) ([0,65534,639,59392,18439,1,65504,10239,32768,32894,20,256,0,0,0,0,0,0,0,0,0,0,0,0,0,12288,0,0,0,0,0,0,0,0,65264,7,512,0,0,61184,127,2048,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6144,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,112,10240,0,0,0,0,0,7168,0,1536,4096,0,0,0,24576,0,7,640,8192,0,6,112,10240,0,0,0,0,0,0,32,0,0,0,6144,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,512,0,0,0,0,8192,0,0,0,0,32,0,0,0,0,0,0,0,32768,1,0,16,0,0,0,0,0,0,0,0,0,1024,0,0,6144,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,128,0,0,0,1,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,112,10240,0,0,0,0,0,0,1,0,0,65264,7,0,24576,0,7,640,0,0,0,0,0,0,0,0,0,0,0,0,65024,32767,2,2024,328,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1536,28672,0,40,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,8192,0,0,0,0,448,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,3072,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,16,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,96,7936,32768,2,32,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseTokens","Program","Objectives","Objective","Infix","SpecificThing","MessCP","EdgeCases","ChapterType","Prefix","Location","Checkpoint","Chapter","Collectable","newLine","chapter","chapterName","readpoem","findletter","readdiary","theophone","reflectioncutscene","picoorb","switchice","toproute","bottomroute","easteregg","coreorb","introcar","birdsnest","allflags","kevin4","wingedgolden","reachrockbottom","reflection","pico8","epilogue","bside","aside","grabless","jumping","dashing","cassette","blueheart","blueandred","blue","redheart","heart","winged","seeded","berry","key","bino","gem","oneup","collectables","theo","checkpoint","chapters","start","complete","reach","jumpon","stun","kill","seeker","oshiro","snowball","books","towels","chests","times","without","get","in","of","all","and","use","num","text","%eof"]
        bit_start = st Prelude.* 84
        bit_end = (st Prelude.+ 1) Prelude.* 84
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..83]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (18) = happyShift action_10
action_0 (19) = happyShift action_11
action_0 (20) = happyShift action_12
action_0 (21) = happyShift action_13
action_0 (22) = happyShift action_14
action_0 (23) = happyShift action_15
action_0 (24) = happyShift action_16
action_0 (25) = happyShift action_17
action_0 (26) = happyShift action_18
action_0 (27) = happyShift action_19
action_0 (28) = happyShift action_20
action_0 (29) = happyShift action_21
action_0 (30) = happyShift action_22
action_0 (31) = happyShift action_23
action_0 (32) = happyShift action_24
action_0 (33) = happyShift action_25
action_0 (34) = happyShift action_26
action_0 (35) = happyShift action_27
action_0 (36) = happyShift action_28
action_0 (37) = happyShift action_29
action_0 (38) = happyShift action_30
action_0 (39) = happyShift action_31
action_0 (42) = happyShift action_32
action_0 (60) = happyShift action_33
action_0 (62) = happyShift action_34
action_0 (63) = happyShift action_35
action_0 (64) = happyShift action_36
action_0 (65) = happyShift action_37
action_0 (66) = happyShift action_38
action_0 (67) = happyShift action_39
action_0 (76) = happyShift action_40
action_0 (79) = happyShift action_41
action_0 (81) = happyShift action_42
action_0 (4) = happyGoto action_43
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (8) = happyGoto action_4
action_0 (10) = happyGoto action_5
action_0 (12) = happyGoto action_6
action_0 (13) = happyGoto action_7
action_0 (14) = happyGoto action_8
action_0 (15) = happyGoto action_9
action_0 _ = happyReduce_52

action_1 (18) = happyShift action_10
action_1 (19) = happyShift action_11
action_1 (20) = happyShift action_12
action_1 (21) = happyShift action_13
action_1 (22) = happyShift action_14
action_1 (23) = happyShift action_15
action_1 (24) = happyShift action_16
action_1 (25) = happyShift action_17
action_1 (26) = happyShift action_18
action_1 (27) = happyShift action_19
action_1 (28) = happyShift action_20
action_1 (29) = happyShift action_21
action_1 (30) = happyShift action_22
action_1 (31) = happyShift action_23
action_1 (32) = happyShift action_24
action_1 (33) = happyShift action_25
action_1 (34) = happyShift action_26
action_1 (35) = happyShift action_27
action_1 (36) = happyShift action_28
action_1 (37) = happyShift action_29
action_1 (38) = happyShift action_30
action_1 (39) = happyShift action_31
action_1 (42) = happyShift action_32
action_1 (60) = happyShift action_33
action_1 (62) = happyShift action_34
action_1 (63) = happyShift action_35
action_1 (64) = happyShift action_36
action_1 (65) = happyShift action_37
action_1 (66) = happyShift action_38
action_1 (67) = happyShift action_39
action_1 (76) = happyShift action_40
action_1 (79) = happyShift action_41
action_1 (81) = happyShift action_42
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (8) = happyGoto action_4
action_1 (10) = happyGoto action_5
action_1 (12) = happyGoto action_6
action_1 (13) = happyGoto action_7
action_1 (14) = happyGoto action_8
action_1 (15) = happyGoto action_9
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (17) = happyShift action_86
action_2 _ = happyReduce_1

action_3 _ = happyReduce_2

action_4 (77) = happyShift action_84
action_4 (78) = happyShift action_85
action_4 (7) = happyGoto action_83
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_5

action_6 (45) = happyShift action_66
action_6 (46) = happyShift action_67
action_6 (47) = happyShift action_68
action_6 (48) = happyShift action_69
action_6 (50) = happyShift action_70
action_6 (51) = happyShift action_71
action_6 (52) = happyShift action_72
action_6 (53) = happyShift action_73
action_6 (54) = happyShift action_74
action_6 (55) = happyShift action_75
action_6 (56) = happyShift action_76
action_6 (57) = happyShift action_77
action_6 (58) = happyShift action_78
action_6 (59) = happyShift action_79
action_6 (82) = happyShift action_82
action_6 (16) = happyGoto action_81
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (45) = happyShift action_66
action_7 (46) = happyShift action_67
action_7 (47) = happyShift action_68
action_7 (48) = happyShift action_69
action_7 (50) = happyShift action_70
action_7 (51) = happyShift action_71
action_7 (52) = happyShift action_72
action_7 (53) = happyShift action_73
action_7 (54) = happyShift action_74
action_7 (55) = happyShift action_75
action_7 (56) = happyShift action_76
action_7 (57) = happyShift action_77
action_7 (58) = happyShift action_78
action_7 (59) = happyShift action_79
action_7 (80) = happyShift action_80
action_7 (16) = happyGoto action_65
action_7 _ = happyReduce_15

action_8 _ = happyReduce_58

action_9 (62) = happyShift action_64
action_9 _ = happyReduce_57

action_10 _ = happyReduce_64

action_11 (40) = happyShift action_62
action_11 (41) = happyShift action_63
action_11 _ = happyReduce_67

action_12 _ = happyReduce_28

action_13 _ = happyReduce_29

action_14 _ = happyReduce_30

action_15 _ = happyReduce_31

action_16 _ = happyReduce_32

action_17 _ = happyReduce_33

action_18 _ = happyReduce_34

action_19 _ = happyReduce_35

action_20 _ = happyReduce_36

action_21 _ = happyReduce_37

action_22 _ = happyReduce_38

action_23 _ = happyReduce_39

action_24 _ = happyReduce_40

action_25 _ = happyReduce_41

action_26 _ = happyReduce_46

action_27 _ = happyReduce_47

action_28 _ = happyReduce_48

action_29 (40) = happyShift action_60
action_29 (41) = happyShift action_61
action_29 _ = happyReduce_70

action_30 _ = happyReduce_59

action_31 _ = happyReduce_60

action_32 (18) = happyShift action_10
action_32 (19) = happyShift action_11
action_32 (37) = happyShift action_29
action_32 (38) = happyShift action_30
action_32 (39) = happyShift action_31
action_32 (60) = happyShift action_51
action_32 (62) = happyShift action_34
action_32 (13) = happyGoto action_59
action_32 (14) = happyGoto action_8
action_32 (15) = happyGoto action_9
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (71) = happyShift action_56
action_33 (72) = happyShift action_57
action_33 (73) = happyShift action_58
action_33 (9) = happyGoto action_55
action_33 _ = happyReduce_63

action_34 (18) = happyShift action_10
action_34 (19) = happyShift action_11
action_34 (37) = happyShift action_29
action_34 (15) = happyGoto action_54
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (18) = happyShift action_10
action_35 (19) = happyShift action_11
action_35 (37) = happyShift action_29
action_35 (38) = happyShift action_30
action_35 (39) = happyShift action_31
action_35 (60) = happyShift action_51
action_35 (62) = happyShift action_34
action_35 (82) = happyShift action_53
action_35 (13) = happyGoto action_52
action_35 (14) = happyGoto action_8
action_35 (15) = happyGoto action_9
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (18) = happyShift action_10
action_36 (19) = happyShift action_50
action_36 (37) = happyShift action_29
action_36 (38) = happyShift action_30
action_36 (39) = happyShift action_31
action_36 (60) = happyShift action_51
action_36 (62) = happyShift action_34
action_36 (13) = happyGoto action_49
action_36 (14) = happyGoto action_8
action_36 (15) = happyGoto action_9
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (82) = happyShift action_48
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (68) = happyShift action_46
action_38 (69) = happyShift action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (82) = happyShift action_45
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_55

action_41 _ = happyReduce_53

action_42 (79) = happyShift action_44
action_42 _ = happyReduce_56

action_43 (84) = happyAccept
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_54

action_45 (68) = happyShift action_105
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (82) = happyShift action_104
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (82) = happyShift action_103
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (70) = happyShift action_102
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_19

action_50 (40) = happyShift action_62
action_50 (41) = happyShift action_63
action_50 (77) = happyShift action_101
action_50 _ = happyReduce_67

action_51 _ = happyReduce_63

action_52 (75) = happyShift action_100
action_52 _ = happyReduce_17

action_53 (40) = happyShift action_98
action_53 (41) = happyShift action_99
action_53 (11) = happyGoto action_97
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_61

action_55 (71) = happyShift action_56
action_55 (72) = happyShift action_57
action_55 (73) = happyShift action_58
action_55 (9) = happyGoto action_96
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_42

action_57 _ = happyReduce_43

action_58 _ = happyReduce_44

action_59 _ = happyReduce_6

action_60 _ = happyReduce_68

action_61 _ = happyReduce_69

action_62 _ = happyReduce_65

action_63 _ = happyReduce_66

action_64 _ = happyReduce_62

action_65 _ = happyReduce_18

action_66 _ = happyReduce_73

action_67 _ = happyReduce_74

action_68 _ = happyReduce_82

action_69 (80) = happyShift action_95
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (80) = happyShift action_94
action_70 _ = happyReduce_85

action_71 (53) = happyShift action_93
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (53) = happyShift action_92
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_77

action_74 _ = happyReduce_79

action_75 _ = happyReduce_83

action_76 _ = happyReduce_84

action_77 _ = happyReduce_81

action_78 _ = happyReduce_80

action_79 _ = happyReduce_78

action_80 (18) = happyShift action_10
action_80 (19) = happyShift action_11
action_80 (37) = happyShift action_29
action_80 (38) = happyShift action_30
action_80 (39) = happyShift action_31
action_80 (60) = happyShift action_51
action_80 (62) = happyShift action_34
action_80 (13) = happyGoto action_91
action_80 (14) = happyGoto action_8
action_80 (15) = happyGoto action_9
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (77) = happyShift action_90
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (45) = happyShift action_66
action_82 (46) = happyShift action_67
action_82 (47) = happyShift action_68
action_82 (48) = happyShift action_69
action_82 (50) = happyShift action_70
action_82 (51) = happyShift action_71
action_82 (52) = happyShift action_72
action_82 (53) = happyShift action_73
action_82 (54) = happyShift action_74
action_82 (55) = happyShift action_75
action_82 (56) = happyShift action_76
action_82 (57) = happyShift action_77
action_82 (58) = happyShift action_78
action_82 (59) = happyShift action_79
action_82 (16) = happyGoto action_89
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (18) = happyShift action_10
action_83 (19) = happyShift action_11
action_83 (37) = happyShift action_29
action_83 (38) = happyShift action_30
action_83 (39) = happyShift action_31
action_83 (60) = happyShift action_51
action_83 (62) = happyShift action_34
action_83 (13) = happyGoto action_88
action_83 (14) = happyGoto action_8
action_83 (15) = happyGoto action_9
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_26

action_85 _ = happyReduce_27

action_86 (18) = happyShift action_10
action_86 (19) = happyShift action_11
action_86 (20) = happyShift action_12
action_86 (21) = happyShift action_13
action_86 (22) = happyShift action_14
action_86 (23) = happyShift action_15
action_86 (24) = happyShift action_16
action_86 (25) = happyShift action_17
action_86 (26) = happyShift action_18
action_86 (27) = happyShift action_19
action_86 (28) = happyShift action_20
action_86 (29) = happyShift action_21
action_86 (30) = happyShift action_22
action_86 (31) = happyShift action_23
action_86 (32) = happyShift action_24
action_86 (33) = happyShift action_25
action_86 (34) = happyShift action_26
action_86 (35) = happyShift action_27
action_86 (36) = happyShift action_28
action_86 (37) = happyShift action_29
action_86 (38) = happyShift action_30
action_86 (39) = happyShift action_31
action_86 (42) = happyShift action_32
action_86 (45) = happyReduce_52
action_86 (46) = happyReduce_52
action_86 (47) = happyReduce_52
action_86 (48) = happyReduce_52
action_86 (50) = happyReduce_52
action_86 (51) = happyReduce_52
action_86 (52) = happyReduce_52
action_86 (53) = happyReduce_52
action_86 (54) = happyReduce_52
action_86 (55) = happyReduce_52
action_86 (56) = happyReduce_52
action_86 (57) = happyReduce_52
action_86 (58) = happyReduce_52
action_86 (59) = happyReduce_52
action_86 (60) = happyShift action_33
action_86 (62) = happyShift action_34
action_86 (63) = happyShift action_35
action_86 (64) = happyShift action_36
action_86 (65) = happyShift action_37
action_86 (66) = happyShift action_38
action_86 (67) = happyShift action_39
action_86 (76) = happyShift action_40
action_86 (79) = happyShift action_41
action_86 (81) = happyShift action_42
action_86 (82) = happyReduce_52
action_86 (6) = happyGoto action_87
action_86 (8) = happyGoto action_4
action_86 (10) = happyGoto action_5
action_86 (12) = happyGoto action_6
action_86 (13) = happyGoto action_7
action_86 (14) = happyGoto action_8
action_86 (15) = happyGoto action_9
action_86 _ = happyReduce_4

action_87 _ = happyReduce_3

action_88 _ = happyReduce_25

action_89 (77) = happyShift action_117
action_89 _ = happyReduce_13

action_90 (18) = happyShift action_10
action_90 (19) = happyShift action_11
action_90 (37) = happyShift action_29
action_90 (38) = happyShift action_30
action_90 (39) = happyShift action_31
action_90 (60) = happyShift action_51
action_90 (62) = happyShift action_34
action_90 (13) = happyGoto action_116
action_90 (14) = happyGoto action_8
action_90 (15) = happyGoto action_9
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (56) = happyShift action_115
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_76

action_93 _ = happyReduce_75

action_94 (82) = happyShift action_114
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (82) = happyShift action_113
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (71) = happyShift action_56
action_96 (72) = happyShift action_57
action_96 (73) = happyShift action_58
action_96 (9) = happyGoto action_112
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_16

action_98 _ = happyReduce_50

action_99 (80) = happyShift action_111
action_99 _ = happyReduce_49

action_100 (43) = happyShift action_109
action_100 (44) = happyShift action_110
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (38) = happyShift action_108
action_101 _ = happyFail (happyExpListPerState 101)

action_102 _ = happyReduce_20

action_103 (74) = happyShift action_107
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (74) = happyShift action_106
action_104 _ = happyFail (happyExpListPerState 104)

action_105 _ = happyReduce_23

action_106 _ = happyReduce_22

action_107 _ = happyReduce_21

action_108 _ = happyReduce_45

action_109 _ = happyReduce_7

action_110 _ = happyReduce_8

action_111 (82) = happyShift action_123
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_24

action_113 (49) = happyShift action_122
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (45) = happyShift action_121
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_14

action_116 _ = happyReduce_9

action_117 (18) = happyShift action_10
action_117 (19) = happyShift action_11
action_117 (37) = happyShift action_29
action_117 (38) = happyShift action_30
action_117 (39) = happyShift action_31
action_117 (40) = happyShift action_98
action_117 (41) = happyShift action_99
action_117 (60) = happyShift action_51
action_117 (62) = happyShift action_34
action_117 (82) = happyShift action_120
action_117 (11) = happyGoto action_118
action_117 (13) = happyGoto action_119
action_117 (14) = happyGoto action_8
action_117 (15) = happyGoto action_9
action_117 _ = happyFail (happyExpListPerState 117)

action_118 _ = happyReduce_11

action_119 _ = happyReduce_12

action_120 (61) = happyShift action_125
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_71

action_122 _ = happyReduce_72

action_123 (40) = happyShift action_124
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_51

action_125 _ = happyReduce_10

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (reverse happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_3 : happy_var_1
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 _
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (CompleteWithVariant happy_var_2 Grabless
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CompleteWithVariant happy_var_2 Jumpless
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 6 happyReduction_8
happyReduction_8 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CompleteWithVariant happy_var_2 Dashless
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CollectablesAtLocation happy_var_4 happy_var_2
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 6 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyTerminal (TInt happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyTerminal (TInt happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CollectablesAmountInChapters happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 5 6 happyReduction_11
happyReduction_11 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyTerminal (TInt happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CollectablesAmountInChapterType happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 6 happyReduction_12
happyReduction_12 ((HappyAbsSyn13  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyTerminal (TInt happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (CollectablesAmountAtLocation happy_var_5 happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn16  happy_var_3)
	(HappyTerminal (TInt happy_var_2))
	_
	 =  HappyAbsSyn6
		 (CollectableAmount happy_var_3 happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TwoGems happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  6 happyReduction_15
happyReduction_15 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn6
		 (Complete happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_3)
	(HappyTerminal (TInt happy_var_2))
	_
	 =  HappyAbsSyn6
		 (ChapterTypeAmount happy_var_3 happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  6 happyReduction_17
happyReduction_17 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Complete happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  6 happyReduction_18
happyReduction_18 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn6
		 (CollectablesAtLocation happy_var_1 happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  6 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (ReachLocation happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 _
	(HappyTerminal (TInt happy_var_2))
	_
	 =  HappyAbsSyn6
		 (MiscCountTaskAmount JumpOnSnowballs happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 6 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyTerminal (TInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (MiscCountTaskAmount StunOshiro happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 6 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyTerminal (TInt happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (MiscCountTaskAmount StunSeeker happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  6 happyReduction_23
happyReduction_23 _
	(HappyTerminal (TInt happy_var_2))
	_
	 =  HappyAbsSyn6
		 (MiscCountTaskAmount KillSeeker happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 6 happyReduction_24
happyReduction_24 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (MessOrder happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_3  6 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (DoThingAtLocation happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  7 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn7
		 (
	)

happyReduce_27 = happySpecReduce_1  7 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn7
		 (
	)

happyReduce_28 = happySpecReduce_1  8 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn8
		 (ReadPoem
	)

happyReduce_29 = happySpecReduce_1  8 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn8
		 (FindLetter
	)

happyReduce_30 = happySpecReduce_1  8 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn8
		 (ReadDiary
	)

happyReduce_31 = happySpecReduce_1  8 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn8
		 (FindTheoPhone
	)

happyReduce_32 = happySpecReduce_1  8 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn8
		 (ReflectionCutscene
	)

happyReduce_33 = happySpecReduce_1  8 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn8
		 (GetPicoOrb
	)

happyReduce_34 = happySpecReduce_1  8 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn8
		 (SwitchIce
	)

happyReduce_35 = happySpecReduce_1  8 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn8
		 (TopRoute
	)

happyReduce_36 = happySpecReduce_1  8 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn8
		 (BottomRoute
	)

happyReduce_37 = happySpecReduce_1  8 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn8
		 (EasterEggRoom
	)

happyReduce_38 = happySpecReduce_1  8 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn8
		 (ReachCoreOrb
	)

happyReduce_39 = happySpecReduce_1  8 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn8
		 (ReachIntroCar
	)

happyReduce_40 = happySpecReduce_1  8 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn8
		 (BirdsNest
	)

happyReduce_41 = happySpecReduce_1  8 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn8
		 (AllFlags
	)

happyReduce_42 = happySpecReduce_1  9 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn9
		 (Books
	)

happyReduce_43 = happySpecReduce_1  9 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn9
		 (Towels
	)

happyReduce_44 = happySpecReduce_1  9 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn9
		 (Chests
	)

happyReduce_45 = happyReduce 4 10 happyReduction_45
happyReduction_45 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ReachLocation LPico8OldSite
	) `HappyStk` happyRest

happyReduce_46 = happySpecReduce_1  10 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn10
		 (KevinOn4Sides
	)

happyReduce_47 = happySpecReduce_1  10 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn10
		 (CollectablesAtLocation (LChapter (Chapter 1 ASide)) WingedGolden
	)

happyReduce_48 = happySpecReduce_1  10 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn10
		 (ReachLocation LRockBottom
	)

happyReduce_49 = happySpecReduce_1  11 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn11
		 (ASide
	)

happyReduce_50 = happySpecReduce_1  11 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn11
		 (BSide
	)

happyReduce_51 = happyReduce 4 11 happyReduction_51
happyReduction_51 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AAndBSide
	) `HappyStk` happyRest

happyReduce_52 = happySpecReduce_0  12 happyReduction_52
happyReduction_52  =  HappyAbsSyn12
		 (
	)

happyReduce_53 = happySpecReduce_1  12 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn12
		 (
	)

happyReduce_54 = happySpecReduce_2  12 happyReduction_54
happyReduction_54 _
	_
	 =  HappyAbsSyn12
		 (
	)

happyReduce_55 = happySpecReduce_1  12 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn12
		 (
	)

happyReduce_56 = happySpecReduce_1  12 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn12
		 (
	)

happyReduce_57 = happySpecReduce_1  13 happyReduction_57
happyReduction_57 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (LChapter happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  13 happyReduction_58
happyReduction_58 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (LCheckpoint happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  13 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn13
		 (LPico8
	)

happyReduce_60 = happySpecReduce_1  13 happyReduction_60
happyReduction_60 _
	 =  HappyAbsSyn13
		 (LEpilogue
	)

happyReduce_61 = happySpecReduce_2  14 happyReduction_61
happyReduction_61 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Checkpoint happy_var_2 1
	)
happyReduction_61 _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_2  14 happyReduction_62
happyReduction_62 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (Checkpoint happy_var_1 1
	)
happyReduction_62 _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  14 happyReduction_63
happyReduction_63 (HappyTerminal (TCheckpoint happy_var_1))
	 =  HappyAbsSyn14
		 (Checkpoint (Chapter (fst $ fst happy_var_1) (charToChapterType $ snd happy_var_1)) (snd $ fst happy_var_1)
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  15 happyReduction_64
happyReduction_64 (HappyTerminal (TChapter happy_var_1))
	 =  HappyAbsSyn15
		 (Chapter (read $ [head happy_var_1]) (charToChapterType $ head $ tail happy_var_1)
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  15 happyReduction_65
happyReduction_65 _
	(HappyTerminal (TChapterName happy_var_1))
	 =  HappyAbsSyn15
		 (Chapter happy_var_1 BSide
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  15 happyReduction_66
happyReduction_66 _
	(HappyTerminal (TChapterName happy_var_1))
	 =  HappyAbsSyn15
		 (Chapter happy_var_1 ASide
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  15 happyReduction_67
happyReduction_67 (HappyTerminal (TChapterName happy_var_1))
	 =  HappyAbsSyn15
		 (Chapter happy_var_1 ASide
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_2  15 happyReduction_68
happyReduction_68 _
	_
	 =  HappyAbsSyn15
		 (Chapter 6 BSide
	)

happyReduce_69 = happySpecReduce_2  15 happyReduction_69
happyReduction_69 _
	_
	 =  HappyAbsSyn15
		 (Chapter 6 ASide
	)

happyReduce_70 = happySpecReduce_1  15 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn15
		 (Chapter 6 ASide
	)

happyReduce_71 = happyReduce 4 16 happyReduction_71
happyReduction_71 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HeartAndCassette
	) `HappyStk` happyRest

happyReduce_72 = happyReduce 4 16 happyReduction_72
happyReduction_72 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (BlueAndRedHeart
	) `HappyStk` happyRest

happyReduce_73 = happySpecReduce_1  16 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn16
		 (Cassette
	)

happyReduce_74 = happySpecReduce_1  16 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn16
		 (BlueHeart
	)

happyReduce_75 = happySpecReduce_2  16 happyReduction_75
happyReduction_75 _
	_
	 =  HappyAbsSyn16
		 (WingedBerry
	)

happyReduce_76 = happySpecReduce_2  16 happyReduction_76
happyReduction_76 _
	_
	 =  HappyAbsSyn16
		 (SeededBerry
	)

happyReduce_77 = happySpecReduce_1  16 happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn16
		 (Berry
	)

happyReduce_78 = happySpecReduce_1  16 happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn16
		 (TheoCutscene
	)

happyReduce_79 = happySpecReduce_1  16 happyReduction_79
happyReduction_79 _
	 =  HappyAbsSyn16
		 (Key
	)

happyReduce_80 = happySpecReduce_1  16 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn16
		 (AllCollectables
	)

happyReduce_81 = happySpecReduce_1  16 happyReduction_81
happyReduction_81 _
	 =  HappyAbsSyn16
		 (OneUp
	)

happyReduce_82 = happySpecReduce_1  16 happyReduction_82
happyReduction_82 _
	 =  HappyAbsSyn16
		 (BlueAndRedHeart
	)

happyReduce_83 = happySpecReduce_1  16 happyReduction_83
happyReduction_83 _
	 =  HappyAbsSyn16
		 (Bino
	)

happyReduce_84 = happySpecReduce_1  16 happyReduction_84
happyReduction_84 _
	 =  HappyAbsSyn16
		 (Gem
	)

happyReduce_85 = happySpecReduce_1  16 happyReduction_85
happyReduction_85 _
	 =  HappyAbsSyn16
		 (Heart
	)

happyNewToken action sts stk [] =
	action 84 84 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TNewLine -> cont 17;
	TChapter happy_dollar_dollar -> cont 18;
	TChapterName happy_dollar_dollar -> cont 19;
	TReadPoem -> cont 20;
	TFindLetter -> cont 21;
	TReadDiary -> cont 22;
	TFindTheoPhone -> cont 23;
	TReflectionCutscene -> cont 24;
	TGetPicoOrb -> cont 25;
	TSwitchIce -> cont 26;
	TTopRoute -> cont 27;
	TBottomRoute -> cont 28;
	TEasterEggRoom -> cont 29;
	TReachCoreOrb -> cont 30;
	TReachIntroCar -> cont 31;
	TBirdsNest -> cont 32;
	TAllFlags -> cont 33;
	TKevin4Sides -> cont 34;
	TWingedGolden -> cont 35;
	TReachRockBottom -> cont 36;
	TReflection -> cont 37;
	TPico8 -> cont 38;
	TEpilogue -> cont 39;
	TBSide -> cont 40;
	TASide -> cont 41;
	TGrabless -> cont 42;
	TJumping -> cont 43;
	TDashing -> cont 44;
	TCassette -> cont 45;
	TBlueHeart -> cont 46;
	TBlueAndRedHeart -> cont 47;
	TBlue -> cont 48;
	TRedHeart -> cont 49;
	THeart -> cont 50;
	TWinged -> cont 51;
	TSeeded -> cont 52;
	TBerry -> cont 53;
	TKey -> cont 54;
	TBino -> cont 55;
	TGem -> cont 56;
	T1Up -> cont 57;
	TCollectables -> cont 58;
	TTheo -> cont 59;
	TCheckpoint happy_dollar_dollar -> cont 60;
	TChapters -> cont 61;
	TStart -> cont 62;
	TComplete -> cont 63;
	TReach -> cont 64;
	TJumpOn -> cont 65;
	TStun -> cont 66;
	TKill -> cont 67;
	TSeeker -> cont 68;
	TOshiro -> cont 69;
	TSnowball -> cont 70;
	TBooks -> cont 71;
	TTowels -> cont 72;
	TChests -> cont 73;
	TTimes -> cont 74;
	TWithout -> cont 75;
	TGet -> cont 76;
	TIn -> cont 77;
	TOf -> cont 78;
	TAll -> cont 79;
	TAnd -> cont 80;
	TUse -> cont 81;
	TInt happy_dollar_dollar -> cont 82;
	TString happy_dollar_dollar -> cont 83;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 84 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> happyError tokens)
happyParseTokens tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError _ = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
