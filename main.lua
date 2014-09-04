require "start"
require("LoveFrames")
require "TEsound"
require "actionbar"
require "population"
require "resources"
require "law"
if start == false then
  
  
end

function love.load()

end


function love.update(dt)
  
  
  
  TEsound.cleanup()
  if start == false then
    
    --happy:SetValue(tax / peasants / maxPeasants)
    
    woodText:SetText(wood .." / " .. maxWood)
    foodText:SetText(food .." / " .. maxFood)
    stoneText:SetText(stone .." / " .. maxStone)
    popText:SetText("Current population: " .. peasants .. " / " .. maxPeasants)
    
    
    maxPeasants = maxPeasants
    peasants = peasants
    noJob = noJob
    resClick = resClick
    farmers = farmers
    
    -- Automatic food gathering check
    if food >= maxFood then end -- Don't gather food if greater than maxFood
    if food <= maxFood then -- Gather food if food is less than maxFood
      food = food + farmers / 10 * dt
    end
    -- Automatic wood gathering check
    if wood >= maxWood then end -- Don't gather wood if greater than maxWood
    if wood <= maxWood then -- Gather wood if food is less than maxWood
      wood = wood + woodcutters / 10 * dt
    end
    -- Automatic stone gathering check
    if stone >= maxStone then end -- Don't gather wood if greater than maxWood
    if stone <= maxStone then -- Gather wood if food is less than maxWood
      stone = stone + miners / 10 * dt
    end
  end
  
  if checked == true then
    love.window.setFullscreen(true)
  end
  if checked == false then
    love.window.setFullscreen(false)
  end
  
  
  loveframes.update(dt)
 
end
function love.draw()
  if start == true then
    love.graphics.draw(logo, love.window.getWidth() / 4.2, love.window.getHeight() / 17)
  end
  loveframes.draw()
 
end
 
function love.mousepressed(x, y, button)
 
  loveframes.mousepressed(x, y, button)
 
end
 
function love.mousereleased(x, y, button)
 
  loveframes.mousereleased(x, y, button)
 
end
 
function love.keypressed(key, unicode)
 
  if key == "1" then
    if resourceWin == false then
      resourceWin = true
      resourceW()
    end
  end
  if key == "2" then
    if populationWin == false then
      populationWin = true
      populationW()
    end
  end
  if key == "3" then
    if jobsWin == false then
      jobsWin = true
      jobsW()
    end
  end
  
  
  loveframes.keypressed(key, unicode)
 
end
 
function love.keyreleased(key)
 
  loveframes.keyreleased(key)
 
end