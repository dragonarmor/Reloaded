-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Achuka (Custom Version)
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);

    -- addMod
    mob:addMod(MOD_DEF, 100);
    mob:addMod(MOD_MDEF, 30);
end;

-----------------------------------
-- OnMobSpawn
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGAIN,10);
    mob:setMod(MOD_MACC, 2000);
    mob:setMod(MOD_MATT, 100);
    mob:setMod(MOD_FIRE_AFFINITY_DMG, 10);
    mob:setMod(MOD_FIRE_AFFINITY_ACC, 10);
    mob:setMod(MOD_STUNRES, 50);
    mob:setMod(MOD_ACC,1500);

    mob:SetMobSkillAttack(4172); -- Enable Special Animation for melee attacks.
end;

-----------------------------------
-- onMobDisEngage Action
-----------------------------------

function onMobDisEngage(mob, target)
    mob:delStatusEffect(EFFECT_RAGE);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------


function onMobFight(mob, target)
    local BattleTime = mob:getBattleTime();

    if (BattleTime - os.time() > 3600 and mob:getLocalVar("RAGED") == 0) then
        mob:addStatusEffectEx(EFFECT_RAGE,0,1,0,0);
        mob:setLocalVar("RAGED", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local CHANCE = 10;
    if (math.random(0,99) < CHANCE and player:getMainJob() == JOBS.BLU and player:hasSpell(746) == false) then
        player:addSpell(746);
    end
    mob:setRespawnTime(math.random((18000),(28800)));   -- 5 to 8 hours
end;