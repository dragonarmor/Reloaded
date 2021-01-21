---------------------------------------------------
-- Dissipation.lua
-- Dispels all buffs add terror effect
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobID = mob:getID();   --(16908295 ,16908302 ,16908309 =omega ,          16928966=proto-ultima   )
    local mobhp = mob:getHPP();
    if (mobID == 16928966) then
        if (mobhp > 40) then
            return 0;
        end
    end
    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_TERROR;
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 10);

    local count = target:dispelAllStatusEffect();

    if (count == 0) then
        skill:setMsg(msgBasic.NO_EFFECT);
    else
        skill:setMsg(msgBasic.DISAPPEAR_NUM);
    end

    return count;
end
