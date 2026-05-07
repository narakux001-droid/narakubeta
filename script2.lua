--// =========================================
--// NARAKU TOOLBOX SYSTEM FINAL V3
--// SMALL UI + AUTO TYPE SAVE + AUTO NAME
--// FAVORITE + SEARCH + SAVE PERMANENT
--// DELTA / STUDIO LITE
--// =========================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer

--// =========================
--// FILE SYSTEM
--// =========================

local folderPath = "id.asset.workspas"
local favFile = folderPath.."/favorite.json"
local saveFile = folderPath.."/saved.json"

if not isfolder(folderPath) then
	makefolder(folderPath)
end

if not isfile(favFile) then
	writefile(favFile,"[]")
end

if not isfile(saveFile) then
	writefile(saveFile,"[]")
end

local Favorites = HttpService:JSONDecode(readfile(favFile))
local SavedAssets = HttpService:JSONDecode(readfile(saveFile))

--// =========================
--// ASSET LIST
--// =========================

local Assets = {

-- AUDIO
{Id="77222785479261",Name="aishiteru",Type="Audio"},
{Id="71352440268880",Name="bukan sulap bukan sihir",Type="Audio"},
{Id="106460063662",Name="teri mery",Type="Audio"},
{Id="9119644661",Name="Did i stutter",Type="Audio"},
{Id="7427687439",Name="DJML",Type="Audio"},
{Id="94304371006849",Name="semuanya diam!",Type="Audio"},
{Id="76463442516219",Name="death bed",Type="Audio"},
{Id="137160480186369",Name="untitled",Type="Audio"},
{Id="131302001414352",Name="die with a smile cover",Type="Audio"},
{Id="1255922819",Name="anime sound",Type="Audio"},
{Id="131887330457007",Name="supernova",Type="Audio"},
{Id="15689457467",Name="aku sayang (ver Inggris)",Type="Audio"},
{Id="8928760105",Name="suaveee~",Type="Audio"},
{Id="103093530102792",Name="chinese remix",Type="Audio"},

-- MODEL
{Id="88109389533828",Name="Mini Game Catur",Type="Model"},
{Id="71333106773028",Name="Tempat Dance + Laser Light",Type="Model"},
{Id="79690237118625",Name="Stage + Light & Decal Bisa Gerak",Type="Model"},
{Id="96782795585741",Name="Pohon Support SL",Type="Model"},
{Id="132706881850770",Name="Bahan Dekor",Type="Model"},
{Id="88853059526012",Name="Bahan Dekor",Type="Model"},
{Id="87642278114395",Name="Sofa Club",Type="Model"},
{Id="106985418541085",Name="Tool Bendera",Type="Model"},
{Id="84224378840831",Name="Grey",Type="Model"},
{Id="111582364751260",Name="Poster Club/Hangout",Type="Model"},
{Id="78395325106323",Name="Panggung Club",Type="Model"},
{Id="138652299586117",Name="Aset Club VIP 5",Type="Model"},
{Id="80122802149294",Name="Aset Club VIP 5",Type="Model"},
{Id="92299315909169",Name="Aset Club VIP 5",Type="Model"},
{Id="116031518505106",Name="Aset Club VIP 5",Type="Model"},
{Id="75352819606676",Name="Aset Club VIP 5",Type="Model"},
{Id="93810032946014",Name="Aset Club VIP 5",Type="Model"},
{Id="127067526188326",Name="Aset Club VIP 5",Type="Model"},
{Id="130430113488134",Name="Aset Club VIP 5",Type="Model"},
{Id="98583232229153",Name="Aset Club VIP 5",Type="Model"},
{Id="104128055611438",Name="Aset Club VIP 5",Type="Model"},
{Id="12686057924",Name="Bahan Club",Type="Model"},
{Id="92878930058570",Name="Tool Hiu Terbang",Type="Model"},
{Id="116134867908147",Name="Bambu Daun",Type="Model"},
{Id="128954053563078",Name="All Skin Tools",Type="Model"},
{Id="76385937269078",Name="Spoot Foto",Type="Model"},
{Id="131614523117704",Name="SpeedTool",Type="Model"},
{Id="132327036979662",Name="Command Fixjump/Fps/Fixlag",Type="Model"},
{Id="13365412166",Name="Teleport Bagus",Type="Model"},
{Id="105962298396256",Name="Judol",Type="Model"},
{Id="132423164960006",Name="Barista Bot",Type="Model"},

-- DECAL
{Id="18999242405",Name="Sky Bagus 1",Type="Decal"},
{Id="18915196644",Name="Sky Bagus 2",Type="Decal"},
{Id="15502099013",Name="Sky Bagus 3",Type="Decal"},
{Id="14828409189",Name="Sky Bagus 4",Type="Decal"},
{Id="17839304279",Name="Sky Bagus 5",Type="Decal"},
{Id="16642336373",Name="Sky Bagus 6",Type="Decal"},
{Id="15493730673",Name="Sky Bagus 7",Type="Decal"},
{Id="16676792127",Name="Sky Bagus 8",Type="Decal"}

}

