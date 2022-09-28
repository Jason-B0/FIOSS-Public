local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local RoactRodux = require(game:GetService("ReplicatedStorage").Packages.RoactRodux)
local e = Roact.createElement

local Store = require(script.Parent.Parent.Parent.Store)

local function HomePageComponent(props)
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(142, 101, 21),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(142, 101, 21),
		BorderMode = Enum.BorderMode.Inset,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.545),
		Size = UDim2.fromScale(1, 0.91),
	}, {
        avatar = e(require(script.Avatar)),
        content = require(script.Content),
		sideMenu = e(require(script.SideMenu)),
    })
end

return HomePageComponent
