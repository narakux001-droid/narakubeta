--// =========================================
--// NARAKU BETA UI + FEATURE SYSTEM
--// ARCHIMEDES+TERRAIN+FLY+MUSIC+ANTIAFK
--// =========================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Stats = game:GetService("Stats")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

--// =========================================
--// NOTIFY
--// =========================================

local function notify(title, text)

	pcall(function()

		StarterGui:SetCore("SendNotification", {
			Title = title or "NARAKU",
			Text = text or "SYSTEM",
			Duration = 3
		})

	end)

end

notify("NARAKU", "Beta Loaded")

--// =========================================
--// GUI
--// =========================================

local gui = Instance.new("ScreenGui")
gui.Name = "NarakuUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// PANEL

local panel = Instance.new("Frame")
panel.Parent = gui
panel.Size = UDim2.new(0,320,0,250)
panel.Position = UDim2.new(0,70,0,10)
panel.BackgroundColor3 = Color3.fromRGB(0,0,0)
panel.BackgroundTransparency = 0.2
panel.Active = true
panel.Draggable = true

local corner = Instance.new("UICorner")
corner.Parent = panel
corner.CornerRadius = UDim.new(0,8)

local stroke = Instance.new("UIStroke")
stroke.Parent = panel
stroke.Color = Color3.fromRGB(0,255,255)
stroke.Thickness = 1.2

--// HEADER

local top = Instance.new("Frame")
top.Parent = panel
top.Size = UDim2.new(1,0,0,30)
top.BackgroundColor3 = Color3.fromRGB(0,0,0)

local topCorner = Instance.new("UICorner")
topCorner.Parent = top
topCorner.CornerRadius = UDim.new(0,8)

-- ICON

local icon = Instance.new("ImageLabel")
icon.Parent = top
icon.Size = UDim2.new(0,22,0,22)
icon.Position = UDim2.new(0,8,0,4)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://85521644284429"

-- TITLE

