--[[
    Jas_nRuski
    
    Date time component for the UI.
    
    This should be a component updating itself independent from any stores, components, etc.
]]

local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

export type Props = {
    abbreviation: string,
}


local DateTimeComponent = Roact.PureComponent:extend("DateTimeComponent")

local function updateCurrentTime(timezoneType: string)
    local dt = DateTime.now()
	local dtString
    if timezoneType == "Universal" then
        dtString = dt:FormatUniversalTime("dddd YYYY-MM-DD, HHmm:ss", "en-us")
    elseif timezoneType == "Local" then
        dtString = dt:FormatLocalTime("dddd YYYY-MM-DD, HHmm:ss", "en-us")
    end
    return dtString
end

function DateTimeComponent:init(props: Props)
    self.props = props
    self.state = {
        dt = "DD-MM-YYYY HHMM:ss"
    }
end

function DateTimeComponent:render()
    return e("TextLabel", {
        FontFace = Font.new(
            "rbxasset://fonts/families/Inconsolata.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        RichText = true,
        Text = self.state.dt,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        TextScaled = true,
        TextXAlignment = "Left",
        TextYAlignment = "Center",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = self.props.Position,
        Size = self.props.Size,
    }, {
        uiTextConst = e("UITextSizeConstraint", {
            MaxTextSize = 20,
            MinTextSize = 10,
        }),
    })
end

function DateTimeComponent:didMount()
    task.delay(1,function()
       while self.props.active do 
			local newTime = updateCurrentTime(self.props.timezoneType)
			self:setState({
                dt = newTime
            })
			task.wait(1)
       end
    end)
    
end

return DateTimeComponent