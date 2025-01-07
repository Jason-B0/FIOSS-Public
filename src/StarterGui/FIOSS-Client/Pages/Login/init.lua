local Roact = require(game:GetService('ReplicatedStorage').Packages.Roact)
local Hooks = require(game:GetService('ReplicatedStorage').Packages.Hooks)
local Template = script.Parent.Parent.Template
local e = Roact.createElement

local function validateInput(inputString: string): boolean
    
    if  (inputString:len() < 3 or inputString:len() > 21) or    -- too short or too long
        (inputString:find("%c") ~= nil) or               -- any control characters
        (inputString:find("%s") ~= nil) or               -- any whitespace characters
        (inputString:find("%z") ~= nil)                  -- any null characters
    then     
       return false
    end
    return true
end

local function Main(props, hooks)
    local currentUsernameInput, setUsernameInput = hooks.useState("")
    local currentPasswordInput, setPasswordInput = hooks.useState("")
    local usernameTextboxRef = Roact.createRef()
    local passwordTextboxRef = Roact.createRef()
    
    local function setUsernameInputCallback()
        local newInput = usernameTextboxRef:getValue().Text
        if validateInput(newInput) == false then
            --TODO: show error
            return
        end
        setUsernameInput(newInput)
    end
    
    local function setPasswordInputCallback()
		local newInput = passwordTextboxRef:getValue().Text
		if validateInput(newInput) == false then
            --TODO: show error
			return
		end
        setPasswordInput(newInput)
    end
    
	return e("Frame", {
        Active = props.active,
        Visible = props.active,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BackgroundTransparency = 0.8,
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.985, 0.975),
	}, {

		-- INTERACTIVES
		usernameTextbox = e(require(script.usernameTextbox), {
            Ref = usernameTextboxRef,
            InputFinished = setUsernameInputCallback,
        }),
		passwordTextbox = e(require(script.passwordTextbox), {
            Ref = passwordTextboxRef,
            InputFinished = setPasswordInputCallback,
        }),
        loginButton = e(require(script.loginButton), {
            Username = currentUsernameInput,
            Password = currentPasswordInput,
        }),
        
        ExitButton = e(require(Template.ExitButton)),
        
		-- DUMMIES-
        identifier = e(require(Template.TwoLetterIdentifier), {
            Position = UDim2.fromScale(0.045, 0.08),
		    Size = UDim2.fromScale(0.0558, 0.1),
            Text = "AP"
        }),
        
		miscInformation = e(require(script.miscInformation)),

		propsNumber1 = e(require(script.propsNumber), {
			Position = UDim2.fromScale(0.0638, 0.466),
			Size = UDim2.fromScale(0.101, 0.43),
		}),

		propsNumber2 = e(require(script.propsNumber), {
			Position = UDim2.fromScale(0.17, 0.466),
			Size = UDim2.fromScale(0.101, 0.43),
		}),
	})
    
end

return Hooks.new(Roact)(Main)