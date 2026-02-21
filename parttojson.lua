print("Starting to save...")
local starttime = os.clock()
local yay = {
	Anchored = false,
	Color = {0, 0, 0},
	Transparency = 1,
	Position = {0, 0, 0},
	Rotation = {0, 0, 0},
	Orientation = {0, 0, 0},
	Size = {0, 0, 0},
	CanCollide = false,
	Material = nil,
	ClassName = "",
	Name = "",
	ParentName = ""
}

local yaya = {}
for i, v in workspace:GetDescendants() do
	if v:IsA("BasePart") then
		local test = table.clone(yay)
		test.Anchored = v.Anchored
		test.Color = {
			v.Color.R,
			v.Color.G,
			v.Color.B
		}
		test.Transparency = v.Transparency
		test.Position = {v.Position.X, v.Position.Y, v.Position.Z}
		test.Rotation = {v.Rotation.X, v.Rotation.Y, v.Rotation.Z}
		test.Orientation = {v.Orientation.X, v.Orientation.Y, v.Orientation.Z}
		test.Size = {v.Size.X, v.Size.Y, v.Size.Z}
		test.Name = v.Name
		test.ParentName = v.Parent.Name
		test.CanCollide = v.CanCollide
		test.Material = tostring(v.Material)
		test.ClassName = v.ClassName
		table.insert(yaya, test)
	end
end
local name = `Parts_{game.PlaceId}.json`
writefile(name, game:GetService("HttpService"):JSONEncode(yaya))
print(`Saved {#yaya} values to workspace/{name} in {os.clock() - starttime} seconds`)
