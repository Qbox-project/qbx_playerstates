--- @type table<string, PlayerStateConfig>
local allStates = {}
-- numeric
allStates.stress = require 'config.states.stress'
allStates.hunger = require 'config.states.hunger'
allStates.thirst = require 'config.states.thirst'
allStates.painkiller = require 'config.states.painkiller'

-- boolean
allStates.dead = require 'config.states.dead'
allStates.cuff = require 'config.states.cuff'

-- custom
allStates.escort = require 'config.states.escort'
allStates.escorted = require 'config.states.escorted'
allStates.carry = require 'config.states.carry'
allStates.carried = require 'config.states.carried'

return allStates
