-- Copyright (c) 2008--2011 Andres Loeh
-- Copyright (c) 2010--2021 Mikolaj Konarski and others (see git history)
-- This file is a part of the computer game Allure of the Stars
-- and is released under the terms of the GNU Affero General Public License.
-- For license and copyright information, see the file LICENSE.
--
-- | Definitions of place kinds. Every room in the game is an instantiated
-- place kind.
module Content.PlaceKind
  ( -- * Group name patterns
    pattern ROGUE, pattern LABORATORY, pattern ZOO, pattern BRAWL, pattern SHOOTOUT, pattern ARENA, pattern ESCAPE, pattern AMBUSH, pattern BATTLE, pattern NOISE, pattern EMPTY
  , pattern INDOOR_ESCAPE_DOWN, pattern INDOOR_ESCAPE_UP, pattern OUTDOOR_ESCAPE_DOWN, pattern TINY_STAIRCASE, pattern OPEN_STAIRCASE, pattern CLOSED_STAIRCASE, pattern WALLED_STAIRCASE, pattern GATED_TINY_STAIRCASE, pattern GATED_OPEN_STAIRCASE, pattern GATED_CLOSED_STAIRCASE, pattern OUTDOOR_TINY_STAIRCASE, pattern OUTDOOR_CLOSED_STAIRCASE, pattern OUTDOOR_WALLED_STAIRCASE
  , pattern RESIDENTIAL, pattern MUSEUM, pattern EXIT, pattern RAID
  , pattern TINY_LIFT, pattern OPEN_LIFT, pattern WALLED_LIFT, pattern CLOSED_LIFT, pattern ESCAPE_FROM_SPACESHIP_DOWN, pattern DECON_TINY_STAIRCASE, pattern DECON_OPEN_STAIRCASE, pattern DECON_WALLED_STAIRCASE, pattern DECON_TINY_LIFT, pattern DECON_OPEN_LIFT, pattern DECON_WALLED_LIFT, pattern GATED_TINY_LIFT, pattern GATED_OPEN_LIFT, pattern GATED_CLOSED_LIFT, pattern WELDED_TINY_LIFT, pattern WELDED_OPEN_LIFT, pattern WELDED_WALLED_LIFT, pattern WELDED_TINY_STAIRCASE, pattern WELDED_OPEN_STAIRCASE, pattern WELDED_WALLED_STAIRCASE
  , groupNamesSingleton, groupNames
  , -- * Content
    content
  ) where

import Prelude ()

import Game.LambdaHack.Core.Prelude

import qualified Data.Text as T

import Content.TileKind hiding (content, groupNames, groupNamesSingleton)
import Game.LambdaHack.Content.PlaceKind
import Game.LambdaHack.Content.TileKind (TileKind)
import Game.LambdaHack.Definition.Defs

-- * Group name patterns

groupNamesSingleton :: [GroupName PlaceKind]
groupNamesSingleton = []

-- TODO: if we stick to the current system of generating extra kinds and their
-- group names, let's also add the generated group names to @groupNames@.
groupNames :: [GroupName PlaceKind]
groupNames =
       [ROGUE, LABORATORY, ZOO, BRAWL, SHOOTOUT, ARENA, ESCAPE, AMBUSH, BATTLE, NOISE, EMPTY]
    ++ [INDOOR_ESCAPE_DOWN, INDOOR_ESCAPE_UP, OUTDOOR_ESCAPE_DOWN, TINY_STAIRCASE, OPEN_STAIRCASE, CLOSED_STAIRCASE, WALLED_STAIRCASE]
    ++ [RESIDENTIAL, MUSEUM, EXIT, RAID]
    ++ [TINY_LIFT, OPEN_LIFT, WALLED_LIFT, CLOSED_LIFT, ESCAPE_FROM_SPACESHIP_DOWN]
    ++ fst generatedStairs

pattern ROGUE, LABORATORY, ZOO, BRAWL, SHOOTOUT, ARENA, ESCAPE, AMBUSH, BATTLE, NOISE, EMPTY :: GroupName PlaceKind

pattern INDOOR_ESCAPE_DOWN, INDOOR_ESCAPE_UP, OUTDOOR_ESCAPE_DOWN, TINY_STAIRCASE, OPEN_STAIRCASE, CLOSED_STAIRCASE, WALLED_STAIRCASE, GATED_TINY_STAIRCASE, GATED_OPEN_STAIRCASE, GATED_CLOSED_STAIRCASE, OUTDOOR_TINY_STAIRCASE, OUTDOOR_CLOSED_STAIRCASE, OUTDOOR_WALLED_STAIRCASE :: GroupName PlaceKind

pattern RESIDENTIAL, MUSEUM, EXIT, RAID :: GroupName PlaceKind

pattern TINY_LIFT, OPEN_LIFT, WALLED_LIFT, CLOSED_LIFT, ESCAPE_FROM_SPACESHIP_DOWN, DECON_TINY_STAIRCASE, DECON_OPEN_STAIRCASE, DECON_WALLED_STAIRCASE, DECON_TINY_LIFT, DECON_OPEN_LIFT, DECON_WALLED_LIFT, GATED_TINY_LIFT, GATED_OPEN_LIFT, GATED_CLOSED_LIFT, WELDED_TINY_LIFT, WELDED_OPEN_LIFT, WELDED_WALLED_LIFT, WELDED_TINY_STAIRCASE, WELDED_OPEN_STAIRCASE, WELDED_WALLED_STAIRCASE :: GroupName PlaceKind

pattern ROGUE = GroupName "rogue"
pattern LABORATORY = GroupName "laboratory"
pattern ZOO = GroupName "zoo"
pattern BRAWL = GroupName "brawl"
pattern SHOOTOUT = GroupName "shootout"
pattern ARENA = GroupName "arena"
pattern ESCAPE = GroupName "escape"
pattern AMBUSH = GroupName "ambush"
pattern BATTLE = GroupName "battle"
pattern NOISE = GroupName "noise"
pattern EMPTY = GroupName "empty"

pattern INDOOR_ESCAPE_DOWN = GroupName "escape down"
pattern INDOOR_ESCAPE_UP = GroupName "escape up"
pattern OUTDOOR_ESCAPE_DOWN = GroupName "outdoor escape route"
pattern TINY_STAIRCASE = GroupName "tiny staircase"
pattern OPEN_STAIRCASE = GroupName "open staircase"
pattern CLOSED_STAIRCASE = GroupName "closed staircase"
pattern WALLED_STAIRCASE = GroupName "walled staircase"

-- This is a rotten compromise, because these are synthesized below,
-- so typos can happen.
pattern GATED_TINY_STAIRCASE = GroupName "gated tiny staircase"
pattern GATED_OPEN_STAIRCASE = GroupName "gated open staircase"
pattern GATED_CLOSED_STAIRCASE = GroupName "gated closed staircase"
pattern OUTDOOR_TINY_STAIRCASE = GroupName "outdoor tiny staircase"
pattern OUTDOOR_CLOSED_STAIRCASE = GroupName "outdoor closed staircase"
pattern OUTDOOR_WALLED_STAIRCASE = GroupName "outdoor walled staircase"

-- ** Allure-specific
pattern RESIDENTIAL = GroupName "residential"
pattern MUSEUM = GroupName "museum"
pattern EXIT = GroupName "exit"
pattern RAID = GroupName "raid"

pattern TINY_LIFT = GroupName "tiny lift"
pattern OPEN_LIFT = GroupName "open lift"
pattern WALLED_LIFT = GroupName "walled lift"
pattern CLOSED_LIFT = GroupName "closed lift"
pattern ESCAPE_FROM_SPACESHIP_DOWN = GroupName "escape from spaceship"

-- This is a rotten compromise, because these are synthesized below,
-- so typos can happen.
pattern DECON_TINY_STAIRCASE = GroupName "decon tiny staircase"
pattern DECON_OPEN_STAIRCASE = GroupName "decon open staircase"
pattern DECON_WALLED_STAIRCASE = GroupName "decon walled staircase"
pattern DECON_TINY_LIFT = GroupName "decon tiny lift"
pattern DECON_OPEN_LIFT = GroupName "decon open lift"
pattern DECON_WALLED_LIFT = GroupName "decon walled lift"
pattern GATED_TINY_LIFT = GroupName "gated tiny lift"
pattern GATED_OPEN_LIFT = GroupName "gated open lift"
pattern GATED_CLOSED_LIFT = GroupName "gated closed lift"
pattern WELDED_TINY_LIFT = GroupName "welded tiny lift"
pattern WELDED_OPEN_LIFT = GroupName "welded open lift"
pattern WELDED_WALLED_LIFT = GroupName "welded walled lift"
pattern WELDED_TINY_STAIRCASE = GroupName "welded tiny staircase"
pattern WELDED_OPEN_STAIRCASE = GroupName "welded open staircase"
pattern WELDED_WALLED_STAIRCASE = GroupName "welded walled staircase"

