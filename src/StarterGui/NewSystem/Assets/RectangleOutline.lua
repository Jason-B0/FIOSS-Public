local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement

return e(
        "ImageLabel", {
            Image = "rbxassetid://12241945911",
            ScaleType = "Slice",
            SliceCenter = Rect.new(450, 450, 574, 573),
            TileSize = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1.05)
            
        }, {

            uIAspectRatioConstraint = e(
                "UIAspectRatioConstraint",{AspectRatio = 4.735}
            )
                
        }
    )
