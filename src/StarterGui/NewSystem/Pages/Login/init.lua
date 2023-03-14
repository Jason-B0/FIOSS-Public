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
    
    -- INTERACTIVES
    usernameTextbox = e(require(script.usernameTextbox)),
    
    
    -- DUMMIES
    miscInformation = e(require(script.miscInformation)),
    
    propsNumber1 = e(require(script.propsNumber), {
        Position = UDim2.fromScale(0.0638, 0.466),
        Size = UDim2.fromScale(0.101, 0.43),
    }),
    
    propsNumber2 = e(require(script.propsNumber), {
        Position = UDim2.fromScale(0.17, 0.466),
        Size = UDim2.fromScale(0.101, 0.43),
    })
})
