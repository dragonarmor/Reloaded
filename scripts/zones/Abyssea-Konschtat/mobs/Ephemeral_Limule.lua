-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Ephemeral_Limule
-----------------------------------
package.loaded["scripts/globals/abyssea"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Konschtat/textIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
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

	-- local result = DoCruor(killer,result);
	-- DoExp(killer,bonus);
    -- DoLights(mob,killer);
	-- PyxisSpawn(mob,killer,npc);

	-- player:messageSpecial(CRUOR_OBTAINED,result);
end;