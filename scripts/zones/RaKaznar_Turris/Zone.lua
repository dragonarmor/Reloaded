-----------------------------------
--
-- Zone: Ra’Kanzar Turris (277)
--
-----------------------------------
package.loaded["scripts/zones/RaKaznar_Turris/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/RaKaznar_Turris/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(58,30,20,0);
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