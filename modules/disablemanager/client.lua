--- @alias FeatureKey 'inventory' | 'radialMenu' | 'target' | 'emotes' | 'radio' | 'phone'

--- @class CLDisableManager
local CLDisableManager = {}

function CLDisableManager:new()
  --- @type CLDisableManager
  local instance = setmetatable({}, { __index = self })
  instance.stateDisables = {}
  instance.loopRunning = false
  instance.activeDisabledKeys = {}
  instance.totalDisabledKeys = 0
  return instance
end

--- @param feature FeatureKey
--- @return boolean
function CLDisableManager:isFeatureDisabled(feature)
  for _, stateData in pairs(self.stateDisables) do
    if stateData[feature] then
      return true
    end
  end
  return false
end

--- @param key number
--- @return boolean
function CLDisableManager:isKeyDisabled(key)
  for _, stateData in pairs(self.stateDisables) do
    if stateData.keys and stateData.keys[key] then
      return true
    end
  end
  return false
end

--- @param stateId string
function CLDisableManager:removeDisable(stateId)
  local stateData = self.stateDisables[stateId]
  if stateData then
    if stateData.keys then
      for key in pairs(stateData.keys) do
        self.activeDisabledKeys[key] = self.activeDisabledKeys[key] - 1
        if self.activeDisabledKeys[key] == 0 then
          self.activeDisabledKeys[key] = nil
          self.totalDisabledKeys = self.totalDisabledKeys - 1
        end
      end
    end

    self.stateDisables[stateId] = nil
    self:updateDisableStates()
  end
end

--- @param stateId string
--- @param config DisableConfig
function CLDisableManager:applyDisable(stateId, config)
  self:removeDisable(stateId)
  self.stateDisables[stateId] = {}

  if config.inventory then self.stateDisables[stateId].inventory = true end
  if config.radialMenu then self.stateDisables[stateId].radialMenu = true end
  if config.target then self.stateDisables[stateId].target = true end
  if config.emotes then self.stateDisables[stateId].emotes = true end
  if config.radio then self.stateDisables[stateId].radio = true end
  if config.phone then self.stateDisables[stateId].phone = true end

  if config.keys then
    self.stateDisables[stateId].keys = {}
    for _, key in ipairs(config.keys) do
      self.stateDisables[stateId].keys[key] = true
      self.activeDisabledKeys[key] = (self.activeDisabledKeys[key] or 0) + 1
      if self.activeDisabledKeys[key] == 1 then
        self.totalDisabledKeys = self.totalDisabledKeys + 1
      end
    end
  end

  self:updateDisableStates()
  self:ensureKeyLoop()
end

function CLDisableManager:updateDisableStates()
  --- @type FeatureKey[]
  local features = {'inventory', 'radialMenu', 'target', 'emotes', 'radio', 'phone'}
  for _, feature in ipairs(features) do
    local shouldBeDisabled = self:isFeatureDisabled(feature)
    self:toggleFeature(feature, shouldBeDisabled)
  end
end

function CLDisableManager:ensureKeyLoop()
  if not self.loopRunning and self.totalDisabledKeys > 0 then
    self.loopRunning = true
    CreateThread(function()
      while self.totalDisabledKeys > 0 do
        for key in pairs(self.activeDisabledKeys) do
          DisableControlAction(0, key, true)
        end
        Wait(0)
      end
      self.loopRunning = false
    end)
  end
end

--- @param feature FeatureKey
--- @param shouldDisable boolean
function CLDisableManager:toggleFeature(feature, shouldDisable)
  if feature == 'inventory' then
    self:toggleInventory(shouldDisable)
  elseif feature == 'radialMenu' then
    self:toggleRadialMenu(shouldDisable)
  elseif feature == 'target' then
    self:toggleTarget(shouldDisable)
  elseif feature == 'emotes' then
    self:toggleEmotes(shouldDisable)
  elseif feature == 'radio' then
    self:toggleRadio(shouldDisable)
  elseif feature == 'phone' then
    self:togglePhone(shouldDisable)
  end
end

--- @param shouldDisable boolean
function CLDisableManager:toggleInventory(shouldDisable)
  if shouldDisable then
    if LocalPlayer.state.invOpen then
      exports.ox_inventory:closeInventory()
    end
  end
  LocalPlayer.state.invBusy = shouldDisable
end

--- @param shouldDisable boolean
function CLDisableManager:toggleRadialMenu(shouldDisable)
  lib.disableRadial(shouldDisable)
end

--- @param shouldDisable boolean
function CLDisableManager:toggleTarget(shouldDisable)
  exports.ox_target:disableTargeting(shouldDisable)
end

--- @param shouldDisable boolean
function CLDisableManager:toggleEmotes(shouldDisable)
  exports.scully_emotemenu:setLimitation(shouldDisable)
end

--- @param shouldDisable boolean
function CLDisableManager:toggleRadio(shouldDisable)
  -- if shouldDisable then
  --   -- leave radio channel
  --   -- exports.qbx_radio:leaveRadio()
  -- end
  LocalPlayer.state.disableRadio = shouldDisable and 1 or 0
end

--- @param shouldDisable boolean
function CLDisableManager:togglePhone(shouldDisable)
  exports.npwd:setPhoneDisabled(shouldDisable)
end

return CLDisableManager
