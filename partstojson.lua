local whereToCheck = game:GetService("Workspace")

print("Starting to save...")
local starttime = os.clock()
local yay = {
    Shape = nil,
	Anchored = nil,
	Color = nil,
	Transparency = nil,
	Position = nil,
	Rotation = nil,
	Orientation = nil,
	Size = nil,
	CanCollide = nil,
	Material = nil,
	ClassName = nil,
	Name = nil,
	ParentName = nil,
    MeshID = nil,
    TextureID = nil,
    Offset = nil,
    Scale = nil,
    --PuID = nil,
}

local function parseV3asTable(vec : Vector3)
    local test = {
        vec.X,
        vec.Y,
        vec.Z
    }
    return test
end

local function formatfor(v : Instance)
    local test = table.clone(yay)
    test.Name = v.Name
    test.ClassName = v.ClassName
    --test.PuID = v.Parent.Unique
    if v:IsA("BasePart") then
        if v:IsA("Part") then
            test.Shape = tostring(v.Shape)
        end
        test.Anchored = v.Anchored
        test.Color = {
            v.Color.R,
            v.Color.G,
            v.Color.B
        }
        test.Transparency = v.Transparency
        test.Position = parseV3asTable(v.Position)
        test.Rotation = parseV3asTable(v.Rotation)
        test.Orientation = parseV3asTable(v.Orientation)
        test.Size = parseV3asTable(v.Size)
        test.ParentName = v.Parent.Name
        test.CanCollide = v.CanCollide
        test.Material = tostring(v.Material)
        if v:IsA("MeshPart") then
            test.MeshID = (v.MeshId:match("%d+"))
            test.TextureID = tonumber(v.TextureID:match("%d+"))
            --test.Offset = parseV3asTable(v.Offset)
            --test.Scale = parseV3asTable(v.Scale)
        end
    --[[elseif v:IsA("SpecialMesh") then
        test.MeshID = (v.MeshID:match("%d+"))
        test.TextureID = tonumber(v.TextureID:match("%d+"))
        test.Offset = parseV3asTable(v.Offset)
        test.Color = {
            v.Color.R,
            v.Color.G,
            v.Color.B
        }--]]
    end
    return test
end

local yaya = {}
for i, v in whereToCheck:GetDescendants() do
	if v:IsA("BasePart") then
		table.insert(yaya, formatfor(v))
	end
end
local name = `Parts_{game.PlaceId}.json`
writefile(name, game:GetService("HttpService"):JSONEncode(yaya))
print(`Saved {#yaya} values to workspace/{name} in {os.clock() - starttime} seconds`)
