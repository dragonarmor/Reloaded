---------------------------------------------
-- Crashing Thunder
-- Hurkan
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_SHOCK;
    local dmgmod = 1.5;
    skill:setMsg(MobGazeMove(mob, target, typeEffect, 100, 0, 90));

    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 4,ELE_THUNDER,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_THUNDER,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
