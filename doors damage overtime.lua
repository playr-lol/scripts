local doorHealthGained = 7
local itemHealthGained = 15

local tickrate = 0.1 -- how many seconds until update healthh
local damage = 0.1 -- how much damage will it do

if not game:IsLoaded() then game.Loaded:Wait() end
repeat task.wait() until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value ~= 0
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui

TextLabel.Size = UDim2.new(0,750,0,200)
TextLabel.TextSize = 48
TextLabel.TextStrokeColor3 = Color3.new(1,1,1)
TextLabel.TextStrokeTransparency = 0
TextLabel.BackgroundTransparency = 1
TextLabel.Text = ""
local hpeaten = 0
local hptaken = 0
local player = game.Players.LocalPlayer
local items = {}
game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
        local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid.Health > 0 then
            if hptaken < doorHealthGained then
                humanoid.Health += hptaken
                hptaken = doorHealthGained
            else
                humanoid.Health += doorHealthGained
                hptaken -= doorHealthGained
            end
        end
    end
end)
player.CharacterAdded:Connect(function()
    player.Character.ChildAdded:Connect(function(ae)
        if not ae:IsA("Tool") then return end
        if table.find(items, ae) then return end
        table.insert(items, ae)
        if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
            local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
            if humanoid.Health > 0 then
                if hptaken < itemHealthGained then
                    humanoid.Health += hptaken
                    hptaken = 0
                else
                    humanoid.Health += itemHealthGained
                    hptaken -= itemHealthGained
                end
            end
        end
    end)
end)
player.Character.ChildAdded:Connect(function(ae)
    if not ae:IsA("Tool") then return end
    if table.find(items, ae) then return end
    table.insert(items, ae)
    if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
        local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid.Health > 0 then
            if hptaken < itemHealthGained then
                humanoid.Health += hptaken
                hptaken = 0
            else
                humanoid.Health += itemHealthGained
                hptaken -= itemHealthGained
            end
        end
    end
end)
game:GetService("RunService").RenderStepped:Connect(function()
    if player.PlayerGui:FindFirstChild("MainUI") then task.spawn(function() require(player.PlayerGui.MainUI.Initiator.Main_Game).csgo = CFrame.new(0,0,0) end) end -- doing a task.spawn here cause if you die it breaks
end)
while task.wait(tickrate) do
    if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
        local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid.Health > 0 then
            humanoid.Health -= damage
            hptaken += damage
            hpeaten += damage
            TextLabel.Text = (string.format("%.1f", hpeaten)).. " total HP eaten."
        end
    end
    if player.PlayerGui:FindFirstChild("MainUI") then
        player.PlayerGui.MainUI:WaitForChild("Initiator").Main_Game.Health.Hit.Volume = 0
        player.PlayerGui.MainUI:WaitForChild("Initiator").Main_Game.Health.Ringing.SoundId = "rbxassetid://0"
    end
end
