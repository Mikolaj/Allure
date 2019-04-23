# Copyright (c) 2008--2011 Andres Loeh
# Copyright (c) 2010--2019 Mikolaj Konarski and others (see git history)
# This file is a part of the computer game Allure of the Stars
# and is released under the terms of the GNU Affero General Public License.
# For license and copyright information, see the file LICENSE.
#

play:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix play --dumpInitRngs

shot:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix play --dumpInitRngs --printEachScreen

expose-lore:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix know --newGame 5 --dumpInitRngs --gameMode crawl --knowItems --exposePlaces --exposeItems --exposeActors --showItemSamples --benchmark --noAnim --maxFps 1000

dig-lore:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix know --newGame 5 --dumpInitRngs --gameMode dig --knowItems --exposePlaces --exposeItems --exposeActors --showItemSamples --benchmark --noAnim --maxFps 1000

see-caves:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix know --newGame 5 --dumpInitRngs --gameMode see --knowItems --exposePlaces --exposeItems --exposeActors --showItemSamples --benchmark --noAnim --maxFps 1000

configure-debug:
	cabal configure --enable-profiling --profiling-detail=all-functions -fwith_expensive_assertions --disable-optimization

configure-prof:
	cabal configure --enable-profiling --profiling-detail=exported-functions

ghcjs-new-build:
	cabal new-build -j1 --ghcjs --disable-library-profiling --disable-profiling .

chrome-log:
	google-chrome --enable-logging --v=1 file:///home/mikolaj/r/allureofthestars.github.io/play/index.html &

chrome-prof:
	google-chrome --no-sandbox --js-flags="--logfile=%t.log --prof" ../allureofthestars.github.io/play/index.html

minific:
	npx google-closure-compiler dist-newstyle/build/x86_64-linux/ghcjs-8.6.0.1/Allure-0.9.4.2/x/Allure/build/Allure/Allure.jsexe/all.js --compilation_level=ADVANCED_OPTIMIZATIONS --isolation_mode=IIFE --assume_function_wrapper --externs=dist-newstyle/build/x86_64-linux/ghcjs-8.6.0.1/Allure-0.9.4.2/x/Allure/build/Allure/Allure.jsexe/all.js.externs --jscomp_off="*" > ../allureofthestars.github.io/play/allure.all.js

minificForNode:
	npx google-closure-compiler dist-newstyle/build/x86_64-linux/ghcjs-8.6.0.1/Allure-0.9.4.2/x/Allure/build/Allure/Allure.jsexe/all.js --compilation_level=ADVANCED_OPTIMIZATIONS --isolation_mode=IIFE --assume_function_wrapper --externs=dist-newstyle/build/x86_64-linux/ghcjs-8.6.0.1/LambdaHack-0.9.4.2/x/LambdaHack/build/LambdaHack/LambdaHack.jsexe/all.js.externs --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/assert.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/child_process.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/crypto.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/dns.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/events.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/globals.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/https.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/os.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/punycode.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/readline.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/stream.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/tls.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/url.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/vm.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/buffer.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/cluster.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/dgram.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/domain.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/fs.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/http.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/net.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/path.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/querystring.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/repl.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/string_decoder.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/tty.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/util.js --externs=/home/mikolaj/r/closure-compiler/contrib/nodejs/zlib.js --jscomp_off="*" > ../allureofthestars.github.io/play/allure.all.js

# Low delay to display animations swiftly and not bore the public too much.
# Delay can't be lower than 2, because browsers sometimes treat delay 1
# specially and add their extra delay.
create-gif :
	find ~/.Allure/screenshots/ -name 'prtscn*.bmp' -print0 | xargs -0 -r mogrify -format gif
	gifsicle -O3 --careful -d2 -l ~/.Allure/screenshots/prtscn*.gif -o ~/.Allure/screenshots/screenshot.gif

frontendRaid:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 5 --dumpInitRngs --automateAll --gameMode raid --exposeActors

frontendBrawl:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 5 --dumpInitRngs --automateAll --gameMode brawl

frontendShootout:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 5 --dumpInitRngs --automateAll --gameMode shootout

frontendHunt:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 5 --dumpInitRngs --automateAll --gameMode hunt

frontendEscape:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 3 --dumpInitRngs --automateAll --gameMode escape

frontendZoo:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 2 --dumpInitRngs --automateAll --gameMode zoo --exposeActors

