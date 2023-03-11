module BingoData where


-- ChapterNum CheckpointNum Count
berryCount :: Int -> Int -> Int
berryCount 1 1 = 6
berryCount 1 2 = 9
berryCount 1 3 = 5
berryCount 2 1 = 9
berryCount 2 2 = 8
berryCount 2 3 = 1
berryCount 3 1 = 11
berryCount 3 2 = 7
berryCount 3 3 = 4
berryCount 3 4 = 3
berryCount 4 1 = 8
berryCount 4 2 = 9
berryCount 4 3 = 7
berryCount 4 4 = 5
berryCount 5 1 = 12
berryCount 5 2 = 11
berryCount 5 3 = 1
berryCount 5 4 = 6
berryCount 5 5 = 1
berryCount 7 1 = 4
berryCount 7 2 = 6
berryCount 7 3 = 6
berryCount 7 4 = 8
berryCount 7 5 = 8
berryCount 7 6 = 8
berryCount 7 7 = 7
berryCount 8 2 = 1
berryCount 8 3 = 3
berryCount 8 4 = 1
berryCount _ _ = 0

-- A-side ChapterNum CheckpointNum Count
binoCount :: Bool -> Int -> Int -> Int
binoCount True 2 1 = 1
binoCount True 4 1 = 1
binoCount True 4 2 = 1
binoCount True 4 4 = 1
binoCount True 5 2 = 1
binoCount True 6 3 = 1
binoCount True 7 2 = 3
binoCount True 7 3 = 4
binoCount True 7 7 = 1
binoCount True 9 2 = 2
binoCount True 9 3 = 7
binoCount True 9 4 = 5
binoCount False 1 1 = 1
binoCount False 1 3 = 1
binoCount False 2 3 = 2
binoCount False 3 1 = 1
binoCount False 3 3 = 1
binoCount False 4 2 = 1
binoCount False 4 3 = 1
binoCount False 4 4 = 2
binoCount False 5 2 = 1
binoCount False 6 1 = 2
binoCount False 7 2 = 2
binoCount _ _ _ = 0

-- ChapterNum CheckpointNum
getHeartCp :: Int -> Int
getHeartCp 1 = 2
getHeartCp 2 = 1
getHeartCp 3 = 2
getHeartCp 4 = 2
getHeartCp 5 = 2
getHeartCp 6 = 3
getHeartCp 7 = 7
getHeartCp 8 = 4
getHeartCp i = error ("Chapter " ++ show i ++ " does not have a heart")

-- ChapterNum CheckpointNum
getCassetteCp :: Int -> Int
getCassetteCp 1 = 3
getCassetteCp 2 = 1
getCassetteCp 3 = 3
getCassetteCp 4 = 1
getCassetteCp 5 = 2
getCassetteCp 6 = 3
getCassetteCp 7 = 4
getCassetteCp 8 = 4
getCassetteCp i = error ("Chapter " ++ show i ++ " does not have a cassette")
