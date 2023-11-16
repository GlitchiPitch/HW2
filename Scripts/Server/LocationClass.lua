

local Location1 = {}
local Location2 = {}
local Location3 = {}

local LocationClass = {}

LocationClass.__index = LocationClass
-- Location1.__index = LocationClass
-- Location2.__index = LocationClass
-- Location3.__index = LocationClass

function LocationClass.NewLocation(game_)
    local self = setmetatable({}, LocationClass)
    self.Game = game_
    self.CurrentStageIndex = 1
    -- print(self.Game, self.Index)

    self.LocationList = {Location1.New, Location2.New, Location3.New}
    self.LocationEvent = Instance.new('BindableEvent')

    self:Init()

    return self
end

function LocationClass:Subscribe()
    self.LocationEvent.Event:Connect(function(action)
        if action == 'ChangeStage' then
            print('ChangeStage')
            self.CurrentStageIndex += 1
            self.Game.ServerEvents:Fire('Next')
        elseif action == 'StagesOver' then
            print('StagesOver')
            self.Game.ServerEvents:Fire('Over')
        end
    end)
end



function LocationClass:Init()
    print(self.Game.CurrentLocation)
    self.Game.CurrentLocation =  self.LocationList[self.Game.CurrentLocationIndex](self)
    print(getmetatable(self.Game.CurrentLocation))
    print(self)
    self:Subscribe()

    self.Game.ServerEvents:Fire('Stage')
    self.Game.ServerEvents:Fire('Next')
end




function Location1.New(locationClass)
    local self = setmetatable({}, locationClass)
    print('is Location 1')
    -- self.Game = game_
    print(self)
    print(getmetatable(self))
    -- self:Init()
    -- self.LocationClass = locationClass
    -- self.CurrentStageIndex = stageIndex
    -- self.LocationEvent = locationEvent
    return self
end

-- function Location1:Init()
--     -- print('Hello from init')
-- end

function Location2.New(locationEvent, stageIndex)
    local self = setmetatable({}, Location2)
    print('is Location 2')
    -- self.Game = game_
    -- self.LocationClass = locationClass
    self.CurrentStageIndex = stageIndex
    self.LocationEvent = locationEvent
    return self
end

function Location2:Init()
    -- print('Hello from init')
end

function Location3.New(locationEvent, stageIndex)
    local self = setmetatable({}, Location3)
    print('is Location 3')
    -- self.Game = game_
    -- self.LocationClass = locationClass
    self.CurrentStageIndex = stageIndex
    self.LocationEvent = locationEvent
    return self
end

function Location3:Init()
    -- print('Hello from init')
end


return LocationClass