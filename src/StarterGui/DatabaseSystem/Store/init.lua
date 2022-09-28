local Rodux = require(game:GetService('ReplicatedStorage').Packages.Rodux)

local Store = Rodux.Store.new(Rodux.combineReducers({
    
    auth = Rodux.createReducer(nil, {
        Authenticate = function(_, action)
            local player, inUsername, inPassword = action.player, action.inUsername, action.inPassword
            local loginSuccess = false
            
            if inUsername == player.Name and inPassword == tostring(player.UserId) then
                loginSuccess = true
            end
            
            return {
                success = loginSuccess
            }
        end
    }),
    
    page = Rodux.createReducer(nil, {
        UpdatePage = function(_, action)
            return action.newPage
        end
    }),
    
    display = Rodux.createReducer({}, {
        UpdateDisplay = function(_, action)
            return action.newDisplay
        end
    })
    
}), 
nil, { Rodux.loggerMiddleware }
)

return Store