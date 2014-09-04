require "resources"

happiness = 100
dead = 0
emptyGraves = 0

tax = 0

local population = loveframes.Create("frame")
population:SetName("Population")
population:SetPos(320, 64)
population:SetDockable(true)

popText = loveframes.Create("text", population)
popText:SetPos(8, 37)
popText:SetText("Current population: " .. peasants .. " / " .. maxPeasants)

addPop = loveframes.Create("button", population)
addPop:SetPos(8, 64)
addPop:SetSize(128, foodButton:GetHeight())
addPop:SetText("Create peasant")
addPop.OnClick = function (object, x, y)
  if peasants <= maxPeasants - 1 then
    if food >= 10 then
      peasants = peasants + 1
      food = food - 10
      noJob = noJob +1
    end
  end
end


addTool = loveframes.Create("tooltip")
addTool:SetObject(addPop)
addTool:SetText("Creates a new peasant. \n \n Cost: \n 10 Food")
addTool:SetPadding(10)
addTool:SetOffsets(32, 64)

population:SetVisible(false)