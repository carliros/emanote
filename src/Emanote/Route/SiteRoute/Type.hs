{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

module Emanote.Route.SiteRoute.Type
  ( SiteRoute,
    IndexR (..),
    TagIndexR (..),
    MissingR (..),
    VirtualRoute,
    ResourceRoute,
    decodeVirtualRoute,
  )
where

import Data.WorldPeace.Union
  ( OpenUnion,
    openUnionLift,
  )
import Emanote.Route.ModelRoute (LMLRoute, StaticFileRoute)
import qualified Emanote.Route.R as R

data IndexR = IndexR
  deriving (Eq, Show, Ord)

data TagIndexR = TagIndexR
  deriving (Eq, Show, Ord)

-- | A 404 route
newtype MissingR = MissingR {unMissingR :: FilePath}
  deriving (Eq, Show, Ord)

type VirtualRoute' =
  '[ IndexR,
     TagIndexR
   ]

-- | A route to a virtual resource (not in `Model`)
type VirtualRoute = OpenUnion VirtualRoute'

type ResourceRoute' =
  '[ (StaticFileRoute, FilePath),
     LMLRoute
   ]

-- | A route to a resource in `Model`
--
-- This is *mostly isomorphic* to `ModelRoute`, except for containing the
-- absolute path to the static file.
type ResourceRoute = OpenUnion ResourceRoute'

type SiteRoute' =
  '[ VirtualRoute,
     ResourceRoute,
     MissingR
   ]

type SiteRoute = OpenUnion SiteRoute'

decodeVirtualRoute :: FilePath -> Maybe VirtualRoute
decodeVirtualRoute fp =
  fmap openUnionLift (decodeIndexR fp)
    <|> fmap openUnionLift (decodeTagIndexR fp)

decodeIndexR :: FilePath -> Maybe IndexR
decodeIndexR fp = do
  slug <- R.routeSlug . R.decodeHtmlRoute $ fp
  guard $ slug == "@index"
  pure IndexR

decodeTagIndexR :: FilePath -> Maybe TagIndexR
decodeTagIndexR fp = do
  slug <- R.routeSlug . R.decodeHtmlRoute $ fp
  guard $ slug == "@tags"
  pure TagIndexR