frontendAmbush:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 5 --dumpInitRngs --automateAll --gameMode ambush

frontendCrawl:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 1 --dumpInitRngs --automateAll --gameMode crawl --exposeItems --exposeActors

frontendCrawlEmpty:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 1 --dumpInitRngs --automateAll --gameMode "crawl empty"

frontendSafari:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 2 --dumpInitRngs --automateAll --gameMode safari --exposeActors

frontendSafariSurvival:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 5 --dumpInitRngs --automateAll --gameMode "safari survival" --exposeActors

frontendBattle:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 4 --dumpInitRngs --automateAll --gameMode battle --exposeActors

frontendBattleDefense:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 6 --dumpInitRngs --automateAll --gameMode "battle defense" --exposeActors

frontendBattleSurvival:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 6 --dumpInitRngs --automateAll --gameMode "battle survival" --exposeActors

frontendDefense:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 9 --dumpInitRngs --automateAll --gameMode defense --exposeItems --exposeActors

frontendDefenseEmpty:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 9 --dumpInitRngs --automateAll --gameMode "defense empty"

fastCrawl:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --savePrefix test --newGame 1 --dumpInitRngs --automateAll --gameMode crawl --exposeItems --exposeActors --showItemSamples --noAnim --maxFps 100000


benchMemoryAnim:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --maxFps 100000 --benchmark --stopAfterFrames 33000 --automateAll --keepAutomated --gameMode crawl --setDungeonRng 120 --setMainRng 47 --frontendNull --noAnim +RTS -s -A1M -RTS

benchBattle:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 3 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 1500 --automateAll --keepAutomated --gameMode battle --setDungeonRng 7 --setMainRng 7

benchAnimBattle:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 3 --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 7000 --automateAll --keepAutomated --gameMode battle --setDungeonRng 7 --setMainRng 7

benchFrontendBattle:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 3 --noAnim --maxFps 100000 --benchmark --stopAfterFrames 2000 --automateAll --keepAutomated --gameMode battle --setDungeonRng 7 --setMainRng 7

benchCrawl:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 7000 --automateAll --keepAutomated --gameMode crawl --setDungeonRng 0 --setMainRng 0

benchFrontendCrawl:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --benchmark --stopAfterFrames 7000 --automateAll --keepAutomated --gameMode crawl --setDungeonRng 0 --setMainRng 0

benchDig:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 1 --automateAll --keepAutomated --gameMode dig --setDungeonRng 0 --setMainRng 0

benchNull: benchBattle benchAnimBattle benchCrawl

bench: benchBattle benchAnimBattle benchFrontendBattle benchCrawl benchFrontendCrawl

nativeBenchCrawl:
	dist/build/Allure/Allure		   --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 2000 --automateAll --keepAutomated --gameMode crawl --setDungeonRng 0 --setMainRng 0

nativeBenchBattle:
	dist/build/Allure/Allure		   --dbgMsgSer --logPriority 4 --newGame 3 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 1000 --automateAll --keepAutomated --gameMode battle --setDungeonRng 0 --setMainRng 0

nativeBench: nativeBenchBattle nativeBenchCrawl

nodeBenchCrawl:
	node dist/build/Allure/Allure.jsexe/all.js --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 2000 --automateAll --keepAutomated --gameMode crawl --setDungeonRng 0 --setMainRng 0

nodeBenchBattle:
	node dist/build/Allure/Allure.jsexe/all.js --dbgMsgSer --logPriority 4 --newGame 3 --noAnim --maxFps 100000 --frontendNull --benchmark --stopAfterFrames 1000 --automateAll --keepAutomated --gameMode battle --setDungeonRng 0 --setMainRng 0

nodeBench: nodeBenchBattle nodeBenchCrawl


test-travis: test-sniff test-short test-medium benchNull

test: test-sniff test-short test-medium benchNull

test-short: test-short-new test-short-load

test-medium: testRaid-medium testBrawl-medium testShootout-medium testHunt-medium testEscape-medium testZoo-medium testAmbush-medium testCrawl-medium testCrawlEmpty-medium testCrawl-medium-know testSafari-medium testSafariSurvival-medium testBattle-medium testBattleDefense-medium testBattleSurvival-medium testDig-medium testDefenseEmpty-medium