local title = Instance.new("TextLabel")
title.Parent = top
title.Size = UDim2.new(0,140,0,20)
title.Position = UDim2.new(0,38,0,5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.DenkOne
title.Text = "NARAKU BETA"
title.TextSize = 15
title.TextColor3 = Color3.fromRGB(0,255,255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE

local close = Instance.new("TextButton")
close.Parent = top
close.Size = UDim2.new(0,20,0,20)
close.Position = UDim2.new(1,-25,0,5)
close.BackgroundTransparency = 1
close.Text = "X"
close.Font = Enum.Font.DenkOne
close.TextSize = 12
close.TextColor3 = Color3.fromRGB(255,0,0)

-- MINIMIZE

local mini = Instance.new("TextButton")
mini.Parent = top
mini.Size = UDim2.new(0,20,0,20)
mini.Position = UDim2.new(1,-50,0,5)
mini.BackgroundTransparency = 1
mini.Text = "-"
mini.Font = Enum.Font.ArialBold
mini.TextSize = 14
mini.TextColor3 = Color3.new(1,1,1)

-- RESTORE

local restore = Instance.new("TextButton")
restore.Parent = top
restore.Size = UDim2.new(0,20,0,20)
restore.Position = UDim2.new(1,-50,0,5)
restore.BackgroundTransparency = 1
restore.Text = "+"
restore.Font = Enum.Font.ArialBold
restore.TextSize = 12
restore.TextColor3 = Color3.new(1,1,1)
restore.Visible = false

--// =========================================
--// HEADER FPS + PING SYSTEM
--// STABLE VERSION
--// =========================================

local fps = 0
local ping = 0

local frameCount = 0
local accumulator = 0

--// FPS + PING LABEL

local statsLabel = Instance.new("TextLabel")
statsLabel.Parent = top
statsLabel.Size = UDim2.new(0,110,0,20)
statsLabel.Position = UDim2.new(0,170,0,5)
statsLabel.BackgroundTransparency = 1
statsLabel.Font = Enum.Font.DenkOne
statsLabel.TextSize = 9
statsLabel.TextColor3 = Color3.fromRGB(180,180,180)
statsLabel.Text = "Ping 0 | FPS 0"
statsLabel.TextXAlignment = Enum.TextXAlignment.Left

--// =========================================
--// FPS SYSTEM
--// =========================================

RunService.RenderStepped:Connect(function(dt)

	accumulator += dt
	frameCount += 1

	if accumulator >= 1 then

		fps = math.floor(frameCount / accumulator)

		accumulator = 0
		frameCount = 0

	end

end)

--// =========================================
--// PING SYSTEM
--// =========================================

task.spawn(function()

	while true do

		local success, result = pcall(function()

			return Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()

		end)

		if success and result then

			local number = string.match(result, "%d+")

			if number then
				ping = tonumber(number)
			end

		end

		statsLabel.Text =
			"Ping "..ping.." | FPS "..fps

		task.wait(1)

	end

end)

--// LEFT MENU

local menu = Instance.new("Frame")
menu.Parent = panel
menu.Size = UDim2.new(0,90,1,-35)
menu.Position = UDim2.new(0,0,0,32)
menu.BackgroundColor3 = Color3.fromRGB(5,5,5)

local menuCorner = Instance.new("UICorner")
menuCorner.Parent = menu
menuCorner.CornerRadius = UDim.new(0,8)

local menuLayout = Instance.new("UIListLayout")
menuLayout.Parent = menu
menuLayout.Padding = UDim.new(0,5)
menuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
menuLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local menuPadding = Instance.new("UIPadding")
menuPadding.Parent = menu
menuPadding.PaddingTop = UDim.new(0,8)

--// CONTENT HOLDER

local content = Instance.new("Frame")
content.Parent = panel
content.Size = UDim2.new(0,220,0,210)
content.Position = UDim2.new(0,95,0,35)
content.BackgroundTransparency = 1

--// DASHBOARD PAGE

local dashboardPage = Instance.new("Frame")
dashboardPage.Parent = content
dashboardPage.Size = UDim2.new(1,0,1,0)
dashboardPage.BackgroundTransparency = 1

local dashScroll = Instance.new("ScrollingFrame")
dashScroll.Parent = dashboardPage
dashScroll.Size = UDim2.new(1,0,1,0)
dashScroll.BackgroundTransparency = 1
dashScroll.ScrollBarThickness = 4
dashScroll.CanvasSize = UDim2.new(0,0,0,450)

local dashLayout = Instance.new("UIListLayout")
dashLayout.Parent = dashScroll
dashLayout.Padding = UDim.new(0,5)

local dashPadding = Instance.new("UIPadding")
dashPadding.Parent = dashScroll
dashPadding.PaddingTop = UDim.new(0,5)
dashPadding.PaddingLeft = UDim.new(0,4)

-- AUTO CANVAS

dashLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

	dashScroll.CanvasSize =
		UDim2.new(0,0,0,dashLayout.AbsoluteContentSize.Y + 10)

end)

-- INFO CREATOR

local function createInfo(text)

	local label = Instance.new("TextLabel")
	label.Parent = dashScroll
	label.Size = UDim2.new(1,-8,0,110)
	label.BackgroundColor3 = Color3.fromRGB(15,15,15)
	label.TextColor3 = Color3.fromRGB(255,255,255)
	label.Font = Enum.Font.DenkOne
	label.TextSize = 14
	label.TextWrapped = true
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.RichText = true
	label.Text = text

	local padding = Instance.new("UIPadding")
	padding.Parent = label
	padding.PaddingLeft = UDim.new(0,10)
	padding.PaddingTop = UDim.new(0,8)

	local c = Instance.new("UICorner")
	c.Parent = label
	c.CornerRadius = UDim.new(0,8)

	return label

end

-- INFO LIST

createInfo([[
NARAKU BETA

▫️ STATUS    : ONLINE
▫️ VERSION  : BETA
▫️ UI  PANEL : NARAKU SYSTEM
]])

createInfo([[
FITUR TERSEDIA

▫️ ANTIAFK
▫️ ARCHIMEDES
▫️ FLY
▫️ TERRAIN
▫️ Rejoin
]])

createInfo([[
CREDITS

▫️ARCHIMEDES by Naraku
▫️FLY by Anonymous
▫️TERRAIN by ZARS V3
]])

createInfo([[
INFO

▫️Script Free  dilarang memperjualbelikan 
▫️Jika ada bug silahkan lapor discord 
▫️Link.Discord ; https://discord.gg/QFYghqQgJ
]])

--// MAIN PAGE

local mainPage = Instance.new("Frame")
mainPage.Parent = content
mainPage.Size = UDim2.new(1,0,1,0)
mainPage.BackgroundTransparency = 1
mainPage.Visible = false

local scroll = Instance.new("ScrollingFrame")
scroll.Parent = mainPage
scroll.Size = UDim2.new(1,0,1,0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0,0,0,350)

local layout = Instance.new("UIListLayout")
layout.Parent = scroll
layout.Padding = UDim.new(0,5)

--// BUTTON CREATOR

local function createMenuButton(text)

	local b = Instance.new("TextButton")
	b.Parent = menu
	b.Size = UDim2.new(0,75,0,32)
	b.BackgroundColor3 = Color3.fromRGB(15,15,15)
	b.TextColor3 = Color3.fromRGB(0,255,255)
	b.Font = Enum.Font.DenkOne
	b.TextSize = 13
	b.Text = text

	local c = Instance.new("UICorner")
	c.Parent = b
	c.CornerRadius = UDim.new(0,6)

	return b

end

local function createMainButton(name)

	local b = Instance.new("TextButton")
	b.Parent = scroll
	b.Size = UDim2.new(1,-8,0,40)
	b.BackgroundColor3 = Color3.fromRGB(15,15,15)
	b.TextColor3 = Color3.fromRGB(255,255,255)
	b.Font = Enum.Font.DenkOne
	b.TextSize = 15
	b.Text = name

	local c = Instance.new("UICorner")
	c.Parent = b
	c.CornerRadius = UDim.new(0,8)

	return b

end

--// MENU BUTTONS

local dashboardBtn = createMenuButton("🔗 INFO")
local mainBtn = createMenuButton("⚙️ MENU")

--// =========================================
--// PLAYER PROFILE SYSTEM
--// FIX VERSION
--// =========================================

local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420

local userId = player.UserId

local contentImage, isReady = Players:GetUserThumbnailAsync(
	userId,
	thumbType,
	thumbSize
)

--// HOLDER

local profileHolder = Instance.new("Frame")
profileHolder.Parent = panel
profileHolder.Size = UDim2.new(0,90,0,80)

-- POSISI BAWAH MENU
profileHolder.Position = UDim2.new(0,0,1,-85)

profileHolder.BackgroundTransparency = 1
profileHolder.ZIndex = 5

--// AVATAR IMAGE

local avatar = Instance.new("ImageLabel")
avatar.Parent = profileHolder
avatar.Size = UDim2.new(0,42,0,42)

-- TENGAH
avatar.Position = UDim2.new(0.5,-21,0,0)

avatar.BackgroundTransparency = 1
avatar.Image = contentImage
avatar.ZIndex = 5

--// LINGKARAN

local avatarCorner = Instance.new("UICorner")
avatarCorner.Parent = avatar
avatarCorner.CornerRadius = UDim.new(1,0)

--// STROKE CYAN

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Parent = avatar
avatarStroke.Color = Color3.fromRGB(0,255,255)
avatarStroke.Thickness = 1

--// DISPLAY NAME

local profileName = Instance.new("TextLabel")
profileName.Parent = profileHolder
profileName.Size = UDim2.new(1,-10,0,16)

-- DIBAWAH AVATAR
profileName.Position = UDim2.new(0,5,0,45)

profileName.BackgroundTransparency = 1
profileName.Text = player.DisplayName
profileName.Font = Enum.Font.DenkOne
profileName.TextSize = 10
profileName.TextColor3 = Color3.fromRGB(255,255,255)
profileName.TextWrapped = true
profileName.TextXAlignment = Enum.TextXAlignment.Center
profileName.ZIndex = 5

--// PLAYER ID BUTTON

local idButton = Instance.new("TextButton")
idButton.Parent = profileHolder
idButton.Size = UDim2.new(1,-10,0,14)

-- DIBAWAH DISPLAYNAME
idButton.Position = UDim2.new(0,5,0,60)

idButton.BackgroundTransparency = 1
idButton.Text = "ID : "..player.UserId
idButton.Font = Enum.Font.DenkOne
idButton.TextSize = 9
idButton.TextColor3 = Color3.fromRGB(0,255,255)
idButton.TextWrapped = true
idButton.TextXAlignment = Enum.TextXAlignment.Center
idButton.ZIndex = 5

--// COPY ID SYSTEM

idButton.MouseButton1Click:Connect(function()

	if setclipboard then

		setclipboard(tostring(player.UserId))

		notify(
			"NARAKU",
			"Copied ID : "..player.UserId
		)

	else

		notify(
			"NARAKU",
			"Executor Tidak Support Clipboard"
		)

	end

end)

--// MINIMIZE SUPPORT

mini.MouseButton1Click:Connect(function()

	profileHolder.Visible = false

end)

--// RESTORE SUPPORT

restore.MouseButton1Click:Connect(function()

	profileHolder.Visible = true

end)

--// FEATURE BUTTONS

local antiBtn = createMainButton("Anti Afk")
local terrainBtn = createMainButton("Terrain")
local archBtn = createMainButton("Archimedes")
local flyBtn = createMainButton("Fly")

--// =========================================
--// SPEED SYSTEM (INLINE MAIN)
--// =========================================

-- STATE
local speedEnabled = false
local defaultWalkSpeed = 16
local speedValue = 50

-- HOLDER (langsung masuk scroll)
local speedFrame = Instance.new("Frame")
speedFrame.Parent = scroll
speedFrame.Size = UDim2.new(1,-8,0,45)
speedFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)

