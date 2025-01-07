local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Knit = require(game:GetService('ReplicatedStorage').Packages.Knit)
local FIOSS_Service	= Knit.GetService("FIOSS_Service")
local UIController = Knit.GetController("UIController")
local Template = script.Parent.Parent.Parent.Template

local e = Roact.createElement

return function(props)
	return e(require(Template.InteractiveButton), {
		Position = UDim2.fromScale(0.5, 0.7),
    	Size = UDim2.fromScale(0.0745, 0.0488),
		Text = "LOGIN",
		
		onClick = function()
			FIOSS_Service:RequestLogin(props.Username, props.Password):andThen(function(response)
				if response == true then
					UIController:SwitchToPage("home")
				end
			end)
		end,
		
	})
end
