{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

module Singletons.TopLevelPatterns where

import Data.Singletons
import Data.Singletons.Prelude.List
import Data.Singletons.SuppressUnusedWarnings
import Data.Singletons.TH hiding (STrue, SFalse, TrueSym0, FalseSym0)

-- Remove this test once #54 is fixed
$(promote [d|
  data Bool = False | True
  data Foo = Bar Bool Bool

  id :: a -> a
  id x = x

  not :: Bool -> Bool
  not True  = False
  not False = True

  f,g :: Bool -> Bool
  [f,g] = [not, id]

  h,i :: Bool -> Bool
  (h,i) = (f, g)

  j,k :: Bool
  (Bar j k) = Bar True (h False)

  l,m :: Bool
  [l,m] = [not True, id False]
 |])
