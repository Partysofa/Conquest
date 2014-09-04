require "resources"
require "population"

jobs = loveframes.Create("frame")
jobs:SetSize(256, 400)
jobs:SetPos(400, 200)
jobs:SetName("Jobs")
jobs:SetDockable(true)


farmerN = loveframes.Create("numberbox", jobs)
farmerN:SetPos(128, 35)
farmW = farmerN:GetValue()
farmerN:SetMin(1)

addFarmer = loveframes.Create("button", jobs)
addFarmer:SetText("+")
addFarmer:SetSize(32, foodButton:GetHeight())
addFarmer:SetPos(216, 32)
addFarmer.OnClick = function(object, x, y)
  if noJob >= farmW then
    farmers = farmers + farmW
    noJob = noJob - farmW
  end
end