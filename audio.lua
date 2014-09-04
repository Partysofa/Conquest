require "TEsound"

music = {}
music.regular = love.audio.newSource("sound/PianoVariationForSeamless.mp3")
music.battle = love.audio.newSource("sound/SmallBattleLoop1.mp3")
music.bigBattle = love.audio.newSource("sound/EpicLoop1.mp3")
music.menu = love.audio.newSource("sound/MAINTHEME.mp3")

music.menu:setLooping(true)
music.regular:setLooping(true)