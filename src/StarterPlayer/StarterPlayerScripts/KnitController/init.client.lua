local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Knit = require(Packages.Knit)

local Controllers = script

Knit.AddControllers(Controllers)

Knit.Start()
	:andThen(function()
		print("Knit started on client side.")
	end)
	:catch(warn)

