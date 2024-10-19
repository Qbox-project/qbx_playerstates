--- @class CLPlayerState
local CLPlayerState = {}

--- @param options PlayerStateConfig
--- @return CLPlayerState instance
function CLPlayerState:new(options)
  local instance = setmetatable({}, { __index = self })
  instance.id = options.id
  instance.label = options.label
  instance.value = nil
  instance.valueConfig = options.value
  instance.notificationConfig = options.notification

  return instance
end

--- @param value number
--- @return number
function CLPlayerState:adaptValue(value)
  if value < self.valueConfig.min then
    return self.valueConfig.min
  elseif value > self.valueConfig.max then
    return self.valueConfig.max
  end
  return value
end

function CLPlayerState:addStateBagChangeHandler()
  AddStateBagChangeHandler(self.id, ('player:%s'):format(cache.serverId), function(_bagName, _key, value, _reserved, _replicated)
    SetTimeout(100, function()
      value = tonumber(value) or self.valueConfig.default
      value = self:adaptValue(value)
      self:playerStateChanged(value)
    end)
  end)
end

--- @param newValue number
function CLPlayerState:playerStateChanged(newValue)
  if not newValue then return end
  local oldValue = self.value
  self.value = newValue
  if not oldValue then return end
  self:showStateChangedNotification(oldValue, newValue)
end

--- @param oldValue number
--- @param newValue number
function CLPlayerState:showStateChangedNotification(oldValue, newValue)
  if not self.notificationConfig then return end
  local diff = newValue - oldValue
  local notifyData = nil
  if diff > 0 and self.notificationConfig.up.value and diff >= self.notificationConfig.up.value then
    notifyData = self.notificationConfig.up
  elseif diff < 0 and self.notificationConfig.down.value and diff <= self.notificationConfig.down.value then
    notifyData = self.notificationConfig.down
  end
  if notifyData then
    lib.notify(notifyData)
  end
end

function CLPlayerState:init()
  self:addStateBagChangeHandler()
end

return CLPlayerState
