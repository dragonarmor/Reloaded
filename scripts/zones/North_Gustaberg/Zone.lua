-----------------------------------
--
-- Zone: North_Gustaberg (106)
--
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/North_Gustaberg/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 880, 226, DIGREQ_NONE },
                    { 17396, 264, DIGREQ_NONE },
                    { 17296, 176, DIGREQ_NONE },
                    { 847, 75, DIGREQ_NONE },
                    { 864, 59, DIGREQ_NONE },
                    { 846, 75, DIGREQ_NONE },
                    { 869, 170, DIGREQ_NONE },
                    { 868, 83, DIGREQ_NONE },
                    { 749, 63, DIGREQ_NONE },
                    { 644, 60, DIGREQ_NONE },
                    { 645, 3, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 4545, 150, DIGREQ_BURROW },
                    { 636, 50, DIGREQ_BURROW },
                    { 617, 100, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                    { 1236, 3, DIGREQ_NIGHT },
};

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onGameHour()
    local TwinkleTreantID = 17212404;
    local month = tonumber(os.date("%m"));
    local day = tonumber(os.date("%d"));
    -- Dec 5th through Jan 5th.
    if ((month == 12 and day >= 5) or (month == 1 and day <= 5)) then
        DisallowRespawn(TwinkleTreantID, false);
    else
        DisallowRespawn(TwinkleTreantID, true);
        if (GetMobAction(TwinkleTreantID) == ACTION_ROAMING) then
            DespawnMob(TwinkleTreantID);
        end

        for boxes = (TwinkleTreantID -9), (TwinkleTreantID -1) do
            if (GetMobAction(boxes) == ACTION_ROAMING) then
                DespawnMob(boxes);
            end
        end
    end
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -518.867, 35.538, 588.64, 50);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 244;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 246;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 244) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 246) then
        if (player:getZPos() >  461) then
            player:updateEvent(0,0,0,0,0,6);
        elseif (player:getXPos() > -240) then
                player:updateEvent(0,0,0,0,0,7);
        end
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 244) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;