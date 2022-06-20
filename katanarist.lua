
--hat: https://www.roblox.com/catalog/4855525473/Nagamaki

--loadstring(game:HttpGet('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
getgenv()._reanimate()
local folder = game:GetObjects('rbxassetid://9216241674')[1]
folder.Parent = workspace.non

-- padero#0001

-----------------------------------------------------------

local mt = {
	drandom = function(minNum,maxNum,div)
		div = div or 1
		return math.random(minNum * div,maxNum * div)/div
	end
}

local math = setmetatable(mt,{__index = math})

local Player = game:GetService("Players").LocalPlayer

--BasicFunctions
local ins = Instance.new
local v3 = Vector3.new
local cf = CFrame.new
local angles = CFrame.Angles
local rad = math.rad
local huge = math.huge
local cos = math.cos
local sin = math.sin
local tan = math.tan
local abs = math.abs
local ray = Ray.new
local random = math.random
local drandom = math.drandom
local ud = UDim.new
local ud2 = UDim2.new
local c3 = Color3.new
local rgb = Color3.fromRGB
local bc = BrickColor.new
--script.Client.Disabled = false
--Services
local plrs = game:GetService("Players")
local tweens = game:GetService("TweenService")
local debrs = game:GetService("Debris")
local runservice = game:GetService("RunService")
 
--Variables
local plr = Player
local plrg = game:GetService('CoreGui')
local char = workspace.non
local h = char.Head
local t = char.Torso
local ra = char["Right Arm"]
local la = char["Left Arm"]
local rl = char["Right Leg"]
local ll = char["Left Leg"]
local rut = char.HumanoidRootPart
local hum = char:FindFirstChildOfClass("Humanoid")
local nec = t.Neck
local rutj = rut.RootJoint
local rs = t["Right Shoulder"]
local ls = t["Left Shoulder"]
local rh = t["Right Hip"]
local lh = t["Left Hip"]

necc0,necc1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
rutjc0,rutjc1=cf(0,0,0),cf(0,0,0)
rsc0,rsc1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
lsc0,lsc1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
rhc0,rhc1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
lhc0,lhc1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)

local takingAStep = false
local muted = false
local using = false
local wallJump = false
local wallJumpDeb = false
local lightEnabled = false

local anim = "idle"
local asset = "rbxassetid://"

local themeID = 1837107670
local themeVolume = .5
local themePitch = 1
local timePos = 0

local combo = 1

local change = 1
local sine = 0

local ws = 50
local jp = 85

local healthPool = 350
local healPercentage = 0

local ignoreList = {char}

--
local stepsounds = {
	Grass = asset.."1201103066",
	Sand = asset.."1436385526",
	Plastic = asset.."1569994049",
	Stone = asset.."507863857", --379398649
	Wood = asset.."1201103959",
	Pebble = asset.."1201103211",
	Ice = asset.."265653271",
	Glass = asset.."145180170",
	Metal = asset.."379482691"
}

local directions = {In = Enum.EasingDirection.In,
    Out = Enum.EasingDirection.Out,
    InOut = Enum.EasingDirection.InOut
}

local styles = {Linear = Enum.EasingStyle.Linear,
    Back = Enum.EasingStyle.Back,
    Bounce = Enum.EasingStyle.Bounce,
    Sine = Enum.EasingStyle.Sine,
    Quad = Enum.EasingStyle.Quad,
    Elastic = Enum.EasingStyle.Elastic,
    Quart = Enum.EasingStyle.Quart,
    Quint = Enum.EasingStyle.Quint
}

local stepped = runservice.Heartbeat

--Removing joints/Animations
if char:FindFirstChild("Animate") then
	char.Animate:Destroy()
end

if hum:FindFirstChildOfClass("Animator") then
	char.Humanoid.Animator:Destroy()
end

nec.Parent = nil
rutj.Parent = nil
rs.Parent = nil
ls.Parent = nil
rh.Parent = nil
lh.Parent = nil

--Joints
local nec = ins("Motor6D",t) nec.Name = "Neck" nec.Part0 = t nec.Part1 = h
local rutj = ins("Motor6D",rut) rutj.Name = "RootJoint" rutj.Part0 = t rutj.Part1 = rut
local rs = ins("Motor6D",t) rs.Name = "Right Shoulder" rs.Part0 = t rs.Part1 = ra
local ls = ins("Motor6D",t) ls.Name = "Left Shoulder" ls.Part0 = t ls.Part1 = la
local rh = ins("Motor6D",t) rh.Name = "Right Hip" rh.Part0 = t rh.Part1 = rl
local lh = ins("Motor6D",t) lh.Name = "Left Hip" lh.Part0 = t lh.Part1 = ll

--Setting CFrames
nec.C1 = necc1
nec.C0 = necc0
rs.C1 = rsc1
rs.C0 = rsc0
ls.C1 = lsc1
ls.C0 = lsc0
rh.C1 = rhc1
rh.C0 = rhc0
lh.C1 = lhc1
lh.C0 = lhc0
rutj.C1 = rutjc1
rutj.C0 = rutjc0

--Functions1
function createWeld(p1,p2,c0,c1)
	c0 = c0 or cf(0,0,0)
	c1 = c1 or cf(0,0,0)
	local weld = ins("Motor6D",p1)
	weld.Part0 = p1
	weld.Part1 = p2
	weld.C0 = c0
	weld.C1 = c1
	return weld
end

--Adds
local healPNum = ins("NumberValue",hum)
healPNum.Name = "HealReadyPercentage"
healPNum.Value = healPercentage
local katana = folder.Models.Katana
local hitbox = katana.Hitbox
local handle = katana.Handle

local handleW = createWeld(ra,handle,cf(-.125,-.9,0),angles(rad(75),rad(190),rad(0)))
katana.Parent = char

local lamp = folder.Models.Lamp
lamp.Parent = char
local lWeld = createWeld(t,lamp.Handle,cf(-.975,-.75,-.25) * angles(rad(85),rad(85),rad(5)))

local ff = ins("ForceField",char)
ff.Visible = false

local effects = ins("Model",char)
effects.Name = "Effects"

local theme = ins("Sound",t)
theme.Volume = themeVolume
theme.SoundId = asset..themeID
theme.Pitch = themePitch
theme.TimePosition = timePos
theme.Looped = true
theme:Play()

local ui = folder.UIs.KatanaristUI
ui.Parent = plrg
char.Humanoid.Died:Connect(function()
	ui:Destroy()
end)

local shaker = folder.DistShaker:Clone()

--Functions2

function remove(instance,time)
	time = time or 0
	game:GetService("Debris"):AddItem(instance,time)
end

function swait()
	game:GetService("RunService").Stepped:Wait()
end

function rayc(spos,direc,ignore,dist)
    local rai = ray(spos,direc.Unit * dist)
    local rhit,rpos,rrot = workspace:FindPartOnRayWithIgnoreList(rai,ignore,false,false)
    return rhit,rpos,rrot
end

function sound(id,vol,pitch,parent,maxdist)
	local mdist = 30 or maxdist
	local newsound = Instance.new("Sound",parent)
	newsound.Volume = vol
	newsound.SoundId = "rbxassetid://"..id
	newsound.Pitch = pitch
	newsound:Play()
	coroutine.resume(coroutine.create(function()
		wait(.1)
		remove(newsound,newsound.TimeLength/newsound.Pitch)
	end))
	return newsound
end

function placesoundpart(rcf,id,vol,pitch,maxdist)
	pcall(function()
		local mdist = 30 or maxdist
		local spart = ins("Part",effects)
		spart.Anchored = true
		spart.CanCollide = false
		spart.Locked = true
		spart.Transparency = 1
		spart.CFrame = rcf
		local ssound = sound(id,vol,pitch,spart,mdist)
		remove(spart,ssound.TimeLength/ssound.Pitch)
	end)
end

local tlerp = function(part,tablee,leinght,easingstyle,easingdirec)
    local info = TweenInfo.new(
    leinght,
    easingstyle,
    easingdirec,
    0,
    false,
    0
    )
    local lerp = tweens:Create(part,info,tablee)
    lerp:Play()
end

function removeWithFade(instance,time)
	game:GetService("Debris"):AddItem(instance,time+3.5)
	coroutine.resume(coroutine.create(function()
		wait(time)
		tlerp(instance,{Transparency = 1},3.5,styles.Linear,directions.In)
	end))
end

local Effects = {
	Ring = function(pos,color,sSize,eSize,sTrans,eTrans,time)
		local ring = script.Effects.Ring:Clone()
		ring.Size = sSize
		ring.Transparency = sTrans
		ring.CFrame = pos
		ring.Color = color
		ring.Parent = effects
		remove(ring,time)
		tlerp(ring,{Size = eSize,Transparency = eTrans},time,styles.Linear,directions.Out)
	end,
	SpinningRing = function(pos,color,rotation,sSize,eSize,sTrans,eTrans,time)
		local ring = script.Effects.Ring:Clone()
		ring.Size = sSize
		ring.Transparency = sTrans
		ring.CFrame = pos
		ring.Color = color
		ring.Parent = effects
		remove(ring,time)
		tlerp(ring,{Size = eSize,Transparency = eTrans},time,styles.Linear,directions.Out)
		coroutine.wrap(function()
			repeat
				ring.CFrame = ring.CFrame * rotation
				wait(1/30)
			until not ring.Parent
		end)()
	end,
	Sphere = function(pos,color,sSize,eSize,sTrans,eTrans,time)
		local sphere = ins("Part")
		sphere.Shape = "Ball"
		sphere.Size = v3(sSize,sSize,sSize)
		sphere.Transparency = sTrans
		sphere.CFrame = pos
		sphere.Color = color
		sphere.Parent = effects
		sphere.Anchored = true
		sphere.CanCollide = false
		sphere.Locked = true
		sphere.Material = "Neon"
		remove(sphere,time)
		tlerp(sphere,{Size = v3(eSize,eSize,eSize),Transparency = eTrans},time,styles.Linear,directions.Out)
	end,
	SpinningBlock = function(pos,color,sSize,eSize,sTrans,eTrans,cfRotation,time)
		local part = ins("Part")
		part.Size = v3(sSize,sSize,sSize)
		part.Transparency = sTrans
		part.CFrame = pos
		part.Color = color
		part.Parent = effects
		part.Anchored = true
		part.CanCollide = false
		part.Locked = true
		part.Material = "Neon"
		remove(part,time)
		tlerp(part,{Size = v3(eSize,eSize,eSize),Transparency = eTrans},time,styles.Linear,directions.Out)
		coroutine.wrap(function()
			repeat
				part.CFrame = part.CFrame * cfRotation
				wait(1/30)
			until not part.Parent
		end)()
	end,
	CustomSphere = function(pos,endPos,color,sSize,eSize,sTrans,eTrans,time)
		local sphere = ins("Part")
		sphere.Size = sSize
		sphere.Transparency = sTrans
		sphere.CFrame = pos
		sphere.Color = color
		sphere.Parent = effects
		sphere.Anchored = true
		sphere.CanCollide = false
		sphere.Locked = true
		sphere.Material = "Neon"
		
		local mesh = ins("SpecialMesh",sphere)
		mesh.MeshType = "Sphere"
		
		remove(sphere,time)
		tlerp(sphere,{Size = eSize,Transparency = eTrans,CFrame = endPos},time,styles.Linear,directions.Out)
	end,
	Wind = function(pos,color,rotation,sSize,eSize,sTrans,eTrans,time)
		local ring = script.Effects.Wind:Clone()
		ring.Size = sSize
		ring.Transparency = sTrans
		ring.CFrame = pos
		ring.Color = color
		ring.Parent = effects
		remove(ring,time)
		tlerp(ring,{Size = eSize,Transparency = eTrans},time,styles.Linear,directions.Out)
		coroutine.wrap(function()
			repeat
				ring.CFrame = ring.CFrame * angles(rad(0),rad(rotation),rad(0))
				wait(1/30)
			until not ring.Parent
		end)()
	end,
	CreateCamShake = function(part,maxDist,intensivity,time)
		maxDist = maxDist or 20
		intensivity = intensivity or 1
		time = time or .1
		
		local bool = ins("BoolValue",part)
		bool.Name = "Shaking"
		bool.Value = true
		
		local MaxDist = ins("NumberValue",bool)
		MaxDist.Name = "MaxDist"
		MaxDist.Value = maxDist
		
		local Intensivity = ins("NumberValue",bool)
		Intensivity.Name = "Intensivity"
		Intensivity.Value = intensivity
		
		remove(bool,time)
	end,
	SoundEffect = function(sound,effect)
		ins(effect.."SoundEffect",sound)
	end,
	Particles = function(part,type,dis)
		local parts
		if type:lower() == "blood" then
			parts = script.Effects.BloodParticles:Clone()
			parts.Parent = part
			if dis then
				parts.Enabled = false
			else
				parts.Enabled = true
			end
		elseif type:lower() == "bloodsplash" then
			parts = script.Effects.BloodSplash:Clone()
			parts.Parent = part
			if dis then
				parts.Enabled = false
			else
				parts.Enabled = true
			end
		end
		return parts
	end
}

function createweld(part1,part2,v3c0,v3c1)
	local att1 = ins("Attachment",part1)
	local att2 = ins("Attachment",part2)
	att1.Position = v3c0
	att2.Position = v3c1
	local con = ins("BallSocketConstraint",part1)
	con.Attachment0 = att1
	con.Attachment1 = att2
	con.LimitsEnabled = true
	con.TwistLimitsEnabled = true
	con.TwistLowerAngle = 0
	con.TwistUpperAngle = 0
	con.UpperAngle = 0
	att1.Name = "dontremove"
	att2.Name = "dontremove"
	con.Name = "dontremove"
	return {att0 = att1,att1 = att2,constraint = con}
end

function createglue(parent1,parent2,name,part0,part1,c0,c1)
	local att1 = ins("Attachment")
	local att2 = ins("Attachment")
	local socket = ins("BallSocketConstraint")
	att1.Parent = parent1
	att2.Parent = parent2
	socket.Attachment0 = att1
	socket.Attachment1 = att2
	att1.Position = c0
	att2.Position = c1
	socket.Name = "dontremove"
	att1.Name = "dontremove"
	att2.Name = "dontremove"
	socket.Parent = parent2
	return att1,att2,socket
end

function createhitbox(part,parent)
	pcall(function()
		local hbpart = ins("Part")
		hbpart.Name = "HitboxRagdoll"
		hbpart.Locked = true
		hbpart.Transparency = 1
		hbpart.TopSurface = "Smooth"
		hbpart.BottomSurface = "Smooth"
		hbpart.Material = "Ice"
		if part.Name ~= "Head" then
			hbpart.Size = v3(part.Size.x/1.35,part.Size.y/1.2,part.Size.z/1.35)
			hbpart.CFrame = part.CFrame
			local att1 = ins("Attachment",part)
			local att2 = ins("Attachment",hbpart)
			att1.Position = v3(0,(-part.Size.y/2) + (hbpart.Size.y/2),0)
			local con = ins("BallSocketConstraint",part)
			con.Attachment0 = att1
			con.Attachment1 = att2
			con.LimitsEnabled = true
			con.TwistLimitsEnabled = true
			con.TwistLowerAngle = 0
			con.TwistUpperAngle = 0
			con.UpperAngle = 0
		else
			hbpart.Size = v3(part.Size.x,part.Size.y/2,part.Size.z)
			hbpart.CFrame = part.CFrame
			local att1 = ins("Attachment",part)
			local att2 = ins("Attachment",hbpart)
			local con = ins("BallSocketConstraint",part)
			con.Attachment0 = att1
			con.Attachment1 = att2
			con.LimitsEnabled = true
			con.TwistLimitsEnabled = true
			con.TwistLowerAngle = 0
			con.TwistUpperAngle = 0
			con.UpperAngle = 0
		end
		hbpart:BreakJoints()
		hbpart.Parent = parent
	end)
end

function createhitboxr15(part,parent)
	pcall(function()
		local hbpart = ins("Part")
		hbpart.Name = "HitboxRagdoll"
		hbpart.Locked = true
		hbpart.Transparency = 1
		hbpart.TopSurface = "Smooth"
		hbpart.BottomSurface = "Smooth"
		hbpart.Material = "Ice"
		if part.Name ~= "Head" then
			hbpart.Size = v3(part.Size.x/1.5,part.Size.y/6,part.Size.z/1.5)
			hbpart.CFrame = part.CFrame
			local att1 = ins("Attachment",part)
			local att2 = ins("Attachment",hbpart)
			local con = ins("BallSocketConstraint",part)
			con.Attachment0 = att1
			con.Attachment1 = att2
			con.LimitsEnabled = true
			con.TwistLimitsEnabled = true
			con.TwistLowerAngle = 0
			con.TwistUpperAngle = 0
			con.UpperAngle = 0
		else
			hbpart.Size = v3(part.Size.x,part.Size.y/2,part.Size.z)
			hbpart.CFrame = part.CFrame
			local att1 = ins("Attachment",part)
			local att2 = ins("Attachment",hbpart)
			local con = ins("BallSocketConstraint",part)
			con.Attachment0 = att1
			con.Attachment1 = att2
			con.LimitsEnabled = true
			con.TwistLimitsEnabled = true
			con.TwistLowerAngle = 0
			con.TwistUpperAngle = 0
			con.UpperAngle = 0
		end
		hbpart:BreakJoints()
		hbpart.Parent = parent
	end)
end

function paralizer6(type,who,huma,ripHead)
pcall(function()
	if type == "body" then
		local torso = who:FindFirstChild("Torso")
		local righta = who:FindFirstChild("Right Arm")
		local lefta = who:FindFirstChild("Left Arm")
		local rightl = who:FindFirstChild("Right Leg")
		local leftl = who:FindFirstChild("Left Leg")
		local head = who:FindFirstChild("Head")
		local tag = ins("Glue",who) tag.Name = "deletmepls"
		if torso then
			local root = who:FindFirstChild("HumanoidRootPart")
			if root then
				root:Destroy()
			end
			huma.PlatformStand = true
			if head then
				if head:FindFirstChild("Ripped") then
					return
				end
				head:BreakJoints()
				head.Anchored = false
				createhitbox(head,torso)
				local att1,att2,sock = createglue(torso,head,"paralized",torso,leftl,v3(0,torso.Size.y/2,0),v3(0,-head.Size.y/2,0))
				att1.Orientation = v3(0, -90, 90)
				att2.Orientation = v3(0, -90, 90)
				sock.LimitsEnabled = true
				sock.TwistLimitsEnabled = true
				sock.UpperAngle = 80
				sock.TwistLowerAngle = -80
				sock.TwistUpperAngle = 80
				head.TopSurface = "Smooth"
				head.BottomSurface = "Smooth"
				head:MakeJoints()
				if ripHead then
					remove(att1)
					remove(att2)
					remove(sock)
					coroutine.wrap(function()
						for i = 1,random(15,30) do
							blood(torso.CFrame * cf(0,torso.Size.Y/2,0),torso.CFrame.UpVector,random(5,15),(random(80,130)/100) * torso.Size.Z,who)
							wait(random(25,60)/350)
						end
					end)()
				end
			end
			if leftl then
				if not leftl:FindFirstChild("Ripped") then
					leftl:BreakJoints()
					leftl.Anchored = false
					local att1,att2,sock = createglue(torso,leftl,"paralized",torso,leftl,v3(-torso.Size.x/4,-torso.Size.y/2,0),v3(0,leftl.Size.y/2,0))
					att1.Orientation = v3(-0, -90, 90)
					att2.Orientation = v3(0, -90, 90)
					sock.LimitsEnabled = true
					sock.TwistLimitsEnabled = true
					sock.UpperAngle = 100
					sock.TwistLowerAngle = 35
					sock.TwistUpperAngle = -45
					createhitbox(leftl,torso)
				end
			end
			if rightl then
				if not rightl:FindFirstChild("Ripped") then
					rightl:BreakJoints()
					rightl.Anchored = false
					local att1,att2,sock = createglue(torso,rightl,"paralized",torso,rightl,v3(torso.Size.x/4,-torso.Size.y/2,0),v3(0,rightl.Size.y/2,0))
					att1.Orientation = v3(-0, -90, 90)
					att2.Orientation = v3(0, -90, 90)
					sock.LimitsEnabled = true
					sock.TwistLimitsEnabled = true
					sock.UpperAngle = 100
					sock.TwistLowerAngle = 45
					sock.TwistUpperAngle = -35
					createhitbox(rightl,torso)
				end
			end
			if righta then
				righta:BreakJoints()
				righta.Anchored = false
				if not righta:FindFirstChild("Ripped") then
					local att1,att2,sock = createglue(torso,righta,"paralized",torso,righta,v3((torso.Size.x/2) + (righta.Size.x/2),torso.Size.y/4,0),v3(0,righta.Size.y/4,0))
					att1.Orientation = v3(-90, 0, 0)
					att2.Orientation = v3(0, 180, -180)
					sock.LimitsEnabled = true
					sock.TwistLimitsEnabled = true
					sock.UpperAngle = 100
					sock.TwistLowerAngle = 105
					sock.TwistUpperAngle = -110
				end
				createhitbox(righta,torso)
			end
			if lefta then
				lefta:BreakJoints()
				lefta.Anchored = false
				if not lefta:FindFirstChild("Ripped") then
					local att1,att2,sock = createglue(torso,lefta,"paralized",torso,lefta,v3((-torso.Size.x/2) - (lefta.Size.x/2),torso.Size.y/4,0),v3(0,lefta.Size.y/4,0))
					att1.Orientation = v3(-90, 180, 0)
					att2.Orientation = v3(0, -180, 0)
					sock.LimitsEnabled = true
					sock.TwistLimitsEnabled = true
					sock.UpperAngle = 100
					sock.TwistLowerAngle = 105
					sock.TwistUpperAngle = -90
				end
				createhitbox(lefta,torso)
			end
		else
			warn("Cant get the torso")
		end
	end
end)
end

function killr6(who,ripHead)
pcall(function()
	local khum = who:FindFirstChildOfClass("Humanoid")
	if khum then
		--remove(who,10)
		--khum.Health = 0
		--khum.Name = "Dead hobo"
		--who:BreakJoints()
		local khe = khum.Parent:FindFirstChild("Head")
		--if khe.Size.x ~= khe.Size.z then
		--	khe.Size = v3(khe.Size.z,khe.Size.z,khe.Size.z)
		--end
		for i,v in pairs(who:GetDescendants()) do
			if v:IsA("Accessory") or v:IsA("Hat") then
			--[[	local att1 = ins("Attachment",khe)
				local att2 = ins("Attachment",v.Handle)
				att1.Position = (v.Handle.Position-khe.Position)
				local con = ins("BallSocketConstraint",khe)
				con.Attachment0 = att1
				con.Attachment1 = att2
				con.LimitsEnabled = true
				con.TwistLimitsEnabled = true
				con.TwistLowerAngle = 0
				con.TwistUpperAngle = 0
				con.UpperAngle = 0]]
			end
			if v:IsA("Script") or v:IsA("LocalScript") or v.Name == "HitboxRagdoll" or v:IsA("Attachment") and v.Name ~= "dontremove" or v:IsA("BallSocketConstraint") and v.Name ~= "dontremove" then
			--	remove(v,0)
			end
			if v:IsA("Decal") then
			end
			if v:IsA("Part") or v:IsA("MeshPart") then
				--v.Anchored = false
				--v:BreakJoints()
				--removeWithFade(v,5)
			end
		end
		--paralizer6("body",khum.Parent,khum,ripHead)
		--ins("Glue",who).Name = "am ded"
	end
end)
end

function killr15(who,riphead)
pcall(function()
	local khum = who:FindFirstChildOfClass("Humanoid")
	if khum then
		--remove(who,10)
		local root = who:FindFirstChild("HumanoidRootPart")
		if root then
		--	remove(root)
		end
		local joints = {}
		for i,v in pairs(who:GetDescendants()) do
			if v:IsA("Motor6D") or v:IsA("Motor") then
				if v.Part0 and v.Part1 then
					table.insert(joints,v)
				end
			end
		end
		--khum.Health = 0
		--khum.Name = "Dead hobo"
		--who:BreakJoints()
		local khe = khum.Parent:FindFirstChild("Head")
		if khe.Size.x ~= khe.Size.z then
		--	khe.Size = v3(khe.Size.z,khe.Size.z,khe.Size.z)
		end
		for i,v in pairs(who:GetDescendants()) do
			if v:IsA("Accessory") or v:IsA("Hat") then
				--[[local att1 = ins("Attachment",khe)
				local att2 = ins("Attachment",v.Handle)
				att1.Position = (v.Handle.Position-khe.Position)
				local con = ins("BallSocketConstraint",khe)
				con.Attachment0 = att1
				con.Attachment1 = att2
				con.LimitsEnabled = true
				con.TwistLimitsEnabled = true
				con.TwistLowerAngle = 0
				con.TwistUpperAngle = 0
				con.UpperAngle = 0]]
			end
			if v:IsA("Script") or v:IsA("LocalScript") or v.Name == "HitboxRagdoll" or v:IsA("Attachment") and v.Name ~= "dontremove" or v:IsA("BallSocketConstraint") and v.Name ~= "dontremove" or v.Name == "HumanoidRootPart" then
				--remove(v,0)
			end
			if v:IsA("Decal") then
				--removeWithFade(v,5)
			end
			if v:IsA("Part") or v:IsA("MeshPart") then
				--v.Anchored = false
				--v:BreakJoints()
				--removeWithFade(v,5)
			end
		end
		for i,v in pairs(joints) do
			if v.Name == "Neck" and not riphead then
				--createglue(v.Part0,v.Part1,"paralized",v.Part0,v.Part1,v3(v.C0.x,v.C0.y,v.C0.z),v3(v.C1.x,v.C1.y,v.C1.z))
			elseif v.Name == "Neck" and riphead then
				coroutine.wrap(function()
					for i = 1,random(15,30) do
						blood(v.Part0.CFrame * cf(0,v.Part0.Size.Y/2,0),v.Part0.CFrame.UpVector,random(5,15),(drandom(.8,1.3,100)) * v.Part0.Size.Z,who)
						wait(random(25,60)/350)
					end
				end)()
			elseif v.Name ~= "Neck" then
				--createglue(v.Part0,v.Part1,"paralized",v.Part0,v.Part1,v3(v.C0.x,v.C0.y,v.C0.z),v3(v.C1.x,v.C1.y,v.C1.z))
			end
			if not v.Part0.Name ~= "UpperTorso" or not v.Part1.Name ~= "UpperTorso" then
				--createhitboxr15(v.Part0,v.Part0)
				--removeWithFade(v.Part0,5)
			end
		end
	end
end)
end

function death(who,ripHead)
	if who:FindFirstChild("UpperTorso") then
		killr15(who,ripHead)
	elseif who:FindFirstChild("Torso") then
		killr6(who,ripHead)
	end
end

function blood(pos,direc,forcev,scale,ignore)
	ignore = ignore or ins("Model")
	scale = scale or 1
	forcev = forcev or 25
	if not pos then
		return warn("No position set")
	end
	local p = ins("Part")
	p.Size = v3(.35,.35,.35) * scale
	p.CanCollide = true
	p.Transparency = 1
	p.Material = "Neon"
	p.Shape = "Ball"
	p.CFrame = pos
	p.Parent = effects
	p:BreakJoints()
	
	table.insert(ignoreList,p)
	
	local bps = Effects.Particles(p,"blood",false)
	bps.Size = NumberSequence.new(.2 * scale)
	bps:Emit(7)
	
	local force = ins("BodyVelocity",p)
	force.MaxForce = v3(huge,huge,huge)
	force.Velocity = (direc + v3(drandom(-.75,.75,100),drandom(-.75,.75,100),drandom(-.75,.75,100))) * forcev
	
	remove(force,.15)
	
	local raySides = {
		v3(0,100,0),
		v3(0,-100,0),
		v3(0,0,100),
		v3(0,0,-100),
		v3(100,0,0),
		v3(-100,0,0),
		v3(100,100,0),
		v3(-100,100,0),
		v3(100,-100,0),
		v3(-100,-100,0),
		v3(0,100,100),
		v3(0,100,-100),
		v3(0,-100,100),
		v3(0,-100,-100),
		v3(100,100,100),
		v3(100,-100,100),
		v3(100,100,-100),
		v3(100,-100,-100),
		v3(-100,100,100),
		v3(-100,-100,100),
		v3(-100,100,-100),
		v3(-100,-100,-100),
		v3(100,100,-100),
		v3(-100,-100,100),
		v3(-100,100,-100),
		v3(100,-100,100)
	}
	local deb = false
	p.Touched:Connect(function(hit)
		if hit:IsDescendantOf(char) or hit:IsDescendantOf(ignore) or deb then return end
		deb = true
		bps.Enabled = false
		p.CanCollide = false
		p.Anchored = true
		local pPos = p.Position
		remove(p,2.5)
		
		local decSize = 3 * scale
		local reg = Region3.new(pPos - v3(decSize/2,decSize/2,decSize/2),pPos + v3(decSize/2,decSize/2,decSize/2))
		local foundParts = workspace:FindPartsInRegion3WithWhiteList(reg,ignoreList,100)
		
		local breakAfter = false
		
		for i,v in pairs(foundParts) do
			if v.Name == "BloodPuddle_v2" then
				local add = random(10,25)/100
				v.Size = v.Size + v3(add,0,add) * scale
				local pars = Effects.Particles(v,"blood",true)
				pars.LockedToPart = false
				pars.Size = NumberSequence.new(.2 * scale)
				pars.Speed = NumberRange.new(5)
				pars.Acceleration = v3(0,-10,0) * scale
				pars.SpreadAngle = Vector2.new(50,50) * scale
				pars.Lifetime = NumberRange.new(.2,.5)
				pars:Emit(3)
				breakAfter = true
			end
		end
		
		if breakAfter then
			return
		end
		
		for i,v in pairs(raySides) do
			local hitt,ppos,nId = rayc(pPos,(pPos + v) - pPos,ignoreList,5 * scale)
			if hitt then
				
				local decSize = 3 * scale
				local reg = Region3.new(pPos - v3(decSize/2,decSize/2,decSize/2),pPos + v3(decSize/2,decSize/2,decSize/2))
				local foundParts = workspace:FindPartsInRegion3WithWhiteList(reg,ignoreList,100)
				
				local breakAfter = false
				
				for i,v in pairs(foundParts) do
					if v.Name == "BloodPuddle_v2" then
						local add = random(10,25)/100
						v.Size = v.Size + v3(add,0,add) * scale
						local pars = Effects.Particles(v,"blood",true)
						pars.LockedToPart = false
						pars.Size = NumberSequence.new(.2 * scale)
						pars.Speed = NumberRange.new(5 * scale)
						pars.Acceleration = v3(0,-10,0) * scale
						pars.SpreadAngle = Vector2.new(50,50) * scale
						pars.Lifetime = NumberRange.new(.2,.5)
						pars:Emit(3)
						breakAfter = true
					end
				end
				
				if breakAfter then
					return
				end
				
				local size = random(75,125)/100
				local puddle = ins("Part")
				puddle.CanCollide = false
				puddle.Anchored = true
				puddle.Material = "SmoothPlastic"
				puddle.Color = bc("Maroon").Color
				puddle.Size = v3(size,.05,size) * scale
				puddle.CFrame = cf(ppos,ppos+nId) * angles(rad(-90),rad(0),rad(0))
				puddle.Name = "BloodPuddle_v2"
				puddle.Parent = effects
				
				if not hitt.Anchored then
					puddle.Anchored = false
					local we = ins("WeldConstraint",puddle)
					we.Part0 = hitt
					we.Part1 = puddle
				end
				
				ins("CylinderMesh",puddle)
				
				sound(685857471,.025 * scale,drandom(.9,1.1,100),puddle,.01)
				
				local pars = Effects.Particles(puddle,"blood",true)
				pars.LockedToPart = false
				pars.Size = NumberSequence.new(.2 * scale)
				pars.Speed = NumberRange.new(5 * scale)
				pars.Acceleration = v3(0,-10,0) * scale
				pars.SpreadAngle = Vector2.new(50,50) * scale
				pars.Lifetime = NumberRange.new(.2,.5)
				pars:Emit(20)
				
				coroutine.wrap(function()
					wait(random(450,900)/100)
					remove(puddle,2)
					tlerp(puddle,{Transparency = 1},2,styles.Quad,directions.In)
				end)()
				
				break
			end
		end
	end)
end

function damage(humanoid,Damage,knockback,knockbackStartPoint,knockbackTime,knockDelay,damageSound,ripHead)
	Damage = Damage or random(5,15)
	knockback = knockback or 15
	knockbackStartPoint = knockbackStartPoint or v3(0,0,0)
	knockbackTime = knockbackTime or .15
	knockDelay = knockDelay or .2
	damageSound = damageSound or sound(851453784,1.5,drandom(.9,1.1,100),nil,1)
	if humanoid and not humanoid:FindFirstChild("Dbounce'd") and humanoid.Health > .01 then
		Damage = math.floor(Damage * (1 + humanoid.MaxHealth/500))
		local part = humanoid.Parent:FindFirstChildOfClass("Part") or humanoid.Parent:FindFirstChildOfClass("MeshPart")
		local deb = ins("BoolValue",humanoid)
		deb.Name = "Dbounce'd"
		remove(deb,knockDelay)
		if part then
			damageSound.Parent = part
			--local knock = ins("BodyVelocity",part)
			--knock.MaxForce = v3(huge,huge,huge)
			--knock.Velocity = -cf(part.Position,knockbackStartPoint).LookVector * knockback
			--remove(knock,knockbackTime)
			for i = 1,random(1,4) do
				blood(part.CFrame * cf(drandom(-1,1,10),drandom(-1,1,10),drandom(-1,1,10)),hitbox.CFrame.LookVector,random(10,20),drandom(.8,1.2,100),humanoid.Parent)
			end
		end
		--[[if humanoid.MaxHealth > 10000000 then
			sound(1753674936,5,1,t,5)
			death(humanoid.Parent,ripHead)
		end
		humanoid.Health = humanoid.Health - Damage]]
		if humanoid.Health < .01 then
			death(humanoid.Parent,ripHead)
			if part then
				placesoundpart(part,2801263,15,drandom(.9,1.1,100),1)
			end
		end
	end
end

function magDamage(pos,partSize,size,Damage,knockback,knockbackTime,knockDelay,damageSound,ripHead)
	pcall(function()
		local reg
		local knockPoint
		if typeof(pos) == "Vector3" then
			reg = Region3.new(pos - v3(size/2,size/2,size/2),pos + v3(size/2,size/2,size/2))
			knockPoint = pos
		elseif typeof(pos) == "Instance" then
			knockPoint = pos.Position
			if partSize then
				reg = Region3.new(pos.Position - pos.Size/2,pos.Position + pos.Size/2)
				local hb = ins("Part",effects)
				hb.Anchored = true
				hb.CanCollide = false
				hb.Size = reg.Size
				hb.CFrame = reg.CFrame
				remove(hb,5)
			else
				reg = Region3.new(pos.Position - v3(size/2,size/2,size/2),pos.Position + v3(size/2,size/2,size/2))
			end
		end
		if reg then
			for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(reg,{char},250)) do
				local humm = v.Parent:FindFirstChildOfClass("Humanoid")
				if humm then
					damage(humm,Damage,knockback,knockPoint,knockbackTime,knockDelay,damageSound,ripHead)
				end
			end
		end
	end)
