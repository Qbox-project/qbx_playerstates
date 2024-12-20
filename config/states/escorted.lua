--- @type PlayerStateConfig
return {
  id = 'escorted',
  label = 'Escorted',
  fields = { stateBag = 'escortedBy' },
  permanent = false,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-escorted-up-notif',
      title = 'Escorted',
      description = 'You are being escorted',
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
      id = 'state-escorted-down-notif',
      title = 'Escorted',
      description = 'You are no longer being escorted',
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
      return value
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
    radialMenu = true,
    target = true,
  },
}
