-----------------------------------------
-- Spell: Shellra IV
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 22;
    local duration = 1800;

    duration = calculateDurationForLvl(duration, 68, target:getMainLvl());

    local typeEffect = EFFECT_SHELL;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;