end

function swing1()
	using = true
	local oldWS = ws
	local oldJP = jp
	jp = 50
	local alpha = .4
	local add = -.0165
	for i = 0,1,.075 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(0),rad(-40),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,-.15) * angles(rad(0),rad(-40),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,-.05,-.4) * angles(rad(95),rad(90),rad(0)) * angles(rad(25),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.15,.2) * angles(rad(15),rad(35),rad(5)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,-.075) * angles(rad(-10),rad(-5),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,-.075,-.125) * angles(rad(10),rad(10),rad(-2.5)),alpha)
		handleW.C1 = handleW.C1:Lerp(angles(rad(80),rad(0),rad(0)),alpha)
		alpha = alpha + add
		swait()
	end
	alpha = .35
	add = .075
	for i = 0,1,.095 do
		for i,v in pairs(katana:GetChildren()) do
			if v.Name == "BladeMain" then
				magDamage(v,false,.5,random(25,50),random(15,30),.05,.3,nil,true)
			end
		end
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(0),rad(50),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,.25) * angles(rad(0),rad(50),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,.05,.15) * angles(rad(95),rad(90),rad(0)) * angles(rad(-105),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.05,-.1) * angles(rad(35),rad(-25),rad(-15)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,-.05,-.1) * angles(rad(10),rad(-10),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(-15),rad(5),rad(-2.5)),alpha)
		handleW.C1 = handleW.C1:Lerp(angles(rad(120),rad(0),rad(0)),alpha)
		alpha = alpha + add
		if alpha >.775 then
			add = -math.abs(add)
		end
		swait()
	end
	ws = oldWS
	jp = oldJP
	using = false
