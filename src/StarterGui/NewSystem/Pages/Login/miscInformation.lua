local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement
local Template = script.Parent.Parent.Parent.Template
local Assets = script.Parent.Parent.Parent.Assets

return function()
    return e(require(Template.RectangleFrame), {
        Position = UDim2.fromScale(0.215, 0.08),
        Size = UDim2.fromScale(0.274, 0.0985),
    }, {
        
        aspectRatioConstraint = e("UIAspectRatioConstraint", {
            AspectRatio = 4.99
        }),
        
        rectangleOutline = require(Assets.RectangleOutline),
        
       
        systemStatus = e(require(Template.TypewriterTextLabel), {
            Text = "ONLINE<br/>SYS..OK",
            TextColor3 = Color3.fromRGB(255, 150, 4),
            Position = UDim2.fromScale(0.14, 0.305),
            Size = UDim2.fromScale(0.227, 0.431),
            TextXAlignment = "Left",
        }),
        
        fakeIP = e(require(Template.TypewriterTextLabel), {
            Text = "207.606.1.2345",
            Position = UDim2.fromScale(0.171, 0.732),
            Size = UDim2.fromScale(0.291, 0.431),
            TextXAlignment = "Left",
        }),
        
        fakeDNSInfo = e(require(Template.TypewriterTextLabel), {
            Text = "DSNET-2  DNSA: CHENEY RES",
            Position = UDim2.fromScale(0.662, 0.305),
            Size = UDim2.fromScale(0.618, 0.431),
            TextXAlignment = "Left",
        }),
        
        detachmentInfo = e(require(Template.TypewriterTextLabel), {
            Text = "DET. THETA - 09 || UNIT 31",
            Position = UDim2.fromScale(0.662, 0.691),
            Size = UDim2.fromScale(0.618, 0.431),
            TextXAlignment = "Left",
        }),
    })

end