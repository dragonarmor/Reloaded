-----------------------------------
--  Area: Abyssea - Grauberg (254)
--   Mob: Xibalba
-----------------------------------
package.loaded["scripts/zones/Abyssea-Grauberg/TextIDs"] = nil;
require("scripts/zones/Abyssea-Grauberg/TextIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/keyitems");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(MOD_MATT,75);
    mob:setMod(MOD_MACC,800);
    mob:addMod(MOD_DEF,-100);
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
    if ((math.random(1,10) ~= 3) or (target:hasStatusEffect(EFFECT_DOOM) == true)) then
        return 0,0,0;
    else
        local duration = 10;
        target:addStatusEffect(EFFECT_DOOM,1,0,duration);
        mob:resetEnmity(target);
        return SUBEFFECT_NONE,0,EFFECT_DOOM;
    end
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local CHANCE = 15;
    if (math.random(0,99) < CHANCE  and player:hasKeyItem(INDIGO_ABYSSITE_OF_MERIT) == false) then
        player:addKeyItem(INDIGO_ABYSSITE_OF_MERIT);
        player:messageSpecial(KEYITEM_OBTAINED, INDIGO_ABYSSITE_OF_MERIT);
    end
end;

