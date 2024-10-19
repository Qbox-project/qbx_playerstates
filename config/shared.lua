--- @type table<string, PlayerStateConfig>
local allStates = {}
allStates.stress = require 'config.states.stress'
allStates.hunger = require 'config.states.hunger'
allStates.thirst = require 'config.states.thirst'

return allStates
