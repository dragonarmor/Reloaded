-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Ketos
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,1);
end;