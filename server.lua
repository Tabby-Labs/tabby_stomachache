local qbx = exports.qbx_core
local config = require 'config'

-- function
local function checkStomach(src, player)
    local playerState = Player(src).state

    if not playerState.isLoggedIn then return end

    local hunger = playerState.hunger
    local thirst = playerState.thirst
    local xPed = GetPlayerPed(src)
    local maxHealth = GetPedMaxHealth(xPed)
    local minHealth = (config.MinHealth / 100) * maxHealth

    if ((hunger or 0) <= config.MinHunger or (thirst or 0) <= config.MinThirst) and (not playerState.isDead and GetEntityHealth(xPed) > minHealth)  then
        local playerStomach = player.Functions.GetMetaData('stomachAche')

        if not playerStomach then
            player.Functions.SetMetaData('stomachAche', true)
        end

        TriggerClientEvent('stomachache:client:StomachEffect', src)
    end

    print(player.Functions.GetMetaData('stomachAche'))
end

-- loop
Citizen.CreateThread(function()
    local delay = 60000 * config.CheckStomach
    while true do
        Wait(delay)
        for src, player in pairs(qbx:GetQBPlayers()) do
            checkStomach(src, player)
        end
    end
end)

-- useable item
qbx:CreateUseableItem(config.DrugItem, function(source, item)
    local src = source
    local xPlayer = qbx:GetPlayer(src)

    if not xPlayer then return end

    local hasItem = exports.ox_inventory:Search(src, 'count', item.name) > 0
    
    if not hasItem then return end

    local useDrug = lib.callback.await('stomachache:client:RemoveAche', src)

    if not useDrug then return end

    exports.ox_inventory:RemoveItem(src, item.name, 1)
end)