--- @class CLAnimationManager
local CLAnimationManager = {}

function CLAnimationManager:new()
  --- @type CLAnimationManager
  local instance = setmetatable({}, { __index = self })
  instance.states = {}
  instance.currentAnimation = nil
  instance.isLoopRunning = false
  instance.props = {}
  instance:ensureLoop()
  return instance
end

--- @param stateId string
--- @param value any
--- @param animations AnimationConfig[]|nil
function CLAnimationManager:updateState(stateId, value, animations)
  if not animations then
    self.states[stateId] = nil
  else
    self.states[stateId] = {
      animations = animations,
      value = value
    }
  end
end

function CLAnimationManager:updateCurrentAnimation()
  local newCurrentAnimation = nil

  for stateId, state in pairs(self.states) do
    for _, animation in ipairs(state.animations) do
      if animation.condition(state.value) then
        newCurrentAnimation = {
          stateId = stateId,
          animation = animation
        }
        break
      end
    end
    if newCurrentAnimation then break end
  end

  if not self:isSameAnimation(self.currentAnimation, newCurrentAnimation) then
    if self.currentAnimation then
      self:clearProps()
      ClearPedTasks(cache.ped)
    end
    self.currentAnimation = newCurrentAnimation
    if self.currentAnimation then
      self:createProps()
    end
  end
end

function CLAnimationManager:createProps()
  if not self.currentAnimation then return end
  local animation = self.currentAnimation.animation
  if animation.prop then
    for _, propConfig in ipairs(animation.prop) do
      local propHandle = self:createProp(propConfig)
      if propHandle then
        table.insert(self.props, propHandle)
      end
    end
  end
end

--- @param anim1 AnimationState|nil
--- @param anim2 AnimationState|nil
function CLAnimationManager:isSameAnimation(anim1, anim2)
  if not anim1 and not anim2 then return true end
  if not anim1 or not anim2 then return false end
  local a1 = anim1.animation
  local a2 = anim2.animation
  return a1.dict == a2.dict and a1.name == a2.name
end

function CLAnimationManager:ensureLoop()
  if not self.isLoopRunning then
    self.isLoopRunning = true
    CreateThread(function()
      while self.isLoopRunning do
        self:updateCurrentAnimation()
        local animation = self.currentAnimation?.animation
        if animation then
          if not IsEntityPlayingAnim(cache.ped, animation.dict, animation.name, animation.flag) then
            lib.playAnim(cache.ped, animation.dict, animation.name, 8.0, -8.0, -1, animation.flag, 0, false, false, false)
          end
        end
        Wait(1000)
      end
      self.isLoopRunning = false
    end)
  end
end

--- @param propConfig PropConfig
--- @return number|nil propHandle
function CLAnimationManager:createProp(propConfig)
  local modelHash = joaat(propConfig.model)
  lib.requestModel(modelHash)
  local coords = GetEntityCoords(cache.ped)
  local prop = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, false)
  local timeout = 1000
  while not DoesEntityExist(prop) and timeout > 0 do
    Wait(100)
    timeout = timeout - 100
  end
  if DoesEntityExist(prop) then
    AttachEntityToEntity(
      prop,
      cache.ped,
      GetPedBoneIndex(cache.ped, propConfig.bone),
      propConfig.pos.x,
      propConfig.pos.y,
      propConfig.pos.z,
      propConfig.rot.x,
      propConfig.rot.y,
      propConfig.rot.z,
      true, true, false, true, 1, true
    )
    return prop
  end
  return nil
end

function CLAnimationManager:clearProps()
  if not self.props then return end
  for _, propHandle in ipairs(self.props) do
    DeleteEntity(propHandle)
  end
  self.props = {}
end

return CLAnimationManager
