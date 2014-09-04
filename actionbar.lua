
require "resources"
require "audio"
require "regionmanager"
require "law"
require "upgrades"
---------------------------------------
start = true

resourceWin = false
resourceWinN = 0

populationWin = false
populationWinN = 0

buildingWin = false
buildingWinN = 0

jobsWin = false
jobsWinN = 0

regionWin = false
regionWinN = 0
docking = false

--- ALL VARIABLES ---
-- Population
happiness = 0
dead = 0
emptyGraves = 0
tax = 0
money = 60000
---
-- Resources
food = 100
wood = 100
stone = 100
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
foodStorage = 0
woodStorage = 0
stoneStorage = 0
---
-- Buildings
mill = 0
smithy = 1
temple = 0
tannery = 0
butcher = 0
bakery = 0
brewery = 0
graveyard = 0
houses = 0
capitol = false
---
-- War Units

soldier = 0
cavalry = 0
general = 0
medic = 0 -- Healer
ballista = 0
spy = 0
catapult = 0
warship = 0
ranger = 0
catapult = 0
shaman = 0 -- Healer
spear = 0

---


function drawMenu()
    if start == true then
      
      love.audio.play(music.regular)
      love.audio.setVolume(0.1)
      
      local frame = loveframes.Create("frame")
      frame:SetName("")
      frame:SetWidth(love.window.getWidth())
      frame:SetHeight(79)
      frame:SetPos(0,-25)
      frame:ShowCloseButton(false)
      frame:SetDraggable(false)
      frame:SetDockable(true)
      
      local foodImg = loveframes.Create("image", frame)
      foodImg:SetImage("img/shiny-apple.png")
      foodImg:SetPos(690, 32)
      local woodImg = loveframes.Create("image", frame)
      woodImg:SetImage("img/pine-tree.png")
      woodImg:SetPos(690, 53)
      local stoneImg = loveframes.Create("image", frame)
      stoneImg:SetImage("img/rock.png")
      stoneImg:SetPos(712, 32)
      
      foodImgTool = loveframes.Create("tooltip")
      foodImgTool:SetText("Food ".."("..food..")")
      foodImgTool:SetObject(foodImg)
      foodImgTool:SetOffsetY(16)
      woodImgTool = loveframes.Create("tooltip")
      woodImgTool:SetText("Wood ".."("..wood..")")
      woodImgTool:SetObject(woodImg)
      woodImgTool:SetOffsetY(16)
      stoneImgTool = loveframes.Create("tooltip")
      stoneImgTool:SetText("Stone ".."("..stone..")")
      stoneImgTool:SetObject(stoneImg)
      stoneImgTool:SetOffsetY(16)
      
      local grid = loveframes.Create("grid", frame)
      grid:SetPos(frame:GetWidth() / 3, 30)
      grid:SetRows(1)
      grid:SetColumns(8)
      grid:SetCellWidth(32)
      grid:SetCellHeight(32)
      grid:SetCellPadding(5)
      grid:SetItemAutoSize(true)
      
      -- The button to open the Resource window
      local resource = loveframes.Create("imagebutton")
      resource:SetImage("img/dig-dug.png")
      resource:SetSize(32, 32)
      resource:SetText("1")
      resource.OnClick = function (object, x, y)
        if resourceWin == false then
          resourceWin = true
          resourceW()
        end
      end
      -- The button to open the Population window
      local population = loveframes.Create("imagebutton")
      population:SetImage("img/backup.png")
      population:SetSize(32, 32)
      population:SetText("2")
      population.OnClick = function (object, x, y)
        if populationWin == false then
          populationWin = true
          populationW()
        end
      end
      -- The button to open the Jobs window
      local job = loveframes.Create("imagebutton")
      job:SetImage("img/scythe.png")
      job:SetSize(32, 32)
      job:SetText("3")
      job.OnClick = function (object, x, y)
        if jobsWin == false then
          jobsWin = true
          jobsW()
        end
      end
      
      -- The button to open the Buildings window
      local buildings = loveframes.Create("imagebutton")
      buildings:SetImage("img/wooden-door.png")
      buildings:SetSize(32, 32)
      buildings:SetText("4")
      buildings.OnClick = function (object, x, y)
        if buildingWin == false then
          buildingWin = true
          buildingW()
        end
      end
      
      
      -- The button to open the Region Management window
      local region = loveframes.Create("imagebutton")
      region:SetImage("img/capitol.png")
      region:SetSize(32, 32)
      region:SetText("5")
      region.OnClick = function (object, x, y)
        if regionWin == false then
          regionWin = true
          regionW()
        end
      end
      
      -- The button to open the Conquest window
      local conquest = loveframes.Create("imagebutton")
      conquest:SetImage("img/cannon.png")
      conquest:SetSize(32, 32)
      conquest:SetText("6")
      
      -- The button to open the Pause window
      local menu = loveframes.Create("imagebutton")
      menu:SetImage("img/sands-of-time.png")
      menu:SetSize(32, 32)
      menu:SetText("esc")
      
      -- The button to open the Statistics window
      local stats = loveframes.Create("imagebutton")
      stats:SetImage("img/bookmarklet.png")
      stats:SetSize(32, 32)
      stats:SetText("7")
      
      -- Population Tooltip
      local popTool = loveframes.Create("tooltip")
      popTool:SetObject(population)
      popTool:SetText("Population")
      popTool:SetPadding(10)
      popTool:SetOffsetY(32)
      
      -- Resource Tooltip
      local resTool = loveframes.Create("tooltip")
      resTool:SetObject(resource)
      resTool:SetText("Resources")
      resTool:SetPadding(10)
      resTool:SetOffsetY(32)
      
      -- Jobs Tooltip
      local jobTool = loveframes.Create("tooltip")
      jobTool:SetObject(job)
      jobTool:SetText("Jobs")
      jobTool:SetPadding(10)
      jobTool:SetOffsetY(32)
      
      -- Buildings Tooltip
      local buildTool = loveframes.Create("tooltip")
      buildTool:SetObject(buildings)
      buildTool:SetText("Buildings")
      buildTool:SetPadding(10)
      buildTool:SetOffsetY(32)
      
      -- Region Management Tooltip
      local regionTool = loveframes.Create("tooltip")
      regionTool:SetObject(region)
      regionTool:SetText("Region Management (Requires Capitol Building)")
      regionTool:SetPadding(10)
      regionTool:SetOffsetY(32)
      
      -- Conquest Tooltip
      local regionTool = loveframes.Create("tooltip")
      regionTool:SetObject(conquest)
      regionTool:SetText("Conquest")
      regionTool:SetPadding(10)
      regionTool:SetOffsetY(32)
      
      -- Statistics Tooltip
      local regionTool = loveframes.Create("tooltip")
      regionTool:SetObject(stats)
      regionTool:SetText("Statistics")
      regionTool:SetPadding(10)
      regionTool:SetOffsetY(32)
      
      -- Menu Tooltip
      local regionTool = loveframes.Create("tooltip")
      regionTool:SetObject(menu)
      regionTool:SetText("Menu")
      regionTool:SetPadding(10)
      regionTool:SetOffsetY(32)
      
      -- Add items to the grid. The 1 is the row, the second argument is collumn
      grid:AddItem(resource, 1, 1)
      grid:AddItem(population, 1, 2)
      grid:AddItem(job, 1, 3)
      grid:AddItem(buildings, 1, 4)
      grid:AddItem(region, 1, 5)
      grid:AddItem(conquest, 1, 6)
      grid:AddItem(stats, 1, 7)
      grid:AddItem(menu, 1, 8)
      
      -- Population happiness
      happy = loveframes.Create("progressbar", frame) -- Happiness increases resource gathering
      happy:SetPos(8, 30)
      happy:SetWidth(320)
      happy:SetLerpRate(10)
      local happiness = loveframes.Create("text", frame)
      happiness:SetPos(96, 59)
      happiness:SetText("Population Happiness")
    end
