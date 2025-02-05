-----------------------------------
--
-- Zone: PsoXja (9)
--
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/PsoXja/TextIDs");
require("scripts/zones/PsoXja/MobIDs");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,  -21.469, 27,  -24.255,  -18.723, 32,  -19.877); -- 40 cap (H-8 Tower)
    zone:registerRegion(2,  337.376, 27,  -19.836,  342.340, 32,  -16.055); -- 50 cap area (J-8 Tower)
    zone:registerRegion(3,   95.659, 42, -302.390,   99.973, 48, -297.744); -- 60 cap area (H-10 Tower)
    zone:registerRegion(4, -384.452, 26,  257.961, -379.945, 32,  262.558); -- Uncapped area 1 (F-7 Tower)
    zone:registerRegion(5, -302.493, 42, -179.995, -297.386, 48, -176.078); -- Uncapped area 2 (G-9 Tower)
    zone:registerRegion(6,  299.847, 42,  257.716,  303.824, 48,  262.391); -- Uncapped area 3 (I-7 Tower)

    --[[ Begin workarounds for easily broken elevators
    zone:registerRegion(7, -20, 9, 20, 0, 0, 0); -- Elevator to/from Diablos
    zone:registerRegion(8, -340, 10, 340, 0, 0, 0); -- Elevator to/from Promy 
    zone:registerRegion(9, -300, 10, 340, 0, 0, 0); -- Elevator to/from ?
    zone:registerRegion(10, 300, 10, -60, 0, 0, 0); -- Elevator to/from Tenzen's Path Avatar Gate (A)
    zone:registerRegion(11, -340, 10, -220, 0, 0, 0); -- Elevator to/from Avatar Gate (B)
    zone:registerRegion(12, 260, 10, 300, 0, 0, 0); -- Elevator to/from Avatar Gate (C)
    zone:registerRegion(13, 140, 10, -340, 0, 0, 0); -- Elevator to/from Avatar Gate (D)
    ]]-- End workarounds for easily broken elevators

    UpdateTreasureSpawnPoint(PSO_XJA_TREASURE_CHEST);
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-29.956,-1.903,212.521,188);
    end

    if (player:getXPos() == -300 and player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus") == 2) then
        cs = 1; -- COP event
    elseif (player:getXPos() == 220 and player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 8) then
        cs = 4;
    end

    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("brmp");
    player:entityVisualPacket("lirp");
    player:entityVisualPacket("kil1");
    player:entityVisualPacket("kil2");
    player:entityVisualPacket("kil3");
    player:entityVisualPacket("saa1");
    player:entityVisualPacket("saa2");
    player:entityVisualPacket("saa3");
    player:entityVisualPacket("byc1");
    player:entityVisualPacket("byc2");
    player:entityVisualPacket("byc3");
    player:entityVisualPacket("byc4");
    player:entityVisualPacket("byc5");
    player:entityVisualPacket("byc6");
    player:entityVisualPacket("byc7");
    player:entityVisualPacket("byc8");
    player:entityVisualPacket("s123");

    -- ZONE WIDE LEVEL RESTRICTION
    if (ENABLE_COP_ZONE_CAP == 1) then
        local LVLcap = player:getVar("PSOXJA_RESTRICTION_LVL");
        if (LVLcap > 0) then -- LV cap depends on entrance
            player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,LVLcap,0,0);
        end
    end
end;

function onRegionEnter(player,region)



  --[[ If elevators break, incomment all this, leave DSP's code in the final "else" statement
  if (region:GetRegionID() == 7) then -- Diablos Elevator
      if (player:getYPos() < 1) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(-20, 31, 33, 192);
      elseif (player:getYPos() > 29 and player:getYPos() < 33) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(-28, -1, 20, 128);
      else
          player:PrintToPlayer("ERROR! Report Diablos elevator bug please!");
      end
  elseif (region:GetRegionID() == 8) then -- Promy Vahzl Elevator
      if (player:getYPos() < 2) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(-348, 48, 340, 128);
      elseif (player:getYPos() > 46 and player:getYPos() < 50) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(-340, -0.5, 332, 64);
      else
          player:PrintToPlayer("ERROR! Report Promy-Vahzl elevator bug please!");
      end
  elseif (region:GetRegionID() == 9) then -- ? Elevator
      if (player:getYPos() < 2) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(-290, 48, 340, 128);
      elseif (player:getYPos() > 46 and player:getYPos() < 50) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(-300, -0.5, 332, 64);
      else
          player:PrintToPlayer("ERROR! Report Pso'Xja elevator bug please!");
      end
  elseif (region:GetRegionID() == 10) then -- Tenzen's Path Avatar Gate (A) Elevator
      if (player:getYPos() < 2) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(292, 32, -60, 128);
      elseif (player:getYPos() > 30 and player:getYPos() < 34) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(300, -0.5, -50, 192);
      else
          player:PrintToPlayer("ERROR! Report Tenzen's Path Avatar Gate (A) elevator bug please!");
      end
  elseif (region:GetRegionID() == 11) then -- Avatar Gate (B) Elevator
      if (player:getYPos() < 2) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(-348, 48, -220, 128);
      elseif (player:getYPos() > 46 and player:getYPos() < 50) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(-340, -0.5, -210, 192);
      else
          player:PrintToPlayer("ERROR! Report Avatar Gate (B) elevator bug please!");
      end
  elseif (region:GetRegionID() == 12) then -- Avatar Gate (C) Elevator
      if (player:getYPos() > 13 and player:getYPos() < 17) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(260, 48, 308, 192);
      elseif (player:getYPos() > 40) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(250, 15.5, 300, 128);
      else
          player:PrintToPlayer("ERROR! Report Avatar Gate (C) elevator bug please!");
      end
  elseif (region:GetRegionID() == 13) then -- Avatar Gate (D) Elevator
      if (player:getYPos() > 13 and player:getYPos() < 17) then
          -- player:PrintToPlayer("Going down!");
          player:setPos(140, 48, -348, 64);
      elseif (player:getYPos() > 46 and player:getYPos() < 50) then
          -- player:PrintToPlayer("Going up!");
          player:setPos(140, 15.5, -348, 64);
      else
          player:PrintToPlayer("ERROR! Report Avatar Gate (D) elevator bug please!");
      end
  else
  ]]


    player:startEvent(19 + region:GetRegionID());
  --[[
  end
  ]]
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1) then
        player:setVar("PromathiaStatus",3);
    elseif (csid == 4) then
        player:setVar("COP_Tenzen_s_Path",9);
    elseif (csid == 20 and option == 1) then
        player:setPos(-20,-60.250,-60,63,111);
    elseif (csid == 21 and option == 1) then
        player:setPos(260,-0.25,-20,254,111);
    elseif (csid == 22 and option == 1) then
        player:setPos(60,-0.250,-340.000,190,111);
    elseif (csid == 23 and option == 1) then
        player:setPos(-340,-100.250,140,63,111);
    elseif (csid == 24 and option == 1) then
        player:setPos(-180,-40.25 ,-220,0,111);
    elseif (csid == 25 and option == 1) then
        player:setPos(100,-20.25,140,64,111);
    end
end;
