---------------------------------------------------------------------------------------------------
-- func: @sjboost
-- desc: Toggles alternate SJ cap of 2/3 instead of 1/2
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
};

function onTrigger(player,target)
    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        if (targ:hasStatusEffect(EFFECT_SJCAP_BOOST)) then
            targ:delStatusEffect(EFFECT_SJCAP_BOOST);
        else
            targ:addStatusEffectEx(EFFECT_SJCAP_BOOST,EFFECT_TRANSCENDENCY,1,0,0);
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end