--- @type PlayerStateConfig
return {
  id = 'carry',
  label = 'Carry',
  fields = { stateBag = 'carry' },
  permanent = false,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-carry-up-notif',
      title = 'Carry',
      description = 'You are carrying someone',
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
      id = 'state-carry-down-notif',
      title = 'Carry',
      description = 'You are no longer carrying someone',
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
      dict = 'missfinale_c2mcs_1',
      name = 'fin_c2_mcs_1_camman',
      flag = 48,
    }
  },
}