local corner = Instance.new("UICorner", speedFrame)
corner.CornerRadius = UDim.new(0,8)

-- TOGGLE BUTTON (KIRI)
local speedToggle = Instance.new("TextButton")
speedToggle.Parent = speedFrame
speedToggle.Size = UDim2.new(0.6,-10,1,-10)
speedToggle.Position = UDim2.new(0,5,0,5)
speedToggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
speedToggle.Text = "SPEED OFF"
speedToggle.Font = Enum.Font.DenkOne
speedToggle.TextSize = 14
speedToggle.TextColor3 = Color3.fromRGB(255,255,255)

local toggleCorner = Instance.new("UICorner", speedToggle)
toggleCorner.CornerRadius = UDim.new(0,6)

-- TEXTBOX (KANAN)
local speedBox = Instance.new("TextBox")
speedBox.Parent = speedFrame
speedBox.Size = UDim2.new(0.4,-10,1,-10)
speedBox.Position = UDim2.new(0.6,5,0,5)
speedBox.BackgroundColor3 = Color3.fromRGB(10,10,10)
speedBox.Text = tostring(speedValue)
speedBox.Font = Enum.Font.DenkOne
speedBox.TextSize = 14
speedBox.TextColor3 = Color3.fromRGB(0,255,255)

local boxCorner = Instance.new("UICorner", speedBox)
boxCorner.CornerRadius = UDim.new(0,6)

