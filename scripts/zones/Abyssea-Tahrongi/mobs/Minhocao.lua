-----------------------------------
--  Area: Abyssea - Tahrongi (45)
--   Mob: Minhocao
-----------------------------------
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
require("scripts/zones/Abyssea-Tahrongi/TextIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    -- setMod
    mob:setMod(MOD_REGAIN,33);

    -- addMod
    mob:setMod(MOD_MATT,75);
    mob:setMod(MOD_MACC,700);
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
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
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local CHANCE = 55;
    if (math.random(0,99) < CHANCE  and player:hasKeyItem(SODDEN_SANDWORM_HUSK) == false) then
        player:addKeyItem(SODDEN_SANDWORM_HUSK);
        player:messageSpecial(KEYITEM_OBTAINED, SODDEN_SANDWORM_HUSK);
    end
end;

