local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

return function(props)
    return e("TextBox", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(51, 0, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = props.Position,
        RichText = true,
        FontFace = Font.new(
            "rbxasset://fonts/families/Inconsolata.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        Size = props.Size,
        Text = props.Text or "",
		PlaceholderText = props.PlaceholderText or "",
		PlaceholderColor3 = props.PlaceholderColor3 or Color3.fromRGB(255, 255, 255),
        TextColor3 = props.TextColor3 or Color3.fromRGB(255, 255, 255),
        TextScaled = false,
        TextSize = props.TextSize or 20,
        TextWrapped = true,
        TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center,
        TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center,
        ZIndex = 2,
    })
end