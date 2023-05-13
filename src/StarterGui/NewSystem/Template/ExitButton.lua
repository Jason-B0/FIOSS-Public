local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local UIController = Knit.GetController("UIController")
local e = Roact.createElement

return function()
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.975, 0.05),
		Size = UDim2.fromScale(0.0333, 0.0596),
	}, {
		uiAspectRatioConstraint = e("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width,
		}),
		
		imageButton = e("ImageButton", {
			Image = "rbxassetid://12241605246",
			ScaleType = "Slice",
			SliceCenter = Rect.new(Vector2.new(26, 0), Vector2.new(944, 0)),
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.525, 0.48),
			Size = UDim2.fromScale(1.143, 1.138),
			[Roact.Event.Activated] = function()
				UIController:UnmountUI()
			end,
		}),

		textButton = e("TextButton", {
			FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
			Text = "X",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 40,
			TextWrapped = true,
			AutoButtonColor = false,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.8),
			ZIndex = 2,
			[Roact.Event.Activated] = function()
				UIController:UnmountUI()
			end,
		}, {
			uiTextConst = e("UITextSizeConstraint", {
				MaxTextSize = 40,
				MinTextSize = 20,	
			}),
		}),
	})
end