end
function resourceW() -- Resource Window
  if resourceWin == true then
    local resFrame = loveframes.Create("frame")
    resFrame:SetName("Basic Resources")
    resFrame:SetPos(32, 64)
    resFrame:SetSize(256, 128)
    resFrame:SetMinWidth(96, 128)
    resFrame:SetMinHeight(128, 96)
    resFrame:SetMaxWidth(256, 128)
    resFrame:SetMaxHeight(128, 128)
    resFrame:SetDockable(docking)
    
    resFrame.OnClose = function (object, x, y)
      resourceWin = false
      resourceWinN = 0
    end
    
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
  end
end


function populationW() -- Population Window
  
  if populationWin == true then
    local population = loveframes.Create("frame")
    population:SetName("Population")
    population:SetPos(320, 64)
    population:SetDockable(docking)
      
    population.OnClose = function (object, x, y)
      populationWin = false
      populationWinN = 0
    end
      
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
  end
end

function buildingW() -- Buildings Window
  if buildingWin == true then
    buildFrame = loveframes.Create("frame")
    buildFrame:SetName("Buildings")
    buildFrame:SetPos(128, 320)
    buildFrame:SetSize(256, 300)
    buildFrame:SetDockable(docking)
    
    buildFrame.OnClose = function (object, x, y)
      buildingWin = false
      buildingWinN = 0
    end
    
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
    
    local foodDep = loveframes.Create("button")
    foodDep:SetText("Food Storage")
    local foodDepTip = loveframes.Create("tooltip")
    foodDepTip:SetObject(foodDep)
    foodDepTip:SetPadding(10)
    foodDepTip:SetText("Increases food storage by 100 \n \n Cost to build: \n 20x wood")
    foodDep.OnClick = function(object, x, y)
      if wood >= 20 then
        if landAvailable >= landUsed then
          wood = wood - 20
          foodStorage = foodStorage + 1
          maxFood = maxFood + 100
          landUsed = landUsed + 1
          landAvailable = landAvailable - 1
        end
      end
    end
    
    local woodDep = loveframes.Create("button")
    woodDep:SetText("Wood Storage")
    local woodDepTip = loveframes.Create("tooltip")
    woodDepTip:SetObject(woodDep)
    woodDepTip:SetPadding(10)
    woodDepTip:SetText("Increases wood storage by 100 \n \n Cost to build: \n 20x wood")
    woodDep.OnClick = function(object, x, y)
      if wood >= 20 then
        if landAvailable >= landUsed then
          wood = wood - 20
          woodStorage = woodStorage + 1
          maxWood = maxWood + 100
          landUsed = landUsed + 1
          landAvailable = landAvailable - 1
        end
      end
    end
    
    local stoneDep = loveframes.Create("button")
    stoneDep:SetText("Stone Storage")
    local stoneDepTip = loveframes.Create("tooltip")
    stoneDepTip:SetObject(stoneDep)
    stoneDepTip:SetPadding(10)
    stoneDepTip:SetText("Increases stone storage by 100 \n \n Cost to build: \n 20x wood")
    stoneDep.OnClick = function(object, x, y)
      if wood >= 20 then
        if landAvailable >= landUsed then
          wood = wood - 20
          stoneStorage = stoneStorage + 1
          maxStone = maxStone + 100
          landUsed = landUsed + 1
          landAvailable = landAvailable - 1
        end
      end
    end
    
    local capitolB = loveframes.Create("button")
    capitolB:SetText("Capitol")
    if capitol == true then
      capitolB:SetText("Capitol (ALREADY BUILT)")
    end
    local capitolBTip = loveframes.Create("tooltip")
    capitolBTip:SetObject(capitolB)
    capitolBTip:SetPadding(10)
    capitolBTip:SetText("Allows you to set laws, manage your land and buy upgrades \n \n Cost to build: \n 300x stone \n 100x wood \n 100x food")
    capitolB.OnClick = function(object, x, y)
      if capitol == false then
        if wood >= 100 then
          if food >= 100 then
            if stone >= 300 then
              if landAvailable >= landUsed then
                wood = wood - 100
                stone = stone - 300
                food = food - 100
                capitol = true
                landUsed = landUsed + 1
                landAvailable = landAvailable - 1
                capitolB:SetText("Capitol (ALREADY BUILT)")
              end
            end
          end
        end
      end
    end
    
    
    
    local buildList = loveframes.Create("list", buildFrame)
    buildList:SetPos(5, 30)
    buildList:SetSize(246, 265)
    buildList:SetPadding(5)
    buildList:SetSpacing(5)
    
    buildList:AddItem(house)
    buildList:AddItem(foodDep)
    buildList:AddItem(woodDep)
    buildList:AddItem(stoneDep)
    buildList:AddItem(capitolB)
  end