test-sniff:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 5 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterFrames 1  --dumpInitRngs --automateAll --keepAutomated --gameMode raid --sniff 2> /tmp/teletypetest.log

testRaid-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 20 --dumpInitRngs --automateAll --keepAutomated --gameMode raid 2> /tmp/teletypetest.log

testBrawl-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 20 --dumpInitRngs --automateAll --keepAutomated --gameMode brawl 2> /tmp/teletypetest.log

testShootout-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 20 --dumpInitRngs --automateAll --keepAutomated --gameMode shootout 2> /tmp/teletypetest.log

testHunt-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 20 --dumpInitRngs --automateAll --keepAutomated --gameMode hunt 2> /tmp/teletypetest.log

testEscape-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 3 --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode escape 2> /tmp/teletypetest.log

testZoo-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 2 --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode zoo 2> /tmp/teletypetest.log

testAmbush-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 20 --dumpInitRngs --automateAll --keepAutomated --gameMode ambush 2> /tmp/teletypetest.log

testCrawl-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 200 --dumpInitRngs --automateAll --keepAutomated --gameMode crawl 2> /tmp/teletypetest.log

testCrawlEmpty-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode "crawl empty" 2> /tmp/teletypetest.log

testCrawl-medium-know:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix know --newGame 1 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 100 --dumpInitRngs --automateAll --keepAutomated --gameMode crawl --knowItems --exposePlaces --exposeItems --exposeActors --showItemSamples 2> /tmp/teletypetest.log

testSafari-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 2 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 100 --dumpInitRngs --automateAll --keepAutomated --gameMode safari 2> /tmp/teletypetest.log

testSafariSurvival-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 8 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode "safari survival" 2> /tmp/teletypetest.log

testBattle-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 3 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 20 --dumpInitRngs --automateAll --keepAutomated --gameMode battle 2> /tmp/teletypetest.log

testBattleDefense-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 7 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode "battle defense" 2> /tmp/teletypetest.log

testBattleSurvival-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 7 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode "battle survival" 2> /tmp/teletypetest.log

testDefense-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 9 --noAnim --maxFps 100000 --frontendLazy --benchmark --stopAfterSeconds 200 --dumpInitRngs --automateAll --keepAutomated --gameMode defense 2> /tmp/teletypetest.log

testDig-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --newGame 1 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterFrames 100 --dumpInitRngs --automateAll --keepAutomated --gameMode dig 2> /tmp/teletypetest.log

testDefenseEmpty-medium:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 9 --noAnim --maxFps 100000 --frontendTeletype --benchmark --stopAfterSeconds 40 --dumpInitRngs --automateAll --keepAutomated --gameMode "defense empty" 2> /tmp/teletypetest.log

test-short-new:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix raid --dumpInitRngs --automateAll --keepAutomated --gameMode raid --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix brawl --dumpInitRngs --automateAll --keepAutomated --gameMode brawl --showItemSamples --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix shootout --dumpInitRngs --automateAll --keepAutomated --gameMode shootout --showItemSamples --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix hunt --dumpInitRngs --automateAll --keepAutomated --gameMode hunt --showItemSamples --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix escape --dumpInitRngs --automateAll --keepAutomated --gameMode escape --showItemSamples --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix zoo --dumpInitRngs --automateAll --keepAutomated --gameMode zoo --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix ambush --dumpInitRngs --automateAll --keepAutomated --gameMode ambush --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix crawl --dumpInitRngs --automateAll --keepAutomated --gameMode crawl --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix safari --dumpInitRngs --automateAll --keepAutomated --gameMode safari --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix safariSurvival --dumpInitRngs --automateAll --keepAutomated --gameMode "safari survival" --showItemSamples --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix battle --showItemSamples --dumpInitRngs --automateAll --keepAutomated --gameMode battle --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix battleDefense --dumpInitRngs --automateAll --keepAutomated --gameMode "battle defense" --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --newGame 5 --savePrefix battleSurvival --dumpInitRngs --automateAll --keepAutomated --gameMode "battle survival" --frontendTeletype --stopAfterSeconds 2 2> /tmp/teletypetest.log