end

function swing2()
	using = true
	local oldWS = ws
	local oldJP = jp
	jp = 50
	local alpha = .4
	local add = -.0175
	for i = 0,1,.075 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(-7.5),rad(30),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,-.15) * angles(rad(-5),rad(30),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,.35,.25) * angles(rad(190),rad(0),rad(20)) * angles(rad(0),rad(40),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.15,.2) * angles(rad(5),rad(-5),rad(-2.5)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,-.075) * angles(rad(-7.5),rad(-10),rad(8.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,-.075,-.125) * angles(rad(7.5),rad(10),rad(-2.5)),alpha)
		handleW.C1 = handleW.C1:Lerp(angles(rad(80),rad(0),rad(0)),alpha)
		alpha = alpha + add
		swait()
	end
	alpha = .5
	add = .095
	for i = 0,1,.115 do
		for i,v in pairs(katana:GetChildren()) do
			if v.Name == "BladeMain" then
				magDamage(v,false,.5,random(40,65),random(15,30),.05,.3,nil,false)
			end
		end
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(3.5),rad(5),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,.25) * angles(rad(20),rad(-5),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(-.25,-.25,-.3) * angles(rad(40),rad(0),rad(-15)) * angles(rad(0),rad(10),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.15,.2) * angles(rad(35),rad(-15),rad(-10)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,-.125) * angles(rad(7.5),rad(-5),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,-.075,-.125) * angles(rad(10),rad(10),rad(-2.5)),alpha)
		handleW.C1 = handleW.C1:Lerp(angles(rad(135),rad(0),rad(0)),alpha)
		alpha = alpha + add
		if alpha >.85 then
			add = -math.abs(add)
		end
		swait()
	end
	ws = oldWS
	jp = oldJP
	using = false
