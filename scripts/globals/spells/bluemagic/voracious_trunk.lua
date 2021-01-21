-----------------------------------------
-- Spell: Voracious Trunk
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.effect = EFFECT_NONE;
    local resist = applyResistance(caster, target, spell, params);

    if (resist > 0.0625) then
        spell:setMsg(msgBasic.MAGIC_ERASE);
        effect = target:dispelStatusEffect();
        if (effect == EFFECT_NONE) then
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return effect;
end;