local Players = game:GetService("Players")
local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local RoactRodux = require(game:GetService("ReplicatedStorage").Packages.RoactRodux)
local RoactSpring = require(game:GetService("ReplicatedStorage").Packages.RoactSpring)

local e = Roact.createElement
local inUsernameRef = Roact.createRef()
local inPasswordRef = Roact.createRef()

local LoginPageComponent = Roact.Component:extend("LoginPageComponent")


function LoginPageComponent:init(props)
	self.props.onClick = props.onClick
	self.props.success = props.success
	
	self.styles, self.api = RoactSpring.Controller.new({
		size = UDim2.fromScale(0, 0),
	})
end

function LoginPageComponent:render()
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(142, 101, 21),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(142, 101, 21),
		BorderMode = Enum.BorderMode.Inset,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.fromScale(0.5, 0.55),
		Size = if self.props.success == false then self.styles.size else UDim2.fromScale(0.3,0.7),
	}, {
		inputUsername = e("TextBox", {
			[Roact.Ref] = inUsernameRef,
			FontFace = Font.new(
				"rbxasset://fonts/families/Michroma.json",
				Enum.FontWeight.Bold,
				Enum.FontStyle.Italic
			),
			PlaceholderText = "{USERNAME}",
			ClearTextOnFocus = false,
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 30,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(16, 130, 123),
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.35),
			Size = UDim2.fromScale(0.8, 0.05),
			ZIndex = 2,
		}, {
			uITextSizeConstraint = e("UITextSizeConstraint", {
				MaxTextSize = 30,
				MinTextSize = 0,
			}),

			uIAspectRatioConstraint = e("UIAspectRatioConstraint", {
				AspectRatio = 12.2,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		inputPassword = e("TextBox", {
			[Roact.Ref] = inPasswordRef,
			FontFace = Font.new(
				"rbxasset://fonts/families/Michroma.json",
				Enum.FontWeight.Bold,
				Enum.FontStyle.Italic
			),
			PlaceholderText = "{PASSWORD}",
			ClearTextOnFocus = false,
			RichText = true,
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 30,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(16, 130, 123),
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.55),
			Size = UDim2.fromScale(0.786, 0.05),
			ZIndex = 2,
		}, {
			uITextSizeConstraint1 = e("UITextSizeConstraint", {
				MaxTextSize = 30,
				MinTextSize = 0,
			}),

			uIAspectRatioConstraint1 = e("UIAspectRatioConstraint", {
				AspectRatio = 12,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		props = e("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/Sarpanch.json"),
			Text = "USERNAME",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 40,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.276, 0.288),
			Size = UDim2.fromScale(0.347, 0.0663),
			ZIndex = 2,
		}, {
			uITextSizeConstraint2 = e("UITextSizeConstraint", {
				MaxTextSize = 40,
				MinTextSize = 0,
			}),

			uIAspectRatioConstraint2 = e("UIAspectRatioConstraint", {
				AspectRatio = 4,
				DominantAxis = Enum.DominantAxis.Height,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		props1 = e("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/Sarpanch.json"),
			Text = "PASSWORD",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextSize = 40,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.278, 0.488),
			Size = UDim2.fromScale(0.341, 0.0654),
			ZIndex = 2,
		}, {
			uITextSizeConstraint3 = e("UITextSizeConstraint", {
				MaxTextSize = 40,
				MinTextSize = 0,
			}),

			uIAspectRatioConstraint3 = e("UIAspectRatioConstraint", {
				AspectRatio = 3.98,
				DominantAxis = Enum.DominantAxis.Height,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		background = e("ImageLabel", {
			Image = "rbxassetid://10925972242",
			ImageColor3 = Color3.fromRGB(24, 26, 32),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.95, 0.95),
		}, {
			uIAspectRatioConstraint4 = e("UIAspectRatioConstraint", {
				AspectRatio = 0.763,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		background1 = e("ImageLabel", {
			Image = "rbxassetid://10925984822",
			ImageColor3 = Color3.fromRGB(223, 156, 32),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
		}, {
			uIAspectRatioConstraint5 = e("UIAspectRatioConstraint", {
				AspectRatio = 0.763,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		badge = e("ImageLabel", {
			Image = "rbxassetid://502403405",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.143),
			Size = UDim2.fromScale(0.25, 0.2),
			ScaleType = Enum.ScaleType.Fit,
			ZIndex = 3,
		}, {
			uIAspectRatioConstraint6 = e("UIAspectRatioConstraint", {
				AspectRatio = 1.14,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		errorMessage = e("TextLabel", {
			FontFace = Font.new("rbxasset://fonts/families/Sarpanch.json"),
			Text = self.props ~= nil and self.props.message or " ",
			TextColor3 = Color3.fromRGB(255, 0, 0),
			TextScaled = true,
			TextSize = 30,
			TextWrapped = true,
			Active = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.65),
			Size = UDim2.fromScale(0.81, 0.1),
			ZIndex = 2,
		}, {
			uITextSizeConstraint4 = e("UITextSizeConstraint", {
				MaxTextSize = 30,
				MinTextSize = 0,
			}),

			uIAspectRatioConstraint7 = e("UIAspectRatioConstraint", {
				AspectRatio = 6.18,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),

		accessButton = e("ImageButton", {
			[Roact.Event.Activated] = self.props ~= nil and self.props.onClick,
			Image = "rbxassetid://10925972242",
			ImageColor3 = Color3.fromRGB(208, 255, 96),
			ScaleType = Enum.ScaleType.Slice,
			AutoButtonColor = false,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(208, 255, 96),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.764),
			Size = UDim2.fromScale(0.347, 0.066),
			ZIndex = 3,
		}, {
			textButton = e("TextButton", {
				[Roact.Event.Activated] = self.props ~= nil and self.props.onClick,
				FontFace = Font.new(
					"rbxasset://fonts/families/Sarpanch.json",
					Enum.FontWeight.Medium,
					Enum.FontStyle.Normal
				),
				Text = "ACCESS",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextSize = 14,
				TextWrapped = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(1, 1),
				ZIndex = 2,
			}, {
				uIAspectRatioConstraint8 = e("UIAspectRatioConstraint", {
					AspectRatio = 4.01,
					DominantAxis = Enum.DominantAxis.Width,
					AspectType = Enum.AspectType.FitWithinMaxSize,
				}),
			}),

			uIAspectRatioConstraint9 = e("UIAspectRatioConstraint", {
				AspectRatio = 4.01,
				DominantAxis = Enum.DominantAxis.Width,
				AspectType = Enum.AspectType.FitWithinMaxSize,
			}),
		}),
	})
end

function LoginPageComponent:didMount(props)
	task.delay(.5,function()
		self.api:start({ 
			size = UDim2.fromScale(0.3, 0.1),
			config = { mass = 1, tension = 210, friction = 20, clamp = true, duration = .1 }
		}):andThen(function()
			self.api:start({
				size = UDim2.fromScale(0.3, 0.7),
				config = { mass = 1, tension = 210, friction = 20, clamp = true, duration = .25 }
			})
		end)
	end)
	
	if self.props.success == true then
			self.api:start({
					size = UDim2.fromScale(0.3, 0.7),
					config = { mass = 1, tension = 210, friction = 20, clamp = true, duration = .25 }
			}):andThen(function()
				self.api:start({ 
				size = UDim2.fromScale(0.3, 0.1),
				config = { mass = 1, tension = 210, friction = 20, clamp = true, duration = .1 }
			})
		end)
	end
end

local LoginPage = RoactRodux.connect(
	function(state)
        if state.auth ~= nil then
            local success = state.auth.success
            if success ~= true then
                return {
					success = false,
                    message = "[ERROR] Incorrect Username/Password"
                }
			else
				return {
					success = true,
					message = " ",
				}
            end
        end
    end,
	function(dispatch)
		return {
			onClick = function()
				dispatch({
					type = "Authenticate",
					player = Players.LocalPlayer,
					inUsername = inUsernameRef:getValue().Text,
					inPassword = inPasswordRef:getValue().Text,
				})
			end
		}
	end
)(LoginPageComponent)

return LoginPage
