local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Hooks = require(game:GetService("ReplicatedStorage").Packages.Hooks)
local Template = script.Parent.Parent.Template
local e = Roact.createElement

local function Main(_, hooks)
	
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BackgroundTransparency = 0.8,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.985, 0.975),
	}, {

		-- INTERACTIVES
		
		
		ExitButton = e(require(Template.ExitButton)),

		-- DUMMIES-
		identifier = e(require(Template.TwoLetterIdentifier), {
			Position = UDim2.fromScale(0.045, 0.08),
			Size = UDim2.fromScale(0.0558, 0.1),
			Text = "CU",
		}),

	})
end

return Hooks.new(Roact)(Main)
