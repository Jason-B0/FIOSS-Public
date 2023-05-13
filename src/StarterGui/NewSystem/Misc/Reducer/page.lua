local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Rodux = require(ReplicatedStorage.Packages.Rodux)
local actions = require(script.Parent.Parent.actions)

local SET_PAGE = actions.SET_PAGE
local GO_HOME = actions.GO_HOME

export type State = string

return Rodux.createReducer("", {
	[SET_PAGE] = function(_, action)
		return action.payload
	end,

	[GO_HOME] = function()
		return ""
	end,
})
