--- @type PlayerStateConfig
return {
  id = 'ziptie',
  label = 'Ziptie',
  fields = { stateBag = 'isZiptied', metadata = 'ziptied' },
  permanent = true,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-ziptie-up-notif',
      title = 'Ziptie',
      description = 'You are ziptied',
      duration = 2000,
      icon = 'handcuffs',
      iconColor = '#4CAF50',
      style = {
        backgroundColor = '#141517',
        color = '#FFFFFF',
      },
      value = 1,
    },
    down = {
      id = 'state-ziptie-down-notif',
      title = 'Ziptie',
      description = 'You are no longer ziptied',
      duration = 2000,
      icon = 'handcuffs',
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
      21, 22, 24, 25, 26, 36, 37, 44, 45, 59,
      71, 72, 73, 75, 140, 141, 142, 143, 167,
      170, 199, 200, 257, 264, 288
    },
    target = true,
    emotes = true,
    radio = true,
    phone = true,
    inventory = true,
    radialMenu = true,
  },
  forcedAnimations = {

    {
      condition = function(value)
        if not value then return false end
        if not LocalPlayer.state.escortedBy then return true end
        local escortPlayer = GetPlayerFromServerId(LocalPlayer.state.escortedBy)
        if not escortPlayer then return true end
        local escortPed = GetPlayerPed(escortPlayer)
        if not escortPed then return true end
        if not DoesEntityExist(escortPed) then return true end
        return
          not IsPedWalking(escortPed) and
          not IsPedRunning(escortPed) and
          not IsPedSprinting(escortPed)
      end,
      dict = 'move_weapon@pistol@copb',
      name = 'idle',
      flag = 49,
      prop = {
        {
          bone = 0x49D9,
          model = 'police_zip_tie_positioned',
          pos = vec3(-0.024, 0.012, 0.042),
          rot = vec3(-103.780, 84.210, -10.100),
        },
      },
    },
    {
      condition = function(value)
        if not value or not LocalPlayer.state.escortedBy then return false end
        local escortPlayer = GetPlayerFromServerId(LocalPlayer.state.escortedBy)
        if not escortPlayer then return false end
        local escortPed = GetPlayerPed(escortPlayer)
        if not escortPed then return false end
        if not DoesEntityExist(escortPed) then return false end
        return IsPedWalking(escortPed)
      end,
      dict = 'move_weapon@pistol@copb',
      name = 'walk',
      flag = 1,
      prop = {
        {
          bone = 0x49D9,
          model = 'police_zip_tie_positioned',
          pos = vec3(-0.024, 0.012, 0.042),
          rot = vec3(-103.780, 84.210, -10.100),
        },
      },
    },
    {
      condition = function(value)
        if not value or not LocalPlayer.state.escortedBy then return false end
        local escortPlayer = GetPlayerFromServerId(LocalPlayer.state.escortedBy)
        if not escortPlayer then return false end
        local escortPed = GetPlayerPed(escortPlayer)
        if not escortPed then return false end
        if not DoesEntityExist(escortPed) then return false end
        return IsPedRunning(escortPed) or IsPedSprinting(escortPed)
      end,
      dict = 'move_weapon@pistol@copa',
      name = 'run',
      flag = 1,
      prop = {
        {
          bone = 0x49D9,
          model = 'police_zip_tie_positioned',
          pos = vec3(-0.024, 0.012, 0.042),
          rot = vec3(-103.780, 84.210, -10.100),
        },
      },
    },
  },
}
