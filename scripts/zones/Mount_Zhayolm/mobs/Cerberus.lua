-----------------------------------
-- Area: Mount Zhayolm
--  NM:  Cerberus
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/custom_trials");
-----------------------------------

function onMobInitialize(mob)
    -- addMod
    mob:addMod(MOD_MATT,75);
    mob:addMod(MOD_MACC,200);
    mob:addMod(MOD_ACC,250);
    mob:addMod(MOD_ATT,50);
    mob:addMod(MOD_DEF,50);
end;

function onMobSpawn(mob)
end;

function onMobFight(mob, target)
    if (mob:getHPP() > 25) then
        mob:setMod(MOD_REGAIN, 10)
    else
        mob:setMod(MOD_REGAIN, 70)
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(CERBERUS_MUZZLER);

    ------------------------------------
    -- Begin Custom Legion Code
    ------------------------------------

    if (isKiller == true) then
        local RND = math.random(1,1000);
        if (RND <= 100) then -- 10%
            player:addTreasure(10954, mob); -- Alchemist's Torque
        elseif (RND <= 300) then -- 20%
            player:addTreasure(20905, mob); -- Qalgwer
        else
            player:addTreasure(4023, mob); -- Snowsteel Ore
            player:addTreasure(4023, mob); -- Snowsteel Ore
        end
    end

    -- Custom Trial Check
    cTrialProgress(player, 3, "mythic");

    ------------------------------------
    -- End Custom Legion Code
    ------------------------------------

end;

function onMobDespawn(mob)
    --[[
    mob:setRespawnTime((math.random(0,24)*3600)+172800); -- 48-72 hours proper 1 hour windows
    ]]
    mob:setRespawnTime((math.random(21,36)*3600)+0); -- 21-36 hours proper 1 hour windows

end;