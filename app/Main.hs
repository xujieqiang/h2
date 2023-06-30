module Main where

main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
    let cfb=chengfabiao 10
    print cfb
    everyS cfb 1
    -- putStrLn ("aaa"++"\t"++"bbb")


everyS::[String]->Int->IO ()
everyS [] i=putStrLn "end"
everyS xs i=do
    let h=take i [x|x<-xs,x/="\n"]
    stringsToStr h
    let rl=removeFrontOftheList i xs
    everyS rl (i+1)

stringsToStr::[String]->IO ()
stringsToStr xs=if length xs==1 then putStrLn (head xs) else do
    putStr ((head xs)++"\t")
    stringsToStr (tail xs)

removeFrontOftheList::Int->[String] ->[String]
removeFrontOftheList n xs=if n==0 then xs else removeFrontOftheList (n-1) (tail xs)

-- dddddd你好

chengfabiao::Int->[String]
chengfabiao 1=["1 X 1=1 "]
chengfabiao x=(chengfabiao (x-1)) ++ [  (show i)++" X "++(show x)++"="++(show (i*x))++ "   " | i<-[1..x]]