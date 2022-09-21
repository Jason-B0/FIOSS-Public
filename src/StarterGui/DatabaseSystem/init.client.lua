local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages.RoactRodux)
local e = Roact.createElement

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local app = require(script.App)

existingUITree = Roact.mount(e(app), 
	LocalPlayer.PlayerGui, 
    "DatabaseSystemUI"
)
