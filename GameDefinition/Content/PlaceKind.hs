-- Copyright (c) 2008--2011 Andres Loeh
-- Copyright (c) 2010--2018 Mikolaj Konarski and others (see git history)
-- This file is a part of the computer game Allure of the Stars
-- and is released under the terms of the GNU Affero General Public License.
-- For license and copyright information, see the file LICENSE.
--
-- | Room, hall and passage definitions.
module Content.PlaceKind
  ( content
  ) where

import Prelude ()

import Game.LambdaHack.Common.Prelude

import qualified Data.Text as T

import Game.LambdaHack.Common.Misc
import Game.LambdaHack.Content.PlaceKind
import Game.LambdaHack.Content.TileKind (TileKind)

content :: [PlaceKind]
content =
  [deadEnd, rect, rect2, rectWindows, glasshouse, glasshouse2, glasshouse3, pulpit, ruin, ruin2, collapsed, collapsed2, collapsed3, collapsed4, collapsed5, collapsed6, collapsed7, pillar, pillar2, pillar3, pillar4, pillar5, pillar6, colonnade, colonnade2, colonnade3, colonnade4, colonnade5, colonnade6, lampPost, lampPost2, lampPost3, lampPost4, treeShade, fogClump, fogClump2, smokeClump, smokeClump2, smokeClump3FGround, bushClump, escapeUp, escapeUp2, escapeUp3, escapeUp4, escapeUp5, escapeDown, escapeDown2, escapeDown3, escapeDown4, escapeDown5, escapeOutdoorDown, staircase1, staircase2, staircase3, staircase4, staircase5, staircase6, staircase7, staircase8, staircase9, staircase10, staircase11, staircase12, staircase13, staircase14, staircase15, staircase16, staircase17, staircase18, staircase19, staircase20, staircase21, staircase22, staircase23, staircase24, staircase25, staircase26, staircase27, staircase28, staircase29, staircase30, staircase31, staircase32, staircase33, staircase34, staircase35, staircase36, staircase37]
  -- Allure-specific
  ++ [staircaseLift11, staircaseLift12, staircaseLift13, staircaseLift14, staircaseLift15, staircaseLift16, staircaseLift17, staircaseLift18, staircaseLift19, staircaseLift20, staircaseLift21, staircaseLift22, staircaseLift23, staircaseLift24, staircaseLift25]
  -- automatically generated
  ++ generatedStairs
  -- Allure-specific, continued
  ++ [escapeSpaceshipDown, escapeSpaceshipDown2, escapeSpaceshipDown3, escapeSpaceshipDown4, escapeSpaceshipDown5, pumps, oval, ovalFloor, ovalSquare, ovalBasin, ovalBasin2, squareBasin, squareBasin2, floodedRoom, maze, maze2, maze3, mazeBig, mazeBig2, cells, cells2, cells3, cells4, cells5, cells6, cells7, tank, tank2, tank3, tank4, tank5]

deadEnd,    rect, rect2, rectWindows, glasshouse, glasshouse2, glasshouse3, pulpit, ruin, ruin2, collapsed, collapsed2, collapsed3, collapsed4, collapsed5, collapsed6, collapsed7, pillar, pillar2, pillar3, pillar4, pillar5, pillar6, colonnade, colonnade2, colonnade3, colonnade4, colonnade5, colonnade6, lampPost, lampPost2, lampPost3, lampPost4, treeShade, fogClump, fogClump2, smokeClump, smokeClump2, smokeClump3FGround, bushClump, escapeUp, escapeUp2, escapeUp3, escapeUp4, escapeUp5, escapeDown, escapeDown2, escapeDown3, escapeDown4, escapeDown5, escapeOutdoorDown, staircase1, staircase2, staircase3, staircase4, staircase5, staircase6, staircase7, staircase8, staircase9, staircase10, staircase11, staircase12, staircase13, staircase14, staircase15, staircase16, staircase17, staircase18, staircase19, staircase20, staircase21, staircase22, staircase23, staircase24, staircase25, staircase26, staircase27, staircase28, staircase29, staircase30, staircase31, staircase32, staircase33, staircase34, staircase35, staircase36, staircase37 :: PlaceKind
-- Allure-specific
staircaseLift11, staircaseLift12, staircaseLift13, staircaseLift14, staircaseLift15, staircaseLift16, staircaseLift17, staircaseLift18, staircaseLift19, staircaseLift20, staircaseLift21, staircaseLift22, staircaseLift23, staircaseLift24, staircaseLift25, escapeSpaceshipDown, escapeSpaceshipDown2, escapeSpaceshipDown3, escapeSpaceshipDown4, escapeSpaceshipDown5, pumps, oval, ovalFloor, ovalSquare, ovalBasin, ovalBasin2, squareBasin, squareBasin2, floodedRoom, maze, maze2, maze3, mazeBig, mazeBig2, cells, cells2, cells3, cells4, cells5, cells6, cells7, tank, tank2, tank3, tank4, tank5 :: PlaceKind

staircase, staircaseLift :: PlaceKind  -- templates

staircaseBasic :: [PlaceKind]
staircaseBasic = [staircase1, staircase2, staircase3, staircase4, staircase5, staircase6, staircase7, staircase8, staircase9, staircase10, staircase11, staircase12, staircase13, staircase14, staircase15, staircase16, staircase17, staircase18, staircase19, staircase20, staircase21, staircase22, staircase23, staircase24, staircase25, staircase26, staircase27, staircase28, staircase29, staircase30, staircase31, staircase32, staircase33, staircase34, staircase35, staircase36, staircase37]
  -- Allure-specific
  ++ [staircaseLift11, staircaseLift12, staircaseLift13, staircaseLift14, staircaseLift15, staircaseLift16, staircaseLift17, staircaseLift18, staircaseLift19, staircaseLift20, staircaseLift21, staircaseLift22, staircaseLift23, staircaseLift24, staircaseLift25]

