-- Created by Clark Productions 2024 --
-- Anti-cheat script for detecting speed hacks

local MAX_SPEED = 50 -- Maximum allowed speed in studs per second
local CHECK_INTERVAL = 1 -- Interval in seconds to check player speed

local function checkSpeed(player)
    local character = player.Character
    if not character then return end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local velocity = humanoid.RootPart.Velocity
    local speed = velocity.magnitude

    if speed > MAX_SPEED then
        -- Detected speed hack, take action here (e.g., kick player, reset speed)
        print(player.Name .. " is moving too quickly!")

        -- Example action: Kick player
        player:Kick("Speed hack detected")

        -- You can add more severe actions like banning the player's account or logging the incident
    end
end

-- Check player speed periodically
while true do
    for _, player in ipairs(game.Players:GetPlayers()) do
        checkSpeed(player)
    end
    wait(CHECK_INTERVAL)
end