-- * Content

content :: [PlaceKind]
content =
  [deadEnd, rect, rect2, rectWindows, glasshouse, glasshouse2, glasshouse3, glasshouse4, pulpit, ruin, ruin2, collapsed, collapsed2, collapsed3, collapsed4, collapsed5, collapsed6, collapsed7, pillar, pillar2, pillar3, pillar4, pillar5, pillar6, colonnade, colonnade2, colonnade3, colonnade4, colonnade5, colonnade6, colonnade7, colonnade8, colonnade9, colonnade10, lampPost, lampPost2, lampPost3, lampPost4, treeShade, fogClump, fogClump2, smokeClump, smokeClump2, smokeClump3FGround, bushClump, escapeDown, escapeDown2, escapeDown3, escapeDown4, escapeDown5, escapeDown6, escapeDown7, escapeDown8, escapeDown9, staircase1, staircase2, staircase3, staircase4, staircase5, staircase6, staircase7, staircase8, staircase9, staircase10, staircase11, staircase12, staircase13, staircase14, staircase15, staircase16, staircase17, staircase18, staircase19, staircase20, staircase21, staircase22, staircase23, staircase24, staircase25, staircase26, staircase27, staircase28, staircase29, staircase30, staircase31, staircase32, staircase33, staircase34, staircase35, staircase36, staircase37]
  -- Allure-specific
  ++ [staircaseLift11, staircaseLift12, staircaseLift13, staircaseLift14, staircaseLift15, staircaseLift16, staircaseLift17, staircaseLift18, staircaseLift19, staircaseLift20, staircaseLift21, staircaseLift22, staircaseLift23, staircaseLift24, staircaseLift25]
  -- automatically generated
  ++ snd generatedStairs ++ generatedEscapes
  -- Allure-specific, continued
  ++ [ pumps, oval, ovalFloor, ovalSquare, ovalBasin, ovalBasin2, squareBasin, squareBasin2, floodedRoom, floodedRoom2, maze, maze2, maze3, maze4, mazeBig, mazeBig2, cells, cells2, cells3, cells4, cells5, cells6, cells7, tank, tank2, tank3, tank4, tank5, tank6, tank7, tank8, tank9, tank10, tank11, tank12, shuttleHusk, shuttleHusk2, shuttleHusk3, shuttleHusk4, shuttleHusk5, shuttleHusk6, dormitory, dormitory2, dormitory3, dormitory4, dormitory5, dormitory6]

deadEnd,    rect, rect2, rectWindows, glasshouse, glasshouse2, glasshouse3, glasshouse4, pulpit, ruin, ruin2, collapsed, collapsed2, collapsed3, collapsed4, collapsed5, collapsed6, collapsed7, pillar, pillar2, pillar3, pillar4, pillar5, pillar6, colonnade, colonnade2, colonnade3, colonnade4, colonnade5, colonnade6, colonnade7, colonnade8, colonnade9, colonnade10, lampPost, lampPost2, lampPost3, lampPost4, treeShade, fogClump, fogClump2, smokeClump, smokeClump2, smokeClump3FGround, bushClump, escapeDown, escapeDown2, escapeDown3, escapeDown4, escapeDown5, escapeDown6, escapeDown7, escapeDown8, escapeDown9, staircase1, staircase2, staircase3, staircase4, staircase5, staircase6, staircase7, staircase8, staircase9, staircase10, staircase11, staircase12, staircase13, staircase14, staircase15, staircase16, staircase17, staircase18, staircase19, staircase20, staircase21, staircase22, staircase23, staircase24, staircase25, staircase26, staircase27, staircase28, staircase29, staircase30, staircase31, staircase32, staircase33, staircase34, staircase35, staircase36, staircase37 :: PlaceKind
-- Allure-specific
staircaseLift11, staircaseLift12, staircaseLift13, staircaseLift14, staircaseLift15, staircaseLift16, staircaseLift17, staircaseLift18, staircaseLift19, staircaseLift20, staircaseLift21, staircaseLift22, staircaseLift23, staircaseLift24, staircaseLift25, pumps, oval, ovalFloor, ovalSquare, ovalBasin, ovalBasin2, squareBasin, squareBasin2, floodedRoom, floodedRoom2, maze, maze2, maze3, maze4, mazeBig, mazeBig2, cells, cells2, cells3, cells4, cells5, cells6, cells7, tank, tank2, tank3, tank4, tank5, tank6, tank7, tank8, tank9, tank10, tank11, tank12, shuttleHusk, shuttleHusk2, shuttleHusk3, shuttleHusk4, shuttleHusk5, shuttleHusk6, dormitory, dormitory2, dormitory3, dormitory4, dormitory5, dormitory6 :: PlaceKind

staircase, staircaseLift :: PlaceKind  -- templates

staircaseBasic :: [PlaceKind]
staircaseBasic = [staircase1, staircase2, staircase3, staircase4, staircase5, staircase6, staircase7, staircase8, staircase9, staircase10, staircase11, staircase12, staircase13, staircase14, staircase15, staircase16, staircase17, staircase18, staircase19, staircase20, staircase21, staircase22, staircase23, staircase24, staircase25, staircase26, staircase27, staircase28, staircase29, staircase30, staircase31, staircase32, staircase33, staircase34, staircase35, staircase36, staircase37]
  -- Allure-specific
  ++ [staircaseLift11, staircaseLift12, staircaseLift13, staircaseLift14, staircaseLift15, staircaseLift16, staircaseLift17, staircaseLift18, staircaseLift19, staircaseLift20, staircaseLift21, staircaseLift22, staircaseLift23, staircaseLift24, staircaseLift25]

generatedStairs :: ([GroupName PlaceKind], [PlaceKind])
generatedStairs =
  let (stairs, lifts) = partition ((/= "a lift") . pname) staircaseBasic
      gatedStairs = map switchStaircaseToGated stairs
      gatedLifts = map switchLiftToGated lifts
      deconStairs = map switchStaircaseToDecon stairs
      deconLifts = map switchLiftToDecon lifts
      weldedStairs = map switchStaircaseToWelded stairs
      weldedLifts = map switchLiftToWelded lifts
      outdoorStairs = map switchStaircaseToOutdoor stairs
      stairsAll = stairs ++ gatedStairs ++ deconStairs ++ weldedStairs
                  ++ outdoorStairs
      liftsAll = lifts ++ gatedLifts ++ deconLifts ++ weldedLifts
      genStairs =
        gatedStairs ++ gatedLifts
        ++ deconStairs ++ deconLifts
        ++ weldedStairs ++ weldedLifts
        ++ outdoorStairs
        ++ map (switchExitToUp "stair terminal") stairsAll
        ++ map (switchExitToUp "lift terminal") liftsAll
        ++ map (switchExitToDown "stair terminal") stairsAll
        ++ map (switchExitToDown "lift terminal") liftsAll
  in ( nub $ sort $ concatMap (map fst . pfreq) genStairs
     , genStairs )

escapeDownBasic :: [PlaceKind]
escapeDownBasic =
  [ escapeDown, escapeDown2, escapeDown3, escapeDown4, escapeDown5, escapeDown6
  , escapeDown7, escapeDown8, escapeDown9 ]

generatedEscapes :: [PlaceKind]
generatedEscapes =
  let upEscapes = map switchEscapeToUp escapeDownBasic
      outdoorEscapes = map switchEscapeToOutdoorDown escapeDownBasic
      spaceshipEscapes = map switchEscapeToSpaceshipDown escapeDownBasic
  in upEscapes ++ outdoorEscapes ++ spaceshipEscapes

-- The dots below are @'\x00B7'@, as defined in @TileKind.floorSymbol@.
deadEnd = PlaceKind  -- needs to have index 0
  { psymbol  = 'd'
  , pname    = "a dead end"
  , pfreq    = []
  , prarity  = []
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = ["·"]
  , poverrideDark = []
  , poverrideLit = []
  }
