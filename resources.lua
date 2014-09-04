food = 100
wood = 10
stone = 10

maxFood = 100
maxWood = 100
maxStone = 100

foodMod = 0
woodMod = 0
stoneMod = 0

farmers = 0
woodcutters = 0
miners = 0

resClick = 0

peasants = 0
maxPeasants = 10
noJob = 0

landUsed = 0
landAvailable = 20

local resFrame = loveframes.Create("frame")
resFrame:SetName("Basic Resources")
resFrame:SetPos(32, 64)
resFrame:SetSize(256, 128)
resFrame:SetMinWidth(96, 128)
resFrame:SetMinHeight(128, 96)
resFrame:SetMaxWidth(256, 128)
resFrame:SetMaxHeight(128, 128)
resFrame:SetDockable(true)
resFrame:SetVisible(false)

foodButton = loveframes.Create("button", resFrame)
foodButton:SetPos(8, 32)
foodButton:SetText("Gather Food")
foodButton.OnClick = function(object, x, y)
  if food <= maxFood -1 then
    food = food + 1 + foodMod
    resClick = resClick + 1
  end
end
local foodTip = loveframes.Create("tooltip")
foodTip:SetObject(foodButton)
foodTip:SetText("Gather more food for your people (+".. 1 + foodMod ..") \n \n Food is required in order to put more \n workers into labor and training soldiers. \n A vital resource for all humans.")
foodTip:SetPadding(10)
foodText = loveframes.Create("text", resFrame)
foodText:SetPos (100, 37)


woodButton = loveframes.Create("button", resFrame)
woodButton:SetPos(8, 64)
woodButton:SetText("Gather Wood")
woodButton.OnClick = function(object, x, y)
  if wood <= maxWood -1 then
    wood = wood + 1 + woodMod
    resClick = resClick + 1
  end
end
local woodTip = loveframes.Create("tooltip")
woodTip:SetObject(woodButton)
woodTip:SetText("Gather more wood for your people (+" .. 1 + woodMod ..") \n \n Wood is used in basic buildings, tools, \n for fire during nights and building war \n machines.")
woodTip:SetPadding(10)
woodText = loveframes.Create("text", resFrame)
woodText:SetPos(100, 69)

stoneButton = loveframes.Create("button", resFrame)
stoneButton:SetPos(8, 96)
stoneButton:SetText("Gather Stone")
stoneButton.OnClick = function(object, x, y)
  if stone <= maxStone -1 then
    stone = stone + 1 + stoneMod
    resClick = resClick + 1
  end
end
local stoneTip = loveframes.Create("tooltip")
stoneTip:SetObject(stoneButton)
stoneTip:SetText("Gather more stone for your people (+".. 1 + stoneMod ..") \n \n Stone is mostly used for buildings, but \n can also be used for ammo in large war \n machines such as the catapult.")
stoneTip:SetPadding(10)
stoneText = loveframes.Create("text", resFrame)
stoneText:SetPos(100, 101)