end
function jobsW() -- Jobs Window
  if jobsWin == true then
    jobs = loveframes.Create("frame")
    jobs:SetSize(256, 400)
    jobs:SetPos(400, 200)
    jobs:SetName("Jobs")
    jobs:SetDockable(docking)
    jobs.OnClose = function (object, x, y)
      jobsWin = false
      jobsWinN = 0
    end
    
    local jobList = loveframes.Create("list", jobs)
    jobList:SetPos(8, 32)
    jobList:SetSize(240, 128)
    jobList:SetPadding(5)
    jobList:SetSpacing(5)  
    
    addFarmer = loveframes.Create("button", jobs)
    addFarmer:SetText("Create Farmer")
    addFarmer:SetSize(200, foodButton:GetHeight())
    addFarmer:SetPos(8, 32)
    addFarmer.OnClick = function(object, x, y)
      if noJob >= 1 then
        farmers = farmers + 1
        noJob = noJob - 1
      end
    end
    
    addWoodcutter = loveframes.Create("button", jobs)
    addWoodcutter:SetText("Create Woodcutter")
    addWoodcutter:SetSize(200, foodButton:GetHeight())
    addWoodcutter:SetPos(8, 32)
    addWoodcutter.OnClick = function(object, x, y)
      if noJob >= 1 then
        woodcutters = woodcutters + 1
        noJob = noJob - 1
      end
    end
    
    addMiner = loveframes.Create("button", jobs)
    addMiner:SetText("Create Miner")
    addMiner:SetSize(200, foodButton:GetHeight())
    addMiner:SetPos(8, 32)
    addMiner.OnClick = function(object, x, y)
      if noJob >= 1 then
        miners = miners + 1
        noJob = noJob - 1
      end
    end
    
    
    
    jobList:AddItem(addFarmer)
    jobList:AddItem(addWoodcutter)
    jobList:AddItem(addMiner)
  end
