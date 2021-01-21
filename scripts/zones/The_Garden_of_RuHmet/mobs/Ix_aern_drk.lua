-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Ix'aern (drk)
-- !pos -240 5.00 440 35
-- !pos -280 5.00 240 35
-- !pos -560 5.00 239 35
-- !pos -600 5.00 440 35
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");
-----------------------------------

function onMobInitialize(mob)
    mob:addListener("DEATH", "AERN_DEATH", function(mob)
        local timesReraised = mob:getLocalVar("AERN_RERAISES");
        if(math.random (1,10) < 10) then
            -- reraise
            local target = mob:getTarget();
            local targetid = 0;
            if target then
                targetid = target:getShortID();
            end;
            mob:setMobMod(MOBMOD_NO_DROPS, 1);
            mob:timer(9000, function(mob)
                mob:setHP(mob:getMaxHP());
                mob:AnimationSub(3);
                mob:resetAI();
                mob:stun(3000);
                local new_target = mob:getEntity(targetid);
                if new_target and mob:checkDistance(new_target) < 40 then
                    mob:updateClaim(new_target);
                    mob:updateEnmity(new_target);
                end;
                mob:triggerListener("AERN_RERAISE", mob, timesReraised)
            end)
        else
            -- death
            mob:setMobMod(MOBMOD_NO_DROPS, 0);
            DespawnMob(QnAernA);
            DespawnMob(QnAernB);
        end
    end)
    mob:addListener("AERN_RERAISE", "IX_DRK_RERAISE", function(mob, timesReraised)
        mob:setLocalVar("AERN_RERAISES", timesReraised + 1);
        mob:setLocalVar("bloodMode", 0);
        mob:setLocalVar("bloodTime", os.time() + 120);
        mob:timer(5000, function(mob)
            mob:AnimationSub(1);
        end)
    end)

    -- addMod
    mob:addMod(MOD_MDEF,50);
    mob:addMod(MOD_DEF,100);
    mob:addMod(MOD_ATT,75);
end;

function onMobSpawn(mob)
    mob:AnimationSub(1);
    --[[
    mob:setMobMod(MOBMOD_SCRIPTED_2HOUR,1);

    -- drops either vice or deed
    if (math.random(0,100) <= 25) then
        SetDropRate(4397,1902,1000); -- Vice of Avarice
        SetDropRate(4397,1854,0);
    else
        SetDropRate(4397,1902,0);
        SetDropRate(4397,1854,1000); -- Deed of Moderation
    end
    ]]

    -- setMod
    mob:setMod(MOD_REGEN, 150);
    mob:setMod(MOD_REFRESH, 100);
    mob:setMod(MOD_REGAIN, 10);
    mob:setMod(MOD_HASTE_ABILITY, 20);
    mob:setMod(MOD_UFASTCAST, 75);
    mob:setMod(MOD_MACC,925);
    mob:setMod(MOD_MATT,100);
    mob:setMod(MOD_DOUBLE_ATTACK, 15);
end;

function onMobEngaged(mob)
    mob:setLocalVar("bloodMode", 0);
    mob:setLocalVar("bloodTime", os.time() + 120);
end;

function onMobFight(mob, target)

    -- blood weapon (uses every 2 minutes, lasts 30 seconds)
    if (os.time() > mob:getLocalVar("bloodTime")) then
        if (mob:getLocalVar("bloodMode") == 0) then
            mob:setLocalVar("bloodMode", 1);
            mob:setLocalVar("bloodTime", os.time() + 30);
            mob:SetMagicCastingEnabled(false);
            mob:useMobAbility(2249);
        else
            mob:setLocalVar("bloodMode", 0);
            mob:setLocalVar("bloodTime", os.time() + 120);
            mob:SetMagicCastingEnabled(true);
        end;
    end

end;

function onMobDeath(mob, player, isKiller)
    if (isKiller == true) then
        if (math.random(1,100) <= 80) then
            player:addTreasure(1854, mob); -- Deed of Moderation
        else
            player:addTreasure(1902, mob); -- Vice of Avarice (Altruistic Cape)
        end
    end
end;

function onMobDespawn(mob)
    mob:setLocalVar("AERN_RERAISES",0);
    GetNPCByID(Ix_Aern_DRK_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;