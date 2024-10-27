--- @type PlayerStateConfig
return {
  id = 'cuffed',
  label = 'Handcuffed',
  fields = {
    statebag = 'isCuffed',
    metadata = 'ishandcuffed',
  },
  permanent = true,
  notification = {
    up = {
      id = 'state-cuffed-up-notif',
      title = 'Cuffed',
      description = 'You are handcuffed',
      duration = 1000,
      icon = 'handcuffs',
      iconColor = '#C53030',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
    },
    down = {
      id = 'state-cuffed-down-notif',
      title = 'UnCuffed',
      description = 'You are no longer handcuffed',
      duration = 1000,
      icon = 'handcuffs',
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
      dict = 'mp_arresting',
      clip = 'idle',
      duration = -1,
    },
  },
  props = {
    {
      model = 'p_cs_cuffs_02_s',
      pos = vec3(0.04, 0.06, 0.0),
      rot = vec3(-85.24, 4.2, -106.6),
    },
  },
  notAllowedStates = {
    {id = 'carried'},
    {id = 'carried', remove = true},
    {id = 'dead'},
    -- ...
  },
}
