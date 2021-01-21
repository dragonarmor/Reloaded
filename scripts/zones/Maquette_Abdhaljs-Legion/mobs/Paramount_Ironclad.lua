-----------------------------------
-- Area: Legion
-- Paramount_Ironclad
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_SIGHT_RANGE, 20);
    mob:setMobMod(MOBMOD_SOUND_RANGE, 20);
    mob:setMobMod(MOBMOD_HP_STANDBACK, 0);

    -- setMod
    mob:setMod(MOD_MACC,1425); -- Todo: convert to proper amount of addMod..
    mob:setMod(MOD_MATT,120);  -- Todo: convert to proper amount of addMod..

    -- addMod
    mob:addMod(MOD_DOUBLE_ATTACK, 15);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 30);
    mob:setMod(MOD_REGAIN, 15);
    mob:setMod(MOD_HASTE_ABILITY, 15);
    mob:setMod(MOD_COUNTER, 15);
    mob:setMod(MOD_STUNRES, 33);
    mob:setMod(MOD_TERRORRES, 90);

    mob:SetMobSkillAttack(4167); -- Enable Special Animation for melee attacks.
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local did2hr = mob:getLocalVar("did2hr");

    if (mob:hasStatusEffect(EFFECT_HUNDRED_FISTS)) then
        mob:SetMobSkillAttack(0); -- Can't Hundred Fists w/special melee
    else
        mob:SetMobSkillAttack(4167); -- Can't Hundred Fists w/special melee
    end

    if (mob:getHPP() <= 10 and did2hr == 2) then
        mob:useMobAbility(690); -- HUNDRED FISTS
        mob:setLocalVar("did2hr", 3);
    elseif (mob:getHPP() <= 30 and did2hr == 1) then
        mob:useMobAbility(688); -- MIGHTY STRIKES
        mob:setLocalVar("did2hr", 2);
    elseif (mob:getHPP() <= 70 and did2hr == 0) then
        mob:useMobAbility(690); -- HUNDRED FISTS
        mob:setLocalVar("did2hr", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addCurrency("legion_point", 200);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local popBoss = true;
    local MobIDs =
    {
        17526851, -- Paramount Naraka
        17526852, -- Paramount Harpeia
        17526853 -- Paramount Mantis
        -- 17526854  -- Paramount Ironclad
    };

    for deezNuts, ID in pairs(MobIDs) do
        if (GetMobAction(ID) ~= ACTION_NONE and GetMobAction(ID) ~= ACTION_SPAWN) then
            popBoss = false;
        end
    end

    if (popBoss == true) then
        SpawnMob(17527794); -- Auspicious_Entity : 2hr reset
        SpawnMob(17526855); -- Paramount Gallu
        SpawnMob(17526856); -- Paramount Botulus
    end
end;
