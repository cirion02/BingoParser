module Helper where

if' :: Bool -> a -> a -> a
if' True  a _ = a
if' False _ b = b