end

function heal()
	using = true
	local alpha = .35
	local add = -.015
	for i = 0,1,.05 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(-25),rad(50),rad(2.5)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(.1,-.05,.065) * angles(rad(-10),rad(35),rad(25)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(rad(0),rad(-5),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(0),rad(5),rad(-2.5)),alpha)
		alpha = alpha + add
		swait()
	end
	local s = folder.Models.Syringe:Clone()
	s.Parent = la
	local w = createWeld(la,s,cf(.1,-.95,0),angles(rad(0),rad(90),rad(180)))
	local alpha = .45
	local add = -.03
	for i = 0,1,.075 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(-25),rad(10),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(.15,.1,-.35) * angles(rad(65),rad(0),rad(25)) * cf(0,0,0) * angles(rad(0),rad(50),rad(0)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(rad(0),rad(-5),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(0),rad(5),rad(-2.5)),alpha)
		alpha = alpha + add
		swait()
	end
	local alpha = .5
	local add = -.04
	sound(851453784,.075,drandom(1.25,1.65,100),la,.25)
	for i = 0,1,.1 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(-20),rad(-10),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(.25,-.05,-.75) * angles(rad(45),rad(0),rad(70)) * cf(0,0,0) * angles(rad(0),rad(60),rad(0)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(rad(0),rad(-5),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(0),rad(5),rad(-2.5)),alpha)
		alpha = alpha + add
		swait()
	end
	local healSpeed = 1
	for i = 1,120,healSpeed do
		--hum.Health = hum.Health + healSpeed
		swait()
	end
	healPercentage = 0
	local alpha = .5
	local add = -.04
	for i = 0,1,.1 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(-20),rad(5),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(.1,-.05,-.5) * angles(rad(65),rad(0),rad(20)) * cf(0,0,0) * angles(rad(0),rad(50),rad(0)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(rad(0),rad(-5),rad(2.5)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(0),rad(5),rad(-2.5)),alpha)
		alpha = alpha + add
		swait()
	end
	s.CanCollide = true
	s:BreakJoints()
	removeWithFade(s,3.5)
	using = false