# "--setDungeonRng 0 --setMainRng 0" is needed for determinism relative to seed
# generated before game save
test-short-load:
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix raid --dumpInitRngs --automateAll --keepAutomated --gameMode raid --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix brawl --dumpInitRngs --automateAll --keepAutomated --gameMode brawl --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix shootout --dumpInitRngs --automateAll --keepAutomated --gameMode shootout --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix hunt --dumpInitRngs --automateAll --keepAutomated --gameMode hunt --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix escape --dumpInitRngs --automateAll --keepAutomated --gameMode escape --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix zoo --dumpInitRngs --automateAll --keepAutomated --gameMode zoo --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix ambush --dumpInitRngs --automateAll --keepAutomated --gameMode ambush --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix crawl --dumpInitRngs --automateAll --keepAutomated --gameMode crawl --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix safari --dumpInitRngs --automateAll --keepAutomated --gameMode safari --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix safariSurvival --dumpInitRngs --automateAll --keepAutomated --gameMode "safari survival" --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix battle --dumpInitRngs --automateAll --keepAutomated --gameMode battle --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix battleDefense --dumpInitRngs --automateAll --keepAutomated --gameMode "battle defense" --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log
	dist/build/Allure/Allure --dbgMsgSer --logPriority 4 --boostRandomItem --savePrefix battleSurvival --dumpInitRngs --automateAll --keepAutomated --gameMode "battle survival" --frontendTeletype --stopAfterSeconds 2 --setDungeonRng 0 --setMainRng 0 2> /tmp/teletypetest.log


version:
	dist/build/Allure/Allure --version

build-binary-common:
	cabal v1-install --disable-library-profiling --disable-profiling --disable-documentation --enable-optimization --only-dependencies
	cabal v1-configure --disable-library-profiling --disable-profiling --enable-optimization --prefix=/ --datadir=. --datasubdir=.
	cabal v1-build exe:Allure
	mkdir -p AllureOfTheStars/GameDefinition/fonts
	cabal v1-copy --destdir=AllureOfTheStarsInstall
	cp GameDefinition/config.ui.default AllureOfTheStars/GameDefinition
	cp GameDefinition/fonts/16x16xw.woff AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/16x16xw.bdf AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/16x16x.fnt AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/8x8xb.fnt AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/8x8x.fnt AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/LICENSE.16x16x AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/Fix15Mono-Bold.woff AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/fonts/LICENSE.Fix15Mono-Bold AllureOfTheStars/GameDefinition/fonts
	cp GameDefinition/InGameHelp.txt AllureOfTheStars/GameDefinition
	cp GameDefinition/PLAYING.md AllureOfTheStars/GameDefinition
	cp README.md AllureOfTheStars
	cp CHANGELOG.md AllureOfTheStars
	cp LICENSE AllureOfTheStars
	cp COPYLEFT AllureOfTheStars
	cp CREDITS AllureOfTheStars

#in LambdaHack/
# cabal v1-install --disable-library-profiling --disable-profiling --disable-documentation --enable-optimization
build-binary-ubuntu: build-binary-common
	cp AllureOfTheStarsInstall/bin/Allure AllureOfTheStars
	dist/build/Allure/Allure --version > /dev/null; \
	LH_VERSION=$$(cat ~/.Allure/stdout.txt); \
	tar -czf Allure_$${LH_VERSION}_ubuntu-16.04-amd64.tar.gz AllureOfTheStars

build-binary-macosx: build-binary-common
	cp AllureOfTheStarsInstall/bin/Allure AllureOfTheStars
	dist/build/Allure/Allure --version > /dev/null; \
	LH_VERSION=$$(cat ~/.Allure/stdout.txt); \
	OS_VERSION=$$(sw_vers -productVersion); \
	tar -czf Allure_$${LH_VERSION}_macosx-$${OS_VERSION}-amd64.tar.gz AllureOfTheStars

#in LambdaHack/
# cabal v1-install --disable-library-profiling --disable-profiling --disable-documentation --enable-optimization -fvty
build-binary-screen-reader-ubuntu: build-binary-common
	cp AllureOfTheStarsInstall/bin/Allure AllureOfTheStars
	dist/build/Allure/Allure --version > /dev/null; \
	LH_VERSION=$$(cat ~/.Allure/stdout.txt); \
	tar -czf Allure_$${LH_VERSION}_screen-reader-ubuntu-16.04-amd64.tar.gz AllureOfTheStars

new-build-dev:
	cabal new-build --datadir=. --disable-optimization -j1 all
