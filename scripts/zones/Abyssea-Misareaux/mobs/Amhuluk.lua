-----------------------------------
-- Area: Abyssea - Misareaux (216)
--  Mob: Amhuluk
-----------------------------------
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Misareaux/TextIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    -- setMod
    mob:setMod(MOD_REGAIN,33);

    -- setMod
    mob:addMod(MOD_MATT,75);
    mob:addMod(MOD_MACC,500);
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobRoam
-----------------------------------

function onMobRoam(mob,target)
    -- Begin Temp
    mob:hideName(false);
    mob:untargetable(false);
    -- End temp
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    -- Begin Temp
    mob:hideName(false);
    mob:untargetable(false);
    -- End temp
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    -- Begin Temp
    mob:hideName(false);
    mob:untargetable(false);
    -- End temp
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local CHANCE = 15;
    if (math.random(0,99) < CHANCE and player:hasKeyItem(ATMA_OF_THE_STRANGLING_WIND) == false) then
        player:addKeyItem(ATMA_OF_THE_STRANGLING_WIND);
        player:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THE_STRANGLING_WIND);
    end
end;
