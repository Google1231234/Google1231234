local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function createESP(character)
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Adornee = character
    espBox.Size = character.Size + Vector3.new(0.1, 0.1, 0.1)
    espBox.Color3 = Color3.fromRGB(255, 0, 0) -- R, G, B values for the color
    espBox.Transparency = 0.5
    espBox.AlwaysOnTop = true
    espBox.ZIndex = 5
    espBox.Parent = character
end

-- Function to add ESP to all players in the game
local function addESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                createESP(character)
            end
        end
    end
end

-- Add ESP to existing players and listen for new players
addESP()
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createESP(character)
    end)
end)