generatedStairs :: [PlaceKind]
generatedStairs =
  let (stairs, lifts) = partition ((/= "a lift") . pname) staircaseBasic
      gatedStairs = map makeGatedStaircase stairs
      gatedLifts = map makeGatedLift lifts
      outdoorStairs = map makeOutdoor stairs
      stairsAll = stairs ++ gatedStairs ++ outdoorStairs
      liftsAll = lifts ++ gatedLifts
  in gatedStairs ++ gatedLifts ++ outdoorStairs
     ++ map (makeStaircaseUp "stair terminal") stairsAll
     ++ map (makeStaircaseUp "lift terminal") liftsAll
     ++ map (makeStaircaseDown "stair terminal") stairsAll
     ++ map (makeStaircaseDown "lift terminal") liftsAll

-- The dots below are @Char.chr 183@, as defined in @TileKind.floorSymbol@.
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
  , pfreq    = [("rogue", 100), ("arena", 35), ("laboratory", 30)]
  , prarity  = [(1, 10), (10, 7)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = ["·"]
  , poverrideDark = []
  , poverrideLit = []
  }
rect2 = rect
  { pname    = "a pen"
  , pfreq    = [("zoo", 10)]
  }
rectWindows = PlaceKind
  { psymbol  = 'w'
  , pname    = "a shed"
  , pfreq    = [("escape", 20)]
  , prarity  = [(1, 10), (10, 7)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "#%"
               , "%·"
               ]
  , poverrideDark = [('%', "rectWindowsOver_%")]
  , poverrideLit = [('%', "rectWindowsOver_%")]
  }
glasshouse = PlaceKind
  { psymbol  = 'g'
  , pname    = "a glasshouse"
  , pfreq    = [("shootout", 6)]
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
  , pfreq    = [("zoo", 15)]
  }
glasshouse3 = glasshouse
  { pname    = "an entertainment center"
  , pfreq    = [("arena", 40), ("ambush", 3)]
  }
pulpit = PlaceKind
  { psymbol  = 'p'
  , pname    = "a stand"
  , pfreq    = [("arena", 23), ("zoo", 20)]
  , prarity  = [(1, 10), (10, 10)]
  , pcover   = CMirror
  , pfence   = FGround
  , ptopLeft = [ "%%·"
               , "%··"
               , "··O"
               ]
  , poverrideDark = [('O', "pulpit")]
  , poverrideLit = [('O', "pulpit")]
      -- except for floor, this will all be lit, regardless of night/dark; OK
  }
