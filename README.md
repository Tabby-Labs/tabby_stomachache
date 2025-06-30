# Stomach ache custom made for [Leypak Roleplay](https://discord.gg/bsufVaP2xh)
---

## 🚀 Installation
---
### 📦 Requirements
Install all dependencies:
- [qbox framework](https://github.com/Qbox-project/qbx_core/releases/). other framework in future
- [ox_lib](https://github.com/communityox/ox_lib/releases)
- [ox_inventory](https://github.com/communityox/ox_inventory/releases)

### 🛠️ Steps
1. go to `qbx_core/client/loops.lua` at **Line 4** and replace the code with 
```lua
CreateThread(function()
    local timeout = 1000 * statusInterval
    while true do
        Wait(timeout)

        if QBX.IsLoggedIn then
            if ((playerState.hunger or 0) <= 0 or (playerState.thirst or 0) <= 0) and not playerState.isDead then
                local currentHealth = GetEntityHealth(cache.ped)

                if currentHealth > 150 then
                    local decreaseThreshold = math.random(5, 10)
                    local newHealth = currentHealth - decreaseThreshold
                    SetEntityHealth(cache.ped, newHealth)
                end
            end
        end
    end
end)
```
2. go to `qbx_core/server/player.lua` and look for *`playerData.metadata`* and add new *player metadata*
```lua
playerData.metadata.stomachAche = playerData.metadata.stomachAche or false
```
3. make sure you start the script in your `server.cfg` file
```cfg
ensure tabby_stomachache
```