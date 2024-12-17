--- @class CLStateManager
local CLStateManager = require 'modules.statemanager.client'

local stateManager = CLStateManager:new()
stateManager:init()

local function addToState(stateId, value)
  return lib.callback.await('qbx_playerstates:server:addToState', false, stateId, value)
end
exports('AddToState', addToState)

local function clearState(stateId)
  return lib.callback.await('qbx_playerstates:server:clearState', false, stateId)
end
exports('ClearState', clearState)

local function clearAllStates()
  return lib.callback.await('qbx_playerstates:server:clearAllStates', false)
end
exports('ClearAllStates', clearAllStates)
