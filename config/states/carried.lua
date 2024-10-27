--- @type PlayerStateConfig
return {
  id = 'carried',
  label = 'Carried',
  fields = {
    statebag = 'carriedBy',
  },
  permanent = false,
  notification = {
    up = {
      id = 'state-carried-up-notif',
      title = 'Carried',
      description = 'You are being carried',
      duration = 1000,
      icon = 'arrows-alt',
      iconColor = '#C53030',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
    },
    down = {
      id = 'state-carried-down-notif',
      title = 'Put Down',
      description = 'You are no longer being carried',
      duration = 1000,
      icon = 'arrows-alt',
      iconColor = '#4CAF50',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
    },
  },
  disable = {
    keys = {},
    inventory = true,
    radialMenu = true,
    targeting = true,
    emotes = true,
    radio = true,
    phone = true,
  },
  animations = {
    {
      dict = 'nm',
      clip = 'firemans_carry',
      duration = -1,
      flag = 1
    },
  },
  requiredStates = {
    {id = 'cuffed'},
    {id = 'dead'},
  },
}
