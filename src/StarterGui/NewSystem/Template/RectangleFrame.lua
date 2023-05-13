local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

return function(props)
    return e("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(51, 0, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = props.Position,
        Size = props.Size, -- aspect ratio governed by constraint no matter what
    },props[Roact.Children])
    
end