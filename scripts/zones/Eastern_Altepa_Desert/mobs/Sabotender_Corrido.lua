-----------------------------------
-- Zone: Eastern Altepa Desert
--  NM:  Sabotender Corrido
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    -- setMobMod
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);

    -- addMod
    mob:addMod(MOD_DOUBLE_ATTACK, 20)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 40);
    mob:setMod(MOD_REGAIN, 20);
    mob:setMod(MOD_COUNTER, 35);
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    local chance = 90;
    local LV_diff = target:getMainLvl() - mob:getMainLvl();

    if (target:getMainLvl() > mob:getMainLvl()) then
        chance = chance - 5 * LV_diff;
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20) / 2;
        end

        local dmg = INT_diff+LV_diff+damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(mob, ELE_WATER, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(mob,target,ELE_WATER,0);
        dmg = adjustForTarget(target,dmg,ELE_WATER);

        if (dmg < 0) then
            dmg = 10
        end

        dmg = finalMagicNonSpellAdjustments(mob,target,ELE_WATER,dmg);

        return SUBEFFECT_WATER_DAMAGE,163,dmg;
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;