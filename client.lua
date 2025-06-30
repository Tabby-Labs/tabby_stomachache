local qbx = exports.qbx_core
local config = require 'config'

-- event
RegisterNetEvent('stomachache:client:StomachEffect', function()
    if not qbx:GetPlayerData().metadata.stomachAche then return end

    if lib.progressBar({
        duration = config.Animation.time * 60000,
        label = config.label,
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true,
            sprint = true
        },
        anim = {
            dict = config.Animation.dict,
            clip = config.Animation.anim
        },
    }) then print('Do stuff when complete') else return end
end)

-- callback
lib.callback.register('stomachache:client:RemoveAche', function()
    -- progressbar -> return true/false
end)