---------------------------------------------
-- Erratic Flutter
--
-- Description: Deals Fire damage around the caster. Grants the effect of Haste.
-- Family: Wamoura
-- Monipulators: Wamoura (MON), Coral Wamoura (MON)
-- Level (Monstrosity): 60
-- TP Cost (Monstrosity): 1500 TP
-- Type: Enhancing
-- Element: Fire
-- Can be dispelled: Yes
-- Notes:
-- Blue magic version is 307/1024 haste for 5 minutes. Wamaora haste is presumed identical.
-- Wamoura version also deals Fire damage to targets around the wamoura.
-- While it does not overwrite most forms of Slowga, Slow II, Slow II TP moves,
-- Erratic Flutter does overwrite Hojo: Ni, Hojo: Ichi, and Slow.
-- Player Blue magic version is wind element instead of fire.
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.5,ELE_FIRE,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

    mob:addStatusEffect(EFFECT_HASTE,307,0,300); -- Checked in retail there is no message for the self buff aspect

    target:delHP(dmg);
    return dmg;
end;