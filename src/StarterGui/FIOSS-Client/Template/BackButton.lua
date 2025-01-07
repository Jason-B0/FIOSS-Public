local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local e = Roact.createElement

return function(props)
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = props.Position or UDim2.fromScale(0.045, 0.25),
		Size = props.Size or UDim2.fromScale(0.05, 0.09),
		ZIndex = 3,
	}, {
		imageButton = e("ImageButton", {
			Image = "rbxassetid://12241909812",
			ScaleType = "Fit",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.47, 0.47),
			Size = UDim2.fromScale(1.11, 1.11),
            [Roact.Event.Activated] = if props.onClick ~= nil then props.onClick else function()
				warn("Should go back!")
            end
		}, {
			uIAspectRatioConstraint = e("UIAspectRatioConstraint"),
		}),

		uIAspectRatioConstraint1 = e("UIAspectRatioConstraint"),

		backIcon = e("ImageButton", {
			Image = "rbxassetid://6023426922",
			ScaleType = "Fit",
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Rotation = 180,
			ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(.7, .7),
			[Roact.Event.Activated] = if props.onClick ~= nil then props.onClick else function()
				warn("Should go back!")
			end,
		}),
	})
end
