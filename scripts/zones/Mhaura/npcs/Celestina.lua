-----------------------------------
-- Area: Mhaura
--  NPC: Celestina
-- Finish Quest: The Sand Charm
-- Involved in Quest: Riding on the Clouds
-- Guild Merchant NPC: Goldsmithing Guild
-- !pos -37.624 -16.050 75.681 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(OTHER_AREAS,THE_SAND_CHARM) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(13095,1) and trade:getItemCount() == 1) then
            player:startEvent(127); -- Finish quest "The Sand Charm"
        end
    end

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_3") == 5) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_3",0);
            player:tradeComplete();
            player:addKeyItem(SOMBER_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SOMBER_STONE);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getVar("theSandCharmVar") == 3) then
        player:startEvent(126,13095); -- During quest "The Sand Charm" - 3rd dialog
     --[[
    elseif (player:sendGuild(528,8,23,4)) then
        player:showText(npc,GOLDSMITHING_GUILD);
    ]]
    else
        player:showText(npc, GOLDSMITHING_GUILD);
        local stock =
        {
            640,    9,       -- Copper Ore
            736,    100,     -- Silver Ore
            769,    1288,    -- Red Rock
            770,    1288,    -- Blue Rock
            771,    1288,    -- Yellow Rock
            772,    1288,    -- Green Rock
            773,    1288,    -- Translucent Rock
            774,    1288,    -- Purple Rock
            775,    1288,    -- Black Rock
            776,    1288,    -- White Rock
            2143,   75,      -- Mandrel
            2144,   75       -- Workshop Anvil
        };
        showShop(player, STATIC, stock);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 126 and option == 70) then
        player:setVar("theSandCharmVar",4);
    elseif (csid == 127) then
        player:tradeComplete();
        player:setVar("theSandCharmVar",0);
        player:setVar("SmallDialogByBlandine",1);
        player:addKeyItem(MAP_OF_BOSTAUNIEUX_OUBLIETTE);
        player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_BOSTAUNIEUX_OUBLIETTE);
        player:addFame(OTHER_AREAS,30);
        player:completeQuest(OTHER_AREAS,THE_SAND_CHARM);
    end

end;