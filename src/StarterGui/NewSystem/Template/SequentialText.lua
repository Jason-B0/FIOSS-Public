--[[
    Jas_nRuski
    
    This is what appears on the UI as:
    AA 123. 4567
    
    This should be a component updating itself independent from any stores, components, etc.
]]

local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local e = Roact.createElement

export type Props = {
    abbreviation: string,
}

local function updateSequence(abbreviation: string): string -- abbreviation should be two capital letters such as AB
    local firstSequence = math.random(001,999)
    firstSequence = string.format("%03d", firstSequence)
    
    if string.sub(firstSequence,1,1) == "0" then -- if the first digit is 0, replace it with a space
        firstSequence = string.gsub(firstSequence, "0", " ",1)
    end
    
    if string.sub(firstSequence,2,2) == "0" and string.sub(firstSequence,1,1) == " " then -- if the second digit is 0 and first digit is a space, replace it with a space
        firstSequence = string.gsub(firstSequence, "0", " ",1)
    end
    
    local secondSequence = math.random(1000,9999)
    
    return abbreviation .. "  " .. firstSequence .. ". " .. secondSequence
end

local SequentialText = Roact.PureComponent:extend("SequentialText")

function SequentialText:init(props: Props)
    self.props = props
    self.state = {
        sequence = "AA  123. 4567"
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
    task.delay(math.random(0.1, 0.3), function()
        while self.props.active do
            task.wait(.5)
            local newSequence = updateSequence(self.props.abbreviation)
            self:setState({
                sequence = newSequence
            })
        end
    end)
    
end

return SequentialText