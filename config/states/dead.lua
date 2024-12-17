--- @type PlayerStateConfig
return {
  id = 'dead',
  label = 'Dead',
  fields = { stateBag = 'isDead', metadata = 'isdead' },
  permanent = true,
  value = {
    default = false,
  },
  notification = {
    up = {
      id = 'state-dead-up-notif',
      title = 'Dead',
      description = 'You are dead',
      duration = 2000,
      icon = 'skull-crossbones',
      iconColor = '#C53030',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = 1,
    },
    down = {
      id = 'state-dead-down-notif',
      title = 'Dead',
      description = 'You are Aliiiiive!!! (not really)',
      duration = 2000,
      icon = 'skull-crossbones',
      iconColor = '#4CAF50',
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
      0, 1, 2, 7, 20, 24, 25, 26, 29, 30, 32, 33, 34,
      35, 38, 44, 45, 46, 47, 48, 49, 59, 74, 75, 77,
      101, 104, 140, 141, 142, 144, 145, 185, 199,
      213, 244, 245, 246, 249, 251, 288,
      303, 304, 322, 323,
    },
    emotes = true,
    radio = true,
    phone = true,
    inventory = true,
    radialMenu = true,
    target = true,
  },
  forcedAnimations = {
    {
      condition = function(value)
        return
          value and
          not LocalPlayer.state.carriedBy and
          not LocalPlayer.state.inStretcher and
          not LocalPlayer.state.inBed and
          not cache.vehicle
      end,
      dict = 'dead',
      name = 'dead_a',
      flag = 3,
    },
    {
      condition = function(value)
        return
          value and
          not LocalPlayer.state.carriedBy and
          not LocalPlayer.state.inStretcher and
          not LocalPlayer.state.inBed and
          cache.vehicle
      end,
      dict = 'veh@bus@passenger@common@idle_duck',
      name = 'sit',
      flag = 2,
    }
  },
}
