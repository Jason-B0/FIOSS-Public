local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local Rodux = require(game:GetService('ReplicatedStorage').Packages.Rodux)
local RoactSpring = require(game:GetService('ReplicatedStorage').Packages.RoactSpring)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages.RoactRodux)
local e = Roact.createElement

local Theme = script.Parent.Parent.Parent.Theme
local SideMenuButton = require(Theme.SideMenuButton)

local SpringConfig = { mass = 1, tension = 500, friction = 10, clamp = true }

local function Button(props, hooks)
	local hovered, setHovered = hooks.useState(props.hovered)
	
	local styles = RoactSpring.useSpring(hooks,{
		color = if hovered then Color3.fromRGB(33, 160, 166) else Color3.fromRGB(51, 122, 166),
		config = SpringConfig,
	})
		
    return e(SideMenuButton, {
		onClick = props.onClick,
		hovered = hovered,
		onHoverEnter = function()
			task.spawn(function()
				setHovered(true)
			end)
		end,
		onHoverLeave = function()
			task.spawn(function()
				setHovered(false)
			end)
		end,
		color = styles.color,
		Name = props.Name,
		Text = props.Text,
	})
end

local ThemedButton = Hooks.new(Roact)(Button)

local SideMenuComponent = function(_props)
		return e("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.fromScale(0.093, 0.53),
			Size = UDim2.fromScale(0.124, 0.373),
			ZIndex = 2,
		}, {
			announcementPage = e(ThemedButton, {
				Name = "announcementPage",
				Text = "Unit Updates",
				onClick = function()
					_props.onClick("announcementPage")
				end,
			}),
			
			profilePage = e(ThemedButton, {
				Name = "profilePage",
				Text = "Profile",
				onClick = function()
					_props.onClick("profilePage")
				end,
			}),

			labReportPage = e(ThemedButton, {
				Name = "labReportPage",
				Text = "Lab Report",
				onClick = function()
					_props.onClick("labReportPage")
				end,
			}),

			intelPage = e(ThemedButton, {
				Name = "intelPage",
				Text = "Intelligence",
				onClick = function()
					_props.onClick("intelPage")
				end,
			}),

			actionReportPage = e(ThemedButton, {
				Name = "actionReportPage",
				Text = "Action Report",
				onClick = function()
					_props.onClick("actionReportPage")
				end,
			}),

			uIListLayout = e("UIListLayout", {
				Padding = UDim.new(0.1, 10),
				SortOrder = Enum.SortOrder.Name,
			}),

			uIAspectRatioConstraint5 = e("UIAspectRatioConstraint", {
				AspectRatio = 0.652,
			}),
		})
	end

local SideMenu = RoactRodux.connect(
	function(state, props)
        return state, props
    end,
	function(dispatch)
		return {
			onClick = function(newDisplayIn)
				dispatch({
					type = "UpdateDisplay",
					newDisplay = newDisplayIn
				})
			end
		}
	end
)(SideMenuComponent)


return SideMenu