end

--[[
	local alpha = .35
	local add = -.025
	for i = 0,1,.025 do
		nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rs.C0 = rs.C0:Lerp(rsc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),alpha)
		alpha = alpha + add
		swait()
	end
function base()
	using = true
	local oldWS = ws
	local oldJP = jp
	ws = 0
	jp = 0
	
	ws = oldWS
	jp = oldJP
	using = false
end
--]]

--hum.Died:Connect(function()
--	killr6(char,false)
--end)

local comboAttacks = {swing1,swing2}

mouse = Player:GetMouse()

mouse.KeyDown:Connect(function(key)
	if not using then
		if key == "space" and wallJump and not wallJumpDeb then
            print(1)
			sound(1547211023,1.25,drandom(.8,1.1,100),t,.05)
			sound(260411131,1,drandom(1.1,1.3,100),t,.05)
			wallJumpDeb = true
			local vel = ins("BodyVelocity",rut)
			vel.MaxForce = v3(huge,huge,huge)
			vel.Velocity = (-rut.CFrame.LookVector * 45) + v3(0,125,0)
			remove(vel,.025)
			local hi,po,ni = rayc(rut.Position,rut.CFrame.LookVector,{char},3)
			if hi then
				for i = 1,random(4,8) do
					local siz = drandom(7,17,5,10)
					Effects.Ring(cf(po,po + ni) * angles(rad(random(-15,15)),rad(random(-15,15)),rad(random(-15,15))),bc("Institutional white").Color,v3(2,2,.75),v3(siz,siz,.35),drandom(.35,.65,100),1,drandom(.15,.75,100))
				end
			end
			wait(.5)
			wallJumpDeb = false
		end
		if key == "h" and healPercentage == 1 then
			heal()
		end
	end
	if key == "f" then
		lightEnabled = not lightEnabled
	end
	if key == "m" then
		muted = not muted
	end
end)

