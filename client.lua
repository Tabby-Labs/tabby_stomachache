local qbx = exports.qbx_core
local config = require 'config'

-- event
RegisterNetEvent('stomachache:client:StomachEffect', function()
    if not qbx:GetPlayerData().metadata.stomachAche then return end

    local ped = cache.ped

    if not IsEntityPlayingAnim(ped, config.Animation.dict, config.Animation.anim, 3) then
        lib.playAnim(ped, config.Animation.dict, config.Animation.anim, 1.0, 1.0, -1, 1, 0, false, false, false) 
    end

    if lib.progressBar({
        duration = config.Animation.time * 1000,
        label = config.Label,
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true,
            sprint = true
        },
    }) then
        TaskPlayAnim(ped, config.Animation.dict, 'exit', 1.0, 8.0, -1, 1, -1, false, false, false)
    end
end)

-- callback
lib.callback.register('stomachache:client:RemoveAche', function()
    -- progressbar -> return true/false
end)