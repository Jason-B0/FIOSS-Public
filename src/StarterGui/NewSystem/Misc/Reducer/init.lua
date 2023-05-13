local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Rodux = require(ReplicatedStorage.Packages.Rodux)

local page = require(script.page)

export type State = {
	page: page.State,
}

return Rodux.combineReducers({
	page = page,
})
