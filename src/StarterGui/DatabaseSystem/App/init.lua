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
            exitButton = e("ImageButton", {
                [Roact.Event.Activated] = function()
                    game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChildOfClass("BindableEvent"):Fire()
                end,
                Image = "rbxassetid://7072725299",
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0.975, 0.0492),
                Size = UDim2.fromScale(0.02, 0.03),
                ZIndex = 20,
            }),
			appFrame    = require(script.AppFrame),
            pageController   = e(RoactRodux.StoreProvider, {
                store = require(script.Parent.Store)
            }, {
                pages = e(require(script.Pages))
            })
    })
end

---==================================

return DatabaseSystem