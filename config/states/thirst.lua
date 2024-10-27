--- @type PlayerStateConfig
return {
  id = 'thirst',
  label = 'Thirst',
  fields = {
    statebag = 'thirst',
    metadata = 'thirst',
  },
  permanent = true,
  value = {
    default = 100,
    range = {min = 0, max = 100},
  },
  notification = {
    up = {
      id = 'state-thirst-up-notif',
      title = 'Thirst',
      description = 'You relieved your thirst',
      duration = 2000,
      icon = 'wine-glass',
      iconColor = '#4CAF50',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = 50,
    },
    down = {
      id = 'state-thirst-down-notif',
      title = 'Thirst',
      description = 'You feel thirsty',
      duration = 1000,
      icon = 'wine-glass-empty',
      iconColor = '#C53030',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = -10,
    },
  },
  decay = {
    interval = 60*1000,
    value = -2,
  },
}
