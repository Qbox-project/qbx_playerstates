--- @type table<string, PlayerStateConfig>
local allStates = {}
-- numeric
allStates.stress = require 'config.states.stress'
allStates.hunger = require 'config.states.hunger'
allStates.thirst = require 'config.states.thirst'
allStates.thc = require 'config.states.thc'
allStates.alcohol = require 'config.states.alcohol'
allStates.painkiller = require 'config.states.painkiller'

-- boolean
allStates.dead = require 'config.states.dead'
allStates.grab = require 'config.states.grab'
allStates.cuff = require 'config.states.cuff'
allStates.ziptie = require 'config.states.ziptie'

-- custom
allStates.escort = require 'config.states.escort'
allStates.escorted = require 'config.states.escorted'
allStates.carry = require 'config.states.carry'
allStates.carried = require 'config.states.carried'

return allStates
