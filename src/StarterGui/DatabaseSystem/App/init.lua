local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)
local Rodux = require(ReplicatedStorage.Packages.Rodux)
local RoactRodux = require(ReplicatedStorage.Packages.RoactRodux)

local e = Roact.createElement

---==================================
local DatabaseSystem = Roact.Component:extend("DatabaseSystem")

function DatabaseSystem:init()
	print("DB System Initiated")
end

function DatabaseSystem:render()
    return e("ScreenGui", {
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ResetOnSpawn = false
		}, {
			appFrame    = require(script.AppFrame),
            pageController   = e(RoactRodux.StoreProvider, {
                store = require(script.Parent.Store)
            }, {
                pages = e(require(script.Pages))
                --loginPage = e(require(script.LoginPage))
            })
    })
end

---==================================

return DatabaseSystem