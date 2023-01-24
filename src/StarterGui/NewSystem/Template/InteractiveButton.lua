local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local Rodux = require(game:GetService('ReplicatedStorage').Packages.Rodux)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages
                               .RoactRodux)
local e = Roact.createElement

local function Template(props, hooks)

    return e("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = props.position or UDim2.fromScale(0.5, 0.7),
        Size = props.size or UDim2.fromScale(0.0745, 0.0488),
    }, {
        button = e("ImageButton", {
            Image = "rbxassetid://12241605246",
            AutoButtonColor = false,
            ScaleType = "Fit",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.515, 0.455),
            Size = UDim2.fromScale(1.03, 1.09),
            
            [Roact.Event.Activated] = function()
                props.onClick(props)
            end,
            
        }),

        textButton = e("TextButton", {
            FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
            Text = props.text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 20,
            TextWrapped = true,
            AutoButtonColor = false,
            Active = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            
            [Roact.Event.Activated] = function()
                props.onClick(props)
            end,
            
        }),

        uIAspectRatioConstraint = e("UIAspectRatioConstraint", {
            AspectRatio = 2.74,
        }),
    })

end

return Hooks.new(Roact)(Template)
