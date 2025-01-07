local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

return function(props)
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(51, 0, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = props.Position or UDim2.fromScale(0.045, 0.08),
		Size = props.Size or UDim2.fromScale(0.0558, 0.1),
	}, {
		imageLabel = e("ImageLabel", {
			Image = "rbxassetid://12241909812",
			ScaleType = "Fit",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.47, 0.47),
			Size = UDim2.fromScale(1.11, 1.11),
		}, {
			uIAspectRatioConstraint = e("UIAspectRatioConstraint"),
		}),

		uIAspectRatioConstraint1 = e("UIAspectRatioConstraint"),

		textLabel = e("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/Arial.json"),
			Text = props.Text or "NA",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 40,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.8),
			ZIndex = 3,
		}),
		
		uiTextConst = e("UITextSizeConstraint", {
			MaxTextSize = 40,
			MinTextSize = 20,
		}),
	})
end
