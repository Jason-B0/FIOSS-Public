local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local RoactSpring = require(game:GetService('ReplicatedStorage').Packages.RoactSpring)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)

local e = Roact.createElement

return function(props)
    return e("ImageButton", {
        [Roact.Event.Activated] = props.onClick,
        [Roact.Event.MouseEnter] = props.onHoverEnter,
        [Roact.Event.MouseLeave] = props.onHoverLeave,
        Name = props.Name,
        Image = "rbxassetid://10925972242",
        ImageColor3 = props.color,
        ScaleType = Enum.ScaleType.Slice,
        AutoButtonColor = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(208, 255, 96),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.0932, 0.607),
        Size = UDim2.fromScale(1, 0.12),
        ZIndex = 2
    }, {
        textLabel = e("TextLabel", {
            FontFace = Font.new("rbxasset://fonts/families/Sarpanch.json",Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Text = props.Text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            TextSize = 36,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 1),
            ZIndex = 2
        }, {
            uITextSizeConstraint = e("UITextSizeConstraint", {
				MaxTextSize = 36
			})
        }),

        uIAspectRatioConstraint = e("UIAspectRatioConstraint", {
			AspectRatio = 5.44
		})
    })
end
