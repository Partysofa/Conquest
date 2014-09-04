require "LoveFrames"
require "audio"
require "actionbar"


fullscreenSetting = false

options = false

logo = love.graphics.newImage("img/logo.png")

civlization = {military = true, tribal = false, politics = false}
if start == false then 
  startNew:SetVisible(false)
  end
if start == true then
  
  love.audio.play(music.menu)
  
  local newGame = loveframes.Create("button")
  newGame:SetText("New Game")
  newGame:SetSize(256, 32)
  newGame:SetPos(love.window.getWidth() / 2 - 128,love.window.getHeight() / 3)

  local loadGame = loveframes.Create("button")
  loadGame:SetText("Load Game")
  loadGame:SetSize(256, 32)
  loadGame:SetPos(love.window.getWidth() / 2 - 128,love.window.getHeight() / 3 + 64)

  local optionsB = loveframes.Create("button")
  optionsB:SetText("Options")
  optionsB:SetSize(256, 32)
  optionsB:SetPos(love.window.getWidth() / 2 - 128,love.window.getHeight() / 3 + 128)

  local credits = loveframes.Create("button")
  credits:SetText("Credits")
  credits:SetSize(256, 32)
  credits:SetPos(love.window.getWidth() / 2 - 128,love.window.getHeight() / 3 + 192)

  local quit = loveframes.Create("button")
  quit:SetText("Exit")
  quit:SetSize(256, 32)
  quit:SetPos(love.window.getWidth() / 2 - 128,love.window.getHeight() / 3 + 256)

  quit.OnClick = function(object, x, y)
    love.event.quit()
  end

  optionsB.OnClick = function(object, x, y)
    options = true
    optionsWindow()
  end

  newGame.OnClick = function(object, x, y)
    local startNew = loveframes.Create("frame")
    startNew:SetName("Choose a Civilization Type")
    startNew:SetSize(512, 256)
    startNew:SetPos( love.window.getWidth() / 4,love.window.getHeight() / 4)
    
    local selection = loveframes.Create("button", startNew)
    selection:SetSize(242, 16)
    selection:SetPos(264, 230)
    selection:SetText("Accept Selection")
    
    local panel = loveframes.Create("panel", startNew)
    panel:SetPos(5, 60)
    panel:SetSize(256, 190)
    
    local effects = loveframes.Create("panel", startNew)
    effects:SetPos(264, 75)
    effects:SetSize(242, 150)
    
    local traits = loveframes.Create("text", startNew)
    traits:SetText("Civilization traits")
    traits:SetPos(264, 60)
    
    traitsText = loveframes.Create("text", effects)
    traitsText:SetPos(8, 8)
    traitsText:SetText("Economy \n Export: Metalworks \n Import: Laborers \n \n Military \n Naval & Land \n High physical strength \n \n Population Difficulty \n Hard to make happy")
    
    descriptionText = loveframes.Create("text", panel)
    descriptionText:SetText("A civilization with emphasis on military can quickly cover much land, but being driven only by war will most likely be very taxing on the population as their families will not be home much. Discipline and a iron fist is mandatory to succeed. Due to their often much stronger armor, they can take a beating in fights, but preferably in squads rather than alone. (Start with military units)")
    descriptionText:SetPos(8, 8)
    descriptionText:SetMaxWidth(240)
    
    local military = loveframes.Create("button", startNew)
    military:SetText("Military")
    military:SetPos(32, 32)
    military:SetSize(128, 20)
    
    local tribal = loveframes.Create("button", startNew)
    tribal:SetText("Tribal")
    tribal:SetPos(192, 32)
    tribal:SetSize(128, 20)
    
    local politics = loveframes.Create("button", startNew)
    politics:SetText("Politics")
    politics:SetPos(352, 32)
    politics:SetSize(128, 20)
    
    military.OnClick = function (objecy, x, y)
      civlization.military = true
      civlization.tribal = false
      civlization.politics = false
      descriptionText:SetText("A civilization with emphasis on military can quickly cover much land, but being driven only by war will most likely be very taxing on the population as their families will not be home much. Discipline and a iron fist is mandatory to succeed. Due to their often much stronger armor, they can take a beating in fights, but preferably in squads rather than alone. (Start with military units)")
      traitsText:SetText("Economy \n Export: Metalworks \n Import: Laborers \n \n Military \n Naval & Land \n High physical strength \n \n Population Difficulty \n Hard to make happy")
      peasants = 10
      soldier = 5
      cavalry = 5
      noJob = 0
      capitol = false
    end
    
    tribal.OnClick = function (object, x, y)
      civlization.military = false
      civlization.tribal = true
      civlization.politics = false
      descriptionText:SetText("Tribal civilizations favor to travel light more than settling down, and generally don't like houses in favor of tents. City walls make them feel isolated, and this can quickly affect their overall happiness. Usually good spies and hunters, their military units are very agile, but can't take too much damage in a fight. (Start with more workers)")
      traitsText:SetText("Economy \n Export: Laborers \n Import: Food Crops \n \n Military \n Land \n Very High physical strength \n \n Population Difficulty \n Happy without city walls")
      soldier = 0
      avalry = 0
      capitol = false
      peasants = 10
      noJob = 10
      capitol = 0
    end
    
    politics.OnClick = function (object, x, y)
      civlization.military = false
      civlization.tribal = false
      civlization.politics = true
      descriptionText:SetText("Proper politicians and ruling of a kingdom is vital to success. Due to their way with words and their skills in manipulating, a civlization with good politicians will more or less always have the people on their side, no matter what happens. (Start with Capitol Building)")
      traitsText:SetText("Economy \n Export: Food Crops \n Import: Metalworks \n \n Military \n Land \n Low physical strength \n \n Population Difficulty \n If ruled properly, always happy")
      peasants = 0
      noJob = 0
      soldier = 0
      cavalry = 0
      capitol = true
    end
    
    selection.OnClick = function (object, x, y)
      drawMenu()
      start = false
      startNew:SetVisible(false)
      newGame:SetVisible(false)
      loadGame:SetVisible(false)
      optionsB:SetVisible(false)
      quit:SetVisible(false)
      credits:SetVisible(false)
    end
  end
end

function optionsWindow() 
  
    if options == true then
      options = loveframes.Create("frame")
      options:SetPos( love.window.getWidth() / 4,love.window.getHeight() / 4)
      options:SetSize(512, 384)
      options:SetName("Options")
      
      local graphics = loveframes.Create("form", options)
      graphics:SetPos(5, 25)
      graphics:SetSize(240, 65)
      graphics:SetLayoutType("horizontal")
      graphics:SetName("Graphics")
      
      audio = loveframes.Create("form", options)
      audio:SetPos(256, 25)
      audio:SetSize(250, 65)
      audio:SetName("Audio")
      
      music = loveframes.Create("slider", options)
      music:SetPos(260, 40)
      music:SetWidth(240)
      music:SetMinMax(0, 1)
      
      fullscreen = loveframes.Create("checkbox", options)
      fullscreen:SetText("Fullscreen")
      fullscreen:SetPos(8, 40)
      fullscreen.OnChanged = function(object, x, y)
        if fullscreenSetting then
          love.window.setFullscreen(false)
        elseif not fullscreenSetting then 
          love.window.setFullscreen(true)
      end
    end
  end
end