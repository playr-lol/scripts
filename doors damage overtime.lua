                                                                                             local doorHealthGained local itemHealthGained local breakerHealthGained local tickrate local damage
-- if you find this hi

 --                 Heal settings
                 doorHealthGained = 7
                 itemHealthGained = 15
                breakerHealthGained = 30

--                    Mechanic settings
                 tickrate = 0.1 -- how many seconds until you get damaged
                 damage = 0.1 -- how much damage will it do








-- hi this is thy code
if not game:IsLoaded() then game.Loaded:Wait() end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui

TextLabel.Size = UDim2.new(0,750,0,200)
TextLabel.TextSize = 48
TextLabel.TextStrokeColor3 = Color3.new(1,1,1)
TextLabel.TextStrokeTransparency = 0
TextLabel.BackgroundTransparency = 1
TextLabel.Text = ":)"
repeat task.wait() until game:GetService("ReplicatedStorage").GameData.LatestRoom.Value ~= 0
TextLabel.Text = "started!"
task.spawn(function()
    task.wait(1)
    TextLabel.Text = ""
    TextLabel:Destroy()
end)
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
game.ReplicatedStorage.RemotesFolder.FlashSpecify.OnClientEvent:Connect(function(thing, amount, playerId) -- thanks, damian!
    if thing == "BreakerPoles" then
        if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
            local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
            if humanoid.Health > 0 then
                if hptaken < breakerHealthGained then
                    humanoid.Health += hptaken
                    hptaken = 0
                else
                    humanoid.Health += breakerHealthGained
                    hptaken -= breakerHealthGained
                end
            end
        end
        print(tostring(playerId).. " picked up a breaker pole! ".. tostring(amount).. " have been picked up.")
    end
end)

game:GetService("RunService").RenderStepped:Connect(function() -- gets rid of camera shake
    if player.PlayerGui:FindFirstChild("MainUI") then task.spawn(function() require(player.PlayerGui.MainUI.Initiator.Main_Game).csgo = CFrame.new(0,0,0) end) end -- doing a task.spawn here cause if you die it breaks
end)
while task.wait(tickrate) do
    if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") and player.Character:FindFirstChild("Collison") and not player.Character.Collision.Anchored then
        local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid.Health > 0 then
            humanoid.Health -= damage
            hptaken += damage
            hpeaten += damage
        end
    end
    if player.PlayerGui:FindFirstChild("MainUI") then
        player.PlayerGui.MainUI:WaitForChild("Initiator").Main_Game.Health.Hit.Volume = 0
        player.PlayerGui.MainUI:WaitForChild("Initiator").Main_Game.Health.Ringing.SoundId = "rbxassetid://0"
    end
end
