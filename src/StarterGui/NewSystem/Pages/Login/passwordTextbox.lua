local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)

local Template = script.Parent.Parent.Parent.Template
local Assets = script.Parent.Parent.Parent.Assets

local e = Roact.createElement

return function(props)
	return e(require(Template.RectangleFrame), {
		Position = UDim2.fromScale(0.5, 0.55),
		Size = UDim2.fromScale(0.274, 0.0985),
	}, {
		outline = require(Assets.RectangleOutline),
		
		textLabel = e(require(Template.TextLabel), {
			Text = "PASSWORD:",
			TextColor3 = Color3.fromRGB(255, 150, 4),
			TextSize = 20,
			TextXAlignment = "Left",
			Position = UDim2.fromScale(0.208, 0.498),
			Size = UDim2.fromScale(0.227, 0.431),
		}),

		uIAspectRatioConstraint = e("UIAspectRatioConstraint", {
			AspectRatio = 4.99,
		}),

		textBox = e(require(Template.TextBox), {
			Ref = props.Ref or nil,
			InputFinished = props.InputFinished or nil,
			TextXAlignment = "Left",
			Position = UDim2.fromScale(0.612, 0.498),
			Size = UDim2.fromScale(0.584, 0.431),
		})
		
	})
end