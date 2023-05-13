local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rodux = require(ReplicatedStorage.Packages.Rodux)
local Reducer = require(script.Parent.Reducer)
export type State = Reducer.State
return Rodux.Store.new(Reducer, nil, {})
