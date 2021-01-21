-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: ??? (Jailer of Fortitude Spawn)
-- Allows players to spawn the Jailer of Fortitude by trading 12 Ghrah M Chips to a ???.
-- Random positions:
-- !pos -420 0 755
-- !pos -43 0 460
-- !pos -260 0 44.821
-- !pos -580 0 43
-- !pos -796 0 460
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Garden_of_RuHmet/TextIDs");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");
require("scripts/globals/status");

-----------------------------------

function onTrade(player,npc,trade)
    -- Trade 12 Ghrah M Chips
    --[[
    if (GetMobAction(Jailer_of_Fortitude) == 0 and trade:hasItemQty(1872,12) and trade:getItemCount() == 12) then
        local qm1 = GetNPCByID(Jailer_of_Fortitude_QM);
        -- Complete the trade
        player:tradeComplete();
        -- Hide the NPC, will become unhidden after Jailer of Fortitude despawns
        qm1:setStatus(STATUS_DISAPPEAR);
        -- Change MobSpawn to ???'s pos.
        GetMobByID(Jailer_of_Fortitude):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        -- Change spawn point of pets to be at the ???'s pos as well
        GetMobByID(Kf_Ghrah_WHM):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        GetMobByID(Kf_Ghrah_BLM):setSpawn(qm1:getXPos(),qm1:getYPos(),qm1:getZPos());
        -- Spawn Jailer of Fortitude
        SpawnMob(Jailer_of_Fortitude):updateClaim(player);
        SpawnMob(Kf_Ghrah_WHM):updateClaim(player);
        SpawnMob(Kf_Ghrah_BLM):updateClaim(player);
    ]]

    if (GetMobAction(16921015) == ACTION_NONE) then
        if (trade:hasItemQty(1872,12) and trade:getItemCount() == 12) then
            GetMobByID(16921015):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());
            GetMobByID(16921016):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());
            GetMobByID(16921017):setSpawn(npc:getXPos(),npc:getYPos(),npc:getZPos());
            SpawnMob(16921015):updateClaim(player);
            SpawnMob(16921016):updateEnmity(player);
            SpawnMob(16921017):updateEnmity(player);
            player:tradeComplete();
        end
    end
end;

function onTrigger(player,npc)

    player:PrintToPlayer("Debug: Jailer of Fortitude (qm1.lua)");
end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
end;
