local painDisabled = false

local function disablePain()
  if not painDisabled then
    painDisabled = true
    exports.qbx_medical:DisableDamageEffects()
    lib.notify({description = 'Painkillers effects have started'})
  end
end

local function enablePain()
  if painDisabled then
    painDisabled = false
    exports.qbx_medical:EnableDamageEffects()
    lib.notify({description = 'Painkillers effects have ended'})
  end
end

CreateThread(function()
  while true do
    Wait(10 * 1000)
    if LocalPlayer.state.isLoggedIn and not LocalPlayer.state.isDead then
      if LocalPlayer.state.painkiller then
        if LocalPlayer.state.painkiller > 0 then
          disablePain()
        else
          enablePain()
        end
      else
        enablePain()
      end
    end
  end
end)
