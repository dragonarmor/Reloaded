---------------------------------------------------------------------------------------------------
-- func: pardon
-- desc: Pardons a player from jail. (Mordion Gaol)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid player name.");
        return;
    end

    -- Validate the target..
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) );
        return;
    end

    if (targ:getVar( 'inJail' ) >= 1) then
        local dateStamp = os.date("%d/%m/%Y");
        local timeStamp = os.date("%I:%M:%S %p");
        local file = io.open("log/commands/pardon.log", "a");
        file:write(
        "----------------------------------------",
        "\n", "Date: ".. dateStamp,
        "\n", "Time: ".. timeStamp,
        "\n", "User: ".. player:getName(),
        "\n", "Target: ".. targ:getName(),
        "\n",
        "\n" -- This MUST be final line.
        );
        file:close();

        local message = string.format( '%s is pardoning %s from jail.', player:getName(), targ:getName() );
        printf( message );

        targ:setVar( 'inJail', 0 );
        targ:warp();
    end
end