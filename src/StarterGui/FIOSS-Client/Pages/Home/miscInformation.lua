local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement
local Template = script.Parent.Parent.Parent.Template
local Assets = script.Parent.Parent.Parent.Assets

return function()
    return e(require(Template.RectangleFrame), {
        Position = UDim2.fromScale(0.15, 0.925),
        Size = UDim2.fromScale(0.274, 0.0985),
    }, {
        
        aspectRatioConstraint = e("UIAspectRatioConstraint", {
            AspectRatio = 4.99
        }),
        
        rectangleOutline = require(Assets.RectangleOutline),
        
        gmtDateTime = e(require(Template.DateTimeComponent), {
            active = true,
            timezoneType = "Universal",
            Position = UDim2.fromScale(0.504, 0.305),
            Size = UDim2.fromScale(0.957, 0.431),
        }),
        
        localDateTime = e(require(Template.DateTimeComponent), {
            active = true,
            timezoneType = "Local",
            Position = UDim2.fromScale(0.504, 0.733),
            Size = UDim2.fromScale(0.957, 0.431),
        })
    })

end