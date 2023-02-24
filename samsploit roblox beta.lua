local samhub = Instance.new("ScreenGui")
samhub.Name = "SamHub"
samhub.DisplayOrder = 10000
samhub.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Position = UDim2.new(0, 100, 0, 100)
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BorderSizePixel = 0
mainFrame.Draggable = true
mainFrame.Parent = samhub

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Samsploit roblox beta"
title.TextColor3 = Color3.new(1, 0, 0)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

local espButton = Instance.new("TextButton")
espButton.Name = "ESPButton"
espButton.Size = UDim2.new(0, 100, 0, 50)
espButton.Position = UDim2.new(0, 10, 0, 40)
espButton.BackgroundColor3 = Color3.new(1, 1, 1)
espButton.Text = "ESP"
espButton.TextColor3 = Color3.new(1, 0, 0)
espButton.TextSize = 18
espButton.Font = Enum.Font.SourceSansBold
espButton.Parent = mainFrame

local function outlinePlayers()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer then
            for _, character in pairs(player.Character:GetDescendants()) do
                if character:IsA("BasePart") then
                    local outline = Instance.new("BoxHandleAdornment")
                    outline.Color3 = Color3.new(1, 0, 0)
                    outline.AlwaysOnTop = true
                    outline.Transparency = 0.5
                    outline.ZIndex = 10
                    outline.Size = character.Size + Vector3.new(0.1, 0.1, 0.1)
                    outline.Adornee = character
                    outline.Parent = character
                end
            end
        end
    end
end

local espEnabled = false

espButton.Activated:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        outlinePlayers()
    else
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player ~= game:GetService("Players").LocalPlayer then
                for _, character in pairs(player.Character:GetDescendants()) do
                    if character:IsA("BasePart") then
                        for _, adornment in pairs(character:GetChildren()) do
                            if adornment:IsA("BoxHandleAdornment") then
                                adornment:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end
end)
-- Connect the mouse events to enable dragging
mainFrame.Active = true
mainFrame.Draggable = true