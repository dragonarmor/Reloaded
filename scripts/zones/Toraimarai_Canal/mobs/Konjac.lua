-----------------------------------
-- Zone: Tormaimarai Canal
--  NM:  Konjac
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);

    -- addMod
    mob:addMod(MOD_DOUBLE_ATTACK, 30)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 40);
    mob:setMod(MOD_REGAIN, 20);
    
     local RND1 = math.random(1,5);
    if (RND1 == 1) then
        SetDropRate(455,4781,100); 
        SetDropRate(455,4771,0);
        SetDropRate(455,5505,0);
        SetDropRate(455,4706,0);
        SetDropRate(455,4707,0);
    elseif (RND1 == 2) then
        SetDropRate(455,4781,0);
        SetDropRate(455,4771,100);
        SetDropRate(455,5505,0); 
        SetDropRate(455,4706,0); 
        SetDropRate(455,4707,0); 
    elseif (RND1 == 3) then
        SetDropRate(455,4781,0); 
        SetDropRate(455,4771,0); 
        SetDropRate(455,5505,100); 
        SetDropRate(455,4706,0); 
        SetDropRate(455,4707,0); 
    elseif (RND1 == 4) then
        SetDropRate(455,4781,0); 
        SetDropRate(455,4771,0); 
        SetDropRate(455,5505,0); 
        SetDropRate(455,4706,100); 
        SetDropRate(455,4707,0); 
    elseif (RND1 == 5) then
        SetDropRate(455,4781,0); 
        SetDropRate(455,4771,0); 
        SetDropRate(455,5505,0); 
        SetDropRate(455,4706,0); 
        SetDropRate(455,4707,100);   
    end      
    
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
end;
-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    local chance = 15;
    local LV_diff = target:getMainLvl() - mob:getMainLvl();

    if (target:getMainLvl() > mob:getMainLvl()) then
        chance = chance - 5 * LV_diff
        chance = utils.clamp(chance, 5, 95);
    end

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20) / 2;
        end

        local drain = INT_diff+LV_diff+damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        drain = addBonusesAbility(mob, ELE_DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(mob,target,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);

        if (drain < 0) then
            drain = 0;
        end

        drain = finalMagicNonSpellAdjustments(target,mob,ELE_DARK,drain);
        return SUBEFFECT_HP_DRAIN, 161, mob:addHP(drain);
    end

end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;