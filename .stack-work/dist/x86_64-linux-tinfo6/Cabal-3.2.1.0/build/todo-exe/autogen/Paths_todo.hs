{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_todo (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/sekun/Work/todo/.stack-work/install/x86_64-linux-tinfo6/27ececf779ab4e352b355384d8b132eac0c736afcadb9b932a067063abb39ec0/8.10.4/bin"
libdir     = "/home/sekun/Work/todo/.stack-work/install/x86_64-linux-tinfo6/27ececf779ab4e352b355384d8b132eac0c736afcadb9b932a067063abb39ec0/8.10.4/lib/x86_64-linux-ghc-8.10.4/todo-0.1.0.0-HmyyJgOxiJcK92FFB32Kmg-todo-exe"
dynlibdir  = "/home/sekun/Work/todo/.stack-work/install/x86_64-linux-tinfo6/27ececf779ab4e352b355384d8b132eac0c736afcadb9b932a067063abb39ec0/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/sekun/Work/todo/.stack-work/install/x86_64-linux-tinfo6/27ececf779ab4e352b355384d8b132eac0c736afcadb9b932a067063abb39ec0/8.10.4/share/x86_64-linux-ghc-8.10.4/todo-0.1.0.0"
libexecdir = "/home/sekun/Work/todo/.stack-work/install/x86_64-linux-tinfo6/27ececf779ab4e352b355384d8b132eac0c736afcadb9b932a067063abb39ec0/8.10.4/libexec/x86_64-linux-ghc-8.10.4/todo-0.1.0.0"
sysconfdir = "/home/sekun/Work/todo/.stack-work/install/x86_64-linux-tinfo6/27ececf779ab4e352b355384d8b132eac0c736afcadb9b932a067063abb39ec0/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "todo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "todo_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "todo_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "todo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "todo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "todo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
