---------------------------------------------------------------------------------------------------
-- Transports player to legion entry area
--
-- Legion
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = ""
};
function onTrigger(player)
    player:setPos(180, 11, -274, 192, 183);
end;