rect = PlaceKind  -- Valid for any nonempty area, hence low frequency.
  { psymbol  = 'r'
  , pname    = "a room"
  , pfreq    = [(ROGUE, 100), (LABORATORY, 10), (RAID, 100)]
  , prarity  = [(1, 10), (10, 6)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = ["·"]
  , poverrideDark = []
  , poverrideLit = []
  }
rect2 = rect
  { pname    = "a pen"
  , pfreq    = [(SHOOTOUT, 1), (ZOO, 10)]
  }
rectWindows = PlaceKind
  { psymbol  = 'w'
  , pname    = "a shed"
  , pfreq    = [(ESCAPE, 20)]
  , prarity  = [(1, 10), (10, 10)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "#%"
               , "%·"
               ]
  , poverrideDark = [('%', RECT_WINDOWS)]
  , poverrideLit = [('%', RECT_WINDOWS)]
  }
glasshouse = PlaceKind
  { psymbol  = 'g'
  , pname    = "a glasshouse"
  , pfreq    = [(SHOOTOUT, 10)]
  , prarity  = [(1, 10), (10, 7)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "%%"
               , "%·"
               ]
  , poverrideDark = []
  , poverrideLit = []
  }
glasshouse2 = glasshouse
  { pname    = "a glass cage"
  , pfreq    = [(LABORATORY, 2), (ZOO, 30)]
  , poverrideDark = [('·', DAMP_FLOOR_DARK)]
  , poverrideLit = [('·', DAMP_FLOOR_LIT)]
  }
glasshouse3 = glasshouse
  { pname    = "an entertainment center"
  , pfreq    = [(ARENA, 1), (AMBUSH, 10)]
  }
glasshouse4 = glasshouse
  { pname    = "an exhibition area"
  , pfreq    = [(ARENA, 1), (MUSEUM, 1)]
  }
pulpit = PlaceKind
  { psymbol  = 'p'
  , pname    = "a stand podium"
  , pfreq    = [(ARENA, 15), (MUSEUM, 15), (ZOO, 100)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FGround
  , ptopLeft = [ "%%·"
               , "%··"
               , "··0"
               ]
  , poverrideDark = [('0', S_PULPIT)]
  , poverrideLit = [('0', S_PULPIT)]
      -- except for floor, this will all be lit, regardless of night/dark; OK
  }
ruin = PlaceKind
  { psymbol  = 'R'
  , pname    = "ruins"
  , pfreq    = [(BATTLE, 660), (AMBUSH, 70)]
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = ["X"]
  , poverrideDark = [('·', DAMP_FLOOR_DARK)]
  , poverrideLit = [('·', DAMP_FLOOR_LIT)]
  }
ruin2 = ruin
  { pname    = "a scaffolding"
  , pfreq    = [(NOISE, 2000), (EXIT, 5), (MUSEUM, 1)]
  }
collapsed = PlaceKind
  { psymbol  = 'c'
  , pname    = "a hardware stack"
  , pfreq    = [(NOISE, 1)]
      -- no point taking up space if very little space taken,
      -- but if no other place can be generated, a failsafe is useful
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "#"
               ]
  , poverrideDark = [('#', DOORLESS_MACHINERY)]
  , poverrideLit = [('#', DOORLESS_MACHINERY)]
  }
collapsed2 = collapsed
  { pfreq    = [(NOISE, 1000), (BATTLE, 200)]
  , ptopLeft = [ "X#"
               , "##"
               ]
  }
collapsed3 = collapsed
  { pfreq    = [(NOISE, 2000), (BATTLE, 200)]
  , ptopLeft = [ "XX#"
               , "###"
               ]
  }
collapsed4 = collapsed
  { pfreq    = [(NOISE, 2200), (BATTLE, 200)]
  , ptopLeft = [ "XXX#"
               , "####"
               ]
  }
collapsed5 = collapsed
  { pfreq    = [(NOISE, 3000), (BATTLE, 500)]
  , ptopLeft = [ "XX#"
               , "X##"
               , "###"
               ]
  }
collapsed6 = collapsed
  { pfreq    = [(NOISE, 4000), (BATTLE, 1000)]
  , ptopLeft = [ "XXX#"
               , "X###"
               , "####"
               ]
  }
collapsed7 = collapsed
  { pfreq    = [(NOISE, 4000), (BATTLE, 1000)]
  , ptopLeft = [ "XXX#"
               , "XX##"
               , "####"
               ]
  }
pillar = PlaceKind
  { psymbol  = 'p'
  , pname    = "a market"
  , pfreq    = [(ROGUE, 300), (ARENA, 10000), (EMPTY, 400)]
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FWall
  -- Larger rooms require support pillars.
  , ptopLeft = [ "····"
               , "·0··"
               , "····"
               , "····"
               ]
  , poverrideDark = [('·', OILY_FLOOR_DARK)]
  , poverrideLit = [('·', OILY_FLOOR_LIT)]
  }
pillar2 = pillar
  { pname    = "a mall"
  , pfreq    = [(ROGUE, 10000), (ARENA, 100000), (EMPTY, 4000)]
  , ptopLeft = [ "0····"
               , "·····"
               , "·····"
               , "···0·"
               , "····~"
               ]
  , poverrideDark = [('~', S_POOL_DARK)]
  , poverrideLit = [('~', S_POOL_LIT)]
  }
pillar3 = pillar
  { pname    = "a court"
  , pfreq    = [ (ROGUE, 250), (ARENA, 15), (MUSEUM, 10)
               , (LABORATORY, 200), (RAID, 50) ]
  , ptopLeft = [ "#··"
               , "···"
               , "···"
               ]
  }
pillar4 = pillar
  { pname    = "a plaza"
  , pfreq    = [ (ROGUE, 1500), (ARENA, 5000)
               , (MUSEUM, 4000), (LABORATORY, 1500) ]
  , ptopLeft = [ "#·#·"
               , "····"
               , "#···"
               , "····"
               ]
  }
pillar5 = pillar
  { pname    = "a bank outlet"
  , pfreq    = [ (ROGUE, 1200), (ARENA, 6000)
               , (EMPTY, 600), (EXIT, 600) ]
  , ptopLeft = [ "&i%·"
               , "ii#·"
               , "%#p·"
               , "····"
               ]
  , poverrideDark = [ ('&', CACHE_DEPOSIT), ('p', TRAPPED_DOOR)
                    , ('i', FLOOR_ACTOR_ITEM) ]  -- lit or not, randomly
  , poverrideLit = [ ('&', CACHE_DEPOSIT), ('p', TRAPPED_DOOR)
                   , ('i', FLOOR_ACTOR_ITEM) ]  -- lit or not, randomly
      -- no STUCK_DOOR, because FWall, so would break global pathfinding
  }
pillar6 = pillar
  { pname    = "a jewelry store"
  , pfreq    = [ (ROGUE, 1200), (ARENA, 6000)
               , (MUSEUM, 7000), (EMPTY, 600) ]
  , ptopLeft = [ "0a··"
               , "aaf·"
               , "·f&·"
               , "····"
               ]
  , poverrideDark = [ ('&', CACHE_JEWELRY), ('0', S_LAMP_POST)
                    , ('f', BUSH_GROVE_DARK) , ('a', S_FLOOR_ACTOR_LIT) ]
  , poverrideLit = [ ('&', CACHE_JEWELRY), ('0', S_LAMP_POST)
                   , ('f', BUSH_GROVE_LIT), ('a', S_FLOOR_ACTOR_LIT) ]
  }
colonnade = PlaceKind
  { psymbol  = 'c'
  , pname    = "a colonnade"
  , pfreq    = [ (ROGUE, 12), (NOISE, 1000), (ESCAPE, 200)
               , (EXIT, 30), (RAID, 12) ]
  , prarity  = [(1, 12), (10, 12)]
  , pcover   = CAlternate
  , pfence   = FFloor
  , ptopLeft = [ "#·"
               , "··"
               ]
  , poverrideDark = []
  , poverrideLit = []
  }
colonnade2 = colonnade
  { pfreq    = [(ROGUE, 300)]
  , prarity  = [(1, 1)]
  , pfence   = FWall
  , ptopLeft = [ "#·"
               , "·#"
               ]
  }
colonnade3 = colonnade
  { prarity  = [(1, 120), (10, 120)]
  , ptopLeft = [ "··#"
               , "·#·"
               , "#··"
               ]
  }
colonnade4 = colonnade
  { prarity  = [(1, 1)]
  , pfreq    = [(ROGUE, 1000), (RAID, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "#··"
               , "·#·"
               , "··#"
               ]
  }
colonnade5 = colonnade
  { prarity  = [(1, 25), (10, 25)]
  , ptopLeft = [ "#··"
               , "··#"
               ]
  }
colonnade6 = colonnade
  { prarity  = [(1, 14), (10, 14)]
  , ptopLeft = [ "#·"
               , "··"
               , "·#"
               ]
  }
colonnade7 = colonnade
  { pfreq    = [(ARENA, 50), (MUSEUM, 30), (EMPTY, 800), (RAID, 40)]
  , prarity  = [(1, 7), (10, 7)]
  , ptopLeft = [ "0·"
               , "··"
               ]
  }
colonnade8 = colonnade7
  { prarity  = [(1, 50), (10, 50)]
  , ptopLeft = [ "··0"
               , "·0·"
               , "0··"
               ]
  }
colonnade9 = colonnade7
  { prarity  = [(1, 20), (10, 20)]
  , ptopLeft = [ "0··"
               , "··0"
               ]
  }
colonnade10 = colonnade7
  { prarity  = [(1, 10), (10, 10)]
  , ptopLeft = [ "0·"
               , "··"
               , "·0"
               ]
  }
lampPost = PlaceKind
  { psymbol  = 'l'
  , pname    = "a lamp-lit area"
  , pfreq    = [ (ESCAPE, 200), (ZOO, 100), (AMBUSH, 1000)
               , (BATTLE, 100) ]
  , prarity  = [(1, 1)]
  , pcover   = CVerbatim
  , pfence   = FNone
  , ptopLeft = [ "X·X"
               , "·0·"
               , "X·X"
               ]
  , poverrideDark = [('0', S_LAMP_POST), ('·', S_FLOOR_ACTOR_LIT)]
  , poverrideLit = [('0', S_LAMP_POST), ('·', S_FLOOR_ACTOR_LIT)]
  }
lampPost2 = lampPost
  { ptopLeft = [ "···"
               , "·0·"
               , "···"
               ]
  }
lampPost3 = lampPost
  { pfreq    = [(ESCAPE, 3000), (ZOO, 500), (BATTLE, 1100)]
  , ptopLeft = [ "XX·XX"
               , "X···X"
               , "··0··"
               , "X···X"
               , "XX·XX"
               ]
  }
lampPost4 = lampPost
  { pfreq    = [(ESCAPE, 3000), (ZOO, 500), (BATTLE, 600)]
  , ptopLeft = [ "X···X"
               , "·····"
               , "··0··"
               , "·····"
               , "X···X"
               ]
  }
treeShade = PlaceKind
  { psymbol  = 't'
  , pname    = "a tree shade"
  , pfreq    = [(BRAWL, 500)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "··s"
               , "s0·"
               , "Xs·"
               ]
  , poverrideDark = [ ('0', S_TREE_DARK)
                    , ('s', TREE_SHADE_WALKABLE_DARK)
                    , ('·', S_SHADED_GROUND) ]
  , poverrideLit = [ ('0', S_TREE_LIT)
                   , ('s', TREE_SHADE_WALKABLE_LIT)
                   , ('·', S_SHADED_GROUND) ]
  }
fogClump = PlaceKind
  { psymbol  = 'f'
  , pname    = "a foggy patch"
  , pfreq    = [(EMPTY, 400), (SHOOTOUT, 70), (ESCAPE, 60), (RAID, 50)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "f;"
               , ";f"
               , ";X"
               ]
  , poverrideDark = [('f', FOG_CLUMP_DARK), (';', S_FOG_LIT)]
  , poverrideLit = [('f', FOG_CLUMP_LIT), (';', S_FOG_LIT)]
  }
fogClump2 = fogClump
  { pfreq    = [(EMPTY, 2200), (SHOOTOUT, 400), (ESCAPE, 100), (RAID, 250)]
  , ptopLeft = [ "X;f"
               , "f;f"
               , ";;f"
               , "Xff"
               ]
  }
smokeClump = PlaceKind
  { psymbol  = 's'
  , pname    = "a smoky patch"
  , pfreq    = [(EXIT, 20), (ZOO, 40), (AMBUSH, 50)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "f;"
               , ";f"
               , ";X"
               ]
  , poverrideDark = [ ('f', SMOKE_CLUMP_DARK), (';', S_SMOKE_LIT)
                    , ('·', S_FLOOR_ACTOR_DARK) ]
  , poverrideLit = [ ('f', SMOKE_CLUMP_LIT), (';', S_SMOKE_LIT)
                   , ('·', S_FLOOR_ACTOR_LIT) ]
  }
smokeClump2 = smokeClump
  { pfreq    = [(EXIT, 100), (ZOO, 200), (AMBUSH, 150)]
  , ptopLeft = [ "X;f"
               , "f;f"
               , ";;f"
               , "Xff"
               ]
  }
smokeClump3FGround = smokeClump
  { pname    = "a burned out area"
  , pfreq    = [(LABORATORY, 50)]  -- close to guaranteed, but not overcrowded
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FGround
  , ptopLeft = [ ";f:"  -- workshop terrain
               , "f·f"
               , "f·f"
               , ";f;"
               ]
      -- should not be used in caves with trails, because bushes should
      -- not grow over such artificial trails
  }
bushClump = PlaceKind
  { psymbol  = 'b'
  , pname    = "a bushy patch"
  , pfreq    = [(SHOOTOUT, 120), (EMPTY, 60), (BRAWL, 30)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "f;X"  -- the third column is needed to prevent blockage
               , ";Xf"
               , ";fX"
               ]
  , poverrideDark = [('f', BUSH_CLUMP_DARK), (';', S_BUSH_LIT)]
  , poverrideLit = [('f', BUSH_CLUMP_LIT), (';', S_BUSH_LIT)]
      -- should not be used in caves with trails, because bushes can't
      -- grow over such artificial trails
  }
escapeDown = PlaceKind
  { psymbol  = '>'
  , pname    = "an escape down"
  , pfreq    = [(INDOOR_ESCAPE_DOWN, 1)]
  , prarity  = [(1, 1)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ ">"
               ]
  , poverrideDark = [ ('g', S_FROZEN_PATH) , ('0', S_LAMP_POST), ('b', BARREL)
                    , ('a', S_FLOOR_ACTOR_LIT), ('r', RUBBLE_OR_WASTE_DARK) ]
  , poverrideLit = [ ('g', S_FROZEN_PATH), ('0', S_LAMP_POST), ('b', BARREL)
                   , ('a', S_FLOOR_ACTOR_LIT), ('r', RUBBLE_OR_WASTE_LIT) ]
  }
escapeDown2 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 200)]
  , pfence   = FGround
  , ptopLeft = [ "#·#"
               , "·>·"
               , "#·#"
               ]
  }