-- APPLY SPEED
local function applySpeed()

	local char = player.Character
	if not char then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end

	if speedEnabled then
		hum.WalkSpeed = speedValue
	else
		hum.WalkSpeed = defaultWalkSpeed
	end

end

-- RESPAWN SUPPORT
player.CharacterAdded:Connect(function()
	task.wait(1)
	applySpeed()
end)

-- INPUT VALIDATION
speedBox.FocusLost:Connect(function()

	local num = tonumber(speedBox.Text)

	if num then
		num = math.clamp(num, 10, 100)
		speedValue = num
		speedBox.Text = tostring(num)

		if speedEnabled then
			applySpeed()
		end
	else
		speedBox.Text = tostring(speedValue)
	end

end)

-- TOGGLE LOGIC
speedToggle.MouseButton1Click:Connect(function()

	speedEnabled = not speedEnabled

	if speedEnabled then

		speedToggle.Text = "SPEED ON"
		speedToggle.TextColor3 = Color3.fromRGB(0,255,0)

		applySpeed()
		notify("NARAKU", "Speed Enabled : "..speedValue)

	else

		speedToggle.Text = "SPEED OFF"
		speedToggle.TextColor3 = Color3.fromRGB(255,255,255)

		applySpeed()
		notify("NARAKU", "Speed Disabled")

	end

end)

