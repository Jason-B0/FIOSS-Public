local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local Services = ServerStorage.KnitServices

local function Logger(player: Player, args: { any })
	print("KNIT SERVER MIDDLEWARE:")
	print(player, args)
	return true
end

Knit.AddServices(Services)

Knit.Start({
	Middleware = { 
		--Inbound = { if RunService:IsStudio() then Logger else nil },
        --Outbound = { if RunService:IsStudio() then Logger else nil }, 
	}
})
	:andThen(function()
		print("Knit started on the server side.")
	end)
	:catch(warn)
	:await()
