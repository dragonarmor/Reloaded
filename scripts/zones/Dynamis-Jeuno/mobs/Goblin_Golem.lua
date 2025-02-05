-----------------------------------
-- Area: Dynamis Jeuno
--  MOB: Goblin Golem
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(HYDRA_CORPS_TACTICAL_MAP) == false)then
        player:setVar("DynaJeuno_Win",1);
        player:addKeyItem(HYDRA_CORPS_TACTICAL_MAP);
        player:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_TACTICAL_MAP);
    end

    player:addTitle(DYNAMISJEUNO_INTERLOPER); -- Add title

    local npc = GetNPCByID(17547510); -- Spawn ???
    npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
    npc:setStatus(0);

    player:launchDynamisSecondPart(); -- Spawn dynamis second part

end;