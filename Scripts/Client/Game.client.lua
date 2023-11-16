-- local StarterPlayerScripts = game:GetService('StarterPlayer').StarterPlayerScripts

--[[

    collection of exapmles in different 
    if i will change language in my head from English to Russian in difficult situation i never teach to speak english
    if difficult situation commands me that change to russian i never teach to speak i need hard situation? like this
    i wanna speak russian? because it's fast, but i can't change lang to russian


    back to main task/

    i want to make a collection of exsersices for different "tools" in programming like a sorting, multiply matrices and so on.
    i will create situation where can i use that tool. this colletion i will use for chill during the work time. it will give me develop skills and don't get bored

        -- main.py --
    collection of def's

    import solutions -- this 

    class ex1(Soltuion):
        # a describe of the task
        def init()
            data = self.data
            answer = None
        def check_ans():
            return answer == solution.

    
        -- solutions.py --

    dict_data = {
        []
        []
    }

    dict_solution = {
        []
        []
    }

    solution_dict = {
        (dict_data, dict_solution)
    }

    class Solution:
        def init(num):
            return solution_dict[num]

]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RemoteEvent = ReplicatedStorage:WaitForChild('RemoteEvent')
-- local PlayerManager = require(StarterPlayerScripts.ClientManager)





local ClientManager = {}

ClientManager.__index = ClientManager

function ClientManager.NewPlayer(player)
    local self = setmetatable({}, ClientManager)

    self.Player = player
    self.Event = RemoteEvent

    return self
end




Players.PlayerAdded:Connect(function(player)
    print('Hello ', player)
    ClientManager.NewPlayer(player)
end)
