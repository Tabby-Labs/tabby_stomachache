local config = {}

-- Can't be 0
config.CheckStomach = 5             -- How often to check player stomach in minutes

-- Minimum Hp, Thirst & Hunger before trigger the stomach ache in percentage
config.MinHealth = 50
config.MinThirst = 0
config.MinHunger = 0

config.DrugItem = 'omeprazole'

config.Label = 'Stomach ache...'

config.Animation = {
    time = 60,                         -- in seconds
    dict = 'combat@damage@writhe',     -- animation dictionary
    anim = 'writhe_loop'               -- animation
}

return config