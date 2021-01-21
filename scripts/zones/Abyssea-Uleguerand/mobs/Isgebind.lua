-----------------------------------
-- Area: Abyssea - Uleguerand (253)
--  NM:  Isgebind
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Uleguerand/TextIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/magic");

-----------------------------------
-- OnMobInitialize
-----------------------------------

function onMobInitialize(mob)
    -- addmod
    mob:addMod(MOD_REGAIN, 10);
    mob:addMod(MOD_REGEN, 100);
    mob:addMod(MOD_UFASTCAST, 55);
    mob:addMod(MOD_REFRESH, 100);
    mob:addMod(MOD_DEF,120);
    mob:addMod(MOD_MDEF,70);
    mob:addMod(MOD_DOUBLE_ATTACK, 20);
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_MATT,110);  -- This needs converted to proper addmod
    mob:setMod(MOD_MACC,1800); -- This needs converted to proper addmod
    -- Other
    mob:SetMobSkillAttack(0); -- resetting so it doesn't respawn in flight mode.
    mob:AnimationSub(0); -- subanim 0 is only used when it spawns until first flight.
    mob:delStatusEffect(EFFECT_ALL_MISS);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    if (mob:hasStatusEffect(EFFECT_BLOOD_WEAPON) == false and mob:actionQueueEmpty() == true) then
        local changeTime = mob:getLocalVar("changeTime");
        local twohourTime = mob:getLocalVar("twohourTime");

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setLocalVar("twohourTime", twohourTime);
        end

        if (mob:AnimationSub() == 2 and mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(439);
            mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+20);
        elseif (mob:AnimationSub() == 0 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(732);
            -- and record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime());
        -- subanimation 1 is flight, so check if he should land
        elseif (mob:AnimationSub() == 1 and mob:getBattleTime() - changeTime > 30) then
            mob:useMobAbility(1292);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        -- subanimation 2 is grounded mode, so check if he should take off
        elseif (mob:AnimationSub() == 2 and mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(EFFECT_ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(732);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local KI_CHANCE = 20;
    local ATMA_CHANCE = 15;

    if (KI_CHANCE > math.random(0,99) and player:hasKeyItem(IVORY_ABYSSITE_OF_FURTHERANCE) == false) then
        player:addKeyItem(IVORY_ABYSSITE_OF_FURTHERANCE);
        player:messageSpecial(KEYITEM_OBTAINED, IVORY_ABYSSITE_OF_FURTHERANCE);
    end

    if (ATMA_CHANCE > math.random(0,99) and player:hasKeyItem(ATMA_OF_THE_FROZEN_FETTERS) == false) then
        player:addKeyItem(ATMA_OF_THE_FROZEN_FETTERS);
        player:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_FROZEN_FETTERS);
    end
end;
