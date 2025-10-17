local module = {}

local traj = loadstring(game:HttpGet("https://github.com/playr-lol/scripts/raw/refs/heads/main/trajectory.lua"))()
local isnetworkowner = function(part: BasePart) return part.ReceiveAge == 0 end
module.isnetworkowner = isnetworkowner

module.makeBird = function(part: BasePart, target: BasePart)
	if part.Anchored then return end
	local ogmag = (target.Position - part.Position).Magnitude
	local mag = ogmag
	local trajectory = traj.SolveTrajectory(part.Position, mag, target.Position, target.AssemblyLinearVelocity, false)
	local itr = 1
	repeat 
		mag = mag + (ogmag * 0.5)
		trajectory = traj.SolveTrajectory(part.Position, mag, target.Position, target.AssemblyLinearVelocity, false)
		itr += 1
	until trajectory or itr > 1000
	if trajectory then
		local ra = CFrame.lookAt(part.Position, trajectory)
		part.Velocity = ra.LookVector * mag
	end
end

return module
