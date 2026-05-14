--// DELTA PRANK V2
--// LIGHT OBFUSCATED VERSION

local _A=game:GetService("Players")
local _B=game:GetService("SoundService")
local _C=game:GetService("TweenService")

local _D=_A.LocalPlayer
local _E=_D:WaitForChild("PlayerGui")

local function _F(x)
	return "rbxassetid://"..x
end

local _G=_F("123139751377565")
local _H=_F("136298946425465")

local _I=Instance.new("ScreenGui")
_I.Name="___"
_I.ResetOnSpawn=false
_I.IgnoreGuiInset=true
_I.Parent=_E

local _J=Instance.new("Sound")
_J.SoundId=_H
_J.Volume=10
_J.Parent=_B

local _K={
	UDim2.new(.1,0,.1,0),
	UDim2.new(.7,0,.1,0),
	UDim2.new(.3,0,.5,0),
	UDim2.new(.6,0,.6,0),
	UDim2.new(.4,0,.2,0),
	UDim2.new(.2,0,.7,0),
	UDim2.new(.75,0,.45,0),
	UDim2.new(.5,0,.8,0)
}

local _L={
	"KICAW KICAW 🐦",
	"HAHA GOT YOU 😭",
	"DELTA PRANKED YOU",
	"LOL 😂",
	"💀💀💀",
	"RUNNNNN",
	"PRANK TIME"
}

local function _M()
	local a=Instance.new("Frame")
	a.Size=UDim2.new(1,0,1,0)
	a.BackgroundColor3=Color3.new(1,1,1)
	a.BackgroundTransparency=1
	a.BorderSizePixel=0
	a.Parent=_I

	local b=_C:Create(
		a,
		TweenInfo.new(.1),
		{BackgroundTransparency=.5}
	)

	b:Play()
	b.Completed:Wait()

	local c=_C:Create(
		a,
		TweenInfo.new(.2),
		{BackgroundTransparency=1}
	)

	c:Play()
	c.Completed:Wait()

	a:Destroy()
end

local function _N(p)
	local t=Instance.new("TextLabel")

	t.BackgroundTransparency=1
	t.AnchorPoint=Vector2.new(.5,.5)
	t.Position=p
	t.Size=UDim2.new(0,0,0,0)
	t.Font=Enum.Font.Arcade
	t.TextScaled=true
	t.Text=_L[math.random(1,#_L)]

	t.TextColor3=Color3.fromRGB(
		math.random(50,255),
		math.random(50,255),
		math.random(50,255)
	)

	t.TextStrokeTransparency=0
	t.Parent=_I

	_C:Create(
		t,
		TweenInfo.new(.2,Enum.EasingStyle.Back),
		{
			Size=UDim2.new(0,320,0,70),
			Rotation=math.random(-20,20)
		}
	):Play()

	task.wait(.35)

	local z=_C:Create(
		t,
		TweenInfo.new(.2),
		{
			TextTransparency=1,
			TextStrokeTransparency=1,
			Size=UDim2.new(0,0,0,0)
		}
	)

	z:Play()
	z.Completed:Wait()

	t:Destroy()
end

local function _O(p)
	local i=Instance.new("ImageLabel")

	i.BackgroundTransparency=1
	i.Image=_G
	i.AnchorPoint=Vector2.new(.5,.5)
	i.Position=p
	i.Size=UDim2.new(0,0,0,0)
	i.Parent=_I

	local g=_C:Create(
		i,
		TweenInfo.new(.18,Enum.EasingStyle.Back),
		{
			Size=UDim2.new(0,300,0,300),
			Rotation=math.random(-15,15)
		}
	)

	g:Play()

	task.spawn(_M)
	task.spawn(function()
		_N(p)
	end)

	task.wait(.4)

	local s=_C:Create(
		i,
		TweenInfo.new(.2),
		{
			Size=UDim2.new(0,0,0,0),
			ImageTransparency=1
		}
	)

	s:Play()
	s.Completed:Wait()

	i:Destroy()
end

_J:Play()

for v=1,45 do
	local p=_K[math.random(1,#_K)]

	task.spawn(function()
		_O(p)
	end)

	if v<15 then
		task.wait(.45)
	elseif v<30 then
		task.wait(.25)
	else
		task.wait(.12)
	end
end

local q=Instance.new("ImageLabel")

q.BackgroundTransparency=1
q.Image=_G
q.AnchorPoint=Vector2.new(.5,.5)
q.Position=UDim2.new(.5,0,.5,0)
q.Size=UDim2.new(0,0,0,0)
q.Parent=_I

_C:Create(
	q,
	TweenInfo.new(.5,Enum.EasingStyle.Back),
	{
		Size=UDim2.new(0,750,0,750),
		Rotation=360
	}
):Play()

local w=Instance.new("TextLabel")

w.BackgroundTransparency=1
w.AnchorPoint=Vector2.new(.5,.5)
w.Position=UDim2.new(.5,0,.85,0)
w.Size=UDim2.new(0,0,0,0)
w.Text="KICAW KICAW 🐦"
w.Font=Enum.Font.Arcade
w.TextScaled=true
w.TextColor3=Color3.new(1,1,1)
w.TextStrokeTransparency=0
w.Parent=_I

_C:Create(
	w,
	TweenInfo.new(.4,Enum.EasingStyle.Back),
	{
		Size=UDim2.new(0,500,0,100)
	}
):Play()

for x=1,6 do
	_M()
	task.wait(.08)
end

task.wait(4)

_I:Destroy()
