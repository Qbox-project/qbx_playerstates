--- @type PlayerStateConfig
return {
  id = 'carried',
  label = 'Carried',
  fields = { stateBag = 'carriedBy' },
  permanent = false,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-carried-up-notif',
      title = 'Carried',
      description = 'You are being carried',
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
      id = 'state-carried-down-notif',
      title = 'Carried',
      description = 'You are no longer being carried',
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
      return value ~= nil and value
    end,
    keys = {
      0, 7, 20, 24, 25, 26, 29, 30, 32, 33, 34, 35, 44,
      45, 46, 47, 48, 49, 59, 74, 75, 77, 140, 141, 142,
      144, 145, 185, 199, 244, 251, 246, 303, 323,
    },
    emotes = true,
    radio = true,
    phone = true,
    inventory = true,
  },
  forcedAnimations = {
    {
      condition = function(value)
        return value ~= nil and value
      end,
      dict = 'nm',
      name = 'firemans_carry',
      flag = 1,
    }
  },
}
