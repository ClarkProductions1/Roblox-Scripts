-- Created by Clark Productions 2024 --
local ADMIN_COMMANDS = {
    "kill",
    "godmode",
    "teleport",
    -- Add more admin commands here
}

local function checkAdminCommands(player, message)
    for _, command in ipairs(ADMIN_COMMANDS) do
        if string.find(message:lower(), "/" .. command) then
            -- Detected attempt to use admin command, take action here
            print(player.Name .. " attempted to use admin command: " .. command)

            -- Example action: Kick player
            player:Kick("Attempted unauthorized admin access")

            -- You can add more severe actions like banning the player's account or logging the incident
            break
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        checkAdminCommands(player, message)
    end)
end)
