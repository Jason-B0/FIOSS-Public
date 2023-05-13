-- Used the template of a two-letter-identifier
local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local Rodux = require(game:GetService('ReplicatedStorage').Packages.Rodux)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages.RoactRodux)
local e = Roact.createElement

local function Template(props, hooks)

	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(51, 0, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = props.Position or UDim2.fromScale(0.045, 0.08),
		Size = props.Size or UDim2.fromScale(0.0558, 0.1),
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
            [Roact.Event.Activated] = props.onClick or function()
                print("Clicked")
            end
		}, {
			uIAspectRatioConstraint = e("UIAspectRatioConstraint"),
		}),

		uIAspectRatioConstraint1 = e("UIAspectRatioConstraint"),

		textButton = e("TextButton", {
			FontFace = Font.new("rbxasset://fonts/families/Arial.json"),
			Text = props.Text or "Action",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 20,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
            ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.8),
            [Roact.Event.Activated] = props.onClick or function()
                print("Clicked")
            end
		}),

		uiTextConst = e("UITextSizeConstraint", {
			MaxTextSize = 20,
			MinTextSize = 10,
		}),
	})


end

return Hooks.new(Roact)(Template)