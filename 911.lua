-- Created by Clark Productions 2024 --
-- Function to handle the /911 command
local function handle911Command(player, location, emergencyType)
    -- Example: Display a message in the console
    print(player.Name .. " called 911 for " .. emergencyType .. " at " .. location)

    -- Example: Display a popup GUI to the player
    local popup = Instance.new("ScreenGui")
    popup.Parent = player.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BorderSizePixel = 5
    frame.Parent = popup

    local locationLabel = Instance.new("TextLabel")
    locationLabel.Size = UDim2.new(1, 0, 0.2, 0)
    locationLabel.Position = UDim2.new(0, 0, 0, 0)
    locationLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    locationLabel.Text = "Location: " .. location
    locationLabel.Parent = frame

    local emergencyTypeLabel = Instance.new("TextLabel")
    emergencyTypeLabel.Size = UDim2.new(1, 0, 0.2, 0)
    emergencyTypeLabel.Position = UDim2.new(0, 0, 0.2, 0)
    emergencyTypeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    emergencyTypeLabel.Text = "Emergency Type: " .. emergencyType
    emergencyTypeLabel.Parent = frame

    -- You can customize the popup GUI to fit your game's style

    -- Example: Notify all admins about the emergency
    for _, admin in ipairs(game.Players:GetPlayers()) do
        if admin:IsAdmin() then
            admin:Kick("Emergency call from " .. player.Name .. ": " .. emergencyType .. " at " .. location)
            -- You can also send a message to admins or perform other actions
        end
    end
end

-- Register the /911 command
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        if message:sub(1, 5) == "/911 " then
            -- Extract location and emergency type from the message
            local _, _, location, emergencyType = message:find("/911%s+(.+)%s+(.+)")
            if location and emergencyType then
                handle911Command(player, location, emergencyType)
            else
                -- Notify the player if the command format is incorrect
                player:SendChatMessage("Usage: /911 <location> <emergency type>", "All")
            end
        end
    end)
end)
