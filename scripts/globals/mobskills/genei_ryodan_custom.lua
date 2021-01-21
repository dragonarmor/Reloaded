---------------------------------------------
--  Tropic_Tenor
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1;
    local accmod = 10;
    local dmgmod = 2;
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);
    local dispel =  target:dispelAllStatusEffect(bit.bor(EFFECTFLAG_DISPELABLE, EFFECTFLAG_FOOD));

    MobStatusEffectMove(mob, target, EFFECT_STUN, 10, 0, 5);

    target:delHP(dmg);
    return dmg;
end;


