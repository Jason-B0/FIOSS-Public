local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local e = Roact.createElement
local f = Roact.createFragment
local Template = script.Parent.Parent.Template

return e("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = Color3.fromRGB(50, 50, 50),
    BackgroundTransparency = 0.8,
    BorderSizePixel = 0,
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromScale(0.985, 0.975)
}, {
    miscInformation = e(require(Template.RectangleFrame), {
        Position = UDim2.fromScale(0.215, 0.08),
        Size = UDim2.fromScale(0.274, 0.0985),
    }, {
        
        aspectRatioConstraint = e("UIAspectRatioConstraint", {
            AspectRatio = 4.99
        }),
        
        rectangleOutline = require(script.Parent.Parent.Assets.RectangleOutline),
        
       
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
            Text = "DNSA: CHENEY RES",
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
    }),
    
    propsNumber = e(require(script.propsNumber), {
        Position = UDim2.fromScale(0.0638, 0.466),
        Size = UDim2.fromScale(0.101, 0.43),
    })
})
