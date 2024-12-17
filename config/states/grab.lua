--- @type PlayerStateConfig
return {
  id = 'grab',
  label = 'Grab Hostage',
  fields = { stateBag = 'isGrabbing' },
  permanent = false,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-grab-up-notif',
      title = 'Hostage',
      description = 'You are grabbing a hostage',
      duration = 2000,
      icon = 'user-friends',
      iconColor = '#4CAF50',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = 1,
    },
    down = {
      id = 'state-grab-down-notif',
      title = 'Hostage',
      description = 'You stopped grabbing a hostage',
      duration = 2000,
      icon = 'user-large-slash',
      iconColor = '#C53030',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = -1,
    },
  },
  disable = {
    condition = function(value)
      return value ~= nil
    end,
    keys = { 21, 22 },
    target = true,
  },
  forcedAnimations = {
    {
      condition = function(value)
        return value ~= nil
      end,
      dict = 'amb@code_human_wander_drinking_fat@beer@male@base',
      name = 'static',
      flag = 49,
    }
  },
}