--// PAGE SYSTEM

dashboardBtn.MouseButton1Click:Connect(function()

	dashboardPage.Visible = true
	mainPage.Visible = false

end)

mainBtn.MouseButton1Click:Connect(function()

	dashboardPage.Visible = false
	mainPage.Visible = true

end)

--// CLOSE

close.MouseButton1Click:Connect(function()

	gui:Destroy()

end)

--// MINIMIZE

mini.MouseButton1Click:Connect(function()

	panel.Size = UDim2.new(0,320,0,30)

	menu.Visible = false
	content.Visible = false

	mini.Visible = false
	restore.Visible = true

end)

--// RESTORE

restore.MouseButton1Click:Connect(function()

	panel.Size = UDim2.new(0,320,0,250)

	menu.Visible = true
	content.Visible = true

	mini.Visible = true
	restore.Visible = false

end)

--// =========================================
--// FEATURE SYSTEM
--// =========================================

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

local antiAfkEnabled = false
local idleConnection

local function enableAntiAFK()

	if idleConnection then
		idleConnection:Disconnect()
	end

	idleConnection = player.Idled:Connect(function()

		if not antiAfkEnabled then return end

		pcall(function()

			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new(0, 0))

		end)

	end)

end

local function disableAntiAFK()

	if idleConnection then
		idleConnection:Disconnect()
		idleConnection = nil
	end

end

-- BUTTON UI CONNECT (PAKAI BUTTON KAMU YANG SUDAH ADA)
antiBtn.Text = "ANTIAFK OFF"
antiBtn.TextColor3 = Color3.fromRGB(255,255,255)

antiBtn.MouseButton1Click:Connect(function()

	antiAfkEnabled = not antiAfkEnabled

	if antiAfkEnabled then

		enableAntiAFK()

		antiBtn.Text = "ANTIAFK ON"
		antiBtn.TextColor3 = Color3.fromRGB(0,255,0)

		notify("NARAKU", "AntiAfk Enabled")

	else

		disableAntiAFK()

		antiBtn.Text = "ANTIAFK OFF"
		antiBtn.TextColor3 = Color3.fromRGB(255,255,255)

		notify("NARAKU", "AntiAfk Disabled")

	end

end)

-- AUTO ENABLE DEFAULT
enableAntiAFK()
	
-- RANDOM BACKUP

task.spawn(function()

	while true do
		task.wait(math.random(45,70))

		if antiAfkEnabled then

			pcall(function()

				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())

			end)

		end

	end

end)

-- TERRAIN

terrainBtn.MouseButton1Click:Connect(function()

	notify("NARAKU", "Terrain Loading")

	task.spawn(function()

		pcall(function()

			loadstring(game:HttpGet(
				"https://pastefy.app/GUfD6qc6/raw"
			))()

		end)

	end)

end)

-- ARCHIMEDES

archBtn.MouseButton1Click:Connect(function()

	notify("NARAKU", "Archimedes Loading")

	task.spawn(function()

		pcall(function()

			loadstring(game:HttpGet("https://pastefy.app/Fp37di5c/raw"))()

		end)

	end)

end)

-- FLY

flyBtn.MouseButton1Click:Connect(function()

	notify("NARAKU", "Fly Loading")

	task.spawn(function()

		pcall(function()

			loadstring(game:HttpGet(
				"https://pastefy.app/ofUG7Jsv/raw"
			))()

		end)

	end)

end)
