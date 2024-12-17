--- @type PlayerStateConfig
return {
  id = 'escort',
  label = 'Escort',
  fields = { stateBag = 'escorting' },
  permanent = false,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-escort-up-notif',
      title = 'Escort',
      description = 'You are escorting a player',
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
      id = 'state-escort-down-notif',
      title = 'Escort',
      description = 'You are no longer escorting a player',
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
      25, 59, 140, 141, 142
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
      dict = 'amb@code_human_wander_drinking_fat@beer@male@base',
      name = 'static',
      flag = 49,
    }
  },
}
