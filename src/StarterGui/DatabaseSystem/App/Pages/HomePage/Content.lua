local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local Rodux = require(game:GetService('ReplicatedStorage').Packages.Rodux)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages.RoactRodux)
local e = Roact.createElement

return e("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(142, 0, 0),
	BackgroundTransparency = 1,
	BorderColor3 = Color3.fromRGB(142, 101, 21),
	BorderMode = Enum.BorderMode.Inset,
	BorderSizePixel = 0,
	Position = UDim2.fromScale(0.574, 0.505),
	Size = UDim2.fromScale(0.787, 0.944),
	ZIndex = 2,
}, {
	background = e("ImageLabel", {
		Image = "rbxassetid://10925972242",
		ImageColor3 = Color3.fromRGB(24, 26, 32),
		ScaleType = Enum.ScaleType.Slice,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
	}),

	scrollingFrame = e("ScrollingFrame", {
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		CanvasSize = UDim2.fromScale(0, 10),
		ScrollBarImageTransparency = 1,
		ScrollBarThickness = 0,
		VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.1, 0.5),
		Size = UDim2.fromScale(0.18, 0.97),
	}, {
		report = e("TextButton", {
			FontFace = Font.new("rbxasset://fonts/families/Sarpanch.json"),
			RichText = true,
			Text = "SomeReportButton",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 30,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 0.1),
		}),

		uIListLayout = e("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),
	}),

	frame = e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.595, 0.5),
		Size = UDim2.fromScale(0.8, 0.97),
	}, {
		background1 = e("ImageLabel", {
			Image = "rbxassetid://10925972242",
			ImageColor3 = Color3.fromRGB(47, 51, 63),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(0, 0, 660, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.497, 0.5),
			Size = UDim2.fromScale(0.994, 1),
		}),

		textLabel = e("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/Nunito.json"),
			LineHeight = 1.1,
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 29,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.48),
			Size = UDim2.fromScale(0.98, 0.89),
		}),

		frame1 = e("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.955),
			Size = UDim2.fromScale(0.25, 0.06),
		}, {
			previousPage = e("ImageButton", {
				Image = "http://www.roblox.com/asset/?id=6031091002",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.0886, 0.49),
				Size = UDim2.fromScale(0.178, 1),
			}),

			nextPage = e("ImageButton", {
				Image = "http://www.roblox.com/asset/?id=6031090994",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.909, 0.49),
				Size = UDim2.fromScale(0.178, 1),
			}),

			textLabel1 = e("TextLabel", {
				FontFace = Font.new("rbxasset://fonts/families/Sarpanch.json"),
				Text = "1 / 3",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 50,
				TextWrapped = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0.642, 1),
			}),
		}),
	}),
})