-- LOAD SAVED
for _,v in pairs(SavedAssets) do

	local exists = false

	for _,a in pairs(Assets) do
		if tostring(a.Id) == tostring(v.Id) then
			exists = true
		end
	end

	if not exists then
		table.insert(Assets,v)
	end

end

--// =========================
--// GUI
--// =========================

local gui = Instance.new("ScreenGui")
gui.Name = "NarakuToolbox"
gui.ResetOnSpawn = false

pcall(function()
	gui.Parent = game.CoreGui
end)

-- PANEL
local panel = Instance.new("Frame")
panel.Parent = gui
panel.Size = UDim2.new(0,280,0,340)
panel.Position = UDim2.new(0.35,0,0.2,0)
panel.BackgroundColor3 = Color3.fromRGB(0,0,0)
panel.BackgroundTransparency = 0.2
panel.Active = true
panel.Draggable = true

Instance.new("UICorner",panel).CornerRadius = UDim.new(0,7)

local stroke = Instance.new("UIStroke")
stroke.Parent = panel
stroke.Color = Color3.fromRGB(0,255,255)

-- TOPBAR
local top = Instance.new("Frame")
top.Parent = panel
top.Size = UDim2.new(1,0,0,26)
top.BackgroundColor3 = Color3.fromRGB(0,0,0)

Instance.new("UICorner",top).CornerRadius = UDim.new(0,7)

local title = Instance.new("TextLabel")
title.Parent = top
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,8,0,0)
title.Size = UDim2.new(1,-70,1,0)
title.Font = Enum.Font.DenkOne
title.Text = "NARAKU TOOLBOX"
title.TextColor3 = Color3.fromRGB(0,255,255)
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE
local close = Instance.new("TextButton")
close.Parent = top
close.Size = UDim2.new(0,18,0,18)
close.Position = UDim2.new(1,-22,0,4)
close.BackgroundTransparency = 1
close.Text = "X"
close.Font = Enum.Font.DenkOne
close.TextSize = 14
close.TextColor3 = Color3.fromRGB(255,0,0)

-- MINI
local mini = Instance.new("TextButton")
mini.Parent = top
mini.Size = UDim2.new(0,18,0,18)
mini.Position = UDim2.new(1,-42,0,4)
mini.BackgroundTransparency = 1
mini.Text = "-"
mini.Font = Enum.Font.DenkOne
mini.TextSize = 14
mini.TextColor3 = Color3.new(1,1,1)

-- RESTORE
local restore = Instance.new("TextButton")
restore.Parent = top
restore.Size = UDim2.new(0,18,0,18)
restore.Position = UDim2.new(1,-42,0,4)
restore.BackgroundTransparency = 1
restore.Text = "+"
restore.Font = Enum.Font.DenkOne
restore.TextSize = 14
restore.TextColor3 = Color3.new(1,1,1)
restore.Visible = false

