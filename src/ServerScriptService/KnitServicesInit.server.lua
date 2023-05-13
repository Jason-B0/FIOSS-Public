local ServerStorage = game:GetService("ServerStorage")
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local Services = ServerStorage.KnitServices

Knit.AddServices(Services)

Knit.Start()
	:andThen(function()
		print("Knit started on the server side.")
	end)
	:catch(warn)