escapeDown3 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 200)]
  , pfence   = FFloor
  , ptopLeft = [ "·b·"
               , "b>b"
               , "·b·"
               ]
  }
escapeDown4 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 200)]
  , pfence   = FWall
  , ptopLeft = [ "^·^"
               , "·>·"
               , "^·^"
               ]
  }
escapeDown5 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 200)]
  , pcover   = CMirror
  , pfence   = FFloor
  , ptopLeft = [ "r#·"
               , "r>#"
               , "rrr"
               ]
  }
escapeDown6 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "··#··"
               , "·#g#·"
               , "#g>g#"
               , "·#g#·"
               , "··#··"
               ]
  }
escapeDown7 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·g#g·"
               , "g#g#g"
               , "#g>g#"
               , "g#g#g"
               , "·g#g·"
               ]
  }
escapeDown8 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 1000)]
  , pcover   = CMirror
  , pfence   = FWall
  , ptopLeft = [ "··#g·"
               , "·#gg·"
               , "·#>g#"
               , "·gg#·"
               , "g·#··"
               ]
  }
escapeDown9 = escapeDown
  { pfreq    = [(INDOOR_ESCAPE_DOWN, 1000)]
  , pcover   = CMirror
  , pfence   = FFloor
  , ptopLeft = [ "·a·#"
               , "%a>·"
               , "%0a·"
               , "aa%%"
               ]
  }
staircase = PlaceKind
  { psymbol  = '/'
  , pname    = "a staircase"
  , pfreq    = [(TINY_STAIRCASE, 1)]  -- no cover when arriving; low freq
  , prarity  = [(1, 100), (10, 100)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ "<S>"
               ]
  , poverrideDark = [ ('<', STAIRCASE_UP), ('>', STAIRCASE_DOWN)
                    , ('I', SIGNBOARD), ('S', FILLER_WALL) ]
  , poverrideLit = [ ('<', STAIRCASE_UP), ('>', STAIRCASE_DOWN)
                   , ('I', SIGNBOARD), ('S', FILLER_WALL) ]
  }
staircase1 = staircase
  { prarity  = [(1, 1)]  -- no cover when arriving; so low rarity
  }
staircase2 = staircase
  { pfreq    = [(TINY_STAIRCASE, 3)]
  , prarity  = [(1, 1)]
  , pfence   = FFloor
  , ptopLeft = [ "·<S>·"
               ]
  }
