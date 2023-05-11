local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)

local Assets = script.Parent.Assets

local e = Roact.createElement

local Pages = Roact.Component:extend("Pages")

function Pages:render()
   return e("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(22, 27, 29),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        grid = require(Assets.BackgroundGrid),
        
        uIGradient = e("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.1, Color3.fromRGB(45, 50, 50)),
                ColorSequenceKeypoint.new(0.9, Color3.fromRGB(169, 188, 226)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
            }),
            Rotation = 90,
        }),
        
        container = e("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.95, 0.95),
        }, {
            background = e("ImageLabel", {
                Image = "rbxassetid://11620996726",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Stretch,
            }),
            
            --// INSERT ALL PAGES BELOW
            loginPage = require(script.Login),
            
            --// END INSERT ALL PAGES
        })
    })
end

return Pages