-- CATEGORY
local categoryFrame = Instance.new("Frame")
categoryFrame.Parent = panel
categoryFrame.Size = UDim2.new(1,-6,0,24)
categoryFrame.Position = UDim2.new(0,3,0,30)
categoryFrame.BackgroundTransparency = 1

local function createMenu(text,pos)

	local b = Instance.new("TextButton")
	b.Parent = categoryFrame
	b.Size = UDim2.new(0,88,0,22)
	b.Position = UDim2.new(0,pos,0,0)
	b.BackgroundColor3 = Color3.fromRGB(20,20,20)
	b.TextColor3 = Color3.fromRGB(0,255,255)
	b.Font = Enum.Font.DenkOne
	b.TextSize = 11
	b.Text = text

	Instance.new("UICorner",b).CornerRadius = UDim.new(0,5)

	return b

end

local modelBtn = createMenu("MODEL",0)
local decalBtn = createMenu("DECAL",92)
local audioBtn = createMenu("AUDIO",184)

-- SEARCH FRAME
local searchFrame = Instance.new("Frame")
searchFrame.Parent = panel
searchFrame.Size = UDim2.new(1,-6,0,24)
searchFrame.Position = UDim2.new(0,3,0,58)
searchFrame.BackgroundTransparency = 1

-- FAVORITE
local favBtn = Instance.new("TextButton")
favBtn.Parent = searchFrame
favBtn.Size = UDim2.new(0,24,0,24)
favBtn.Position = UDim2.new(0,0,0,0)
favBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
favBtn.Text = "⭐"
favBtn.Font = Enum.Font.DenkOne
favBtn.TextSize = 12
favBtn.TextColor3 = Color3.fromRGB(255,255,0)

Instance.new("UICorner",favBtn).CornerRadius = UDim.new(0,5)

-- SEARCH BOX
local searchBox = Instance.new("TextBox")
searchBox.Parent = searchFrame
searchBox.Size = UDim2.new(0,165,0,24)
searchBox.Position = UDim2.new(0,28,0,0)
searchBox.BackgroundColor3 = Color3.fromRGB(20,20,20)
searchBox.PlaceholderText = "Search..."
searchBox.Text = ""
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.SourceSans
searchBox.TextSize = 13

Instance.new("UICorner",searchBox).CornerRadius = UDim.new(0,5)

-- SEARCH BUTTON
local searchBtn = Instance.new("TextButton")
searchBtn.Parent = searchFrame
searchBtn.Size = UDim2.new(0,74,0,24)
searchBtn.Position = UDim2.new(1,-74,0,0)
searchBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
searchBtn.Text = "CARI"
searchBtn.Font = Enum.Font.DenkOne
searchBtn.TextSize = 11
searchBtn.TextColor3 = Color3.fromRGB(0,255,255)

Instance.new("UICorner",searchBtn).CornerRadius = UDim.new(0,5)

-- SCROLL
local scroll = Instance.new("ScrollingFrame")
scroll.Parent = panel
scroll.Size = UDim2.new(1,-6,0,190)
scroll.Position = UDim2.new(0,3,0,86)
scroll.BackgroundColor3 = Color3.fromRGB(0,0,0)
scroll.BackgroundTransparency = 0.35
scroll.ScrollBarThickness = 2
scroll.CanvasSize = UDim2.new(0,0,0,0)

Instance.new("UICorner",scroll).CornerRadius = UDim.new(0,5)

local layout = Instance.new("UIListLayout")
layout.Parent = scroll
layout.Padding = UDim.new(0,4)

-- SAVE FRAME
local saveFrame = Instance.new("Frame")
saveFrame.Parent = panel
saveFrame.Size = UDim2.new(1,-6,0,28)
saveFrame.Position = UDim2.new(0,3,1,-34)
saveFrame.BackgroundTransparency = 1

local saveBox = Instance.new("TextBox")
saveBox.Parent = saveFrame
saveBox.Size = UDim2.new(0,190,0,26)
saveBox.BackgroundColor3 = Color3.fromRGB(20,20,20)
saveBox.PlaceholderText = "Asset ID..."
saveBox.Text = ""
saveBox.Font = Enum.Font.SourceSans
saveBox.TextSize = 13
saveBox.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",saveBox).CornerRadius = UDim.new(0,5)

