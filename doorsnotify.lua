local entities={"RushMoving","AmbushMoving","Snare","A60","A120","SeekMoving","JeffTheKiller","Eyes"}
local player = game.Players.LocalPlayer

local function playNotif()
    local Notification = Instance.new("Sound")
    Notification.Parent = game.SoundService
    Notification.SoundId = "rbxassetid://4590662766"
    Notification.Volume = 5
    Notification.PlayOnRemove = true
    Notification:Destroy()
end

workspace.ChildAdded:Connect(function(test)
    if table.find(entities, test.Name) then
        repeat task.wait() until (player:DistanceFromCharacter(test:GetPivot().Position) < 1000) or not test:IsDescendantOf(workspace) 
        if test:IsDescendantOf(workspace) then
            print(test.Name)
            if (test.Name == "RushMoving") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Rush has spawned.", Text = "Get in a closet!", Icon = "https://static.wikia.nocookie.net/doors-game/images/4/4d/Rush1.png/revision/latest?cb=20240209082944"})
                playNotif()
            elseif (test.name == "AmbushMoving") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Ambush has spawned.", Text = "Get in a closet!", Icon = "https://static.wikia.nocookie.net/doors-game/images/6/60/Ambush2.png/revision/latest?cb=20220916122448"})
                playNotif()
            elseif (test.name == "A60") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "A60 has spawned.", Text = "Get in a locker!", Icon = "https://static.wikia.nocookie.net/doors-game/images/8/8c/A-60_DOORS.png/revision/latest?cb=20230217032419"})
                playNotif()
            elseif (test.name == "A120") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "A120 has spawned.", Text = "Get in a locker!", Icon = "https://static.wikia.nocookie.net/doors-game/images/e/ef/A-120_IDLE.png/revision/latest?cb=20231215083711"})
                playNotif()
            elseif (test.name == "Eyes") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Eyes has spawned.", Text = "Look away from it.", Icon = "https://static.wikia.nocookie.net/doors-game/images/5/57/Eyes.png/revision/latest?cb=20230429125223"})
                playNotif()
            elseif (test.name == "SeekMoving") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Seek will spawn.", Text = "The next room contains the Seek chase.", Icon = "https://static.wikia.nocookie.net/doors-game/images/0/0a/Seek_Render_Running.png/revision/latest?cb=20240104164726"})
                playNotif()
            elseif (test.name == "JeffTheKiller") then
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Jeff The Killer has spawned.", Text = "Run away from him.", Icon = "rbxassetid://11401835408"})
                playNotif()
            end
        end
    end
end)