ruin = PlaceKind
  { psymbol  = 'R'
  , pname    = "ruins"
  , pfreq    = [("battle", 33), ("ambush", 5)]
  , prarity  = [(1, 10), (10, 20)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = ["X"]
  , poverrideDark = []
  , poverrideLit = []
  }
ruin2 = ruin
  { pname    = "a scaffolding"
  , pfreq    = [("noise", 120)]
  }
collapsed = PlaceKind
  { psymbol  = 'c'
  , pname    = "a hardware stack"
  , pfreq    = [("noise", 1)]
      -- no point taking up space if very little space taken,
      -- but if no other place can be generated, a failsafe is useful
  , prarity  = [(1, 1), (10, 1)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "#"
               ]
  , poverrideDark = [('#', "doorlessMachineryOver_#")]
  , poverrideLit = [('#', "doorlessMachineryOver_#")]
  }
collapsed2 = collapsed
  { pfreq    = [("noise", 1000), ("battle", 200)]
  , ptopLeft = [ "X#"
               , "##"
               ]
  }
collapsed3 = collapsed
  { pfreq    = [("noise", 2000), ("battle", 200)]
  , ptopLeft = [ "XX#"
               , "###"
               ]
  }
collapsed4 = collapsed
  { pfreq    = [("noise", 2000), ("battle", 200)]
  , ptopLeft = [ "XXX#"
               , "####"
               ]
  }
collapsed5 = collapsed
  { pfreq    = [("noise", 3000), ("battle", 500)]
  , ptopLeft = [ "XX#"
               , "X##"
               , "###"
               ]
  }
collapsed6 = collapsed
  { pfreq    = [("noise", 4000), ("battle", 1000)]
  , ptopLeft = [ "XXX#"
               , "X###"
               , "####"
               ]
  }
collapsed7 = collapsed
  { pfreq    = [("noise", 4000), ("battle", 1000)]
  , ptopLeft = [ "XXX#"
               , "XX##"
               , "####"
               ]
  }
pillar = PlaceKind
  { psymbol  = 'p'
  , pname    = "a market"
  , pfreq    = [ ("rogue", 600), ("arena", 1200)
               , ("empty", 300), ("emptyExit", 300), ("noise", 1200) ]
  , prarity  = [(1, 5), (10, 5)]
  , pcover   = CStretch
  , pfence   = FWall
  -- Larger rooms require support pillars.
  , ptopLeft = [ "····"
               , "·O··"
               , "····"
               , "····"
               ]
  , poverrideDark = []
  , poverrideLit = []
  }
pillar2 = pillar
  { pname    = "a plaza"
  , prarity  = [(1, 15), (10, 15)]
  , ptopLeft = [ "O····"
               , "·····"
               , "·····"
               , "···O·"
               , "····~"
               ]
  , poverrideDark = [('~', "poolOver_~_Dark")]
  , poverrideLit = [('~', "poolOver_~_Lit")]
  }
pillar3 = pillar
  { pname    = "a court"
  , pfreq    = [ ("rogue", 50), ("arena", 100), ("laboratory", 100)
               , ("empty", 30), ("emptyExit", 30), ("noise", 300) ]
  , ptopLeft = [ "#··"
               , "···"
               , "···"
               ]
  }
pillar4 = pillar
  { pname    = "a mall"
  , pfreq    = [ ("rogue", 300), ("arena", 600)
               , ("empty", 300), ("noise", 1200) ]
  , ptopLeft = [ "#·#·"
               , "····"
               , "#···"
               , "····"
               ]
  }
pillar5 = pillar
  { pname    = "a bank outlet"
  , pfreq    = [ ("rogue", 300), ("arena", 1000)
               , ("empty", 300), ("emptyExit", 200) ]
  , prarity  = [(10, 3)]
  , ptopLeft = [ "&·%·"
               , "··#·"
               , "%#+·"
               , "····"
               ]
  , poverrideDark = [('&', "cache deposit"), ('+', "trapped door")]
  , poverrideLit = [('&', "cache deposit"), ('+', "trapped door")]
  }
pillar6 = pillar
  { pname    = "a jewelry store"
  , pfreq    = [ ("rogue", 300), ("arena", 1000), ("empty", 200) ]
  , prarity  = [(10, 3)]
  , ptopLeft = [ "&#··"
               , "#·%·"
               , "·%h·"
               , "····"
               ]
  , poverrideDark = [('&', "cache jewelry"), ('h', "hardware rack")]
  , poverrideLit = [('&', "cache jewelry"), ('h', "hardware rack")]
  }
colonnade = PlaceKind
  { psymbol  = 'c'
  , pname    = "a colonnade"
  , pfreq    = [ ("rogue", 4), ("arena", 9), ("empty", 12), ("emptyExit", 12)
               , ("mine", 1200), ("escape", 40) ]
  , prarity  = [(1, 20), (10, 20)]
  , pcover   = CAlternate
  , pfence   = FFloor
  , ptopLeft = [ "#·"
               , "·#"
               ]
  , poverrideDark = []
  , poverrideLit = []
  }
colonnade2 = colonnade
  { prarity  = [(1, 12), (10, 12)]
  , ptopLeft = [ "#·"
               , "··"
               ]
  }
colonnade3 = colonnade
  { prarity  = [(1, 100), (10, 100)]
  , ptopLeft = [ "··#"
               , "·#·"
               , "#··"
               ]
  }
colonnade4 = colonnade
  { prarity  = [(1, 50), (10, 50)]
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
  { prarity  = [(1, 12), (10, 12)]
  , ptopLeft = [ "#·"
               , "··"
               , "·#"
               ]
  }
lampPost = PlaceKind
  { psymbol  = 'l'
  , pname    = "a lamp post"
  , pfreq    = [("escape", 20), ("ambush", 40), ("zoo", 10), ("battle", 10)]
  , prarity  = [(1, 10), (10, 10)]
  , pcover   = CVerbatim
  , pfence   = FNone
  , ptopLeft = [ "X·X"
               , "·O·"
               , "X·X"
               ]
  , poverrideDark = [('O', "lampPostOver_O"), ('·', "floorActorLit")]
  , poverrideLit = [('O', "lampPostOver_O"), ('·', "floorActorLit")]
  }
lampPost2 = lampPost
  { ptopLeft = [ "···"
               , "·O·"
               , "···"
               ]
  }
lampPost3 = lampPost
  { pfreq    = [("escape", 300), ("zoo", 50), ("battle", 110)]
  , ptopLeft = [ "XX·XX"
               , "X···X"
               , "··O··"
               , "X···X"
               , "XX·XX"
               ]
  }
lampPost4 = lampPost
  { pfreq    = [("escape", 300), ("zoo", 50), ("battle", 60)]
  , ptopLeft = [ "X···X"
               , "·····"
               , "··O··"
               , "·····"
               , "X···X"
               ]
  }
treeShade = PlaceKind
  { psymbol  = 't'
  , pname    = "a tree shade"
  , pfreq    = [("brawl", 100)]
  , prarity  = [(1, 10), (10, 10)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "··s"
               , "sO·"
               , "Xs·"
               ]
  , poverrideDark = [ ('O', "treeShadeOver_O_Dark")
                    , ('s', "treeShadeOver_s_Dark")
                    , ('·', "shaded ground") ]
  , poverrideLit = [ ('O', "treeShadeOver_O_Lit")
                   , ('s', "treeShadeOver_s_Lit")
                   , ('·', "shaded ground") ]
  }
fogClump = PlaceKind
  { psymbol  = 'f'
  , pname    = "a foggy patch"
  , pfreq    = [ ("escape", 80), ("shootout", 50)
               , ("empty", 1000), ("emptyExit", 700) ]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "f;"
               , ";f"
               , ";X"
               ]
  , poverrideDark = [('f', "fogClumpOver_f_Dark"), (';', "fog Lit")]
  , poverrideLit = [('f', "fogClumpOver_f_Lit"), (';', "fog Lit")]
  }
fogClump2 = fogClump
  { pfreq    = [ ("escape", 80), ("shootout", 400)
               , ("empty", 5000), ("emptyExit", 3000) ]
  , ptopLeft = [ "X;f"
               , "f;f"
               , ";;X"
               , "Xff"
               ]
  }
smokeClump = PlaceKind
  { psymbol  = 's'
  , pname    = "a smoky patch"
  , pfreq    = [("zoo", 50), ("ambush", 50), ("emptyExit", 100)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "f;"
               , ";f"
               , ";X"
               ]
  , poverrideDark = [ ('f', "smokeClumpOver_f_Dark"), (';', "smoke Lit")
                    , ('·', "floorActorDark") ]
  , poverrideLit = [ ('f', "smokeClumpOver_f_Lit"), (';', "smoke Lit")
                   , ('·', "floorActorLit") ]
  }
smokeClump2 = smokeClump
  { pfreq    = [("zoo", 500), ("ambush", 100), ("emptyExit", 300)]
  , ptopLeft = [ "X;f"
               , "f;f"
               , ";;X"
               , "Xff"
               ]
  }
smokeClump3FGround = smokeClump
  { pname    = "a burned out area"
  , pfreq    = [("laboratory", 80)]
  , prarity  = [(1, 1)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ ";f;"
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
  , pfreq    = [("shootout", 100)]
  , prarity  = [(1, 1)]
  , pcover   = CMirror
  , pfence   = FNone
  , ptopLeft = [ "f;"
               , ";X"
               , ";f"
               ]
  , poverrideDark = [('f', "bushClumpOver_f_Dark"), (';', "bush Lit")]
  , poverrideLit = [('f', "bushClumpOver_f_Lit"), (';', "bush Lit")]
      -- should not be used in caves with trails, because bushes can't
      -- grow over such artificial trails
  }
escapeUp = PlaceKind
  { psymbol  = '<'
  , pname    = "an escape up"
  , pfreq    = [("escape up", 1)]
  , prarity  = [(1, 1)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ "<"
               ]
  , poverrideDark = []
  , poverrideLit = []
  }
escapeUp2 = escapeUp
  { pfreq    = [("escape up", 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "#·#"
               , "·<·"
               , "#·#"
               ]
  }
escapeUp3 = escapeUp
  { pfreq    = [("escape up", 2000)]
  , pfence   = FWall
  , ptopLeft = [ "·#·"
               , "#<#"
               , "·#·"
               ]
  }
escapeUp4 = escapeUp
  { pfreq    = [("escape up", 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·^·"
               , "^<^"
               , "·^·"
               ]
  }
escapeUp5 = escapeUp
  { pfreq    = [("escape up", 2000)]
  , pcover   = CMirror
  , pfence   = FWall
  , ptopLeft = [ "#··"
               , "·<·"
               , "·~#"
               ]
  }
escapeDown = PlaceKind
  { psymbol  = '>'
  , pname    = "an escape down"
  , pfreq    = [("escape down", 1)]
  , prarity  = [(1, 1)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ ">"
               ]
  , poverrideDark = []
  , poverrideLit = []
  }
escapeDown2 = escapeDown
  { pfreq    = [("escape down", 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "#·#"
               , "·>·"
               , "#·#"
               ]
  }
escapeDown3 = escapeDown
  { pfreq    = [("escape down", 2000)]
  , pfence   = FWall
  , ptopLeft = [ "·#·"
               , "#>#"
               , "·#·"
               ]
  }
escapeDown4 = escapeDown
  { pfreq    = [("escape down", 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·^·"
               , "^>^"
               , "·^·"
               ]
  }
escapeDown5 = escapeDown
  { pfreq    = [("escape down", 2000)]
  , pcover   = CMirror
  , pfence   = FWall
  , ptopLeft = [ "#··"
               , "·>·"
               , "·~#"
               ]
  }
escapeOutdoorDown = escapeDown
  { pfreq     = [("escape outdoor down", 1)]
  , poverrideDark = [('>', "escape outdoor down")]
  , poverrideLit = [('>', "escape outdoor down")]
  }
staircase = PlaceKind
  { psymbol  = '/'
  , pname    = "a staircase"
  , pfreq    = [("tiny staircase", 1)]  -- no cover when arriving; low freq
  , prarity  = [(1, 100)]
  , pcover   = CVerbatim
  , pfence   = FGround
  , ptopLeft = [ "<S>"
               ]
  , poverrideDark = [ ('<', "staircase up"), ('>', "staircase down")
                    , ('I', "signboard"), ('S', "fillerWall") ]
  , poverrideLit = [ ('<', "staircase up"), ('>', "staircase down")
                   , ('I', "signboard"), ('S', "fillerWall") ]
  }
staircase1 = staircase
  { prarity  = [(1, 1)]  -- no cover when arriving; so low rarity
  }
staircase2 = staircase
  { pfreq    = [("tiny staircase", 3)]
  , prarity  = [(1, 1)]
  , pfence   = FGround
  , ptopLeft = [ "·<S>·"
               ]
  }
-- Allure-specific:
staircaseLift = PlaceKind
  { psymbol  = '|'
  , pname    = "a lift"
  , pfreq    = [("tiny lift", 1)]
  , prarity  = [(1, 100)]
  , pcover   = CVerbatim
  , pfence   = FFloor
  , ptopLeft = [ "<S>"
               ]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircase3 = staircaseLift
  { prarity  = [(1, 1)]
  }
staircase4 = staircaseLift
  { pfreq    = [("tiny lift", 3)]
  , prarity  = [(1, 1)]
  , ptopLeft = [ "·<S>·"
               ]
  }
staircase5 = staircase
  { pfreq    = [("open staircase", 200)]  -- no cover, open
  , pfence   = FGround
  , ptopLeft = [ "#·#"
               , "···"
               , "<S>"
               , "···"
               , "#·#"
               ]
  }
staircase6 = staircaseLift
  { pfreq    = [("open lift", 300)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#·#·#"
               ]
  }
staircase7 = staircase
  { pfreq    = [("open staircase", 500)]
  , pfence   = FGround
  , ptopLeft = [ "#·#·#·#"
               , "·······"
               , "#·<S>·#"
               , "·······"
               , "#·#·#·#"
               ]
  }
staircase8 = staircaseLift
  { pfreq    = [("open lift", 2000)]
  , pfence   = FGround
  , ptopLeft = [ "·#·#·#·"
               , "#·····#"
               , "··<S>··"
               , "#·····#"
               , "·#·#·#·"
               ]
  }
staircase9 = staircase
  { pfreq    = [("open staircase", 500)]
  , pfence   = FGround
  , ptopLeft = [ "#·······#"
               , "···<S>···"
               , "#·······#"
               ]
  }
staircase10 = staircaseLift
  { pfreq    = [("open lift", 500)]
  , pfence   = FGround
  , ptopLeft = [ "O·····O"
               , "··<S>··"
               , "O·····O"
               ]
  }
staircase11 = staircase
  { pfreq    = [("closed staircase", 2000)]  -- weak cover, low freq
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
  { pfreq    = [("closed staircase", 4000)]
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
  { pfreq    = [("closed staircase", 6000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·#·"
               , "#·#·#·#"
               , "·······"
               , "O·<S>·O"
               , "·······"
               , "#·#·#·#"
               , "·#·#·#·"
               ]
  }
staircase14 = staircase
  { pfreq    = [("closed staircase", 10000)]
  , pfence   = FFloor
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
  { pfreq    = [("closed staircase", 20000)]
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
  { pfreq    = [("closed staircase", 20000)]
  , pfence   = FFloor
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
  { pfreq    = [("closed staircase", 20000)]
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
  { pfreq    = [("closed staircase", 80000)]
  , pfence   = FFloor
  , ptopLeft = [ "··#·#·#·#··"
               , "·#·#·#·#·#·"
               , "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               , "·#·#·#·#·#·"
               , "··#·#·#·#··"
               ]
  }
staircase19 = staircase
  { pfreq    = [("closed staircase", 20000)]
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
  { pfreq    = [("closed staircase", 5000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·#·O·#·#·"
               , "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               , "·#·#·I·#·#·"
               ]
  }
staircase21 = staircase
  { pfreq    = [("closed staircase", 5000)]
  , pfence   = FFloor
  , ptopLeft = [ "#·#·I·#·#"
               , "·#·····#·"
               , "#··<S>··#"
               , "·#·····#·"
               , "#·#·O·#·#"
               ]
  }
staircase22 = staircase
  { pfreq    = [("closed staircase", 2000)]
  , pfence   = FFloor
  , ptopLeft = [ "#·#·····#·#"
               , "·#··<S>··#·"
               , "#·#·····#·#"
               ]
  }
staircase23 = staircase
  { pfreq    = [("closed staircase", 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·······#·"
               , "#·#·<S>·#·#"
               , "·#·······#·"
               ]
  }
staircase24 = staircase
  { pfreq    = [("closed staircase", 1000)]
  , pfence   = FFloor
  , ptopLeft = [ "·#·····#·"
               , "#··<S>··#"
               , "·#·····#·"
               ]
  }
staircase25 = staircase
  { pfreq    = [("walled staircase", 100)]
  , pfence   = FWall
  , ptopLeft = [ "·····"
               , "·<S>·"
               , "·····"
               ]
  }
staircase26 = staircase
  { pfreq    = [("walled staircase", 200)]
  , pfence   = FWall
  , ptopLeft = [ "·······"
               , "··<S>··"
               , "·······"
               ]
  }
staircase27 = staircaseLift
  { pfreq    = [("walled lift", 500)]
  , pfence   = FWall
  , ptopLeft = [ "#·····#"
               , "··<S>··"
               , "#·····#"
               ]
  }
staircase28 = staircaseLift
  { pfreq    = [("walled lift", 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·····"
               , "·····"
               , "·<S>·"
               , "·····"
               , "·····"
               ]
  }
staircase29 = staircase
  { pfreq    = [("walled staircase", 1000)]
  , pfence   = FWall
  , ptopLeft = [ "#···#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#···#"
               ]
  }
staircase30 = staircaseLift
  { pfreq    = [("walled lift", 1000)]
  , pfence   = FWall
  , ptopLeft = [ "#···#"
               , "·····"
               , "·<S>·"
               , "·····"
               , "#···#"
               ]
  }
staircase31 = staircase
  { pfreq    = [("walled staircase", 2000)]
  , pfence   = FWall
  , ptopLeft = [ "·······"
               , "·~~~~~·"
               , "·~<S>~·"
               , "·~~~~~·"
               , "·······"
               ]
  }
staircase32 = staircaseLift
  { pfreq    = [("walled lift", 5000)]
  , pfence   = FWall
  , ptopLeft = [ "#·····#"
               , "·······"
               , "··<S>··"
               , "·······"
               , "#·····#"
               ]
  }
staircase33 = staircase
  { pfreq    = [("walled staircase", 5000)]
  , pfence   = FWall
  , ptopLeft = [ "#·#·#·#"
               , "·······"
               , "#·<S>·#"
               , "·······"
               , "#·#·#·#"
               ]
  }
staircase34 = staircaseLift
  { pfreq    = [("walled lift", 5000)]
  , pfence   = FWall
  , ptopLeft = [ "·#·#·#·"
               , "#·····#"
               , "··<S>··"
               , "#·····#"
               , "·#·#·#·"
               ]
  }
staircase35 = staircase
  { pfreq    = [("walled staircase", 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·········"
               , "···<S>···"
               , "·········"
               ]
  }
staircase36 = staircaseLift
  { pfreq    = [("walled lift", 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·#·····#·"
               , "#··<S>··#"
               , "·#·····#·"
               ]
  }
staircase37 = staircase
  { pfreq    = [("walled staircase", 1000)]
  , pfence   = FWall
  , ptopLeft = [ "·········"
               , "·O·<S>·O·"
               , "·········"
               ]
  }

-- * Allure-specific

overrideLift :: [(Char, GroupName TileKind)]
overrideLift = [ ('<', "staircase lift up"), ('>', "staircase lift down")
               , ('I', "signboard"), ('S', "lift shaft") ]
staircaseLift11 = staircase11
  { pname     = "a lift"
  , pfreq     = [("closed lift", 2000)]  -- weak cover, low freq
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift12 = staircase12
  { pname     = "a lift"
  , pfreq     = [("closed lift", 4000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift13 = staircase13
  { pname     = "a lift"
  , pfreq     = [("closed lift", 6000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift14 = staircase14
  { pname     = "a lift"
  , pfreq     = [("closed lift", 10000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift15 = staircase15
  { pname     = "a lift"
  , pfreq     = [("closed lift", 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift16 = staircase16
  { pname     = "a lift"
  , pfreq     = [("closed lift", 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift17 = staircase17
  { pname     = "a lift"
  , pfreq     = [("closed lift", 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift18 = staircase18
  { pname     = "a lift"
  , pfreq     = [("closed lift", 80000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift19 = staircase19
  { pname     = "a lift"
  , pfreq     = [("closed lift", 20000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift20 = staircase20
  { pname     = "a lift"
  , pfreq     = [("closed lift", 5000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift21 = staircase21
  { pname     = "a lift"
  , pfreq     = [("closed lift", 5000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift22 = staircase22
  { pname     = "a lift"
  , pfreq     = [("closed lift", 2000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift23 = staircase23
  { pname     = "a lift"
  , pfreq     = [("closed lift", 1000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift24 = staircase24
  { pname     = "a lift"
  , pfreq     = [("closed lift", 1000)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
staircaseLift25 = staircase25
  { pname     = "a lift"
  , pfreq     = [("walled lift", 100)]
  , poverrideDark = overrideLift
  , poverrideLit = overrideLift
  }
escapeSpaceshipDown = escapeDown
  { pfreq     = [("escape spaceship down", 1)]
  , poverrideDark = [('>', "escape spaceship down")]
  , poverrideLit = [('>', "escape spaceship down")]
  }
escapeSpaceshipDown2 = escapeDown2
  { pfreq     = [("escape spaceship down", 1000)]
  , poverrideDark = [('>', "escape spaceship down")]
  , poverrideLit = [('>', "escape spaceship down")]
  }
escapeSpaceshipDown3 = escapeDown3
  { pfreq     = [("escape spaceship down", 2000)]
  , poverrideDark = [('>', "escape spaceship down")]
  , poverrideLit = [('>', "escape spaceship down")]
  }
escapeSpaceshipDown4 = escapeDown4
  { pfreq     = [("escape spaceship down", 1000)]
  , poverrideDark = [('>', "escape spaceship down")]
  , poverrideLit = [('>', "escape spaceship down")]
  }
escapeSpaceshipDown5 = escapeDown5
  { pfreq     = [("escape spaceship down", 1000)]
  , poverrideDark = [('>', "escape spaceship down")]
  , poverrideLit = [('>', "escape spaceship down")]
  }
pumps = PlaceKind
  { psymbol  = 'w'
  , pname    = "water pumps"
  , pfreq    = [ ("rogue", 5), ("laboratory", 7), ("empty", 20), ("mine", 1200)
               , ("shootout", 25) ]
  , prarity  = [(1, 10), (10, 10)]
  , pcover   = CAlternate
  , pfence   = FWall
  , ptopLeft = [ "·f"
               , "%·"
               ]
  , poverrideDark = [ ('%', "doorlessMachineryOver_#")
                    , ('f', "pumpsOver_f_Dark") ]
  , poverrideLit = [ ('%', "doorlessMachineryOver_#")
                   , ('f', "pumpsOver_f_Lit") ]
  }
oval = PlaceKind
  { psymbol  = 'o'
  , pname    = "a dome"
  , pfreq    = [ ("rogue", 2000), ("arena", 1000), ("laboratory", 1000)
               , ("empty", 500), ("emptyExit", 500)
               , ("zoo", 2000), ("ambush", 20) ]
  , prarity  = [(1, 10), (10, 10)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = [ "####·"
               , "##···"
               , "#··tt"
               , "#·t··"
               , "··t··"
               ]
  , poverrideDark = [ ('t', "trailLit"), ('a', "alarmingTrailLit")
                    , ('~', "poolOver_~_Dark") ]
  , poverrideLit = [ ('t', "trailLit"), ('a', "alarmingTrailLit")
                   , ('~', "poolOver_~_Lit") ]
  }
ovalFloor = oval
  { pfreq    = [ ("rogue", 3000), ("arena", 10000), ("laboratory", 2000)
               , ("empty", 5000), ("emptyExit", 5000)
               , ("zoo", 10000), ("ambush", 100) ]
  , pfence   = FGround
  , ptopLeft = [ "XXXX+#"
               , "XX###·"
               , "X##···"
               , "X#···a"
               , "+#··a·"
               , "#··a··"
               ]
  }
ovalSquare = oval
  { pfence   = FGround
  , ptopLeft = [ "X###+"
               , "##···"
               , "#····"
               , "#····"
               , "+····"
               ]
  }
ovalBasin = oval
  { pname    = "a water basin"
  , pfreq    = [ ("rogue", 200), ("zoo", 500)
               , ("arena", 250), ("laboratory", 250), ("empty", 200) ]
  , pfence   = FNone
  , ptopLeft = [ "XXX##"
               , "X###·"
               , "X#···"
               , "##··~"
               , "#··~~"
               ]
  }
ovalBasin2 = oval
  { pname    = "a water basin"
  , pfreq    = [ ("rogue", 200), ("zoo", 500)
               , ("arena", 250), ("laboratory", 250), ("empty", 200) ]
  , pfence   = FNone
  , ptopLeft = [ "X####"
               , "##···"
               , "#···~"
               , "#··~~"
               , "#·~~~"
               ]
  }
squareBasin = oval
  { pname    = "a water basin"
  , pfreq    = [ ("zoo", 400)
               , ("arena", 400), ("laboratory", 400), ("empty", 400) ]
  , pfence   = FNone
  , ptopLeft = [ "OttOt"
               , "t~~~~"
               , "t~O~~"
               , "O~~~~"
               , "t~~~~"
               ]
  }
squareBasin2 = oval
  { pname    = "a water basin"
  , pfreq    = [ ("zoo", 1500)
               , ("arena", 1500), ("laboratory", 1500), ("empty", 1500) ]
  , pfence   = FNone
  , ptopLeft = [ "OtOttt"
               , "t~~~~~"
               , "O~~~~~"
               , "t~~O~~"
               , "t~~~~~"
               , "t~~~~~"
               ]
  }
floodedRoom = PlaceKind  -- Valid for any nonempty area, hence low frequency.
  { psymbol  = 'f'
  , pname    = "a flooded room"
  , pfreq    = [("rogue", 10), ("laboratory", 5)]
  , prarity  = [(1, 1), (10, 2)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = ["~"]
  , poverrideDark = []
  , poverrideLit = []
  }
maze = PlaceKind
  { psymbol  = 'm'
  , pname    = "an intricate maze"
  , pfreq    = [("rogue", 10), ("arena", 20), ("empty", 10), ("emptyExit", 10)]
  , prarity  = [(1, 12), (10, 12)]
  , pcover   = CStretch
  , pfence   = FWall
  , ptopLeft = [ "##··"
               , "#··#"
               , "··#·"
               ]
  , poverrideDark = [ ('&', "cache"), ('+', "trapped door")
                    , ('i', "floorActorItem") ]  -- lit or not, randomly
  , poverrideLit = [ ('&', "cache"), ('+', "trapped door")
                   , ('i', "floorActorItem") ]  -- lit or not, randomly
  }
maze2 = maze
  { pfreq    = [("rogue", 20), ("arena", 40), ("empty", 20), ("emptyExit", 20)]
  , ptopLeft = [ "#·##·"
               , "·#··#"
               , "···#·"
               ]
  }
maze3 = maze
  { pfreq    = [("rogue", 30), ("arena", 60), ("empty", 30), ("emptyExit", 30)]
  , ptopLeft = [ "##·##~"
               , "#·#··#"
               , "~·%···"
               ]
  }
mazeBig = maze
  { pfreq    = [ ("rogue", 50), ("arena", 150)
               , ("empty", 150), ("emptyExit", 150) ]
  , pfence   = FNone
  , ptopLeft = [ "X####"
               , "#·##·"
               , "##···"
               , "##·+%"
               , "#··%i"
               ]
  }
mazeBig2 = maze
  { pfreq    = [ ("rogue", 50), ("arena", 150)
               , ("empty", 150), ("emptyExit", 150) ]
  , prarity  = [(1, 10), (10, 20)]
  , pfence   = FNone
  , ptopLeft = [ "X#####"
               , "#·##··"
               , "##···#"
               , "##··&·"
               , "#··#··"
               ]
  }
cells = PlaceKind
  { psymbol  = '#'
  , pname    = "air filters"
  , pfreq    = [ ("rogue", 12), ("laboratory", 12)
               , ("empty", 12), ("emptyExit", 12), ("noise", 12)
               , ("zoo", 150), ("ambush", 7) ]
  , prarity  = [(1, 4), (10, 4)]
  , pcover   = CReflect
  , pfence   = FWall
  , ptopLeft = [ "··#"
               , "·#·"
               , "#··"
               ]
  , poverrideDark = [ ('%', "doorlessMachineryOver_#")
                    , ('f', "pumpsOver_f_Dark") ]
  , poverrideLit = [ ('%', "doorlessMachineryOver_#")
                   , ('f', "pumpsOver_f_Lit") ]
  }
cells2 = cells
  { pname    = "humidity equalizers"
  , ptopLeft = [ "#··"
               , "·#·"
               , "f·#"
               ]
  }
cells3 = cells
  { pname    = "thermostat units"
  , ptopLeft = [ "··#"
               , "·#^"
               , "#··"
               ]
  }
cells4 = cells
  { pname    = "a power node"
  , ptopLeft = [ "··#"
               , "·#·"
               , "#%·"
               ]
  }
cells5 = cells  -- this one is distinct enough from others, so needs a boost
  { pname    = "broken robot holds"
  , pfreq    = [ ("rogue", 15), ("laboratory", 20)
               , ("empty", 20), ("emptyExit", 20), ("noise", 20) ]
  , ptopLeft = [ "··#"
               , "··#"
               , "##·"
               ]
  }
cells6 = cells
  { pname    = "animal holding pens"
  , pfreq    = [("laboratory", 60), ("noise", 60), ("zoo", 50)]
  , ptopLeft = [ "··#"
               , "##'"
               ]
  }
cells7 = cells
  { pname    = "a defunct control room"
  , pfreq    = [ ("rogue", 5), ("laboratory", 10)
               , ("empty", 8), ("emptyExit", 8), ("noise", 5) ]
  , pfence   = FFloor
  , ptopLeft = [ "#··"
               , "·%·"
               ]
  }
tank = PlaceKind
  { psymbol  = 'c'
  , pname    = "a tank"
  , pfreq    = [("empty", 1), ("emptyExit", 1)]
      -- no point taking up space if very little space taken,
      -- but if no other place can be generated, a failsafe is useful
  , prarity  = [(1, 1), (10, 1)]
  , pcover   = CStretch
  , pfence   = FNone
  , ptopLeft = [ "#"
               ]
  , poverrideDark = [('#', "doorlessWallOver_#"), ('r', "reinforced wall")]
  , poverrideLit = [('#', "doorlessWallOver_#"), ('r', "reinforced wall")]
  }
tank2 = tank
  { pfreq    = [("empty", 800), ("noise", 100), ("battle", 100)]
  , ptopLeft = [ "O#"
               , "##"
               ]
  }
tank3 = tank
  { pfreq    = [("empty", 1000), ("noise", 200), ("battle", 200)]
  , ptopLeft = [ "rr#"
               , "r##"
               , "###"
               ]
  }
tank4 = tank
  { pfreq    = [("empty", 1500), ("noise", 300), ("battle", 300)]
  , ptopLeft = [ "XXO#"
               , "Xrr#"
               , "Or##"
               , "####"
               ]
  }
tank5 = tank
  { pname    = "a cistern"
  , pfreq    = [("empty", 1500), ("noise", 300), ("battle", 300)]
  , ptopLeft = [ "XXr#"
               , "Xr##"
               , "r###"
               , "####"
               ]
  }

-- * Helper functions

makeStaircaseUp :: Text -> PlaceKind -> PlaceKind
makeStaircaseUp terminal s = s
 { psymbol   = '<'
 , pname     = pname s <+> "up"
 , pfreq     = map (\(t, k) -> (toGroupName $ tshow t <+> "up", k)) $ pfreq s
 , poverrideDark = ('>', toGroupName $ terminal <+> "Dark")
                   : filter ((/= '>') . fst) (poverrideDark s)
 , poverrideLit = ('>', toGroupName $ terminal <+> "Lit")
                  : filter ((/= '>') . fst) (poverrideLit s)
 }

makeStaircaseDown :: Text -> PlaceKind -> PlaceKind
makeStaircaseDown terminal s = s
 { psymbol   = '>'
 , pname     = pname s <+> "down"
 , pfreq     = map (\(t, k) -> (toGroupName $ tshow t <+> "down", k)) $ pfreq s
 , poverrideDark = ('<', toGroupName $ terminal <+> "Dark")
                   : filter ((/= '<') . fst) (poverrideDark s)
 , poverrideLit = ('<', toGroupName $ terminal <+> "Lit")
                  : filter ((/= '<') . fst) (poverrideLit s)
 }

overrideGatedStaircase :: [(Char, GroupName TileKind)]
overrideGatedStaircase =
  [ ('<', "gated staircase up"), ('>', "gated staircase down")
  , ('I', "signboard"), ('S', "fillerWall") ]

makeGatedStaircase :: PlaceKind -> PlaceKind
makeGatedStaircase s = s
 { psymbol   = 'g'
 , pname     = T.unwords $ "a gated" : tail (T.words (pname s))
 , pfreq     = map (first (\t -> toGroupName $ "gated" <+> tshow t)) $ pfreq s
 , poverrideDark = overrideGatedStaircase
 , poverrideLit = overrideGatedStaircase
 }

overrideGatedLift :: [(Char, GroupName TileKind)]
overrideGatedLift =
  [ ('<', "gated lift up"), ('>', "gated lift down")
  , ('I', "signboard"), ('S', "lift shaft") ]

makeGatedLift :: PlaceKind -> PlaceKind
makeGatedLift s = s
 { psymbol   = 'g'
 , pname     = T.unwords $ "a gated" : tail (T.words (pname s))
 , pfreq     = map (first (\t -> toGroupName $ "gated" <+> tshow t)) $ pfreq s
 , poverrideDark = overrideGatedLift
 , poverrideLit = overrideGatedLift
 }

overrideOutdoor :: [(Char, GroupName TileKind)]
overrideOutdoor =
  [ ('<', "staircase outdoor up"), ('>', "staircase outdoor down")
  , ('I', "signboard"), ('S', "fillerWall") ]

makeOutdoor :: PlaceKind -> PlaceKind
makeOutdoor s = s
 { psymbol   = 'o'
 , pname     = "an outdoor area exit"
 , pfreq     = map (first (\t -> toGroupName $ "outdoor" <+> tshow t)) $ pfreq s
 , poverrideDark = overrideOutdoor
 , poverrideLit = overrideOutdoor
 }
