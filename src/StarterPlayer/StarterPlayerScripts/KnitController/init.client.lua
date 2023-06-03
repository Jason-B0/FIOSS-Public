local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Packages = ReplicatedStorage.Packages
local Knit = require(Packages.Knit)

local Controllers = script

Knit.AddControllers(Controllers)

local function Logger(args: { any })
	print("KNIT CLIENT MIDDLEWARE:")
	print(args)
	return true
end

Knit.Start({
	Middleware = { 
		--Inbound = { if RunService:IsStudio() then Logger else nil },
       	--Outbound = { if RunService:IsStudio() then Logger else nil }, 
	}
})
	:andThen(function()
		print("Knit started on client side.")
	end)
	:catch(warn)
	:await()

