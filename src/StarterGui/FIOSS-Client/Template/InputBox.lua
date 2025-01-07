local TextService = game:GetService("TextService")
local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Hooks = require(game:GetService("ReplicatedStorage").Packages.Hooks)
local Knit = require(game:GetService('ReplicatedStorage').Packages.Knit)
local UIController = Knit.GetController("UIController")
local Assets = script.Parent.Parent.Assets
local e = Roact.createElement

function Template(props, hooks)
	local canEdit, setCanEdit = hooks.useState(false)
	local acceptable, setAcceptable = hooks.useState(false)
	local inputRef = Roact.createRef()
	UIController.InputToggleChanged:Connect(function(newCanEdit)
		setCanEdit(newCanEdit)
	end)
	
	local function inputValidation(input)
		local filteredTextResult
		local success, errorMessage = pcall(function()
			filteredTextResult = TextService:FilterStringAsync(input, game:GetService("Players").LocalPlayer.UserId)
		end)
		if success then
			setAcceptable(true)
		else
			setAcceptable(false)
		end
	end
	return e("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BorderSizePixel = 0,
		Position = props.Position or UDim2.fromScale(0.15, 0.225),
		Size = props.Size or UDim2.fromScale(0.2, 0.098),
		ZIndex = 3,
		[Roact.Ref] = props.Ref or nil,
	}, {
		imageLabel = require(Assets.RectangleOutline),
		
		uIAspectRatioConstraint = e("UIAspectRatioConstraint", {
			AspectRatio = 4.99,
		}),

		textLabel = e("TextLabel", {
			FontFace = Font.new(
				"rbxasset://fonts/families/Inconsolata.json",
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			),
			Text = props.PromptText or "Prompt Text",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 20,
			TextWrapped = true,
			TextXAlignment = "Left",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.504, 0.305),
			Size = UDim2.fromScale(0.957, 0.431),
			ZIndex = 2,
		}, {
			defaultTextConstraint1 = e("UITextSizeConstraint", {
				MaxTextSize = 20,
				MinTextSize = 10,
			}),
		}),

		textBox = e("TextBox", {
			Active = canEdit,
			TextEditable = canEdit,
			[Roact.Ref] = inputRef,
			[Roact.Event.ReturnPressedFromOnScreenKeyboard] = if
				canEdit == true then function()
					inputValidation(inputRef.Text)
				end else nil,
			[Roact.Event.FocusLost] = if
				canEdit == true then function()
					inputValidation(inputRef.Text)
				end else nil,
			BackgroundColor3 = Color3.fromRGB(51, 0, 255),
			--BackgroundColor3 = if acceptable then Color3.fromRGB(51, 0, 255) else Color3.fromRGB(150, 0, 0),
			BackgroundTransparency = canEdit == true and 0 or 1,
		
			CursorPosition = -1,
			FontFace = Font.new(
				"rbxasset://fonts/families/Inconsolata.json",
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			),
			ClearTextOnFocus = false,
			PlaceholderColor3 = Color3.fromRGB(255, 255, 255),
			PlaceholderText = "",
			RichText = true,
			Text = props.Text or "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 20,
			TextWrapped = true,
			TextXAlignment = "Left",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.501, 0.733),
			Size = UDim2.fromScale(0.952, 0.431),
			
		}, {
			defaultTextConstraint2 = e("UITextSizeConstraint", {
				MaxTextSize = 20,
				MinTextSize = 10,
			}),
		}),
	})
end


return Hooks.new(Roact)(Template)
