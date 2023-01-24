--[[
    Jas_nRuski
    
    This is what appears on the UI as:
    AA 123. 4567
    
    This should be a component updating itself independent from any stores, components, etc.
]]

local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

export type Props = {
    abbreviation: string,
}

local function updateSequence(abbreviation: string): string -- abbreviation should be two capital letters such as AB
    local firstSequence = math.random(001,999)
    firstSequence = string.format("%02d", firstSequence)
    
    local secondSequence = math.random(1000,9999)
    return abbreviation .. "\t" .. firstSequence .. ". " .. secondSequence
end

local SequentialText = Roact.Component:extend("SequentialText")

function SequentialText:init(props: Props)
    self.props = props
    self.state = {
        sequence = "AA\t123. 4567"
    }
end

function SequentialText:render()
    return e("TextLabel", {
        FontFace = Font.new(
            "rbxasset://fonts/families/Inconsolata.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        RichText = true,
        Text = self.state.sequence,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        TextWrapped = true,
        TextXAlignment = "Left",
        TextYAlignment = "Top",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.035),
        Size = UDim2.fromScale(1, 0.07),
    })
end

function SequentialText:didMount()
    local newSequence = updateSequence(self.props.abbreviation)
    
    self:setState({
        sequence = newSequence
    })
end

return SequentialText