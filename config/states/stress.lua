--- @type PlayerStateConfig
return {
  id = 'stress',
  label = 'Stress',
  fields = {
    statebag = 'stress',
    metadata = 'stress',
  },
  permanent = true,
  value = {
    default = 0,
    range = {min = 0, max = 100},
  },
  notification = {
    up = {
      id = 'state-stress-up-notif',
      title = 'Stress',
      description = 'You feel stressed',
      duration = 1000,
      icon = 'brain',
      iconColor = '#C53030',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = 2,
    },
    down = {
      id = 'state-stress-down-notif',
      title = 'Stress',
      description = 'You feel relaxed',
      duration = 1000,
      icon = 'brain',
      iconColor = '#4CAF50',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = -2,
    },
  },
}