-- Allure-specific:
staircaseLift = PlaceKind
  { psymbol  = '|'
  , pname    = "a lift"
  , pfreq    = [(TINY_LIFT, 1)]
  , prarity  = [(1, 100), (10, 100)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ "<S>"
               ]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircase3 = staircaseLift
  { prarity  = [(1, 1)]
  }
staircase4 = staircaseLift
  { pfreq    = [(TINY_LIFT, 3)]
  , prarity  = [(1, 1)]
  , ptopLeft = [ "·<S>·"
               ]
  }
staircase5 = staircase
  { pfreq    = [(OPEN_STAIRCASE, 200)]  -- no cover, open
  , pfence   = FGround
  , ptopLeft = [ "#·#"
               , "···"
               , "<S>"
               , "···"
               , "#·#"
               ]
  }
staircase6 = staircaseLift
  { pfreq    = [(OPEN_LIFT, 300)]
  , pfence   = FFloor
  , ptopLeft = [ "#·#·#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#·#·#"
               ]
  }
staircase7 = staircase
  { pfreq    = [(OPEN_STAIRCASE, 500)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·#·#"
               , "·······"
               , "#·<S>·#"
               , "·······"
               , "#·#·#·#"
               ]
  }
staircase8 = staircaseLift
  { pfreq    = [(OPEN_LIFT, 2000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·#·"
               , "#·····#"
               , "··<S>··"
               , "#·····#"
               , "·#·#·#·"
               ]
  }
staircase9 = staircase
  { pfreq    = [(OPEN_STAIRCASE, 500)]
  , pfence   = FFloor
  , ptopLeft = [ "#·······#"
               , "···<S>···"
               , "#·······#"
               ]
  }
staircase10 = staircaseLift
  { pfreq    = [(OPEN_LIFT, 500)]
  , pfence   = FGround
  , ptopLeft = [ "0·····0"
               , "··<S>··"
               , "0·····0"
               ]
  }
staircase11 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 2000)]  -- weak cover, low freq
  , pfence   = FFloor
  , ptopLeft = [ "·#·"
               , "#·#"
               , "···"
               , "<S>"
               , "···"
               , "#·#"
               , "·#·"
               ]
  }
staircase12 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 4000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·"
               , "#·#·#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#·#·#"
               , "·#·#·"
               ]
  }
staircase13 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 6000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·#·"
               , "#·#·#·#"
               , "·······"
               , "0·<S>·0"
               , "·······"
               , "#·#·#·#"
               , "·#·#·#·"
               ]
  }
staircase14 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 10000)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·#·#"
               , "·#·#·#·"
               , "#·····#"
               , "··<S>··"
               , "#·····#"
               , "·#·#·#·"
               , "#·#·#·#"
               ]
  }
staircase15 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 20000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·#·#·"
               , "#·#·#·#·#"
               , "·#~~~~~#·"
               , "#~~<S>~~#"
               , "·#~~~~~#·"
               , "#·#·#·#·#"
               , "·#·#·#·#·"
               ]
  }
staircase16 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 20000)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·#·#·#"
               , "·#·#·#·#·"
               , "#·······#"
               , "·#·<S>·#·"
               , "#·······#"
               , "·#·#·#·#·"
               , "#·#·#·#·#"
               ]
  }
staircase17 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 20000)]
  , pfence   = FFloor
  , ptopLeft = [ "#·#·#·#·#·#"
               , "·#·#·#·#·#·"
               , "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               , "·#·#·#·#·#·"
               , "#·#·#·#·#·#"
               ]
  }
staircase18 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 80000)]
  , pfence   = FGround
  , ptopLeft = [ "XX#·#·#·#XX"
               , "X#·#·#·#·#X"
               , "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               , "X#·#·#·#·#X"
               , "XX#·#·#·#XX"
               ]
  }
staircase19 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 20000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·#·#·#·"
               , "#·#·#·#·#·#"
               , "·#·······#·"
               , "#·#·<S>·#·#"
               , "·#·······#·"
               , "#·#·#·#·#·#"
               , "·#·#·#·#·#·"
               ]
  }
staircase20 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 5000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·0·#·#·"
               , "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               , "·#·#·I·#·#·"
               ]
  }
staircase21 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 5000)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·I·#·#"
               , "·#·····#·"
               , "#··<S>··#"
               , "·#·····#·"
               , "#·#·0·#·#"
               ]
  }
staircase22 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 2000)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               ]
  }
staircase23 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·······#·"
               , "#·#·<S>·#·#"
               , "·#·······#·"
               ]
  }
staircase24 = staircase
  { pfreq    = [(CLOSED_STAIRCASE, 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·····#·"
               , "#··<S>··#"
               , "·#·····#·"
               ]
  }
staircase25 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 100)]
  , pfence   = FWall
  , ptopLeft = [ "·····"
               , "·<S>·"
               , "·····"
               ]
  }
staircase26 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 200)]
  , pfence   = FWall
  , ptopLeft = [ "·······"
               , "··<S>··"
               , "·······"
               ]
  }
staircase27 = staircaseLift
  { pfreq    = [(WALLED_LIFT, 500)]
  , pfence   = FWall
  , ptopLeft = [ "#·····#"
               , "··<S>··"
               , "#·····#"
               ]
  }
staircase28 = staircaseLift
  { pfreq    = [(WALLED_LIFT, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·····"
               , "·····"
               , "·<S>·"
               , "·····"
               , "·····"
               ]
  }
staircase29 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "#···#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#···#"
               ]
  }
staircase30 = staircaseLift
  { pfreq    = [(WALLED_LIFT, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "#···#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#···#"
               ]
  }
staircase31 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 2000)]
  , pfence   = FWall
  , ptopLeft = [ "·······"
               , "·~~~~~·"
               , "·~<S>~·"
               , "·~~~~~·"
               , "·······"
               ]
  }
staircase32 = staircaseLift
  { pfreq    = [(WALLED_LIFT, 5000)]
  , pfence   = FWall
  , ptopLeft = [ "#·····#"
               , "·······"
               , "··<S>··"
               , "·······"
               , "#·····#"
               ]
  }
staircase33 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 5000)]
  , pfence   = FWall
  , ptopLeft = [ "#·#·#·#"
               , "·······"
               , "#·<S>·#"
               , "·······"
               , "#·#·#·#"
               ]
  }
staircase34 = staircaseLift
  { pfreq    = [(WALLED_LIFT, 5000)]
  , pfence   = FWall
  , ptopLeft = [ "·#·#·#·"
               , "#·····#"
               , "··<S>··"
               , "#·····#"
               , "·#·#·#·"
               ]
  }
staircase35 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·········"
               , "···<S>···"
               , "·········"
               ]
  }
