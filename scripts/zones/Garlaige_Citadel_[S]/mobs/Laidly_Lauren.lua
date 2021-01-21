-----------------------------------
-- Area: Garlaige Citadel [S]
-- VWNM: Laidly Laurence
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Garlaige_Citadel_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/quests");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 100);
    mob:setMod(MOD_MACC,1950); -- Todo: convert to correct amount of AddMod
    mob:setMod(MOD_MATT,125);  -- Todo: convert to correct amount of AddMod
    mob:setMod(MOD_ACC,1950);  -- Todo: convert to correct amount of AddMod

    -- addMod
    mob:addMod(MOD_ATT,250);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- var
    -- mob:setLocalVar("depopTime", os.time(t) + 1800);  -- despawn in 30 min

    local RND1 = math.random(1,8);
    if (RND1 == 1) then
        SetDropRate(9627,0,8919,50); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 2) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,50); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 3) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,50); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 4) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,50); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 5) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,50); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 6) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,50); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 7) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,50); -- Carbutear
        SetDropRate(9627,0,8926,0); -- Fenritear
    elseif (RND1 == 8) then
        SetDropRate(9627,0,8919,0); -- Ifritear
        SetDropRate(9627,0,8920,0); -- Leviatear
        SetDropRate(9627,0,8921,0); -- Ramutear
        SetDropRate(9627,0,8922,0); -- Garutear
        SetDropRate(9627,0,8923,0); -- Titatear
        SetDropRate(9627,0,8924,0); -- Shivatear
        SetDropRate(9627,0,8925,0); -- Carbutear
        SetDropRate(9627,0,8926,50); -- Fenritear
    end

end;

-----------------------------------
-- onMobEngage Action
-----------------------------------

function onMobEngaged(mob, target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(WHITE_STRATUM_ABYSSITE_II)) then -- Laidly Laurence Kill
        if (player:getMaskBit(player:getVar("WHITE_STRATUM_II"), 1) == false) then
            player:setMaskBit(player:getVar("WHITE_STRATUM_II"),"WHITE_STRATUM_II",1,true);
        end

        if (player:getQuestStatus(CRYSTAL_WAR, BATTLE_ON_A_NEW_FRONT) == QUEST_COMPLETED) then
            if (player:isMaskFull(player:getVar("WHITE_STRATUM_II"),6) == true) then
                player:addKeyItem(WHITE_STRATUM_ABYSSITE_III);
                player:delKeyItem(WHITE_STRATUM_ABYSSITE_II);
                player:setVar("WHITE_STRATUM_II", 0);
            end
        end
    end

    player:addCurrency("bayld", 200);
    player:addExp(3000);
end;