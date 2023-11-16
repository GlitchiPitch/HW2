-- local ServerScriptService = game:GetService("ServerScriptService")
-- local STAGES = ServerScriptService.Stages


local StageClass = {}

StageClass.__index = StageClass

function StageClass.NewStage(game_)
    local self = setmetatable({}, StageClass)

    self.Game = game_
    print(self.Game)

    self.CurrentStage = nil
    -- self.CurrentStageIndex = self.Location.StageIndex

    self.Stages = self.Game.Modules[self.Game.CurrentLocationIndex]
    self.StageIndex = getmetatable(self.Game.CurrentLocation).CurrentStageIndex

    self:Init()

    return self
end

function StageClass:Init()
    self:Setup()
end


function StageClass:Setup()
    -- print(self.CurrentStage)
    -- print(self.Location.StageIndex)
    -- print(self.Stages)
    -- print(self.Stages[self.Location.StadeIndex])
    -- print(self.Stages[self.Game.CurrentLocationIndex])
    -- print(self.Game.CurrentLocation.CurrentStageIndex, ' is CurrentStageIndex')
    print(getmetatable(self.Game.CurrentLocation).CurrentStageIndex, ' is CurrentStageIndex')
    print(self.StageIndex)
    self.CurrentStage = self.Stages[self.StageIndex](self, not (self.StageIndex == #self.Stages) and 'ChangeStage' or 'StagesOver')
    print(self.CurrentStage)
    wait(2)
    self.CurrentStage:Finish()
    -- for index = 1, #STAGES:GetChildren() do
        
    -- end
end



return StageClass