staircase36 = staircaseLift
  { pfreq    = [(WALLED_LIFT, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·#·····#·"
               , "#··<S>··#"
               , "·#·····#·"
               ]
  }
staircase37 = staircase
  { pfreq    = [(WALLED_STAIRCASE, 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·········"
               , "·0·<S>·0·"
               , "·········"
               ]
  }

-- * Allure-specific

overrideLift :: [(Char, GroupName TileKind)]
overrideLift = [ ('<', STAIRCASE_LIFT_UP), ('>', STAIRCASE_LIFT_DOWN)
               , ('I', SIGNBOARD), ('S', S_LIFT_SHAFT) ]
staircaseLift11 = staircase11
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 2000)]  -- weak cover, low freq
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift12 = staircase12
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 4000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift13 = staircase13
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 6000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift14 = staircase14
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 10000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift15 = staircase15
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift16 = staircase16
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift17 = staircase17
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift18 = staircase18
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 80000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift19 = staircase19
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift20 = staircase20
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 5000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift21 = staircase21
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 5000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift22 = staircase22
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 2000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift23 = staircase23
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 1000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift24 = staircase24
  { pname     = "a lift"
  , pfreq     = [(CLOSED_LIFT, 1000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift25 = staircase25
  { pname     = "a lift"
  , pfreq     = [(WALLED_LIFT, 100)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
pumps = PlaceKind
  { psymbol  = 'w'
  , pname    = "water pumps"
  , pfreq    = [ (ROGUE, 200), (LABORATORY, 100), (EMPTY, 2000)
               , (SHOOTOUT, 50), (RAID, 300) ]
  , prarity  = [(1, 1)]
  , pcover   = CAlternate
  , pfence   = FWall
  , ptopLeft = [ "·f"
               , "d;"
               ]
  , poverrideDark = [ ('·', DAMP_FLOOR_DARK)
                    , ('d', DOORLESS_MACHINERY)
                    , ('f', PUMPS_DARK)
                    , (';', UNDERBRUSH_CLUMP_DARK) ]
  , poverrideLit = [ ('·', DAMP_FLOOR_LIT)
                   , ('d', DOORLESS_MACHINERY)
                   , ('f', PUMPS_LIT)
                   , (';', UNDERBRUSH_CLUMP_LIT) ]
  }
oval = PlaceKind
  { psymbol  = 'o'
  , pname    = "a dome"
  , pfreq    = [ (ROGUE, 20000), (ARENA, 30000), (MUSEUM, 30000)
               , (LABORATORY, 50000), (EMPTY, 3000), (EXIT, 5000)
               , (AMBUSH, 20000), (RAID, 20000) ]
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = [ "####·"
               , "##···"
               , "#··tt"
               , "#·t··"
               , "··t··"
               ]
  , poverrideDark = [ ('t', TRAIL_LIT)
                    , ('p', TRAPPED_DOOR)
                    , ('b', BARREL)
                    , ('a', SAFE_TRAIL_LIT)
                    , ('1', STUCK_DOOR)
                    , ('2', TRAPPED_DOOR)
                    , ('T', S_TREE_LIT)
                    , ('~', S_POOL_DARK)
                    , (';', S_UNDERBRUSH_DARK) ]
  , poverrideLit = [ ('t', TRAIL_LIT)
                   , ('p', TRAPPED_DOOR)
                   , ('b', BARREL)
                   , ('a', SAFE_TRAIL_LIT)
                   , ('2', STUCK_DOOR)  -- reversed vs dark
                   , ('1', TRAPPED_DOOR)
                   , ('T', S_TREE_LIT)
                   , ('~', S_POOL_LIT)
                   , (';', S_UNDERBRUSH_LIT) ]
  }
ovalFloor = oval
  { pfreq    = [ (ROGUE, 150000), (ARENA, 60000), (MUSEUM, 60000)
               , (LABORATORY, 100000), (EMPTY, 20000), (EXIT, 5000)
               , (AMBUSH, 100000), (RAID, 150000) ]
  , pfence   = FGround
  , ptopLeft = [ "aXXX##"
               , "Xp###·"
               , "X#a···"
               , "X#·a·a"
               , "##··a;"
               , "#··a;;"
               ]
  }
ovalSquare = oval
  { pfreq    = [ (ROGUE, 20000), (ARENA, 30000), (MUSEUM, 30000)
               , (LABORATORY, 50000), (EMPTY, 8000), (EXIT, 5000)
               , (AMBUSH, 20000), (RAID, 20000) ]
  , pfence   = FGround
  , ptopLeft = [ "X###+"
               , "##···"
               , "#··;;"
               , "#·;;;"
               , "+·;;;"
               ]
  }
ovalBasin = oval
  { pname    = "a water basin"
  , pfreq    = [ (ROGUE, 100000), (ARENA, 100000), (LABORATORY, 200000)
               , (EMPTY, 15000), (RAID, 100000) ]
  , pfence   = FGround
  , ptopLeft = [ "XXX1##"
               , "X###··"
               , "X#····"
               , "2#··~~"
               , "#··~~~"
               , "#··~~~"
               ]
  }
ovalBasin2 = oval
  { pname    = "a water basin"
  , pfreq    = [ (ROGUE, 600), (ARENA, 10000), (LABORATORY, 3000)
               , (EMPTY, 700), (RAID, 600) ]
  , pfence   = FWall
  , ptopLeft = [ "#···"
               , "··~~"
               , "·~~~"
               , "·~~~"
               ]
  }
squareBasin = oval
  { pname    = "a water basin"
  , pfreq    = [(ARENA, 10000), (LABORATORY, 5000), (EMPTY, 2000), (RAID, 1000)]
      -- keep it less common in raid not to overload the newbies
  , pfence   = FNone
  , ptopLeft = [ "0bt0t"
               , "b~~~~"
               , "t~0~~"
               , "0~~~~"
               , "t~~~~"
               ]
  }
squareBasin2 = oval
  { pname    = "a water basin"
  , pfreq    = [(ARENA, 200000), (EMPTY, 20000), (BRAWL, 100000)]
      -- can't do LABORATORY, because barrels might block corridors
  , pfence   = FNone
  , ptopLeft = [ "T;T;;;"
               , ";~~~~~"
               , "T~~~~~"
               , ";~~0~~"
               , ";~~~~~"
               , "b~~~~~"
               ]
  }
floodedRoom = PlaceKind  -- Valid for any nonempty area, hence low frequency.
  { psymbol  = 'f'
  , pname    = "a flooded room"
  , pfreq    = [(ROGUE, 10), (LABORATORY, 12), (ZOO, 50), (RAID, 7)]
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = ["~"]
  , poverrideDark = []
  , poverrideLit = []
  }
floodedRoom2 = PlaceKind
  { psymbol  = 'p'
  , pname    = "a pond"
  , pfreq    = [(BRAWL, 100)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "XXf"
               , "f~~"
               , "~~X" ]
  , poverrideDark = [('f', PUMPS_LIT)]
  , poverrideLit = [('f', PUMPS_LIT)]
  }
maze = PlaceKind
  { psymbol  = 'm'
  , pname    = "an intricate maze"
  , pfreq    = [ (ROGUE, 60), (LABORATORY, 1500), (ARENA, 3)
               , (MUSEUM, 3), (EXIT, 100), (RAID, 60) ]
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = [ "##··"
               , "#··#"
               , "··#·"
               ]
  , poverrideDark = [ ('·', OILY_FLOOR_DARK)
                    , ('&', CACHE_MAZE)
                    , ('p', TRAPPED_DOOR)
                    , ('i', FLOOR_ACTOR_ITEM)  -- lit or not, randomly
                    , ('f', BUSH_GROVE_DARK)
                    , (';', S_UNDERBRUSH_DARK)
                    , ('$', TRAPPABLE_WALL) ]
  , poverrideLit = [ ('·', OILY_FLOOR_LIT)
                   , ('&', CACHE_MAZE)
                   , ('p', TRAPPED_DOOR)
                   , ('i', FLOOR_ACTOR_ITEM)  -- lit or not, randomly
                   , ('f', BUSH_GROVE_LIT)
                   , (';', S_UNDERBRUSH_LIT)
                   , ('$', TRAPPABLE_WALL) ]
  }
maze2 = maze
  { pfreq    = [ (ROGUE, 120), (LABORATORY, 12000), (ARENA, 4)
               , (MUSEUM, 4), (EXIT, 100), (RAID, 120) ]
  , ptopLeft = [ "#·%%·"
               , "·%··#"
               , "···#·"
               ]
  }
maze3 = maze
  { pfreq    = [ (ROGUE, 120), (LABORATORY, 1000), (ARENA, 8)
               , (MUSEUM, 4), (EMPTY, 300), (EXIT, 50), (RAID, 120) ]
  , ptopLeft = [ "#·ff·"
               , "·f··#"
               , "···#;"
               ]
  }
maze4 = maze
  { pfreq    = [ (ROGUE, 300), (LABORATORY, 15000), (ARENA, 9)
               , (EXIT, 200), (RAID, 300) ]
  , ptopLeft = [ "##·##·"
               , "#·#··#"
               , "~·f···"
               ]
  }
mazeBig = maze
  { pfreq    = [ (ROGUE, 1500), (LABORATORY, 8000), (ARENA, 10000)
               , (EXIT, 1000), (RAID, 300) ]
  , pfence   = FNone
  , ptopLeft = [ "X$$$$$"
               , "$··##·"
               , "$#····"
               , "$#·p%%"
               , "$··%:i"
               ]
  }
mazeBig2 = mazeBig
  { ptopLeft = [ "XX$$$~"
               , "X#···%"
               , "$·###·"
               , "$·p&%%"
               , "$·#iii"
               ]
  }
cells = PlaceKind
  { psymbol  = '#'
  , pname    = "air filters"
  , pfreq    = [ (ROGUE, 40), (LABORATORY, 48), (MUSEUM, 10)
               , (EXIT, 150), (NOISE, 480)
               , (ZOO, 700), (AMBUSH, 80), (RAID, 40) ]
  , prarity  = [(1, 1)]
  , pcover   = CReflect
  , pfence   = FWall
  , ptopLeft = [ "#··"
               , "·d·"
               , "··#"
               ]
  , poverrideDark = [ ('d', DOORLESS_MACHINERY), ('b', RUBBLE_OR_WASTE_DARK)
                    , ('f', BUSH_GROVE_DARK), ('o', OIL_RESIDUE_DARK)
                    , (';', UNDERBRUSH_CLUMP_DARK), ('w', S_REINFORCED_WALL) ]
  , poverrideLit = [ ('d', DOORLESS_MACHINERY), ('b', RUBBLE_OR_WASTE_LIT)
                   , ('f', BUSH_GROVE_LIT), ('o', OIL_RESIDUE_LIT)
                   , (';', UNDERBRUSH_CLUMP_LIT), ('w', S_REINFORCED_WALL) ]
  }
cells2 = cells
  { pname    = "humidity equalizers"
  , prarity  = [(1, 2), (10, 2)]
  , ptopLeft = [ "f;#·"  -- extra column to avoid blocked exits
               , ";d;;"
               , "·db;"
               ]
  }
cells3 = cells
  { pname    = "thermostat units"
  , ptopLeft = [ "·^#"
               , "·#~"
               , ";;#"
               ]
  }
cells4 = cells
  { pname    = "a power node"
  , ptopLeft = [ "·o#"
               , "oob"
               , "#b·"
               ]
  }
cells5 = cells  -- this one is distinct enough from others, so needs a boost
  { pname    = "broken robot holds"
  , pfreq    = [ (ROGUE, 20), (LABORATORY, 15)
               , (EMPTY, 80), (EXIT, 70), (NOISE, 150) ]
  , ptopLeft = [ "··w"
               , "·:w"
               , "wwo"
               ]
  }
cells6 = cells
  { pname    = "animal holding pens"
  , pfreq    = [ (ARENA, 3), (LABORATORY, 20), (ZOO, 80)]
  , ptopLeft = [ ";;f"
               , "%%'"
               ]
  }
cells7 = cells
  { pname    = "a defunct control room"
  , pfreq    = [ (ROGUE, 10), (LABORATORY, 20)
               , (EXIT, 30), (NOISE, 200), (AMBUSH, 50) ]
  , pfence   = FFloor
  , ptopLeft = [ "d·o"
               , "·#o"
               ]
  }
tank = PlaceKind
  { psymbol  = 'c'
  , pname    = "a tank"
  , pfreq    = [(EMPTY, 1)]
      -- no point taking up space if very little space taken,
      -- but if no other place can be generated, a failsafe is useful
  , prarity  = [(1, 1)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "#"
               ]
  , poverrideDark = [ ('#', DOORLESS_WALL)
                    , ('r', S_REINFORCED_WALL)
                    , ('b', BARREL) ]
  , poverrideLit = [ ('#', DOORLESS_WALL)
                   , ('r', S_REINFORCED_WALL)
                   , ('b', BARREL) ]
  }
tank2 = tank
  { pname    = "a barrel stack"
  , pfreq    = [(EMPTY, 30), (EXIT, 2), (NOISE, 1), (BATTLE, 1)]
  , ptopLeft = [ "b"
               ]
  }
tank3 = tank
  { pfreq    = [(EMPTY, 150), (EXIT, 15), (NOISE, 50), (BATTLE, 25)]
  , ptopLeft = [ "0#"
               , "##"
               ]
  }
tank4 = tank
  { pname    = "a barrel stack"
  , pfreq    = [(EMPTY, 150), (EXIT, 8), (NOISE, 50), (BATTLE, 25)]
  , ptopLeft = [ "Xb"
               , "bb"
               ]
  }
tank5 = tank
  { pname    = "a barrel yard"
  , pfreq    = [(EMPTY, 1800), (EXIT, 700), (NOISE, 700), (BATTLE, 300)]
  , pcover   = CAlternate
  , ptopLeft = [ "bbX"
               , "bbX"
               , "XXX"
               ]
  }
tank6 = tank
  { pname    = "a barrel yard"
  , pfreq    = [(EMPTY, 15000), (EXIT, 5000), (NOISE, 5000), (BATTLE, 2500)]
  , pcover   = CAlternate
  , ptopLeft = [ "bbbX"
               , "bbbX"
               , "bbbX"
               , "XXXX"
               ]
  }
tank7 = tank
  { pfreq    = [(EMPTY, 300), (EXIT, 5), (NOISE, 100), (BATTLE, 50)]
  , ptopLeft = [ "rr#"
               , "r##"
               , "###"
               ]
  }
tank8 = tank
  { pfreq    = [(EMPTY, 500), (EXIT, 15), (NOISE, 150), (BATTLE, 70)]
  , ptopLeft = [ "XX0#"
               , "Xrr#"
               , "0r##"
               , "####"
               ]
  }
tank9 = tank
  { pname    = "a barrel yard"
  , pfreq    = [(EMPTY, 500), (EXIT, 150), (NOISE, 150), (BATTLE, 70)]
  , pcover   = CReflect
  , ptopLeft = [ "XbbX"
               , "bbbX"
               , "bbbX"
               , "XXXX"
               ]
  }
tank10 = tank
  { pname    = "a cistern"
  , pfreq    = [(EMPTY, 500), (EXIT, 15), (NOISE, 150), (BATTLE, 70)]
  , ptopLeft = [ "XXr#"
               , "Xr##"
               , "r###"
               , "####"
               ]
  }
tank11 = tank
  { pname    = "a barrel yard"
  , pfreq    = [(EMPTY, 700), (EXIT, 250), (NOISE, 250), (BATTLE, 125)]
  , pcover   = CReflect
  , ptopLeft = [ "bbbXX"
               , "bbbbX"
               , "XbbbX"
               , "XXXXX"
               ]
  }
tank12 = tank
  { pname    = "a barrel yard"
  , pfreq    = [(EMPTY, 1000), (EXIT, 500), (NOISE, 500), (BATTLE, 250)]
  , pcover   = CReflect
  , ptopLeft = [ "XbbXX"
               , "bbbbX"
               , "bbbbX"
               , "Xbbbb"
               , "XXXbb"
               ]
  }
shuttleHusk = PlaceKind
  { psymbol  = 's'
  , pname    = "a shuttle husk"
  , pfreq    = [(EMPTY, 1000), (EXIT, 15000), (AMBUSH, 15000)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FGround
  , ptopLeft = [ "X·###·X"  -- 7 x 9
               , "X%#w#%X"
               , "#%···%#"
               , "#··h··#"
               , "#w··rw#"
               , "···rr&c"
               , "###&###"
               , "XhhchhX"
               , "hh#w#hh"
               ]
  , poverrideDark = [ ('·', OILY_FLOOR_DARK)
                    , ('r', RUBBLE_OR_WASTE_DARK)
                    , ('#', S_SHUTTLE_HULL)
                    , ('c', CACHE_SHUTTLE)
                    , ('u', STUCK_DOOR)
                    , ('h', S_HARDWARE_RACK)
                    , ('w', S_REINFORCED_WALL) ]
  , poverrideLit = [ ('·', OILY_FLOOR_LIT)
                   , ('r', RUBBLE_OR_WASTE_LIT)
                   , ('#', S_SHUTTLE_HULL)
                   , ('c', CACHE_SHUTTLE)
                   , ('u', STUCK_DOOR)
                   , ('h', S_HARDWARE_RACK)
                   , ('w', S_REINFORCED_WALL) ]
  }
shuttleHusk2 = shuttleHusk
  { pfreq    = [(EMPTY, 1000), (EXIT, 15000), (AMBUSH, 15000)]
  , ptopLeft = map (T.cons 'X' . flip T.snoc 'X')
               $ ptopLeft shuttleHusk  -- 9 x 9
  }
shuttleHusk3 = shuttleHusk
  { pfreq    = [(EMPTY, 300), (EXIT, 5000), (AMBUSH, 5000)]
  , ptopLeft = [ ":··##··X"  -- 8 x 8
               , "X#%ww%#X"
               , "#w····w#"
               , "····h·r#"
               , "#·rrr&r#"
               , "###&&###"
               , "XhhcchhX"
               , "hh#ww#hh"
               ]
  }
shuttleHusk4 = shuttleHusk3
  { pfreq    = [(EMPTY, 300), (EXIT, 5000), (AMBUSH, 5000)]
  , ptopLeft = map (T.cons 'X' . flip T.snoc 'X')
               $ ptopLeft shuttleHusk3  -- 10 x 8
  }
shuttleHusk5 = shuttleHusk
  { pfreq    = [(EXIT, 80000), (AMBUSH, 80000)]
      -- can't have EMPTY or AI can't reach and kill the boss and get the key
  , ptopLeft = [ "···##···"  -- 8 x 10
               , "w#%ww%#w"
               , "X#····#X"
               , "Xu··h·#X"
               , "#w····w#"
               , "%rr····%"
               , "##&rrr##"
               , "X##&&##X"
               , "Xhhcc&hX"
               , "hh#w&#hh"
               ]
  }
shuttleHusk6 = shuttleHusk
  { pfreq    = [(EMPTY, 2000), (EXIT, 120000), (AMBUSH, 120000)]
  , ptopLeft = [ "X··###··X"  -- 9 x 10
               , "X#%#w#%#X"
               , "##·h·h·##"
               , "········%"
               , "#w·····w#"
               , "%·····rr%"
               , "##·rr&r##"
               , "X###&###X"
               , ":XhhchhXX"
               , "Xhh#w#hhX"
               ]
  }
dormitory = PlaceKind
  { psymbol  = 'd'
  , pname    = "dormitory"
  , pfreq    = [(RESIDENTIAL, 10000)]
  , prarity  = [(1, 1)]
  , pcover   = CAlternate
  , pfence   = FWall
  , ptopLeft = [ "··#"
               , "··#"
               , "+##"
               , "ddd"
               ]
  , poverrideDark = [ ('d', FLOOR_ACTOR_ITEM_LIT)
                    , ('f', PUMPS_LIT)
                    , ('$', TRAPPABLE_WALL) ]
  , poverrideLit = [ ('d', FLOOR_ACTOR_ITEM_LIT)
                   , ('f', PUMPS_LIT)
                   , ('$', TRAPPABLE_WALL) ]
  }
dormitory2 = dormitory
  { pfreq    = [(RESIDENTIAL, 10000)]
  , ptopLeft = [ "··+d"
               , "··#d"
               , "###d"
               ]
  }
dormitory3 = dormitory
  { pfreq    = [(RESIDENTIAL, 2000)]
  , pcover   = CStretch
  , ptopLeft = [ "··#··"
               , "··+··"
               , "#+###"
               , "ddddd"
               ]
  }
dormitory4 = dormitory2
  { pfreq    = [(RESIDENTIAL, 10000)]
  , pcover   = CStretch
  , ptopLeft = [ "···#d"  -- avoid huge corridor and tiny room
               , "···+d"
               , "##+#d"
               , "···#d"
               , "···#d"
               ]
  }
dormitory5 = dormitory
  { pfreq    = [(RESIDENTIAL, 100)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "##$$$$$$$$$##"
               , "f#··#···+··#f"
               , "d#··+···#··+d"
               , "d#####+#####d"
               , "ddddddddddddd"
               ]
  }
dormitory6 = dormitory
  { pfreq    = [(RESIDENTIAL, 100)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "#fddd"
               , "##+#d"
               , "$··#d"
               , "$··#d"
               , "$+##d"
               , "$··#d"
               , "$··#d"
               , "$··#d"
               , "##+#d"
               , "#fddd"
               ]
  }

-- * Helper functions

switchExitToUp :: Text -> PlaceKind -> PlaceKind
switchExitToUp terminal s = s
 { psymbol   = '<'
 , pname     = pname s <+> "up"
 , pfreq     = map (\(t, k) -> (GroupName $ fromGroupName t <+> "up", k))
               $ pfreq s
 , poverrideDark = ('>', GroupName $ terminal <+> "Dark")
                   : filter ((/= '>') . fst) (poverrideDark s)
 , poverrideLit = ('>', GroupName $ terminal <+> "Lit")
                  : filter ((/= '>') . fst) (poverrideLit s)
 }

switchExitToDown :: Text -> PlaceKind -> PlaceKind
switchExitToDown terminal s = s
 { psymbol   = '>'
 , pname     = pname s <+> "down"
 , pfreq     = map (\(t, k) -> (GroupName $ fromGroupName t <+> "down", k))
               $ pfreq s
 , poverrideDark = ('<', GroupName $ terminal <+> "Dark")
                   : filter ((/= '<') . fst) (poverrideDark s)
 , poverrideLit = ('<', GroupName $ terminal <+> "Lit")
                  : filter ((/= '<') . fst) (poverrideLit s)
 }


overrideGatedStaircase :: [(Char, GroupName TileKind)]
overrideGatedStaircase =
  [ ('<', GATED_STAIRCASE_UP), ('>', GATED_STAIRCASE_DOWN)
  , ('I', SIGNBOARD), ('S', FILLER_WALL) ]

switchStaircaseToGated :: PlaceKind -> PlaceKind
switchStaircaseToGated s = s
 { psymbol   = 'g'
 , pname     = T.unwords $ "a gated" : tail (T.words (pname s))
 , pfreq     = map (first (\t -> GroupName $ "gated" <+> fromGroupName t))
               $ pfreq s
 , poverrideDark = overrideGatedStaircase
 , poverrideLit = overrideGatedStaircase
 }

overrideGatedLift :: [(Char, GroupName TileKind)]
overrideGatedLift =
  [ ('<', GATED_LIFT_UP), ('>', GATED_LIFT_DOWN)
  , ('I', SIGNBOARD), ('S', S_LIFT_SHAFT) ]

switchLiftToGated :: PlaceKind -> PlaceKind
switchLiftToGated s = s
 { psymbol   = 'g'
 , pname     = T.unwords $ "a gated" : tail (T.words (pname s))
 , pfreq     = map (first (\t -> GroupName $ "gated" <+> fromGroupName t))
               $ pfreq s
 , poverrideDark = overrideGatedLift
 , poverrideLit = overrideGatedLift
 }


overrideDeconStaircase :: [(Char, GroupName TileKind)]
overrideDeconStaircase =
  [ ('<', DECON_STAIRCASE_UP)
  , ('>', S_STAIRCASE_TRAP_DOWN_OIL)  -- talter high enough
  , ('I', SIGNBOARD), ('S', FILLER_WALL) ]

switchStaircaseToDecon :: PlaceKind -> PlaceKind
switchStaircaseToDecon s = s
 { psymbol   = 'd'
 , pfreq     = map (first (\t -> GroupName $ "decon" <+> fromGroupName t))
                   (pfreq s)
 , poverrideDark = overrideDeconStaircase
 , poverrideLit = overrideDeconStaircase
 }

overrideDeconLift :: [(Char, GroupName TileKind)]
overrideDeconLift =
  [ ('<', DECON_LIFT_UP)
  , ('>', STAIRCASE_LIFT_DOWN)
  , ('I', SIGNBOARD), ('S', S_LIFT_SHAFT) ]

switchLiftToDecon :: PlaceKind -> PlaceKind
switchLiftToDecon s = s
 { psymbol   = 'd'
 , pfreq     = map (first (\t -> GroupName $ "decon" <+> fromGroupName t))
                   (pfreq s)
 , poverrideDark = overrideDeconLift
 , poverrideLit = overrideDeconLift
 }


overrideWeldedStaircase :: [(Char, GroupName TileKind)]
overrideWeldedStaircase =
  [ ('<', WELDED_STAIRCASE_UP), ('>', ORDINARY_STAIRCASE_DOWN)
  , ('I', SIGNBOARD), ('S', FILLER_WALL) ]

switchStaircaseToWelded :: PlaceKind -> PlaceKind
switchStaircaseToWelded s = s
 { psymbol   = 'w'
 , pfreq     = map (first (\t -> GroupName $ "welded" <+> fromGroupName t))
               $ pfreq s
 , poverrideDark = overrideWeldedStaircase
 , poverrideLit = overrideWeldedStaircase
 }

overrideWeldedLift :: [(Char, GroupName TileKind)]
overrideWeldedLift =
  [ ('<', WELDED_LIFT_UP), ('>', ORDINARY_LIFT_DOWN)
  , ('I', SIGNBOARD), ('S', S_LIFT_SHAFT) ]

switchLiftToWelded :: PlaceKind -> PlaceKind
switchLiftToWelded s = s
 { psymbol   = 'w'
 , pfreq     = map (first (\t -> GroupName $ "welded" <+> fromGroupName t))
               $ pfreq s
 , poverrideDark = overrideWeldedLift
 , poverrideLit = overrideWeldedLift
 }


overrideOutdoor :: [(Char, GroupName TileKind)]
overrideOutdoor =
  [ ('<', STAIRCASE_OUTDOOR_UP), ('>', STAIRCASE_OUTDOOR_DOWN)
  , ('I', SIGNBOARD), ('S', FILLER_WALL) ]

switchStaircaseToOutdoor :: PlaceKind -> PlaceKind
switchStaircaseToOutdoor s = s
 { psymbol   = 'o'
 , pname     = "an outdoor area exit"
 , pfreq     = map (first (\t -> GroupName $ "outdoor" <+> fromGroupName t))
               $ pfreq s
 , poverrideDark = overrideOutdoor
 , poverrideLit = overrideOutdoor
 }

switchEscapeToUp :: PlaceKind -> PlaceKind
switchEscapeToUp s = s
 { psymbol   = '<'
 , pname     = "an escape up"
 , pfreq     = map (\(_, n) -> (INDOOR_ESCAPE_UP, n)) $ pfreq s
 , poverrideDark = ('>', ESCAPE_UP) : poverrideDark s
 , poverrideLit = ('>', ESCAPE_UP) : poverrideLit s
 }

switchEscapeToOutdoorDown :: PlaceKind -> PlaceKind
switchEscapeToOutdoorDown s = s
 { pname     = "outdoor escape route"
 , pfreq     = map (\(_, n) -> (OUTDOOR_ESCAPE_DOWN, n)) $ pfreq s
 , poverrideDark = ('>', ESCAPE_OUTDOOR_DOWN) : poverrideDark s
 , poverrideLit = ('>', ESCAPE_OUTDOOR_DOWN) : poverrideLit s
 }

switchEscapeToSpaceshipDown :: PlaceKind -> PlaceKind
switchEscapeToSpaceshipDown s = s
 { pname     = "escape from spaceship"
 , pfreq     = map (\(_, n) -> (ESCAPE_FROM_SPACESHIP_DOWN, n)) $ pfreq s
 , poverrideDark = ('>', ESCAPE_SPACESHIP_DOWN) : poverrideDark s
 , poverrideLit = ('>', ESCAPE_SPACESHIP_DOWN) : poverrideLit s
 }
