local config = require 'config.client'

---@type table<string, integer>
local states = {}

---Sets a boolean state. Runs its onSet function if the state is not previously set and the onSet function exists in config
---@param name string
---@return boolean firstSetter true if the state had not previously been set
local function setState(name)
    if not states[name] then
        if config.states[name]?.onSet then
            config.states[name].onSet()
        end
        states[name] = 1
        return true
    else
        states[name] += 1
        return false
    end
end

---Releases a boolean state. Runs its onRelease function if this is the last call to release the state and the release function exists in config.
---@param name string
---@return boolean lastReleaser true if the state is fully released after this function
local function releaseState(name)
    if not states[name] then states[name] = 0 end
    if states[name] <= 1 then
        states[name] = nil
        if config.states[name]?.onRelease() then
            config.states[name].onRelease()
        end
        return true
    else
        states[name] -= 1
        return false
    end
end

exports('SetState', setState)
exports('ReleaseState', releaseState)