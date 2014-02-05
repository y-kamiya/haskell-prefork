
module System.Prefork.Types (
    PreforkSettings(..)
  ) where

import System.Posix (ProcessID)
import System.Prefork.Class

data PreforkSettings sc = PreforkSettings {
    psOnTerminate     :: sc -> [ProcessID] -> IO ()
  , psOnInterrupt     :: sc -> [ProcessID] -> IO ()
  , psOnQuit          :: sc -> IO ()
  , psOnChildFinished :: sc -> IO ([ProcessID])
  , psOnStart         :: Maybe sc -> IO ()
  , psOnFinish        :: Maybe sc -> IO ()
  , psUpdateServer    :: sc -> IO ([ProcessID])
  , psCleanupChild    :: sc -> ProcessID -> IO ()
  , psUpdateConfig    :: IO (Maybe sc)
  }
                          
