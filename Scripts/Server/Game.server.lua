-- local Players = game
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local MODULES = ServerScriptService.ModulesFolder
local FINAL_LOCATION_INDEX = 3
local Game = {}

Game.__index = Game

function Game.New()
	local self = setmetatable({}, Game)
	self.Player = nil
	self.Modules = require(MODULES.Stages)

	self.Locations = require(ServerScriptService.LocationClass)
	self.Stages = require(ServerScriptService.StageClass)

	self.CurrentLocationIndex = 1
	self.CurrentLocation = nil
    
    self.CurrentStage = nil
	self.ClientEvents = Instance.new("RemoteEvent")
	self.ServerEvents = Instance.new("BindableEvent")

	return self
end

function Game:PlayerSetup() print('Setup player') end

function Game:Start()
    -- print('start')
	-- for i = 1, #self.Stages.Stages do

	self.ServerEvents.Event:Connect(function(action: string)
        -- print(action, i)
		if action == "Location" then
            -- print('Location')
			-- print(self.Locations.NewLocation(self, i))
			print(self.CurrentLocationIndex)
			self.CurrentLocation = self.Locations.NewLocation(self)
		elseif action == "Stage" then
			-- print('Stage')
			-- print(self.CurrentLocation)
            self.ServerEvents.Event:Connect(function(actionStage)
                -- print(actionStage, i_)
                if actionStage == 'Next' then
                    print('Next')
					-- print(self.CurrentLocation)
                    self.CurrentStage = self.Stages.NewStage(self)
					elseif actionStage == 'Over' then
						print('Over')
						self.CurrentLocationIndex += 1
						print(self.CurrentLocationIndex)
						if self.CurrentLocationIndex < FINAL_LOCATION_INDEX then self.ServerEvents:Fire('Location') 
						else print('Have a fun') end
					end
				end)
			end
			
		end)
	-- end
end

function Game:Init()
	self.ServerEvents.Parent = ReplicatedStorage
	self.ClientEvents.Parent = ReplicatedStorage
	-- Players.PlayerAdded:Connect(function(player)
	-- 	self.Player = player
	-- 	self:PlayerSetup()
	-- end)
	
    self:Start()
	self.ServerEvents:Fire('Location', self.CurrentLocationIndex)
end

local g = Game.New()
g:Init()