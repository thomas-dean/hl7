{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Data.HL7
    ( Message(..)
    , Segment(..)
    , Field(..)
    , Component(..)
    , Subcomponent
    , MessageMetadata
    ) where

import GHC.Generics (Generic)
import Control.DeepSeq (NFData(..))

-- | Intermediary representation of messages
data Message = Message {
      segments :: [Segment]
    , metadata :: MessageMetadata
    } deriving (Eq, Show, Generic, NFData)

-- | Intermediary representation of sections
data Segment = Segment { 
      fields :: [Field]
    , segtype :: String
    } deriving (Eq, Show, Generic, NFData)

-- | Intermediary representation of fields
data Field = Components [Component]
           | Field String
             deriving (Eq, Show, Generic, NFData)

-- | Intermediary representation of components
data Component = Subcomponents [Subcomponent]
               | Component String
                 deriving (Eq, Show, Generic, NFData)

-- | Intermediary representation of subcomponents
type Subcomponent = String

type MessageMetadata = String
