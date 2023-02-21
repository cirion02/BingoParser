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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,78) ([63488,15,511,16,0,0,48,8176,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,2,0,0,0,0,0,0,0,0,0,0,0,0,511,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParseTokens","Program","Objectives","Objective","Chapter","Collectable","Words","Word","newLine","chapter","chapterName","reflection","bside","grabless","cassette","blueheart","num","text","%eof"]
        bit_start = st Prelude.* 21
        bit_end = (st Prelude.+ 1) Prelude.* 21
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..20]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (12) = happyShift action_7
action_0 (13) = happyShift action_8
action_0 (14) = happyShift action_9
action_0 (15) = happyShift action_10
action_0 (16) = happyShift action_11
action_0 (17) = happyShift action_12
action_0 (18) = happyShift action_13
action_0 (19) = happyShift action_14
action_0 (20) = happyShift action_15
action_0 (4) = happyGoto action_16
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (9) = happyGoto action_5
action_0 (10) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_7
action_1 (13) = happyShift action_8
action_1 (14) = happyShift action_9
action_1 (15) = happyShift action_10
action_1 (16) = happyShift action_11
action_1 (17) = happyShift action_12
action_1 (18) = happyShift action_13
action_1 (19) = happyShift action_14
action_1 (20) = happyShift action_15
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (9) = happyGoto action_5
action_1 (10) = happyGoto action_6
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (11) = happyShift action_33
action_2 _ = happyReduce_1

action_3 _ = happyReduce_2

action_4 (17) = happyShift action_18
action_4 (18) = happyShift action_19
action_4 (8) = happyGoto action_32
action_4 _ = happyReduce_7

action_5 (12) = happyShift action_27
action_5 (13) = happyShift action_28
action_5 (14) = happyShift action_29
action_5 (15) = happyShift action_10
action_5 (16) = happyShift action_30
action_5 (17) = happyShift action_12
action_5 (18) = happyShift action_13
action_5 (19) = happyShift action_31
action_5 (20) = happyShift action_15
action_5 (10) = happyGoto action_26
action_5 _ = happyReduce_9

action_6 _ = happyReduce_17

action_7 (11) = happyReduce_19
action_7 (17) = happyReduce_19
action_7 (18) = happyReduce_19
action_7 (21) = happyReduce_19
action_7 _ = happyReduce_19

action_8 (11) = happyReduce_23
action_8 (15) = happyShift action_25
action_8 (17) = happyReduce_23
action_8 (18) = happyReduce_23
action_8 (21) = happyReduce_23
action_8 _ = happyReduce_23

action_9 (11) = happyReduce_24
action_9 (15) = happyShift action_24
action_9 (17) = happyReduce_24
action_9 (18) = happyReduce_24
action_9 (21) = happyReduce_24
action_9 _ = happyReduce_24

action_10 _ = happyReduce_25

action_11 (12) = happyShift action_21
action_11 (13) = happyShift action_22
action_11 (14) = happyShift action_23
action_11 (7) = happyGoto action_20
action_11 _ = happyReduce_20

action_12 _ = happyReduce_21

action_13 _ = happyReduce_22

action_14 (17) = happyShift action_18
action_14 (18) = happyShift action_19
action_14 (8) = happyGoto action_17
action_14 _ = happyReduce_26

action_15 _ = happyReduce_27

action_16 (21) = happyAccept
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_6

action_18 _ = happyReduce_15

action_19 _ = happyReduce_16

action_20 _ = happyReduce_5

action_21 _ = happyReduce_10

action_22 (15) = happyShift action_25
action_22 _ = happyReduce_12

action_23 (15) = happyShift action_24
action_23 _ = happyReduce_14

action_24 _ = happyReduce_13

action_25 _ = happyReduce_11

action_26 _ = happyReduce_18

action_27 _ = happyReduce_19

action_28 _ = happyReduce_23

action_29 _ = happyReduce_24

action_30 _ = happyReduce_20

action_31 _ = happyReduce_26

action_32 _ = happyReduce_8

action_33 (12) = happyShift action_7
action_33 (13) = happyShift action_8
action_33 (14) = happyShift action_9
action_33 (15) = happyShift action_10
action_33 (16) = happyShift action_11
action_33 (17) = happyShift action_12
action_33 (18) = happyShift action_13
action_33 (19) = happyShift action_14
action_33 (20) = happyShift action_15
action_33 (6) = happyGoto action_34
action_33 (7) = happyGoto action_4
action_33 (9) = happyGoto action_5
action_33 (10) = happyGoto action_6
action_33 _ = happyReduce_4

action_34 _ = happyReduce_3

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

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (CompleteWithVariant (LChapter happy_var_2) Grabless
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  6 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_2)
	(HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn6
		 (CollectableAmount happy_var_2 happy_var_1
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Complete (LChapter happy_var_1)
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  6 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (CollectableAtLocation (LChapter happy_var_1) happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (StringList $ reverse happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 (HappyTerminal (TChapter happy_var_1))
	 =  HappyAbsSyn7
		 (Chapter (read $ [head happy_var_1]) (head $ tail happy_var_1)
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_2  7 happyReduction_11
happyReduction_11 _
	(HappyTerminal (TChapterName happy_var_1))
	 =  HappyAbsSyn7
		 (Chapter happy_var_1 'B'
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 (HappyTerminal (TChapterName happy_var_1))
	 =  HappyAbsSyn7
		 (Chapter happy_var_1 'A'
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  7 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn7
		 (Chapter 6 'B'
	)

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn7
		 (Chapter 6 'A'
	)

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn8
		 (Cassette
	)

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn8
		 (BlueHeart
	)

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  9 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_2 : happy_var_1
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyTerminal (TChapter happy_var_1))
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn10
		 ("Grabless"
	)

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn10
		 ("Cassette"
	)

happyReduce_22 = happySpecReduce_1  10 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn10
		 ("Blue Heart"
	)

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 (HappyTerminal (TChapterName happy_var_1))
	 =  HappyAbsSyn10
		 ("Chapter " ++ show happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn10
		 ("Reflection"
	)

happyReduce_25 = happySpecReduce_1  10 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn10
		 ("B-Side"
	)

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn10
		 (show happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  10 happyReduction_27
happyReduction_27 (HappyTerminal (TString happy_var_1))
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 21 21 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TNewLine -> cont 11;
	TChapter happy_dollar_dollar -> cont 12;
	TChapterName happy_dollar_dollar -> cont 13;
	TReflection -> cont 14;
	TBSide -> cont 15;
	TGrabless -> cont 16;
	TCassette -> cont 17;
	TBlueHeart -> cont 18;
	TInt happy_dollar_dollar -> cont 19;
	TString happy_dollar_dollar -> cont 20;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 21 tk tks = happyError' (tks, explist)
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