end

function regionW() -- Region Management Window
  lawsW = false
  if capitol == true then
    if regionWin == true then
      manager = loveframes.Create("frame")
      manager:SetName("Region Management")
      manager:SetSize(500, 300)
      manager:SetDockable(docking)

      local tabs = loveframes.Create("tabs", manager)
      tabs:SetPos(5, 30)
      tabs:SetSize(490, 265)
      
      local manage = loveframes.Create("panel")
      local upgrades = loveframes.Create("panel")
      
      local economy = loveframes.Create("form", manage)
      economy:SetPos(8, 8)
      economy:SetSize(200, 90)
      economy:SetLayoutType("horizontal")
      economy:SetName("Economy")
      
      local laws = loveframes.Create("form", manage)
      laws:SetPos(216, 8)
      laws:SetSize(255, 210)
      laws:SetLayoutType("horizontal")
      laws:SetName("Laws")
      
      local alcohol = loveframes.Create("checkbox", manage)
      alcohol:SetText("Allow alcohol")
      alcohol:SetPos(232, 32)
      alcohol:SetChecked(true)
      
      local taxN = loveframes.Create("numberbox", manage)
      taxN:SetPos(16, 32)
      taxN:SetMinMax(0, 100)
      taxN.OnValueChanged = function(object, value)
        tax = value
      end
      
      traders = loveframes.Create("checkbox", manage)
      traders:SetPos(16, 64)
      traders:SetText("Allow traders")
      traders:SetChecked(true)
      
      taxT = loveframes.Create("text", manage)
      taxT:SetText("Tax percentage")
      taxT:SetPos(100, 36)
      
      
      tabs:AddTab("Management", manage, "Manage your lands")
      tabs:AddTab("Upgrades", upgrades, "Purchase new upgrades")
      
      manager.OnClick = function (object, x, y)
        regionWin = false
        regionWinN = 0
      end
      
      ------ Upgrades -------
      
      upgradeList = loveframes.Create("list", upgrades)
      upgradeList:SetPos(8, 8)
      upgradeList:SetSize(250, 215)
      
      gathering = loveframes.Create("button")
      gathering:SetText("Better gathering Equpment")
      gatheringTool = loveframes.Create("tooltip")
      gatheringTool:SetObject(gathering)
      gatheringTool:SetText("Workers gather basic resources faster \n \n Requires \n 100x Wood \n 100x Food \n 100x Stone")
      
      gathering.OnClick = function (object, x, y)
        if production == false then
          if wood >= 100 then
            if food >= 100 then
              if stone >= 100 then
                stone = stone - 100
                food = food - 100
                wood = wood - 100
                foodMod = foodMod + 10
                woodMod = woodMod + 10
                stoneMod = stoneMod + 10
                gathering:SetText("Better gathering Equpment (PURCHASED)")
                production = true
              end
            end
          end
        end
      end
      
      iron = loveframes.Create("button")
      iron:SetText("Iron Equipment")
      ironTool = loveframes.Create("tooltip")
      ironTool:SetObject(iron)
      ironTool:SetText("Upgrades your units arsenal to iron \n \n Requires \n 1x Smithy \n 200x Money")
      iron.OnClick = function (object, x, y)
        if smithy >= 1 then
          if money >= 200 then
            if ironE == false then
              ironE = true
              money = money - 200
              iron:SetText("Iron Equipment (PURCHASED)")
              
            end
          end
        end
      end
      steel = loveframes.Create("button")
      steel:SetText("Steel Equipment")
      steelTool = loveframes.Create("tooltip")
      steelTool:SetObject(steel)
      steelTool:SetText("Upgrades your units arsenal to steel \n \n Requires \n Iron Equipment \n 1x Smithy \n 600x Money")
      steel.OnClick = function (object, x, y)
        if ironE == true then
          if smithy >= 1 then
            if money >= 600 then
              if steelE == false then
                steelE = true
                money = money - 600
                steel:SetText("Steel Equipment (PURCHASED)")
              end
            end
          end
        end
      end
      
      upgradeList:AddItem(gathering)
      upgradeList:AddItem(iron)
      upgradeList:AddItem(steel)
      
      
      
    end
  end
end