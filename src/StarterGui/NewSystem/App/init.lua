local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.Roact)

---==================================
local DatabaseSystem = Roact.Component:extend("DatabaseSystem")
local e = Roact.createElement

function DatabaseSystem:init()
	print("DB System Initiated")
end

function DatabaseSystem:render()
    return e("ScreenGui", {
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			ResetOnSpawn = false
		}, {
            pages = e(require(script.Parent.Pages))
        })
end

---==================================

return DatabaseSystem