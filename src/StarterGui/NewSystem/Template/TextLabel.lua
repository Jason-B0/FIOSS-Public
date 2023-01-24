local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

export type Props = {
    position: UDim2,
    size: UDim2,
    text: string,
    textColor: Color3?,
    textSize: number?,
    textXAlignment: Enum.TextXAlignment?,
    textYAlignment: Enum.TextYAlignment?,
}

return function(props: Props)
    return e("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(51, 0, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = props.position,
        RichText = true,
        FontFace = "Inconsolata",
        Size = props.size,
        Text = props.text,
        TextColor3 = props.textColor or Color3.fromRGB(255, 255, 255),
        TextScaled = false,
        TextSize = props.textSize or 20,
        TextWrapped = true,
        TextXAlignment = props.textXAlignment or Enum.TextXAlignment.Center,
        TextYAlignment = props.textYAlignment or Enum.TextYAlignment.Center,
        ZIndex = 2,
    })
end