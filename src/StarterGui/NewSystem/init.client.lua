local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages.RoactRodux)
local e = Roact.createElement

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local app = require(script.App)
local closeEvent
do
    closeEvent = Instance.new("BindableEvent")
    closeEvent.Parent = LocalPlayer.PlayerGui
    closeEvent.Name = "CloseUI"
end

local existingUITree = Roact.mount(e(app), 
	LocalPlayer.PlayerGui, 
    "DatabaseSystemUI"
)

closeEvent.Event:Connect(function()
    Roact.unmount(existingUITree)
    closeEvent:Destroy()
end)