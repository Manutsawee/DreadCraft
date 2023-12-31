local TUNING = GLOBAL.TUNING
GLOBAL.setfenv(1, GLOBAL)

local tuning = {
    DREADSWORD = {
        DAMAGE = 51,
        PLANAR_DAMAGE = 17,
        USES = 200,
        SHADOW_LEVEL = 3,
        REGEN_MAXRATE = TUNING.ARMOR_DREADSTONE_REGEN_MAXRATE,
        REGEN_MINRATE = TUNING.ARMOR_DREADSTONE_REGEN_MINRATE,
        REGEN_SETBONUS = TUNING.ARMOR_DREADSTONE_REGEN_SETBONUS,
        REGEN_PERIOD = TUNING.ARMOR_DREADSTONE_REGEN_PERIOD,
    },

    DREAD_PICKAXE = {
        DAMAGE = 32.5,
        EFFICIENCY = 1.5,
        USES = 250,
        SHADOW_LEVEL = 2,
        PLANAR_DAMAGE = TUNING.PICKAXE_LUNARPLANT_PLANAR_DAMAGE,
        REGEN_MAXRATE = TUNING.ARMOR_DREADSTONE_REGEN_MAXRATE,
        REGEN_MINRATE = TUNING.ARMOR_DREADSTONE_REGEN_MINRATE,
        REGEN_SETBONUS = TUNING.ARMOR_DREADSTONE_REGEN_SETBONUS,
        REGEN_PERIOD = TUNING.ARMOR_DREADSTONE_REGEN_PERIOD,
    },
}

for k,v in pairs(tuning) do
    TUNING[k] = v
end
