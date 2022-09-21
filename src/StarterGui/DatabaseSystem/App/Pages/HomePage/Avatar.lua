local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Hooks = require(game:GetService("ReplicatedStorage").Packages.Hooks)
local Rodux = require(game:GetService("ReplicatedStorage").Packages.Rodux)
local RoactRodux = require(game:GetService("ReplicatedStorage").Packages.RoactRodux)
local e = Roact.createElement

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Avatar = Roact.Component:extend("Avatar")

function Avatar:init()
	self:setState({
		isReady = false,
		content = nil,
	})
end

function Avatar:render()
	return e("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(142, 0, 0),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(142, 101, 21),
		BorderMode = Enum.BorderMode.Inset,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Position = UDim2.fromScale(0.0932, 0.166),
		Size = UDim2.fromScale(0.124, 0.266),
		ZIndex = 2,
	}, {
		background = e("ImageLabel", {
			Image = "rbxassetid://10925984822",
			ImageColor3 = Color3.fromRGB(223, 156, 32),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
		}),

		background1 = e("ImageLabel", {
			Image = "rbxassetid://10925972242",
			ImageColor3 = Color3.fromRGB(24, 26, 32),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.95, 0.95),
			ClipsDescendants = true,
		}, {
			avatar = e("ImageLabel", {
				Image = (self.state.isReady and self.state.content) or "rbxassetid://0",
				ImageColor3 = Color3.fromRGB(139, 139, 139),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(.8,.8),
				ZIndex = 3,
			}),
		}),
	})
end

function Avatar:didMount()
	task.spawn(function()
		local _content, _isReady = Players:GetUserThumbnailAsync(
			LocalPlayer.UserId,
			Enum.ThumbnailType.HeadShot,
			Enum.ThumbnailSize.Size420x420
		)
		self:setState({
			isReady = _isReady,
			content = _content,
		})
	end)
end

return Avatar