-----------------------------------
-- Area: Eastern_Adoulin
--  NPC: HomePoint#1
-- !pos
-----------------------------------
package.loaded["scripts/zones/Eastern_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Eastern_Adoulin/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end; 

function onTrigger(player,npc)
    player:PrintToPlayer("SoA is closed - you should not be here.");
    --[[
    homepointMenu(player, 8700, 45);
    ]]
    player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_WARP,0,4);
end; 

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;