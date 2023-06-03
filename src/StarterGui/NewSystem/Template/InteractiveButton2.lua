-- Used the template of a two-letter-identifier
local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local RoactSpring = require(game:GetService('ReplicatedStorage').Packages.RoactSpring)
local e = Roact.createElement

local function Template(props, hooks)
	local ref = Roact.createRef()
	local hover, setHover = hooks.useState(false)
	local styles = RoactSpring.useSpring(hooks, {
			BackgroundTransparency = if hover then 0.5 else 1,
			BackgroundColor3 = if hover then Color3.fromRGB(255, 94, 0) else Color3.fromRGB(51, 0, 255),
			config = {
				mass = 0.1,
				tension = 500,
				friction = 20.0,
			}
		})
	
	local function onHoverEntered()
		return setHover(true)
	end
	
	local function onHoverLeft()
		return setHover(false)
	end
	
	hooks.useEffect(function()
		if hover then
			ref:getValue().hoverSound:Play()
		end
	end)
	
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = styles.BackgroundColor3,
		BackgroundTransparency = styles.BackgroundTransparency,
		BorderSizePixel = 0,
		Position = props.Position or UDim2.fromScale(0.045, 0.08),
		Size = props.Size or UDim2.fromScale(0.0558, 0.1),
		ZIndex = 3,
		[Roact.Ref] = ref,
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
            [Roact.Event.Activated] = if props.onClick ~= nil then props.onClick else function()
                print("Clicked")
            end,
			[Roact.Event.MouseEnter] = onHoverEntered,
			[Roact.Event.MouseLeave] = onHoverLeft,
		}, {
			uIAspectRatioConstraint = e("UIAspectRatioConstraint"),
		}),

		uIAspectRatioConstraint1 = e("UIAspectRatioConstraint"),

		textButton = e("TextButton", {
			FontFace = Font.new("rbxasset://fonts/families/Arial.json"),
			Text = props.Text or "Action",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 20,
			RichText = true,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
            ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.8),
            [Roact.Event.Activated] = if props.onClick ~= nil then props.onClick else function()
                print("Clicked")
            end
		}),

		uiTextConst = e("UITextSizeConstraint", {
			MaxTextSize = 20,
			MinTextSize = 10,
		}),
		
		hoverSound = e("Sound", {
			Name = "hoverSound",
			SoundId = "rbxassetid://10066942189",
			Volume = 1,
		}),
	})


end

return Hooks.new(Roact)(Template)