mouse.Button1Down:Connect(function()
	if not using then
		comboAttacks[combo]()
		combo = combo +1
		if combo > #comboAttacks then
			combo = 1
		end
	end
end)

--hum.MaxHealth = healthPool
--hum.Health = healthPool

stepped:Connect(function()
	healPercentage = healPercentage + .00075
	if healPercentage >1 then
		healPercentage = 1
	end
	healPNum.Value = healPercentage
	if theme.Parent ~= t then
		remove(theme)
		theme = ins("Sound",t)
		theme.Volume = themeVolume
		theme.SoundId = asset..themeID
		theme.Pitch = themePitch
		theme.TimePosition = timePos
		theme.Looped = true
		theme:Play()
	end
	
	theme:Resume()
	if muted then
		theme.Volume = 0
	else
		theme.Volume = themeVolume
	end
	theme.SoundId = asset..themeID
	theme.Pitch = themePitch
	
	timePos = theme.TimePosition
	
	sine = sine + change
	
	local verVel = rut.Velocity.y
	local horVel = (rut.Velocity * v3(1,0,1)).Magnitude

	local Ccf=rut.CFrame
	
	local dir = hum.MoveDirection
	
	if dir == v3(0,0,0) then
		dir = rut.Velocity/10
	end

	local Walktest1 = dir * Ccf.LookVector
	local Walktest2 = dir * Ccf.RightVector

	local rotfb = Walktest1.X+Walktest1.Z
	local rotrl = Walktest2.X+Walktest2.Z
	
	if rotfb >1 then
		rotfb = 1
	elseif rotfb <-1 then
		rotfb = -1
	end
	
	if rotrl >1 then
		rotrl = 1
	elseif rotrl <-1 then
		rotrl = -1
	end
	
	hum.MaxHealth = healthPool
	
	hum.WalkSpeed = ws
	hum.JumpPower = jp
	
	--for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if not plrg:FindFirstChild(shaker.Name) then
			local shak = shaker:Clone()
			shak.Parent = plrg
			shak.Disabled = false
		end
	--end
	
	if lightEnabled then
		for i,v in pairs(lamp:GetDescendants()) do
			if v:IsA("SurfaceLight") then
				v.Enabled = true
			end
			if string.find(v.Name:lower(),"light") and v:IsA("Part") then
				v.Color = bc("White").Color
			end
		end
	else
		for i,v in pairs(lamp:GetDescendants()) do
			if v:IsA("SurfaceLight") then
				v.Enabled = false
			end
			if string.find(v.Name:lower(),"light") and v:IsA("Part") then
				v.Color = bc("Really black").Color
			end
		end
	end
	
	local hit,pos,nId = rayc(rut.Position + v3(0,-rut.Size.y/2,0),v3(rut.Position.x,-10000,rut.Position.z),{char},3)
	local wHit = rayc(rut.Position,rut.CFrame.LookVector,{char},2)
	
	if wHit then
		wallJump = true
	else
		wallJump = false
	end
	
	if anim == "idle" and hit then
		nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(sin(sine/25) * rad(5),-sin(sine/100) * rad(7.5),-cos(sine/50) * rad(3.5)),.1)
		rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,sin(sine/25)/15,sin(sine/50)/15) * angles(sin(sine/25) * rad(3.5),sin(sine/75) * rad(2.5),cos(sine/50) * rad(3.5)),.1)
		rs.C1 = rs.C1:Lerp(rsc1 * cf(0,sin(sine/25)/15,0) * angles(sin(sine/25) * rad(2.5),sin(sine/75) * rad(5),cos(sine/50) * rad(3.5)),.1)
		ls.C1 = ls.C1:Lerp(lsc1 * cf(0,sin(sine/25)/15,0) * angles(cos(sine/25) * rad(3.5),-sin(sine/75) * rad(5),cos(sine/50) * rad(3.5)),.1)
		rh.C1 = rh.C1:Lerp(rhc1 * cf(0,sin(sine/25)/15,0) * angles((sin(sine/25) * rad(6)) + (sin(sine/75) * rad(2.5)),rad(0),cos(sine/50) * rad(4)),.1)
		lh.C1 = lh.C1:Lerp(lhc1 * cf(0,sin(sine/25)/15,0) * angles((sin(sine/25) * rad(6)) - (sin(sine/75) * rad(2.5)),rad(0),cos(sine/50) * rad(4)),.1)
	elseif anim == "fall" and not hit then
		nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
	elseif anim == "jump" and not hit then
		nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		rh.C1 = rh.C1:Lerp(rhc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
		lh.C1 = lh.C1:Lerp(lhc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.1)
	elseif anim == "walk" and hit then
		nec.C1 = nec.C1:Lerp(necc1 * cf(0,0,0) * angles(cos(sine/1.25) * rad(1.5),sin(sine/2.5) * rad(2.5),rad(0)) * angles(-rotfb/5,rotrl/2,0),.2)
		rutj.C1 = rutj.C1:Lerp(rutjc1 * cf(0,sin(sine/1.25)/7.5,0) * angles(sin(sine/1.25) * rad(2),sin(sine/2.5) * rad(5),rad(0)) * angles(-rotfb/2.5,0,-rotrl/4.5),.2)
		if using == false then
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(-cos(sine/1.25) * rad(7.5),-sin(sine/2.5) * rad(5),rad(0)),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * cf(0,abs(rotfb/2.25),0) * angles(cos(sine/2.5) * rad(10),sin(sine/2.5) * rad(5),rad(0)) * angles(rotfb + (rotrl/2),0,rotrl/1.75) * angles(rad(0),rad(25),rad(0)),.2)
		else
			rs.C1 = rs.C1:Lerp(rsc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.2)
			ls.C1 = ls.C1:Lerp(lsc1 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.2)
		end
		rh.C1 = rh.C1:Lerp(rhc1 * cf(0,cos(sine/2.5)/2.5,-cos(sine/2.5)/2) * angles(sin(sine/2.5) * rad(85) * rotfb,rad(0),sin(sine/2.5) * rad(65) * rotrl),.2)
		lh.C1 = lh.C1:Lerp(lhc1 * cf(0,-cos(sine/2.5)/2.5,cos(sine/2.5)/2) * angles(-sin(sine/2.5) * rad(85) * rotfb,rad(0),-sin(sine/2.5) * rad(65) * rotrl),.2)
	end
	if not using then
		handleW.C1 = handleW.C1:Lerp(angles(rad(75),rad(190),rad(0)),.25)
	end
	if horVel > 5 and verVel >-10 and verVel <10 then
		anim = "walk"
		change = .75
		if using == false then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,-.2,.25) * angles(rad(-10),rad(-55),rad(0)) * angles(rad(0),rad(0),rad(15)),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(.125,.1,0) * angles(rad(0),rad(0),rad(-3.5)),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,0) * angles(rad(0),rad(0),rad(0)),.2)
		end
	elseif verVel >10 then
		anim = "jump"
		change = 1
		if not using then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(15),rad(0),rad(0)),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(-5),rad(0),rad(0)),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,-.1,.25) * angles(rad(5),rad(-15),rad(0)) * angles(rad(0),rad(0),rad(7.5)),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(0,0,0) * angles(rad(145),rad(0),rad(-8)),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.1,-.1) * angles(rad(-3.5),rad(0),rad(2)),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,.3,-.25) * angles(rad(-9),rad(0),rad(-3.5)),.2)
		end
		elseif verVel <-10 then
		anim = "fall"
		change = 1
		if not using then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(-5),rad(0),rad(0)),.2)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(5),rad(0),rad(0)),.2)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.1,-.15,.25) * angles(rad(15),rad(-10),rad(0)) * angles(rad(0),rad(0),rad(15)),.2)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(-.45,-.44,0) * angles(rad(6),rad(0),rad(-97.5)),.2)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,.3,-.25) * angles(rad(-9),rad(0),rad(2)),.2)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,.1,-.1) * angles(rad(-3.5),rad(0),rad(-3.5)),.2)
		end
	elseif horVel < 5 and verVel >-10 and verVel <10 then
		anim = "idle"
		change = 1
		if not using then
			nec.C0 = nec.C0:Lerp(necc0 * cf(0,0,0) * angles(rad(3.5),rad(15),rad(3.5)),.1)
			rutj.C0 = rutj.C0:Lerp(rutjc0 * cf(0,0,0) * angles(rad(7.5),rad(15),rad(-3.5)),.1)
			rs.C0 = rs.C0:Lerp(rsc0 * cf(-.15,-.25,.35) * angles(rad(-25),rad(-45),rad(0)) * angles(rad(0),rad(0),rad(-25)),.1)
			ls.C0 = ls.C0:Lerp(lsc0 * cf(0,-.125,-.075) * angles(rad(12.5),rad(-10),rad(-7.5)),.1)
			rh.C0 = rh.C0:Lerp(rhc0 * cf(0,0,-.1) * angles(rad(-10),rad(-7.5),rad(-5)),.1)
			lh.C0 = lh.C0:Lerp(lhc0 * cf(0,0,-.15) * angles(rad(10),rad(20),rad(-2.5)),.1)
		end
	end
end)
-- i'm tired of life and i want to end it...


local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat = chr["Nagamaki"].Handle -- put the hat here
hat:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat -- Don't bother changing this you already changed it on line 3
Weld.Part0 = workspace.non.Katana.Handle -- What your welding the hat to (has to be a BasePart)

Weld.C0 = CFrame.new(0,1.3,0.25)*CFrame.Angles(math.rad(148.5),math.rad(90),0) -- CFrame.new is the orientation! CFrame.Angles propertys are the angles by XYZ Positions they aren't hard to use if u know what ur doing.

for _,v in next, workspace.non.Katana:GetChildren() do
    if v:IsA("BasePart") then
        v.Transparency = 1
    end
end
print("Ran with no errors")
