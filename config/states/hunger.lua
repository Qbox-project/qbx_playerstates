--- @type PlayerStateConfig
return {
  id = 'hunger',
  label = 'Hunger',
  fields = {
    statebag = 'hunger',
    metadata = 'hunger',
  },
  permanent = true,
  value = {
    default = 100,
    range = {min = 0, max = 100},
  },
  notification = {
    up = {
      id = 'state-hunger-up-notif',
      title = 'Hunger',
      description = 'You relieved your hunger',
      duration = 2000,
      icon = 'drumstick-bite',
      iconColor = '#4CAF50',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = 50,
    },
    down = {
      id = 'state-hunger-down-notif',
      title = 'Hunger',
      description = 'You feel hungry',
      duration = 1000,
      icon = 'bone',
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
