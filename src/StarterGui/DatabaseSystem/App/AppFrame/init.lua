local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local e = Roact.createElement

return e("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(32, 35, 44),
	BorderSizePixel = 0,
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromScale(1, 1),
}, {
	topFrame = e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(24, 26, 32),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.04),
		Size = UDim2.fromScale(1, 0.1),
	}, {
		badge = e("ImageButton", {
			Image = "rbxassetid://9992837650",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.042, 0.57),
			Size = UDim2.fromScale(0.06, 1),
			ZIndex = 3,
		}),
	}),
})
