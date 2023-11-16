-- Moms of 

local ServerScriptService = game:GetService("ServerScriptService")

local MODULES = ServerScriptService.Modules

local Modules = {}

Modules.__index = Modules

function Modules.Create()
    local self = setmetatable({}, Modules)
    self.List = {}
    return self
end

function Modules:Init()
    for index, module in pairs(MODULES:GetChildren()) do
        self.List[index] = require(module)
    end
end

return Modules