local saveBtn = Instance.new("TextButton")
saveBtn.Parent = saveFrame
saveBtn.Size = UDim2.new(1,-194,0,26)
saveBtn.Position = UDim2.new(0,194,0,0)
saveBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
saveBtn.Text = "SAVE"
saveBtn.Font = Enum.Font.DenkOne
saveBtn.TextSize = 11
saveBtn.TextColor3 = Color3.fromRGB(0,255,255)

Instance.new("UICorner",saveBtn).CornerRadius = UDim.new(0,5)

--// =========================
--// SYSTEM
--// =========================

local CurrentFilter = "All"
local FavoriteMode = false

local function saveFavorites()
	writefile(favFile,HttpService:JSONEncode(Favorites))
end

local function saveAssets()
	writefile(saveFile,HttpService:JSONEncode(SavedAssets))
end

local function isFavorite(id)

	for _,v in pairs(Favorites) do
		if tostring(v) == tostring(id) then
			return true
		end
	end

	return false

end

local function assetExists(id)

	for _,v in pairs(Assets) do
		if tostring(v.Id) == tostring(id) then
			return true
		end
	end

	return false

end

local function clearAssets()

	for _,v in pairs(scroll:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end

end

-- ITEM
local function createAsset(asset)

	local item = Instance.new("Frame")
	item.Parent = scroll
	item.Size = UDim2.new(1,-5,0,50)
	item.BackgroundColor3 = Color3.fromRGB(20,20,20)

	Instance.new("UICorner",item).CornerRadius = UDim.new(0,5)

	-- IMAGE
	local img = Instance.new("ImageLabel")
	img.Parent = item
	img.Size = UDim2.new(0,40,0,40)
	img.Position = UDim2.new(0,5,0,5)
	img.BackgroundTransparency = 1
	img.Image = "https://www.roblox.com/asset-thumbnail/image?assetId="..asset.Id.."&width=420&height=420&format=png"

	-- NAME
	local name = Instance.new("TextLabel")
	name.Parent = item
	name.BackgroundTransparency = 1
	name.Position = UDim2.new(0,50,0,3)
	name.Size = UDim2.new(1,-90,0,18)
	name.Font = Enum.Font.SourceSansBold
	name.TextSize = 13
	name.TextColor3 = Color3.new(1,1,1)
	name.TextXAlignment = Enum.TextXAlignment.Left
	name.Text = asset.Name

	-- TYPE
	local typeText = Instance.new("TextLabel")
	typeText.Parent = item
	typeText.BackgroundTransparency = 1
	typeText.Position = UDim2.new(0,50,0,18)
	typeText.Size = UDim2.new(0,60,0,14)
	typeText.Font = Enum.Font.SourceSans
	typeText.TextSize = 11
	typeText.TextColor3 = Color3.fromRGB(0,255,255)
	typeText.Text = "["..asset.Type.."]"

	-- ID BUTTON
	local idBtn = Instance.new("TextButton")
	idBtn.Parent = item
	idBtn.Size = UDim2.new(0,90,0,16)
	idBtn.Position = UDim2.new(0,50,0,30)
	idBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
	idBtn.TextColor3 = Color3.fromRGB(0,255,255)
	idBtn.Font = Enum.Font.SourceSansBold
	idBtn.TextSize = 10
	idBtn.Text = asset.Id

	Instance.new("UICorner",idBtn).CornerRadius = UDim.new(0,4)

	idBtn.MouseButton1Click:Connect(function()

		if setclipboard then
			setclipboard(asset.Id)
		end

		idBtn.Text = "COPIED"
		wait(1)
		idBtn.Text = asset.Id

	end)

	-- FAVORITE
	local fav = Instance.new("TextButton")
	fav.Parent = item
	fav.Size = UDim2.new(0,20,0,20)
	fav.Position = UDim2.new(1,-25,0.5,-10)
	fav.BackgroundTransparency = 1
	fav.Font = Enum.Font.SourceSansBold
	fav.TextSize = 15
	fav.TextColor3 = Color3.fromRGB(255,255,0)

	if isFavorite(asset.Id) then
		fav.Text = "⭐"
	else
		fav.Text = "☆"
	end

	fav.MouseButton1Click:Connect(function()

		if isFavorite(asset.Id) then

			for i,v in pairs(Favorites) do
				if tostring(v) == tostring(asset.Id) then
					table.remove(Favorites,i)
				end
			end

			fav.Text = "☆"

		else

			table.insert(Favorites,asset.Id)
			fav.Text = "⭐"

		end

		saveFavorites()

	end)

end

-- REFRESH
local function refreshAssets()

	clearAssets()

	local search = string.lower(searchBox.Text)

	for _,asset in pairs(Assets) do

		local pass = true

		if CurrentFilter ~= "All" and asset.Type ~= CurrentFilter then
			pass = false
		end

		if FavoriteMode and not isFavorite(asset.Id) then
			pass = false
		end

		if search ~= "" then

			local n = string.lower(asset.Name)

			if not string.find(n,search)
			and not string.find(asset.Id,search) then
				pass = false
			end

		end

		if pass then
			createAsset(asset)
		end

	end

	wait()

	scroll.CanvasSize = UDim2.new(
		0,
		0,
		0,
		layout.AbsoluteContentSize.Y + 5
	)

end

--// =========================
--// BUTTON SYSTEM
--// =========================

searchBtn.MouseButton1Click:Connect(refreshAssets)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	refreshAssets()
end)

