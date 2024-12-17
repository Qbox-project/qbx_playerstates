--- @type PlayerStateConfig
return {
  id = 'cuff',
  label = 'Handcuffs',
  fields = { stateBag = 'isCuffed', metadata = 'ishandcuffed' },
  permanent = true,
  value = {
    default = nil,
  },
  notification = {
    up = {
      id = 'state-cuff-up-notif',
      title = 'Handcuffs',
      description = 'You are handcuffed',
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
      id = 'state-cuff-down-notif',
      title = 'Handcuffs',
      description = 'You are no longer handcuffed',
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
      return value ~= nil and value
    end,
    keys = {
      21, 22, 24, 25, 26, 36, 37, 44, 45, 59, 71,
      72, 73, 75, 140, 141, 142, 143, 167, 170,
      199, 200, 257, 264, 288
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
      dict = 'mp_arresting',
      name = 'idle',
      flag = 49,
      prop = {
        {
          bone = 0x49D9,
          model = 'p_cs_cuffs_02_s',
          pos = vec3(0.04, 0.06, 0.0),
          rot = vec3(-85.24, 4.2, -106.6),
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
        return IsPedWalking(escortPed) or IsPedRunning(escortPed) or IsPedSprinting(escortPed)
      end,
      dict = 'mp_arresting',
      name = 'walk',
      flag = 1,
      prop = {
        {
          bone = 0x49D9,
          model = 'p_cs_cuffs_02_s',
          pos = vec3(0.04, 0.06, 0.0),
          rot = vec3(-85.24, 4.2, -106.6),
        },
      },
    },
  },
}
