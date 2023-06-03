--[[
    Jas_nRuski
    
    This textlabel has a typewriter effect applied to it
    
    This should be a Component updating itself independent from any stores, components, etc.
]]

local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local e = Roact.createElement


function Template(props, hooks)
    local textLength = utf8.len(props.Text)
    local count, setCount = hooks.useState(0)
    
    if props.delayTime ~= nil and props.delayTime > 0 then
        task.wait(props.delayTime)
    end
    
    hooks.useEffect(function()
        if count < textLength then         
            task.spawn(function()
                task.wait(0.05)
                setCount(count + 1)
            end)
        end
    end)
    
    return e("TextLabel", {
        FontFace = Font.new(
            "rbxasset://fonts/families/Inconsolata.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        
        MaxVisibleGraphemes = count,
        
        RichText = true,
        Text = props.Text,
        TextColor3 = props.TextColor3 or Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        TextScaled = true,
        TextXAlignment = "Left",
        TextYAlignment = "Top",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = props.Position or UDim2.fromScale(0.5, 0.035),
        Size = props.Size or UDim2.fromScale(1, 0.07),
        ZIndex = 3,
    }, {
        uiTextConst = e("UITextSizeConstraint", {
            MaxTextSize = 20,
            MinTextSize = 10,
        }),
    })
end


return Hooks.new(Roact)(Template)