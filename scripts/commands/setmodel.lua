---------------------------------------------------------------------------------------------------
-- func: !setmodel <model ID>
-- desc: set appearance of targeted entity
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, model)
  if (player:getzoneID() == 49) then
    local target == player:getCursorTarget();
    if (target == nil) then
        player:PrintToPlayer("Must target with cursor first!");
        return;
    end
    target:setModelId(model);
  end
end;
