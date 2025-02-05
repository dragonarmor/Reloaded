-----------------------------------------
--  ID: 4265
--  Item: Black Drop
--  Transports the user to their Home Point
-----------------------------------------
require("scripts/globals/conquest");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    --[[
    if (target:hasStatusEffect(EFFECT_MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    ]]
    return 0;
end;

function onItemUse(target)
    --[[
    target:addStatusEffect(EFFECT_MEDICINE,0,0,3600);
    target:warp();
    ]]
    toHomeNation(target);
end;