modelBtn.MouseButton1Click:Connect(function()
	CurrentFilter = "Model"
	FavoriteMode = false
	refreshAssets()
end)

decalBtn.MouseButton1Click:Connect(function()
	CurrentFilter = "Decal"
	FavoriteMode = false
	refreshAssets()
end)

audioBtn.MouseButton1Click:Connect(function()
	CurrentFilter = "Audio"
	FavoriteMode = false
	refreshAssets()
end)

favBtn.MouseButton1Click:Connect(function()

	FavoriteMode = not FavoriteMode
	CurrentFilter = "All"

	refreshAssets()

end)

-- SAVE
saveBtn.MouseButton1Click:Connect(function()

	local id = tostring(saveBox.Text)

	if id == "" then
		return
	end

	if assetExists(id) then

		saveBtn.Text = "ADA"
		wait(1)
		saveBtn.Text = "SAVE"

		return

	end

	local assetName = "Custom Asset"
	local assetType = "Model"

	pcall(function()

		local info = MarketplaceService:GetProductInfo(tonumber(id))

		if info then

			if info.Name then
				assetName = info.Name
			end

			local t = tostring(info.AssetTypeId)

			if t == "3" then
				assetType = "Audio"
			elseif t == "13" then
				assetType = "Decal"
			else
				assetType = "Model"
			end

		end

	end)

	local data = {
		Id = id,
		Name = assetName,
		Type = assetType
	}

	table.insert(Assets,data)
	table.insert(SavedAssets,data)

	saveAssets()

	saveBox.Text = ""

	refreshAssets()

	saveBtn.Text = "OK"
	wait(1)
	saveBtn.Text = "SAVE"

end)

-- CLOSE
close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- MINI
mini.MouseButton1Click:Connect(function()

	panel.Size = UDim2.new(0,280,0,26)

	categoryFrame.Visible = false
	searchFrame.Visible = false
	scroll.Visible = false
	saveFrame.Visible = false

	mini.Visible = false
	restore.Visible = true

end)

-- RESTORE
restore.MouseButton1Click:Connect(function()

	panel.Size = UDim2.new(0,280,0,340)

	categoryFrame.Visible = true
	searchFrame.Visible = true
	scroll.Visible = true
	saveFrame.Visible = true

	mini.Visible = true
	restore.Visible = false

end)

-- START
refreshAssets()

print("NARAKU TOOLBOX FINAL V3 LOADED")
