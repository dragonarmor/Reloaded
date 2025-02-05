---------------------------------------------------------------------------------------------------
-- func: spawnmob
-- desc: Spawns a mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "iii"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!spawnmob <mob ID> {despawntime} {respawntime}");
end;

function onTrigger(player, mobId, despawntime, respawntime)

    -- validate mobId
    if (mobId == nil) then
        error(player, "You must provide a mob ID.");
        return;
    end
    local targ = GetMobByID(mobId);
    if (targ == nil) then
        error(player, "Invalid mob ID.");
        return;
    end

    -- validate despawntime
    if (despawntime ~= nil and despawntime < 0) then
        error(player, "Invalid despawn time.");
        return;
    end

    -- validate respawntime
    if (respawntime ~= nil and respawntime < 0) then
        error(player, "Invalid respawn time.");
        return;
    end

    SpawnMob( targ:getID(), despawntime, respawntime );
    player:PrintToPlayer( string.format("Spawned %s %s.", targ:getName(), targ:getID()) );

    -- Log it
    local dateStamp = os.date("%d/%m/%Y");
    local timeStamp = os.date("%I:%M:%S %p");
    local file = io.open("log/commands/spawnmob.log", "a");
    file:write(
    "----------------------------------------",
    "\n", "Date: ".. dateStamp,
    "\n", "Time: ".. timeStamp,
    "\n", "User: ".. player:getName(),
    "\n", "Mob ID: ".. mobId,
    "\n",
    "\n" -- This MUST be final line.
    );
    file:close();
end