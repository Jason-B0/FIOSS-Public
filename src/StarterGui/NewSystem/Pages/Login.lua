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
        position = UDim2.fromScale(0.215, 0.08),
        size = UDim2.fromScale(0.274, 0.0985),
    }, {
        --[[
            UPDATE AS PER 21:28, 01-23-2023
            
            I had to go to bed, here's what's up:
            
                - The parent frame miscInformation loads successfully, but none of the children
                  render. I'm not sure why, but I'm going to try to figure it out.
                - I am hypothesizing that it is a React/Roact limitation, or I have to put the children
                  into fragments.
                - I'm going to try to figure out how to do that and release the login page.
        
        ]]
        aspectRatioConstraint = f(e("UIAspectRatioConstraint", {
            AspectRatio = 4.99
        })),
        --[[
        rectangleOutline = require(script.Parent.Parent.Assets.RectangleOutline),
        
        
        systemStatus = f(require(Template.TextLabel), {
            Text = "ONLINE<br/>SYS..OK",
            TextColor3 = Color3.fromRGB(255, 150, 4),
            Position = UDim2.fromScale(0.14, 0.305),
            Size = UDim2.fromScale(0.227, 0.431),
            TextXAlignment = "Left",
        }),
        
        fakeIP = e(require(Template.TextLabel), {
            Text = "207.606.1.2345",
            Position = UDim2.fromScale(0.171, 0.732),
            Size = UDim2.fromScale(0.291, 0.431),
            TextXAlignment = "Left",
        }),
        
        fakeDNSInfo = e(require(Template.TextLabel), {
            Text = "DNSA: CHENEY RES",
            Position = UDim2.fromScale(0.662, 0.305),
            Size = UDim2.fromScale(0.618, 0.431),
            TextXAlignment = "Left",
        }),
        
        detachmentInfo = e(require(Template.TextLabel), {
            Text = "DET. THETA - 09 || UNIT 31",
            Position = UDim2.fromScale(0.662, 0.691),
            Size = UDim2.fromScale(0.618, 0.431),
            TextXAlignment = "Left",
        }),
            
        ]]
        
    })
})
