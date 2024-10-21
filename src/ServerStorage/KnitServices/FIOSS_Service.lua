local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Promise = require(ReplicatedStorage.Packages.Promise)

local FIOSS_Service = Knit.CreateService({
	Name = "FIOSS_Service",
	Client = {}
})
local PlayerProfileService
--=================================
local function registerNewFIOSS(player:Player, username: string, password: string)
	local defaultData = PlayerProfileService:GetDefaultTemplate()
	defaultData.userId = player.UserId
	defaultData.username = username
	defaultData.password = password
	defaultData.firstTimeUser = false
	PlayerProfileService:SetPlayerData(player, "fiossData", defaultData)
end
--=================================
function FIOSS_Service.Client:RequestLogin(player:Player, username: string, password: string)
	local success = self.Server:RequestLogin(player, username, password)
	if success == true then
		return true
	else
		return false
	end
end

function FIOSS_Service.Client:RequestData(player: Player)
	return self.Server:RequestData(player)
end

function FIOSS_Service.Client:UpdateData(player: Player, newData: {})
	return self.Server:UpdateData(player, newData)
end
--=================================
function FIOSS_Service:RequestLogin(player:Player, username: string, password: string)
	local data = PlayerProfileService:GetPlayerData(player, "fiossData")
	-- studio bypass
	if RunService:IsStudio() then
		if data.firstTimeUser == true then
			registerNewFIOSS(player, tostring(player.UserId), player.Name)
		end
		return true
	end
	
	-- if client is a new user
	if data.firstTimeUser == true then
		if player.UserId == tonumber(username) and player.Name == password then
			-- overwrite data
			registerNewFIOSS(player, username, password)
			return true
		end
	end
	
	-- match pattern
	local pattern = "^.+@theta09%.sac%.com$"
	if not string.match(username, pattern) then
		return false
	end
	
	-- match first part of username before the @ sign
	local usernamePrefix = string.match(username, "^(.-)@")
	if (not usernamePrefix or usernamePrefix ~= data.username) and data.password == password then
		return true
	else
		return false
	end
end

function FIOSS_Service:RequestData(player: Player)
	local data = PlayerProfileService:GetPlayerData(player, "fiossData")
	return data
end

function FIOSS_Service:UpdateData(player: Player, newData: {})
	local data = PlayerProfileService:GetPlayerData(player, "fiossData")
	if player.UserId == data.userId then
		for key, value in pairs(newData) do
			newData[key] = value
		end
		PlayerProfileService:SetPlayerData(player, "fiossData", data)
		return true
	else
		return false
	end
end
--=================================
function FIOSS_Service:KnitStart()
	PlayerProfileService = Knit.GetService("PlayerProfileService")
end

function FIOSS_Service:KnitInit()
	
end

return FIOSS_Service
