-----------------------------------------
-- ID: 18152
-- Item: Venom Bolt
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (target:hasImmunity(256)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    elseif (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        if (not target:hasStatusEffect(EFFECT_POISON)) then
            target:addStatusEffect(EFFECT_POISON, 4, 3, 30);
        end
        return SUBEFFECT_POISON, msgBasic.ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;