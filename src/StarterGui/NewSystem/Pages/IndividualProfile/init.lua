local LocalPlayer = game:GetService("Players").LocalPlayer
local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Hooks = require(game:GetService("ReplicatedStorage").Packages.Hooks)
local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)
local UIController = Knit.GetController("UIController")
local FIOSS_Service = Knit.GetService("FIOSS_Service")

local Template = script.Parent.Parent.Template
local e = Roact.createElement


return Hooks.new(Roact)(function(props, hooks)
	local acceptingInput, setAcceptingInput = hooks.useState(false)
	local refs = {
		usernameTextbox = Roact.createRef(),
		passwordTextbox = Roact.createRef(),
	}
	
	local function onInputToggleChanged(newInputState: boolean?)
		setAcceptingInput(newInputState or nil)
	end
	
	local fiossData = FIOSS_Service:RequestData(LocalPlayer)
	
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
		backButton = e(require(Template.BackButton), {
			Position = UDim2.fromScale(0.045, 0.08),
			Size = UDim2.fromScale(0.05, 0.09),
			onClick = function()
				UIController:SwitchToPage("home")
			end,
		}),

		toggleEditButton = e(require(Template.InteractiveButton), {
			Position = UDim2.fromScale(0.052, 0.721),
			Size = UDim2.fromScale(0.05, 0.09),
			Text = "Edit",
			onClick = function()
				onInputToggleChanged(if acceptingInput then false else true)
				UIController:ToggleInput(acceptingInput)
			end,
		}),

		-- FORM
		usernameInputBox = e(require(Template.InputBox), {
			Position = UDim2.fromScale(0.15, 0.225),
			Size = UDim2.fromScale(0.2, 0.1),
			PromptText = "Username",
			Text = fiossData.username,
			Ref = refs.usernameTextbox,
		}),

		passwordInputBox = e(require(Template.InputBox), {
			Position = UDim2.fromScale(0.15, 0.325),
			Size = UDim2.fromScale(0.2, 0.1),
			PromptText = "Password",
			Text = fiossData.password,
			Ref = refs.passwordTextbox,
		}),

		saveButton = e(require(Template.InteractiveButton), {
			Position = UDim2.fromScale(0.213, 0.721),
			Size = UDim2.fromScale(0.05, 0.09),
			Text = "Save",
			onClick = function()
				if acceptingInput then
					return
				end -- TODO: Add a notification
				for i, v in pairs(refs) do
					if v:getValue():FindFirstChildOfClass("TextBox").Text ~= "" then
						fiossData[i] = v:getValue():FindFirstChildOfClass("TextBox").Text
					end
				end
				print(fiossData)
				--FIOSS_Service:UpdateData(fiossData)
			end,
		}),

		ExitButton = e(require(Template.ExitButton)),

		-- DUMMIES-

		miscInformation = e(require(script.miscInformation), {
			Position = UDim2.fromScale(0.15, 0.925),
			Size = UDim2.fromScale(0.274, 0.0985),
		}),
	})
end)
