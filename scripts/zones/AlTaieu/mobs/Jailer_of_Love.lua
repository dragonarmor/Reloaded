-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Love
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_MDEF,100);
    mob:addMod(MOD_DEF,130);
    mob:addMod(MOD_ATT,100);
    mob:addMod(MOD_ACC,100);
end;

function onMobSpawn(mob)
    mob:setMod(MOD_REGEN, 250);
    mob:setMod(MOD_REFRESH, 250);
    mob:setMod(MOD_REGAIN, 10);
    mob:setMod(MOD_HASTE_ABILITY, 20);
    mob:setMod(MOD_UFASTCAST, 65);
    mob:setMod(MOD_MACC,925);
    mob:setMod(MOD_MATT,100);

    -- mob:hideName(true);
    -- mob:untargetable(true);
    mob:AnimationSub(5);
    mob:wait(2000);
end;

function onMobEngaged(mob, target)
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
    mob:wait(2000);
end;

function onMobDisengage(mob)
    -- mob:hideName(true);
    -- mob:untargetable(true);
    mob:AnimationSub(5);
end;

function onMobFight(mob, target)
    -- Only 9 Qn'xzomit and 9 Qn'hpemde can be summoned. Ru'phuabo (Sharks) are unlimited.
    local XZOMITS = mob:getLocalVar("JoL_Qn_xzomit_Killed");
    local HPEMDES = mob:getLocalVar("JoL_Qn_hpemde_Killed");
    -- Increment these by 1 each time they are slain, in that mobs onMobDeath() script.
    if (mob:getLocalVar("JoL_Regen_Reduction") == 0) then
        if (mob:getLocalVar("JoL_Qn_xzomit_Killed") == 9
        and mob:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
            mob:setLocalVar("JoL_Regen_Reduction", 1);
            mob:addMod(MOD_REGEN, -260)
        end
    end

    local lastPop = mob:getLocalVar("pop_pets");
    if (os.time() - lastPop > 150) then
        local SPAWNS = mob:getLocalVar("SPAWNS");
        local phuabo1 = GetMobAction(16912849);
        local phuabo2 = GetMobAction(16912852);
        local phuabo3 = GetMobAction(16912855);

        if (SPAWNS == 0) then -- Spawns first 3 xzomit
            SpawnMob(16912858):updateEnmity(target);
            SpawnMob(16912859):updateEnmity(target);
            SpawnMob(16912860):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 1);
        elseif (SPAWNS == 1) then -- spawns first 3 hpemde
            SpawnMob(16912867):updateEnmity(target);
            SpawnMob(16912868):updateEnmity(target);
            SpawnMob(16912869):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 2);
        elseif (SPAWNS == 2) then -- spawns first 3 phuabo
            SpawnMob(16912849):updateEnmity(target);
            SpawnMob(16912850):updateEnmity(target);
            SpawnMob(16912851):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 3);
        elseif (SPAWNS == 3) then -- Spawns second 3 xzomit
            SpawnMob(16912861):updateEnmity(target);
            SpawnMob(16912862):updateEnmity(target);
            SpawnMob(16912863):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 4);
        elseif (SPAWNS == 4) then -- spawns second 3 hpemde
            SpawnMob(16912870):updateEnmity(target);
            SpawnMob(16912871):updateEnmity(target);
            SpawnMob(16912872):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 5);
        elseif (SPAWNS == 5) then -- spawns second 3 phuabo
            SpawnMob(16912852):updateEnmity(target);
            SpawnMob(16912853):updateEnmity(target);
            SpawnMob(16912854):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 6);
        elseif (SPAWNS == 6) then -- Spawns last 3 xzomit
            SpawnMob(16912864):updateEnmity(target);
            SpawnMob(16912865):updateEnmity(target);
            SpawnMob(16912866):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 7);
        elseif (SPAWNS == 7) then -- spawns last 3 hpemde
            SpawnMob(16912873):updateEnmity(target);
            SpawnMob(16912874):updateEnmity(target);
            SpawnMob(16912875):updateEnmity(target);
            mob:setLocalVar("pop_pets", os.time());
            mob:setLocalVar("SPAWNS", 8);
        elseif (SPAWNS >= 8) then -- switch to ONLY popping phuabo (still up to 3 at a time)
            if (phuabo1 == ACTION_NONE or phuabo1 == ACTION_SPAWN) then
                SpawnMob(16912849):updateEnmity(target);
                SpawnMob(16912850):updateEnmity(target);
                SpawnMob(16912851):updateEnmity(target);
                mob:setLocalVar("pop_pets", os.time());
            elseif (phuabo2 == ACTION_NONE or phuabo2 == ACTION_SPAWN) then
                SpawnMob(16912852):updateEnmity(target);
                SpawnMob(16912853):updateEnmity(target);
                SpawnMob(16912854):updateEnmity(target);
                mob:setLocalVar("pop_pets", os.time());
            elseif (phuabo3 == ACTION_NONE or phuabo3 == ACTION_SPAWN) then
                SpawnMob(16912855):updateEnmity(target);
                SpawnMob(16912856):updateEnmity(target);
                SpawnMob(16912857):updateEnmity(target);
                mob:setLocalVar("pop_pets", os.time());
            end
        end
    end
end;

function onMobDespawn(mob)
    --[[
    local AV_CHANCE = 25;
    if (AV_CHANCE > math.random(0,99)) then
        SpawnMob(16912876);
    end
    ]]
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller == true) then -- This check is to force this to only run once.
        --SpawnMob(16912876):updateClaim(player); -- Claim AV, begin death fest

        -- Get rid of JoL's adds.
        for helperId = mob:getID()+1, mob:getID()+27, 1 do
            GetMobByID(helperId):setHP(0); -- Just die already!
            -- DespawnMob(helperId);
        end
    end
end;
