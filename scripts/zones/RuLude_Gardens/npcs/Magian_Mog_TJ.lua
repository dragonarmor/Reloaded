-----------------------------------
-- Area: Rulude Gardens
--  NPC: Custom (Relic) Magian Moogle
-----------------------------------
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/custom_trials");
require("scripts/globals/msg");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local itemID = trade:getItem():getID();
    local itemCount = trade:getItemCount();
    local cTrial = player:getVar("cTrialItem[relic]");
    local cStatus = player:getVar("cTrialComplete[relic]");
    local itemInfo = custom_trials[itemID];
    local trialInfo = custom_trials[cTrial];
    -- Info.r, Info.s, Info.t, Info.trade, Info.count;

    -- Begin a new trial
    if (cTrial == 0 and cStatus == 0) then
        if (custom_trials[itemID] == nil) then -- Invalid
            player:PrintToPlayer("I don't have a trial to give you for that item, kupo.. ", chatType.SAY, npc:getName());
        else
            if (itemInfo.t ~= "relic") then
                player:PrintToPlayer("I only handle Relic Weapons, kupo.. ", chatType.SAY, npc:getName());
            elseif (itemInfo.s > 0) then
                if (itemInfo.s == 1) then
                    player:PrintToPlayer("Defeat any of these foes 9 times total..");
                    player:PrintToPlayer("Mischievous Micholas, Megalobugard, Dune Widow, Intulo, Keeper of Halidom..");
                elseif (itemInfo.s == 2) then
                    player:PrintToPlayer("Defeat any of these foes 9 times total..");
                    player:PrintToPlayer("Adamantoise.. Behemoth.. Fafnir..");
                elseif (itemInfo.s == 3) then
                    player:PrintToPlayer("Defeat any of these foes 9 times total..");
                    player:PrintToPlayer("Aspidochelone, King Behemoth, Nidhogg..");
                elseif (itemInfo.s == 4) then
                    player:PrintToPlayer("Deliver 50 Tanzenite Jewels to Magian Mog T.J.");
                end
                player:setVar("cTrialItem[relic]", itemID); -- Sets new trial.
                player:injectActionPacket(6, 203, 0, 0, 0);
                player:PrintToPlayer("Use '$trial' to review your progress! ", chatType.SAY, npc:getName());

                -- Log it..
                local logNfo = custom_trials[itemID];
                local dateStamp = os.date("%d/%m/%Y");
                local timeStamp = os.date("%I:%M:%S %p");
                local file = io.open("log/custom_trials/".. player:getName().. ".log", "a");
                file:write(
                "\n", "----------------------------------------",
                "\n", "** Trial started **",
                "\n", "Trial: ".. cTrial,
                "\n", "Date: ".. dateStamp,
                "\n", "Time: ".. timeStamp,
                "\n", "Traded item: ".. itemID,
                "\n", "Traded item count: ".. itemCount,
                "\n", "Trial reward item: ".. logNfo.r,
                "\n", "Trial type: ".. logNfo.t,
                "\n", "Trial Stage: ".. logNfo.s,
                "\n" -- This MUST be final line.
                );
                file:close();
                -- End logging
            end
        end

    -- Stage 4 Relic weapon Tanzenites.
    -- For now this requires all the items to be traded at once.
    elseif (trade:hasItemQty(trialInfo.trade, trialInfo.count) and itemCount == trialInfo.count) then
        -- player:setVar("cTrialCount[relic]", player:getVar("cTrialCount[mythic]")+1);
        player:tradeComplete(trade);
        player:setVar("cTrialComplete[relic]", 1);
        player:PrintToPlayer("C.J. thinks he's so cool.. ", chatType.SAY, npc:getName());
        player:PrintToPlayer("Oh, you finished your trial? Show me the weapon, kupo. ", chatType.SAY, npc:getName());

    -- Completed trial, trade for upgrade
    elseif (trade:hasItemQty(cTrial, 1) and cStatus == 1 and itemCount == 1) then
        player:injectActionPacket(6, 206, 0, 0, 0);
        player:PrintToPlayer("This ought to put some spark into it..KUPOW! ", chatType.SAY, npc:getName());
        player:injectActionPacket(6, 205, 0, 0, 0);
        cTrialEnd(player, "relic");

        -- Log it..
        local dateStamp = os.date("%d/%m/%Y");
        local timeStamp = os.date("%I:%M:%S %p");
        local file = io.open("log/custom_trials/".. player:getName().. ".log", "a");
        file:write(
        "\n", "----------------------------------------",
        "\n", "** Trial completed **",
        "\n", "Trial: ".. cTrial,
        "\n", "Date: ".. dateStamp,
        "\n", "Time: ".. timeStamp,
        "\n", "Traded item: ".. itemID,
        "\n", "Traded item count: ".. itemCount,
        "\n", "Trial reward item: ".. trialInfo.r,
        "\n", "Trial type: ".. trialInfo.t,
        "\n", "Trial Stage: ".. trialInfo.s,
        "\n" -- This MUST be final line.
        );
        file:close();
        -- End logging

    -- Cancel a trial
    elseif (trade:hasItemQty(2184,1) and cStatus == 0 and itemCount == 1 and cTrial > 0) then
        player:setVar("cTrialItem[relic]", 0);
        player:setVar("cTrialCount[relic]", 0);
        player:tradeComplete();
        player:PrintToPlayer("Thats a shame..Well, your Relic trial has been canceled. ", chatType.SAY, npc:getName());
        player:PrintToPlayer("You can now begin a new trial, if you so choose. ", chatType.SAY, npc:getName());

    -- Other
    else -- Trading anything other than expected during an active trial triggers this.
        if (cTrial > 0) then
            player:PrintToPlayer("If you wish to cancel your Relic trial.. ", chatType.SAY, npc:getName());
            player:PrintToPlayer("The fee for wasting our time is: ", chatType.SAY, npc:getName());
            player:PrintToPlayer("1 Imperial Bronze Piece. ", chatType.SAY, npc:getName());
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local cTrial = player:getVar("cTrialItem[relic]");
    local cStatus = player:getVar("cTrialComplete[relic]");
    if (cTrial == 0) then
        player:PrintToPlayer("Hand me a RELIC weapon to begin a trial, Kupo! ", chatType.SAY, npc:getName());
    elseif (cStatus > 0 and cTrial > 0) then
        player:PrintToPlayer("C.J. thinks he's so cool.. ", chatType.SAY, npc:getName());
        player:PrintToPlayer("Oh, you finished your trial? Show me the weapon, kupo. ", chatType.SAY, npc:getName());
    elseif (cStatus == 0 and cTrial > 0) then
        player:PrintToPlayer("If you wish to cancel your current trial.. ", chatType.SAY, npc:getName());
        player:PrintToPlayer("The fee for wasting my time is: ", chatType.SAY, npc:getName());
        player:PrintToPlayer("1 Imperial Bronze Piece. ", chatType.SAY, npc:getName());
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("finishRESULT: %u",option);
end;
