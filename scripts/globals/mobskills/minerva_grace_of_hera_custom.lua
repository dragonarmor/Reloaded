---------------------------------------------
-- Grace of Hera (Minerva's custom version)
--
-- Grants custom Light Spikes effect,
-- removes a harmful status effect
-- or Minerva heals for 9999 HP
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local erase = mob:eraseStatusEffect();
    mob:addStatusEffect(EFFECT_REPRISAL, 10, 0, 600);

    if (mob:eraseStatusEffect() == EFFECT_NONE) then
        skill:setMsg(msgBasic.SELF_HEAL);
        return MobHealMove(mob, 9999);
    else
        skill:setMsg(msgBasic.DISAPPEAR);
        return erase
    end
end;
