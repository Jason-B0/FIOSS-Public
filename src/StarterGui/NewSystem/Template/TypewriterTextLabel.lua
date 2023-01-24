--[[
    Jas_nRuski
    
    This textlabel has a typewriter effect applied to it
    
    This should be a Component updating itself independent from any stores, components, etc.
]]

local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

local TyperwriterTextLabel = Roact.Component:extend("TyperwriterTextLabel")

function TyperwriterTextLabel:init(props)
    self.props = props
    self:setState({
        MaxVisibleGraphemes = 1,
    })
end

function TyperwriterTextLabel:render()
    print(self.state.MaxVisibleGraphemes)
    return e("TextLabel", {
        FontFace = Font.new(
            "rbxasset://fonts/families/Inconsolata.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        
        MaxVisibleGraphemes = self.state.MaxVisibleGraphemes,
        
        RichText = true,
        Text = self.props.Text,
        TextColor3 = self.props.TextColor3 or Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        TextWrapped = true,
        TextXAlignment = "Left",
        TextYAlignment = "Top",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = self.props.Position or UDim2.fromScale(0.5, 0.035),
        Size = self.props.Size or UDim2.fromScale(1, 0.07),
    })
end

function TyperwriterTextLabel:didMount()
    
    local length = utf8.len(self.props.Text)
    if self.state.MaxVisibleGraphemes < length then
        self:setState(function(prevState, props)
            return {
                MaxVisibleGraphemes = prevState.MaxVisibleGraphemes + 1
            }
        end)
    end   
    
end

return TyperwriterTextLabel