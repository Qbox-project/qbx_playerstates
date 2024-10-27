--- @type PlayerStateConfig
return {
  id = 'carry',
  label = 'Carry',
  fields = {
    statebag = 'carry',
  },
  permanent = false,
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
      dict = 'missfinale_c2mcs_1',
      clip = 'fin_c2_mcs_1_camman',
      duration = -1,
      flag = 48
    },
  },
}
