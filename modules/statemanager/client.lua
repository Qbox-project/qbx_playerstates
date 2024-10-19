local sharedConf = require 'config.shared'

--- @class CLPlayerState
local CLPlayerState = require 'modules.playerstate.client'

--- @class CLStateManager
local CLStateManager = {}

--- @return CLStateManager instance
function CLStateManager:new()
  local instance = setmetatable({}, { __index = self })
  instance.states = {}
  return instance
end

--- @param stateConfig PlayerStateConfig
function CLStateManager:initState(stateConfig)
  if self.states[stateConfig.id] then
    print("State with id " .. stateConfig.id .. " already exists")
    return
  end
  self.states[stateConfig.id] = CLPlayerState:new(stateConfig)
  self.states[stateConfig.id]:init()
end

function CLStateManager:init()
  for _, stateConf in pairs(sharedConf) do
    self:initState(stateConf)
  end
end

return CLStateManager
