local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
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

--=================================
function FIOSS_Service:RequestLogin(player:Player, username: string, password: string)
	local data = PlayerProfileService:GetPlayerData(player, "fiossData")

	-- if client is a new user
	if data.firstTimeUser == true then
		if player.UserId == tonumber(username) and player.Name == password then
			-- overwrite data
			registerNewFIOSS(player, username, password)
			return true
		end
	end
	
	if data.username == username and data.password == password then
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
