-----------------------------------
-- Area: Mhaura
--  NPC: Dieh Yamilsiah
-- Reports the time remaining before boat arrival.
-- !pos 7.057 -2.364 2.489 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/teleports");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/msg");
-----------------------------------

function onTrade(player,npc,trade)
    if (TRAVEL_SKIP >= 1) then
        if (trade:getGil() >= TRAVEL_SKIP and trade:getItemCount() == 1) then
            player:PrintToPlayer(string.format("eye's the %d gil.. ", TRAVEL_SKIP), chatType.EMOTION, npc:getName());
            player:PrintToPlayer("Well..I guess I can let you aboard the express freight Vessel.. ", chatType.SAY, npc:getName());
            if (player:hasKeyItem(BOARDING_PERMIT) and (1152 - ((os.time() - 1009810802)%1152) >= 576)) then
                player:delGil(TRAVEL_SKIP);
                -- player:setPos(-11,2,-142,192,50);
                player:addStatusEffectEx(EFFECT_COMMUTE,0,COMMUTE.SHIP_TO_WHITEGATE_M,0,2);
            else
                player:delGil(TRAVEL_SKIP);
                -- player:setPos(22,-2,-47,194,248);
                player:addStatusEffectEx(EFFECT_COMMUTE,0,COMMUTE.SHIP_TO_SELBINA,0,2);
            end
        end
    end
end;

function onTrigger(player,npc)

    -- Each boat comes every 1152 seconds/8 game hours, 4 hour offset between Selbina and Aht Urghan
    -- Original timer: local timer = 1152 - ((os.time() - 1009810584)%1152);
   local timer = 1152 - ((os.time() - 1009810802)%1152);
   local destination = 0; -- Selbina, set to 1 for Al Zhabi
   local direction = 0; -- Arrive, 1 for depart
   local waiting = 216; -- Offset for Selbina

   -- Next ferry is Al Zhabi for higher values.
    if (timer >= 576) then
      destination = 1;
      timer = timer - 576;
      waiting = 193;
    end

   -- Logic to manipulate cutscene results.
    if (timer <= waiting) then
      direction = 1; -- Ship arrived, switch dialog from "arrive" to "depart"
   else
      timer = timer - waiting; -- Ship hasn't arrived, subtract waiting time to get time to arrival
    end

   player:startEvent(231,timer,direction,0,destination); -- timer arriving/departing ??? destination

   --[[Other cutscenes:
   233 "This ship is headed for Selbina."
   234 "The Selbina ferry will deparrrt soon!  Passengers are to board the ship immediately!"

   Can't find a way to toggle the destination on 233 or 234, so they are not used.
   Users knowing which ferry is which > using all CSs.]]

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;