-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Brass Borer
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/custom_trials");
-- TODO: Damage resistances in streched and curled stances. Halting movement during stance change.

function onMobSpawn(mob)
    mob:setLocalVar("formTime", os.time() + math.random(43,47));
end;

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("formTime");
    if (mob:AnimationSub() == 0 and os.time() > roamTime) then
        mob:AnimationSub(1);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    elseif (mob:AnimationSub() == 1 and os.time() > roamTime) then
        mob:AnimationSub(0);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    end
end;

function onMobFight(mob,target)
    local fightTime = mob:getLocalVar("formTime");
    if (mob:AnimationSub() == 0 and os.time() > fightTime) then
        mob:AnimationSub(1);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    elseif (mob:AnimationSub() == 1 and os.time() > fightTime) then
        mob:AnimationSub(0);
        mob:setLocalVar("formTime", os.time() + math.random(43,47));
    end
end;

function onMobDeath(mob, player, isKiller)

    ------------------------------------
    -- Begin Custom Legion Code
    ------------------------------------

    -- Custom Trial Check
    cTrialProgress(player, 1, "mythic");

    ------------------------------------
    -- End Custom Legion Code
    ------------------------------------
end;