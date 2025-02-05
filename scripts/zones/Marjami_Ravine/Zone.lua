-----------------------------------
--
-- Zone: Marjami Ravine
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Marjami_Ravine/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Marjami_Ravine/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    player:setVar("HpTeleportMask1a", 0);
    player:setVar("HpTeleportMask1b", 0);
    player:setVar("HpTeleportMask2a", 0);
    player:setVar("HpTeleportMask2b", 0);
    player:setVar("HpTeleportMask3a", 0);
    player:setVar("HpTeleportMask3b", 0);
    player:setVar("HpTeleportMask4a", 0);
    player:setVar("HpTeleportMask4b", 0);

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(429,-60,298,99);
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

