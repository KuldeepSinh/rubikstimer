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
    let nanoSecs = toNanoSecs (diffTimeSpec stop start)
    let diff = diffTimeSpec stop start
    putStrLn $ show nanoSecs ++ " (nano seconds)"
    putStrLn $ show (sec diff) ++ " (seconds)"
