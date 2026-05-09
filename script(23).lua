-- SETTINGS
local PART_COUNT = 2000 -- lebih banyak
local AREA_SIZE = 100
local HEIGHT = 10
local BATCH_SIZE = 50 -- spawn bertahap biar gak freeze

-- FOLDER
local folder = workspace:FindFirstChild("StressTestParts")
if not folder then
	folder = Instance.new("Folder")
	folder.Name = "StressTestParts"
	folder.Parent = workspace
end

folder:ClearAllChildren()

-- CACHE
local random = math.random
local vec3 = Vector3.new

-- SPAWN BERTAHAP (ANTI FREEZE)
local created = 0

while created < PART_COUNT do
	for i = 1, BATCH_SIZE do
		if created >= PART_COUNT then break end

		local part = Instance.new("Part")
		part.Size = vec3(2, 2, 2)
		part.Anchored = false -- physics aktif (lebih berat)
		part.Position = vec3(
			random(-AREA_SIZE, AREA_SIZE),
			random(5, HEIGHT),
			random(-AREA_SIZE, AREA_SIZE)
		)
		part.Parent = folder

		created += 1
	end
	
	task.wait() -- kasih napas ke server
end
