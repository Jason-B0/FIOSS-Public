local RunService = game:GetService("RunService")
local Knit = require(game:GetService('ReplicatedStorage').Packages.Knit)
local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local e = Roact.createElement

local UIController = Knit.CreateController({
	Name = "UIController",
	existingUITree = nil,
})
--==========================================
function UIController:MountUI()
	local app = require(LocalPlayer.PlayerGui:WaitForChild("NewSystem").App)
	self:UnmountUI()
	self.existingUITree = Roact.mount(e(app), LocalPlayer.PlayerGui, "DatabaseSystemUI")
end

function UIController:UnmountUI()
	if self.existingUITree then
		Roact.unmount(self.existingUITree)
		self.existingUITree = nil
	end
end
--==========================================
function UIController:KnitInit()
	if RunService:IsStudio() then
		self:MountUI()
	end
end

function UIController:KnitStart()

end

return UIController