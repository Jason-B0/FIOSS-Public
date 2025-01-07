local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

return e("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=2045685837",
            ImageColor3 = Color3.fromRGB(100, 100, 100),
            ScaleType = "Tile",
            TileSize = UDim2.fromScale(0.1, 0.15),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        })