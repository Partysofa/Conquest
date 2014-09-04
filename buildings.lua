require "resources"

mill = 0
smithy = 0
temple = 0
tannery = 0
butcher = 0
bakery = 0
brewery = 0
graveyard = 0
houses = 0

buildFrame = loveframes.Create("frame")
buildFrame:SetName("Buildings")
buildFrame:SetPos(128, 320)
buildFrame:SetSize(256, 300)
buildFrame:SetDockable(true)

local house = loveframes.Create("button")
house:SetText("House")
local houseTip = loveframes.Create("tooltip")
houseTip:SetObject(house)
houseTip:SetPadding(10)
houseTip:SetText("Holds 5 peasants \n \n Cost to build: \n 10x wood")
house.OnClick = function(house)
  if wood >= 10 then
    if landAvailable >= landUsed then
      wood = wood - 10
      houses = houses + 1
      maxPeasants = maxPeasants + 5
      landUsed = landUsed + 1
      landAvailable = landAvailable - 1
    end
  end
end



local buildList = loveframes.Create("list", buildFrame)
buildList:SetPos(5, 30)
buildList:SetSize(246, 265)
buildList:SetPadding(5)
buildList:SetSpacing(5)
buildList:AddItem(house)

