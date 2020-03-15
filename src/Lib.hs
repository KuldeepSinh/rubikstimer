module Lib
    ( showTimeElapsed
    ) where

{-# LANGUAGE OverloadedStrings #-}
import Control.Exception
import System.Clock


showTimeElapsed :: IO ()
showTimeElapsed = 
  do
    putStrLn "Press Enter key to start the timer"
    getLine
    start <- getTime Monotonic

    putStrLn "Press Enter key to stop the timer"
    getLine
    stop <- getTime Monotonic

    let diff = diffTimeSpec stop start
    putStrLn $ show (sec diff) ++ " seconds and " ++  show (nsec diff) ++ " nano seconds."
    let nanoSecs = toNanoSecs diff
    putStrLn $ show nanoSecs ++ " (total nano seconds)."