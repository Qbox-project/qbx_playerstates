--- @class SVPlayerState
local SVPlayerState = {}

--- @param options PlayerStateConfig
--- @return SVPlayerState instance
function SVPlayerState:new(options)
  local instance = setmetatable({}, { __index = self })
  instance.id = options.id
  instance.label = options.label
  instance.permanent = options.permanent
  instance.valueConfig = options.value
  instance.fields = options.fields
  instance.values = {}
  instance.isNumeric = options.value.min and options.value.max and options.value.default and true or false
  instance.decayConfig = options.decay
  return instance
end

--- @param value any
--- @return number
function SVPlayerState:validateValue(value)
  if not value or type(value) ~= 'number' then return self.valueConfig.default end
  if value < self.valueConfig.min then
    return self.valueConfig.min
  elseif value > self.valueConfig.max then
    return self.valueConfig.max
  end
  return value
end

--- @param playerSrc number
--- @param value any
--- @return boolean
function SVPlayerState:setPlayerState(playerSrc, value)
  local player = exports.qbx_core:GetPlayer(playerSrc)
  if not player then return false end
  local playerEntity = Player(playerSrc)
  if not playerEntity then return false end
  local newValue = self.isNumeric and self:validateValue(value) or value
  self.values[playerSrc] = newValue
  if playerEntity.state[self.fields.stateBag] ~= newValue then
    playerEntity.state:set(self.fields.stateBag, newValue, true)
  end
  if self.fields.metadata and newValue ~= player.Functions.GetMetaData(self.fields.metadata) then
    player.Functions.SetMetaData(self.fields.metadata, newValue)
  end
  return true
end

--- @param playerSrc number
--- @param value number
--- @return boolean
function SVPlayerState:addToPlayerState(playerSrc, value)
  if not self.isNumeric then return false end
  local playerEntity = Player(playerSrc)
  if not playerEntity then return false end
  local currentStateValue = playerEntity.state[self.fields.stateBag] or self.valueConfig.default
  local newValue = self:validateValue(currentStateValue + value)
  return self:setPlayerState(playerSrc, newValue)
end

--- @param playerSrc number
--- @return boolean
function SVPlayerState:clearPlayerState(playerSrc)
  return self:setPlayerState(playerSrc, self.valueConfig.default)
end

--- @param playerSrc number
function SVPlayerState:destroyPlayerState(playerSrc)
  local playerEntity = Player(playerSrc)
  if not playerEntity then return end
  self.values[playerSrc] = nil
  playerEntity.state:set(self.fields.stateBag, nil, true)
end

--- @param playerSrc number
function SVPlayerState:initPlayerState(playerSrc)
  local player = exports.qbx_core:GetPlayer(playerSrc)
  if not player then return end
  local playerEntity = Player(playerSrc)
  if not playerEntity then return end
  local stateValue = self.valueConfig.default
  if self.fields.metadata then
    if self.permanent then
      local metadataValue = player.Functions.GetMetaData(self.fields.metadata)
      stateValue = self.isNumeric and self:validateValue(metadataValue) or metadataValue
    end
  end
  self:setPlayerState(playerSrc, stateValue)
end

--- @param playerSrc number
--- @param newValue number
function SVPlayerState:correctValue(playerSrc, newValue)
  if self.values[playerSrc] == newValue then return end
  self:setPlayerState(playerSrc, newValue)
end

function SVPlayerState:startDecayLoop()
  if not self.decayConfig then return end
  CreateThread(function()
    while true do
      Wait(self.decayConfig.interval)
      local players = exports.qbx_core:GetQBPlayers()
      for playerSrc, _ in pairs(players) do
        self:addToPlayerState(playerSrc, self.decayConfig.value)
      end
    end
  end)
end

return SVPlayerState
