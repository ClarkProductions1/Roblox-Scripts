local DataStoreService = game:GetService("DataStoreService")
local PLAYER_DATA_STORE = "PlayerData" -- Name of the data store

-- Function to save player data
local function savePlayerData(player)
    local playerDataStore = DataStoreService:GetDataStore(PLAYER_DATA_STORE)
    local key = "Player_" .. player.UserId -- Unique key for the player's data

    -- Example player data to save (can be customized)
    local data = {
        Coins = 0,
        Level = 1,
        -- Add more player data fields as needed
    }

    -- Save player data to the data store
    local success, error = pcall(function()
        playerDataStore:SetAsync(key, data)
    end)

    if not success then
        warn("Failed to save player data for " .. player.Name .. ": " .. error)
    end
end

-- Function to load player data
local function loadPlayerData(player)
    local playerDataStore = DataStoreService:GetDataStore(PLAYER_DATA_STORE)
    local key = "Player_" .. player.UserId -- Unique key for the player's data

    -- Load player data from the data store
    local success, data = pcall(function()
        return playerDataStore:GetAsync(key)
    end)

    if success then
        -- Data loaded successfully
        return data
    else
        warn("Failed to load player data for " .. player.Name .. ": " .. data)
        return nil
    end
end

-- Example usage: saving and loading player data when they join the game
game.Players.PlayerAdded:Connect(function(player)
    -- Save player data when they join
    savePlayerData(player)

    -- Load player data when they join
    local playerData = loadPlayerData(player)
    if playerData then
        -- Example: Print loaded player data
        print(player.Name .. "'s data loaded:")
        for key, value in pairs(playerData) do
            print(key, "=", value)
        end
    else
        warn("Failed to load data for " .. player.Name)
    end
end)
