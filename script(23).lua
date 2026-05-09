-- SETTINGS
local PART_COUNT = 1500
local AREA_SIZE = 100
local HEIGHT = 50
local BATCH_SIZE = 50

local FORCE = 80
local SPIN = 10

-- FOLDER
local folder = workspace:FindFirstChild("ServerEffect")
if not folder then
	folder = Instance.new("Folder")
	folder.Name = "ServerEffect"
	folder.Parent = workspace
end

folder:ClearAllChildren()

-- CACHE
local random = math.random
local vec3 = Vector3.new

local created = 0

while created < PART_COUNT do
	for i = 1, BATCH_SIZE do
		if created >= PART_COUNT then break end

		local part = Instance.new("Part")
		part.Size = vec3(2,2,2)
		part.Position = vec3(
			random(-AREA_SIZE, AREA_SIZE),
			HEIGHT,
			random(-AREA_SIZE, AREA_SIZE)
		)
		part.Anchored = false
		part.CanCollide = true

		-- efek lemparan (serverside physics)
		part.AssemblyLinearVelocity = vec3(
			random(-FORCE, FORCE),
			random(20, FORCE),
			random(-FORCE, FORCE)
		)

		-- efek muter
		part.AssemblyAngularVelocity = vec3(
			random(-SPIN, SPIN),
			random(-SPIN, SPIN),
			random(-SPIN, SPIN)
		)

		part.Parent = folder
		created += 1
	end
	
	task.wait()
end
