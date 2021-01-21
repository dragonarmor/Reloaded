---------------------------------------------------
-- Binary Absorption
-- Steals hp
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    -- time to drain HP. 100-200
    local power = math.random(0, 101) + 100;
    local dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);

    skill:setMsg(msgBasic.DRAIN_HP);

    if (MobPhysicalHit(skill, 0, 0, 0)) then
        target:delHP(dmg);
        mob:addHP(dmg);
    end

    return dmg;
end;
