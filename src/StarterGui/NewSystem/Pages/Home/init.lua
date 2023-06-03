local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Hooks = require(game:GetService("ReplicatedStorage").Packages.Hooks)
local Knit = require(game:GetService('ReplicatedStorage').Packages.Knit)
local UIController = Knit.GetController("UIController")
local Template = script.Parent.Parent.Template
local e = Roact.createElement

local function Main(props, hooks)
	return e("Frame", {
		Active = props.active,
        Visible = props.active,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BackgroundTransparency = 0.8,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.985, 0.975),
	}, {

		-- INTERACTIVES
		pageActionReport = e(require(Template.InteractiveButton2), {
			Position = UDim2.fromScale(0.045, 0.25),
			Size = UDim2.fromScale(0.05, 0.0899),
			Text = "ACT<br/>REP",
		}),
		
		pageIntel = e(require(Template.InteractiveButton2), {
			Position = UDim2.fromScale(0.045, 0.375),
			Size = UDim2.fromScale(0.05, 0.0899),
			Text = "INTEL",
		}),
		
		pageDataEnt = e(require(Template.InteractiveButton2), {
			Position = UDim2.fromScale(0.045, 0.5),
			Size = UDim2.fromScale(0.05, 0.0899),
			Text = "DATA<br/>ENT",
		}),
		
		pageIndividualProfileEdit = e(require(Template.InteractiveButton2), {
			Position = UDim2.fromScale(0.045, 0.625),
			Size = UDim2.fromScale(0.05, 0.0899),
			Text = "IND<br/>PROF",
			onClick = function()
				UIController:SwitchToPage("individualProfile")
			end,
		}),
		
		pageAdminMgmt = e(require(Template.InteractiveButton2), {
			Position = UDim2.fromScale(0.045, 0.75),
			Size = UDim2.fromScale(0.05, 0.0899),
			Text = "CMD<br/>MGMT",
		}),
		
		ExitButton = e(require(Template.ExitButton)),

		-- DUMMIES-
		identifier = e(require(Template.TwoLetterIdentifier), {
			Position = UDim2.fromScale(0.045, 0.08),
			Size = UDim2.fromScale(0.0558, 0.1),
			Text = "CU",
		}),
		
		propsNumber1 = e(require(script.propsNumber), {
			Position = UDim2.fromScale(0.75, 0.466),
			Size = UDim2.fromScale(0.101, 0.43),
		}),

		propsNumber2 = e(require(script.propsNumber), {
			Position = UDim2.fromScale(0.9, 0.466),
			Size = UDim2.fromScale(0.101, 0.43),
		}),
		
		miscInformation = e(require(script.miscInformation), {
			Position = UDim2.fromScale(0.15, 0.925),
			Size = UDim2.fromScale(0.274, 0.0985),
		}),
	})
end

return Hooks.new(Roact)(Main)
