-- you will need to use vfly in infinite yield before this
-- if you get hit by anything your body disapears and cutscenes will break u

repeat task.wait() until game.Players.LocalPlayer.Character ~= nil
local char = game.Players.LocalPlayer.Character
char.Humanoid.Health = 0
task.wait(0.4)
char:BreakJoints()
workspace.CurrentCamera:remove()
task.wait()
workspace.Camera.CameraSubject = char.HumanoidRootPart
workspace.Camera.CameraType = "Custom"
local hatstuff = {}
if char.RagdollConstraints ~= nil then
    char.RagdollConstraints:Destroy()
end


for _, yea in ipairs(char:GetChildren()) do
    if yea:IsA("Accessory") then
        table.insert(hatstuff, yea)
    end
end


while task.wait() do
    if char:FindFirstChild("Head", false) then
        char.Head.CFrame = char.HumanoidRootPart.CFrame
    end
    for _, accessory in ipairs(hatstuff) do
        if accessory:FindFirstChild("Handle") then accessory.Handle.CFrame = char.HumanoidRootPart.CFrame end
    end
    char.UpperTorso.CFrame = char.HumanoidRootPart.CFrame
    char.LowerTorso.CFrame = char.HumanoidRootPart.CFrame
    char.LeftLowerLeg.CFrame = char.HumanoidRootPart.CFrame
    char.LeftUpperLeg.CFrame = char.HumanoidRootPart.CFrame
    char.LeftLowerArm.CFrame = char.HumanoidRootPart.CFrame
    char.LeftUpperArm.CFrame = char.HumanoidRootPart.CFrame
    char.RightLowerLeg.CFrame = char.HumanoidRootPart.CFrame
    char.RightUpperLeg.CFrame = char.HumanoidRootPart.CFrame
    char.RightLowerArm.CFrame = char.HumanoidRootPart.CFrame
    char.RightUpperArm.CFrame = char.HumanoidRootPart.CFrame
    char.LeftHand.CFrame = char.HumanoidRootPart.CFrame
    char.LeftFoot.CFrame = char.HumanoidRootPart.CFrame
    char.RightHand.CFrame = char.HumanoidRootPart.CFrame
    char.RightFoot.CFrame = char.HumanoidRootPart.CFrame
end
