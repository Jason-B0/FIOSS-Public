local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local Rodux = require(game:GetService('ReplicatedStorage').Packages.Rodux)
local RoactRodux = require(game:GetService('ReplicatedStorage').Packages.RoactRodux)
local e = Roact.createElement

local function Template(props, hooks)

    return e("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = props.Position or UDim2.fromScale(0.5, 0.5),
        Size = props.Size or UDim2.fromScale(0.5, 0.5),
        ZIndex = 3,
    }, {
        button = e("ImageButton", {
            Image = "rbxassetid://12241605246",
            AutoButtonColor = false,
            Active = true,
            ScaleType = "Fit",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.515, 0.455),
            Size = UDim2.fromScale(1.03, 1.09),
            ZIndex = 5,
            [Roact.Event.Activated] = if props.onClick ~= nil then props.onClick else function()
                print("Clicked")
            end,
            
        }),
        
        textLabel = e("TextLabel", {
            FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json"),
            Text = props.Text or "Action",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 20,
            TextScaled = true,
            TextWrapped = true,
            Active = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            ZIndex = 5,
            
        }, {
            uiTextConst = e("UITextSizeConstraint", {
                MaxTextSize = 20,
                MinTextSize = 10,
            }),
        }),

        uIAspectRatioConstraint = e("UIAspectRatioConstraint", {
            AspectRatio = 2.74,
        }),
        
    })

end

return Hooks.new(Roact)(Template)
