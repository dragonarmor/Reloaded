-----------------------------------
-- Area: Ro'Maeve
--  NPC: _3e0 (Moongate)
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrigger(player,npc)
    npc:openDoor(10);
    --[[
    if (player:hasKeyItem(MOONGATE_PASS) == true) then
        npc:openDoor(10);
    end
    ]]
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
end;

function onEventFinish(player,csid,option)
end;

