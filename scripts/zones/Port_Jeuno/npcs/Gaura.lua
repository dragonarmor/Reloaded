-----------------------------------
-- Area: Port Jeuno
--  NPC: Guara
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/settings");
require("scripts/globals/msg");

-----------------------------------

function onTrade(player,npc,trade)
    if (TRAVEL_SKIP >= 1) then
        if (trade:getGil() >= TRAVEL_SKIP and trade:getItemCount() == 1) then
            player:PrintToPlayer(string.format("eye's the %d gil.. ", TRAVEL_SKIP), chatType.EMOTION, npc:getName());
            player:PrintToPlayer("Well..I guess I can let you aboard the express freight Vessel.. ", chatType.SAY, npc:getName());
            if (player:hasKeyItem(AIRSHIP_PASS)) then
                player:delGil(TRAVEL_SKIP);
                -- player:setPos(-68,2,-36,170,236);
                player:addStatusEffectEx(EFFECT_COMMUTE,0,COMMUTE.AISHIP_TO_BASTOK,0,2);
            else
                player:setVar("HasDoorHacked", player:getVar("HasDoorHacked") +1);
                print(player:getName() .. " tried to TRAVEL_SKIP an airship but didn't have a Airship Pass..");
                player:PrintToPlayer("Wait a minute, You don't have a AIRSHIP PASS, how'd you even get through the door?.. ", chatType.SAY, npc:getName());
            end
        end
    end
end;

function onTrigger(player,npc)

    local vHour = VanadielHour();
    local vMin  = VanadielMinute();

    while vHour >= 3 do
        vHour = vHour - 6;
    end

    if (     vHour == -3) then vHour = 3;
    elseif ( vHour == -2) then vHour = 4;
    elseif ( vHour == -1) then vHour = 5;
    end

    local seconds = math.floor(2.4 * ((vHour * 60) + vMin));

    player:startEvent( 10025, seconds, 0, 0, 0, 0, 0, 0, 0);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
