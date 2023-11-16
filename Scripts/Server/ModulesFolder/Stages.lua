local function FinalAction(action)
    if action == 'Next' then 
        
    end
end

local Stages = {}

local Stage1_1 = {}
Stage1_1.__index = Stage1_1

local Stage1_2 = {}
Stage1_2.__index = Stage1_2

local Stage1_3 = {}
Stage1_3.__index = Stage1_3

function Stage1_1.Start(stage, finalAction)
    local self = setmetatable({}, Stage1_1)
    self.StageClass = stage
    self.Location = self.StageClass.Location
    self.FinalAction = finalAction
    -- print(self, self.Location.CurrentStageIndex)
    return self
end

function Stage1_1:Finish()
    self.Location.LocationEvent:Fire(self.FinalAction)
end

function Stage1_2.Start(stage, finalAction)
    local self = setmetatable({}, Stage1_2)
    self.StageClass = stage
    self.Location = self.StageClass.Location
    self.FinalAction = finalAction
    -- print(self, self.Location.CurrentStageIndex)
    return self
end

function Stage1_2:Finish()
    self.Location.LocationEvent:Fire(self.FinalAction)
end

function Stage1_3.Start(stage, finalAction)
    local self = setmetatable({}, Stage1_3)
    self.StageClass = stage
    self.Location = self.StageClass.Location
    self.FinalAction = finalAction
    -- print(self, self.Location.CurrentStageIndex)
    return self
end

function Stage1_3:Finish()
    self.Location.LocationEvent:Fire(self.FinalAction)
end

Stages[1] = {Stage1_1.Start, Stage1_2.Start, Stage1_3.Start}
Stages[2] = {Stage1_1.Start, Stage1_2.Start, Stage1_3.Start}
Stages[3] = {Stage1_1.Start, Stage1_2.Start, Stage1_3.Start}

return Stages