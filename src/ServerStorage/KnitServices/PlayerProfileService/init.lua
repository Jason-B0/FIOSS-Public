local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Players = game:GetService("Players")

local Promise = require(ReplicatedStorage.Packages.Promise)
local ProfileService = require(ReplicatedStorage.Common.ProfileService)

local PlayerProfileService = Knit.CreateService({
	Name = "PlayerProfileService",
	PlayerProfiles = {},
})

local ProfileTemplate = require(script.ProfileTemplate)
local GameProfileStore = ProfileService.GetProfileStore("PlayerData", ProfileTemplate)
--=================================
local function PlayerAdded(player: Player)
	local profile = GameProfileStore:LoadProfileAsync("Profile:" .. tostring(player.UserId))
	if profile ~= nil then
		profile:AddUserId(player.UserId)
		profile:Reconcile()
		profile:ListenToRelease(function()
			PlayerProfileService.PlayerProfiles[player] = nil
			player:Kick([[
                [FRAMEWORK] Your data may be loaded in another ROBLOX server.
                \nPlease ensure that all ROBLOX applications are closed on your device using your Task Manager.
                \nContact an administrator if you think this is a bug.
            ]])
		end)
		if player:IsDescendantOf(Players) == true then
			if RunService:IsStudio() == true then
				print(profile)
			end
			PlayerProfileService.PlayerProfiles[player] = profile

		else
			profile:Release()
		end
	else
		player:Kick([[
                [FRAMEWORK] Your data may be loaded in another ROBLOX server.
                \nPlease ensure that all ROBLOX applications are closed on your device using your Task Manager.
                \nContact an administrator if you think this is a bug.
            ]])
	end
end
--=================================
function PlayerProfileService:GetDefaultTemplate()
	return ProfileTemplate
end
function PlayerProfileService:GetPlayerData(player: Player, dataIndex: string?)
	assert(typeof(dataIndex) == "string" or dataIndex == nil, "dataIndex must be a string or nil!")

	local _, Data = Promise.new(function(resolve)
		while not self.PlayerProfiles[player] do
			task.wait()
		end

		local plrData = self.PlayerProfiles[player].Data

		if dataIndex ~= nil and plrData[dataIndex] then
			resolve(plrData[dataIndex])
		else
			resolve(plrData)
		end
	end)
		:timeout(60)
		:await()

	return Data
end

function PlayerProfileService:SetPlayerData(player: Player, dataIndex: string, value)
	assert(typeof(dataIndex) == "string" or typeof(dataIndex) == nil, "dataIndex must be a string or nil!")
	assert(typeof(value) ~= nil, "Attempting to write a nil value into player profile.")
	if self.PlayerProfiles[player] then
		self.PlayerProfiles[player].Data[dataIndex] = value
	end
end
--=================================
function PlayerProfileService:KnitStart() end

function PlayerProfileService:KnitInit()
	for _, player in pairs(Players:GetPlayers()) do
		if player:IsA(player) then
			task.spawn(PlayerAdded(player))
		end
	end
	Players.PlayerAdded:Connect(PlayerAdded)

	Players.PlayerRemoving:Connect(function(player)
		local profile = self.PlayerProfiles[player]
		if profile ~= nil then
			profile:Release()
		end
	end)
end

return PlayerProfileService
