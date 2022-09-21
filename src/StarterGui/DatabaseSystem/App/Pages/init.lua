local Roact = require(game:GetService("ReplicatedStorage").Packages.Roact)
local Hooks = require(game:GetService("ReplicatedStorage").Packages.Hooks)
local Rodux = require(game:GetService("ReplicatedStorage").Packages.Rodux)
local RoactRodux = require(game:GetService("ReplicatedStorage").Packages.RoactRodux)
local e = Roact.createElement

local PageComponent = Roact.Component:extend("PageComponent")

function PageComponent:render(props)
	props = self.props
	return
        if props.page == "Home" then 
            e(require(script.HomePage))
            
        else
            e(require(script.LoginPage))
    
end

local Page = RoactRodux.connect(function(state)
	if state.page ~= nil then
		return {
			page = state.page.newPage,
		}
    end
    
    if state.auth ~= nil then
		if state.auth.success == true then
			return {
				page = "Home",
			}
        end
    end
    
end)(PageComponent)

return Page
