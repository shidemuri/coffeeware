getgenv()._reanimate()

local stopper = Instance.new('BindableEvent')
local folder = game:GetObjects("rbxassetid://9253561804")[1]
folder.Parent = workspace.non

FELOADLIBRARY = {}
loadstring(game:GetObjects("rbxassetid://5209815302")[1].Source)()
local LoadLibrary = FELOADLIBRARY


--[[ Stratospheric Glitcher 2 ]]-- Because one wasn't enough apparently

--[[ Developers

Aero - blue man
Avix_G - green triangle man
GunsForGunsKidd - gun man
KnottyEeveez - effect and maybe attack man but also pokimane man
AccountAgeReplicate - "0." exterminator and performance upgrader (lol)

]]

-- Aside from the silly quotes I(KnottyEeveez) put there. All of these people contributed to making this script good


local chrt = game.Players.LocalPlayer.Character

local function weld(part0,part1,c0)
	local hat = part1
	hat.Handle:BreakJoints()
	local Weld = Instance.new("Weld", chrt)
	Weld.Name = part0.Parent.Name
	-- Tips for past John (Tescalus)

	Weld.Part1 = hat.Handle -- Don't bother changing this you already changed it on line 3
	Weld.Part0 = part0 -- What your welding the hat to (has to be a BasePart)

	Weld.C0 = c0 -- CFrame.new is the orientation! CFrame.Angles propertys are the angles by XYZ Positions they aren't hard to use if u know what ur doing.
end

local function getgreatsword(textureid)
	for _,v in next, chrt:GetChildren() do
		if v:IsA('Accessory') and v.Name == 'MeshPartAccessory' then
			if v.Handle:FindFirstChildOfClass('SpecialMesh') then
				if v.Handle.SpecialMesh.MeshId:match('%d+')=='4315410540' then
					if v.Handle.SpecialMesh.TextureId:match('%d+')==tostring(textureid) then
						return v
					end
				end
			end
		end
	end
end

local winghats = {
	[1]=getgreatsword('4506940486'),
	[2]=getgreatsword('4794299274'),
	[3]=getgreatsword('4315250791'),
	[4]=getgreatsword('4458626951'),
	[5]=chrt:FindFirstChild('ShatteredGreatsword'),
	[6]=chrt:FindFirstChild('Meshes/machinedemon_meshAccessory')
}


local Service = setmetatable({}, {__call = function(_, Service) local _, Service = pcall(game.GetService, game, Service) return Service or nil end})

local math = setmetatable(
	{
		random = function(a,b)
			if a and b then
				return Random.new():NextInteger(a,b)
			elseif not a and not b then
				return Random.new():NextNumber(0,1)
			end
		end
	}, {__index = math})

local Instance = setmetatable(
	{
		new = function(Class, Properties)
			if typeof(Properties) == "nil" then local _, Class = pcall(Instance.new, Class) return Class or nil end
			if typeof(Properties) == "Instance" then local _, Class = pcall(Instance.new, Class, Properties) return Class or nil end
			if typeof(Properties) == "table" then
				local _, Class = pcall(Instance.new, Class)
				for Property, Value in pairs(Properties) do
					pcall(function()
						if Property ~= "Parent" then
							Class[Property] = Value
						end
					end)
				end
				if Properties.Parent then Class.Parent = Properties.Parent end
				return Class
			end
		end
	}, {__index = Instance})

local Admins = {
	-- Aero 
	"StratosphericAero",
	-- Strato devs
	"KnottyEeveez",
	"GunsForGunsKidd",
	"Avix_G",
	"AccountAgeReplicate",
	-- Other trusted members
	"Birdmaid",
	"DerpzDeNugget_YT",
	"dinkydoo58",
	"divineMoai",
	"doz_koob", -- alt
	"Helkern",
	"IWonderWhoAuntySara", -- alt
	"Jon180018",
	"loplkc",
	"NawThaiError",
	"OGNintendofan",
	"sakke03",
	"Salvo_Starly",
	"Ssyync"
}

-- Stats and variables used during gameplay.
local IsTwelveWingForm = false

local jumps = 1 -- The number of extra jumps remaining. 1 is consumed per doublejump. Restored to 1 if the main loop detects there is ground.

local PowerMultiplier = 1 -- For use by admins. Chat "power/[number]". Limited to between .01x and 100x.

local WingStatus, WingCooldown = {}, {} -- Determines which wings are available for attacks, This is a mess.

for i = 1, 6 do
	WingStatus[i] = true
end

for i = 7, 12 do
	WingStatus[i] = false -- Aerial, the starting mode, only has six wings.
end

for i = 1, 12 do
	WingCooldown[i] = nil
end

local AttacksUsable = { -- Cooldown system.
	Z = true,
	X = true
	--C = true, -- We don't have this yet.
	--V = true
}

-- Labelling What is What. -- //

local plr = game.Players.LocalPlayer
local Player = plr
local char = plr.Character

local Whatever = folder["moai's stupid effect replication"].Whatever
local CRGui = folder.CRLoaderGui
local What = CRGui.CR_Loader.waht

What.event.Value = Whatever
What.moduler.Value = folder["moai's stupid effect replication"].stupidAnimThing

--[[
local Whatever = folder["moai's stupid effect replication"].Whatever
local What = folder["moai's stupid effect replication"].waht

What.moduler.Value = folder["moai's stupid effect replication"].stupidAnimThing

coroutine.resume(coroutine.create(function()
	while wait(1) do
		for _,v in pairs(Service("Players"):GetPlayers()) do
			if v.PlayerGui:FindFirstChild(v.Name .. "'s SuperFunniStratoEFX") then
				v.PlayerGui:FindFirstChild(v.Name .. "'s SuperFunniStratoEFX").waht.moduler.Value = folder["moai's stupid effect replication"].stupidAnimThing
				v.PlayerGui:FindFirstChild(v.Name .. "'s SuperFunniStratoEFX").waht.event.Value = Whatever
			else
				local Gui = Instance.new("ScreenGui",v.PlayerGui)
				Gui.ResetOnSpawn = false
				Gui.Name = v.Name .. "'s SuperFunniStratoEFX"
				local Scrimpt = What:Clone()
				Scrimpt.Disabled = false
				Scrimpt.Parent = Gui
			end
		end
	end
end))
]]
--for _,v in pairs(Service("Players"):GetPlayers()) do
--	local e = What:Clone()
--	e.Disabled = false
--	e.Parent = v.Character
--	v.CharacterAdded:Connect(function(p)
--		local eh = What:Clone()
--		eh.Disabled = false
--		eh.Parent = p
--	end)
--end

--Service("Players").PlayerAdded:Connect(function(p)
--	p.CharacterAdded:Connect(function(v)
--		local e = What:Clone()
--		e.Disabled = false
--		e.Parent = v
--	end)
--end)

--local animThing = require(folder["moai's stupid effect replication"].stupidAnimThing) -- critical for animations and effects

local pcalle = pcall

local caughterrors = {}

function pcallo(dd)
	local eje,errorr = pcalle(dd)
	if not eje and not caughterrors[errorr] then
		print(errorr)
		caughterrors[errorr] = true
	end
	return eje,errorr
end

local pcall = pcallo

local Pl = Service("Players"):GetPlayerFromCharacter(folder.Parent)
local Player = Pl
local C = workspace.non
local Hum = C.Humanoid
local CFR = CFrame.new
folder.Parent = Player.Character


-- Humanoid Stuff, Mainly Defining the player and what a CFrame is. -- //

-- Nothing personal here, Just poking some fun at friends, But if you aren't the users i've defined, Then you have no use being here.

local rad,cos,sin,min,sqrt,acos,asin,floor,random,huge,pi = math.rad,math.cos,math.sin,math.min,math.sqrt,math.acos,math.asin,math.floor,math.random,math.huge,math.pi
local ccreate,cresume = coroutine.create,coroutine.resume
local LerpFactor, Alpha = .1
local sine = 0
local change = 1
local sidecooldown = 0
local currentside = 1
-- Ceasing Animate -- //
C:WaitForChild("Animate"):Destroy() -- Animate needs to C e a s e -- //
C:FindFirstChildOfClass("Humanoid"):WaitForChild("Animator"):Destroy()  -- Just so animate doesn't cause any further problems. -- //
-- Animate has now Ceased -- //
-- Limb Setup. --
local char = C
local Torso = char.Torso
local rarm = char["Right Arm"]
local larm = char["Left Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local ra = char["Right Arm"]
local la = char["Left Arm"]
local rl = char["Right Leg"]
local ll = char["Left Leg"]
local LS=Torso["Left Shoulder"] 
local LH=Torso["Left Hip"] 
local RS=Torso["Right Shoulder"] 
local RH=Torso["Right Hip"] 
local RW, LW=Instance.new("Motor6D", {Name = "Right Shoulder"}), Instance.new("Motor6D", {Name = "Left Shoulder"})
local LH=Torso["Left Hip"]
local RH=Torso["Right Hip"]
local hed = char.Head

local Mode = 1

Hum.MaxHealth = huge
Hum.Health = huge
Hum.Name = "Humanoid"
-- CFrame Functions
function QuaternionFromCFrame(cf) 
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
	local trace = m00 + m11 + m22 
	if trace > 0 then 
		local s = sqrt(1 + trace) 
		local recip = .5/s 
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*.5 
	else 
		local i = 0 
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then 
			i = 2 
		end 
		if i == 0 then 
			local s = sqrt(m00-m11-m22+1) 
			local recip = .5/s 
			return .5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
		elseif i == 1 then 
			local s = sqrt(m11-m22-m00+1) 
			local recip = .5/s 
			return (m01+m10)*recip, .5*s, (m21+m12)*recip, (m02-m20)*recip 
		elseif i == 2 then 
			local s = sqrt(m22-m00-m11+1) 
			local recip = .5/s 
			return (m02+m20)*recip, (m12+m21)*recip, .5*s, (m10-m01)*recip 
		end 
	end 
end

function QuaternionToCFrame(px, py, pz, x, y, z, w) 
	local xs, ys, zs = x + x, y + y, z + z 
	local wx, wy, wz = w*xs, w*ys, w*zs 
	local xx, xy, xz, yy, yz, zz = x*xs, x*ys, x*zs, y*ys, y*zs, z*zs
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end

function QuaternionSlerp(a, b, t) 
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
	local startInterp, finishInterp
	if cosTheta >= .0001 then 
		if (1 - cosTheta) > .0001 then 
			local theta = acos(cosTheta) 
			local invSinTheta = 1/sin(theta) 
			startInterp = sin((1-t)*theta)*invSinTheta 
			finishInterp = sin(t*theta)*invSinTheta  
		else 
			startInterp = 1-t 
			finishInterp = t 
		end 
	else 
		if (1+cosTheta) > .0001 then 
			local theta = acos(-cosTheta) 
			local invSinTheta = 1/sin(theta) 
			startInterp = sin((t-1)*theta)*invSinTheta 
			finishInterp = sin(t*theta)*invSinTheta 
		else 
			startInterp = t-1 
			finishInterp = t 
		end 
	end 
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

function clerp(a,b,t) 
	local qa, qb = {QuaternionFromCFrame(a)}, {QuaternionFromCFrame(b)}
	local ax, ay, az = a.X, a.Y, a.Z
	local bx, by, bz = b.X, b.Y, b.Z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end 

local euler = CFrame.fromEulerAnglesXYZ
local cf = CFrame.new
local angles = CFrame.Angles
local necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local necko2=cf(0, -.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
local LHC1=cf(-.5,1,0,-0,-0,-1,0,1,0,1,0,0)
local RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
local RHC1=cf(.5,1,0,0,0,1,0,1,0,-1,-0,-0)
local RootPart=char.HumanoidRootPart
local RootJoint=RootPart.RootJoint
local RootCF=euler(-(pi/2),0,pi)
local root = char:WaitForChild'HumanoidRootPart'
local player=Player 
local ch=char
local RSH=ch.Torso["Right Shoulder"] 
local LSH=ch.Torso["Left Shoulder"] 
-- 
RSH.Parent=nil 
LSH.Parent=nil 
-- 
RW.Part0=ch.Torso 
RW.C0=cf(1.5, .5, 0) * euler(1.3, 0, -.5) 
RW.C1=cf(0, .5, 0) 
RW.Part1=ch["Right Arm"] 
RW.Parent=ch.Torso 
-- 
LW.Part0=ch.Torso 
LW.C0=cf(-1.5, .5, 0) * euler(1.7, 0, .8) 
LW.C1=cf(0, .5, 0) 
LW.Part1=ch["Left Arm"] 
LW.Parent=ch.Torso 

Hum.WalkSpeed = 16
Hum.JumpPower = 100
-- CFrame End --
local WingFolder = folder.Wings
local wings = WingFolder
local OtherThings = folder.ScriptObjects.MotorFolder
local plr = folder.Parent

local WNG1 = WingFolder.Wing1
local Wing1Weld = Instance.new("WeldConstraint",folder.Wings.Wing1)
Wing1Weld.Part0 = WingFolder.Wing1.Main Wing1Weld.Part1 = WingFolder.Wing1.Secondary
weld(WNG1.Main,winghats[1],CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),0,math.rad(-45)))

local w1m = Instance.new("Motor6D",OtherThings) w1m.Part0 = Torso w1m.Part1 = WingFolder.Wing1.Center

local W2W = WNG1:Clone() W2W.Name = "Wing2" W2W.Parent = WingFolder
weld(W2W.Main,winghats[2],CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),0,math.rad(-45)))
local w2m = Instance.new('Motor6D',OtherThings) w2m.Part0 = Torso w2m.Part1 = WingFolder.Wing2.Center

local W3W = WNG1:Clone() W3W.Name = "Wing3" W3W.Parent = WingFolder
weld(W3W.Main,winghats[3],CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),0,math.rad(-45)))
local w3m = Instance.new('Motor6D',OtherThings) w3m.Part0 = Torso w3m.Part1 = WingFolder.Wing3.Center

local W4W = WNG1:Clone() W4W.Name = "Wing4" W4W.Parent = WingFolder
weld(W4W.Main,winghats[4],CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),0,math.rad(-45)))
local w4m = Instance.new('Motor6D',OtherThings) w4m.Part0 = Torso w4m.Part1 = WingFolder.Wing4.Center

local W5W = WNG1:Clone() W5W.Name = "Wing5" W5W.Parent = WingFolder
weld(W5W.Main,winghats[5],CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),0,math.rad(-90)))
local w5m = Instance.new('Motor6D',OtherThings) w5m.Part0 = Torso w5m.Part1 = WingFolder.Wing5.Center

local W6W = WNG1:Clone() W6W.Name = "Wing6" W6W.Parent = WingFolder
weld(W6W.Main,winghats[6],CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),0,math.rad(90)))
local w6m = Instance.new('Motor6D',OtherThings) w6m.Part0 = Torso w6m.Part1 = WingFolder.Wing6.Center

local ringwing1weld1 = Instance.new("Motor6D",{Part0 = wings.Wing1.Main, Part1 = wings.Wing1.MainRing, Parent = wings.Wing1})
local ringwing1weld2 = Instance.new("Motor6D",{Part0 = wings.Wing1.MainRing, Part1 = wings.Wing1.SecondaryRing, Parent = wings.Wing1})
-----------------------

local ringwing2weld1 = Instance.new("Motor6D",wings.Wing2)
ringwing2weld1.Part0 = wings.Wing2.Main
ringwing2weld1.Part1 = wings.Wing2.MainRing

local ringwing2weld2 = Instance.new("Motor6D",wings.Wing2)
ringwing2weld2.Part0 = wings.Wing2.MainRing
ringwing2weld2.Part1 = wings.Wing2.SecondaryRing
-----------------------

local ringwing3weld1 = Instance.new("Motor6D",wings.Wing3)
ringwing3weld1.Part0 = wings.Wing3.Main
ringwing3weld1.Part1 = wings.Wing3.MainRing
local ringwing3weld2 = Instance.new("Motor6D",wings.Wing3)
ringwing3weld2.Part0 = wings.Wing3.MainRing
ringwing3weld2.Part1 = wings.Wing3.SecondaryRing
-----------------------

local ringwing4weld1 = Instance.new("Motor6D",wings.Wing4)
ringwing4weld1.Part0 = wings.Wing4.Main
ringwing4weld1.Part1 = wings.Wing4.MainRing
local ringwing4weld2 = Instance.new("Motor6D",wings.Wing4)
ringwing4weld2.Part0 = wings.Wing4.MainRing
ringwing4weld2.Part1 = wings.Wing4.SecondaryRing
-----------------------

local ringwing5weld1 = Instance.new("Motor6D",wings.Wing5)
ringwing5weld1.Part0 = wings.Wing5.Main
ringwing5weld1.Part1 = wings.Wing5.MainRing
local ringwing5weld2 = Instance.new("Motor6D",wings.Wing5)
ringwing5weld2.Part0 = wings.Wing5.MainRing
ringwing5weld2.Part1 = wings.Wing5.SecondaryRing
-----------------------

local ringwing6weld1 = Instance.new("Motor6D",wings.Wing6)
ringwing6weld1.Part0 = wings.Wing6.Main
ringwing6weld1.Part1 = wings.Wing6.MainRing
local ringwing6weld2 = Instance.new("Motor6D",wings.Wing6)
ringwing6weld2.Part0 = wings.Wing6.MainRing
ringwing6weld2.Part1 = wings.Wing6.SecondaryRing

-- Did you say 12 wings? --

local WingFolder2 = Instance.new("Folder",WingFolder) WingFolder2.Name = "M o r e"

local W7W = WNG1:Clone() W7W.Name = "Wing7" W7W.Parent = WingFolder2 W7W.MainRing:Destroy() W7W.SecondaryRing:Destroy()
local w7m = Instance.new('Motor6D',OtherThings) w7m.Part0 = Torso w7m.Part1 = WingFolder2.Wing7.Center

local w8 = WNG1:Clone() w8.Name = "Wing8" w8.Parent = WingFolder2 w8.MainRing:Destroy() w8.SecondaryRing:Destroy()
local w8m = Instance.new('Motor6D',OtherThings) w8m.Part0 = Torso w8m.Part1 = WingFolder2.Wing8.Center

local w9 = WNG1:Clone() w9.Name = "Wing9" w9.Parent = WingFolder2 w9.MainRing:Destroy() w9.SecondaryRing:Destroy()
local w9m = Instance.new('Motor6D',OtherThings) w9m.Part0 = Torso w9m.Part1 = WingFolder2.Wing9.Center

local w10 = WNG1:Clone() w10.Name = "Wing10" w10.Parent = WingFolder2 w10.MainRing:Destroy() w10.SecondaryRing:Destroy()
local w10m = Instance.new('Motor6D',OtherThings) w10m.Part0 = Torso w10m.Part1 = WingFolder2.Wing10.Center

local w11 = WNG1:Clone() w11.Name = "Wing11" w11.Parent = WingFolder2 w11.MainRing:Destroy() w11.SecondaryRing:Destroy()
local w11m = Instance.new('Motor6D',OtherThings) w11m.Part0 = Torso w11m.Part1 = WingFolder2.Wing11.Center

local w12 = WNG1:Clone() w12.Name = "Wing12" w12.Parent = WingFolder2 w12.MainRing:Destroy() w12.SecondaryRing:Destroy()
local w12m = Instance.new('Motor6D',OtherThings) w12m.Part0 = Torso w12m.Part1 = WingFolder2.Wing12.Center

local Color1 = Instance.new("Color3Value",{Value = Color3.fromRGB(113, 111, 165), Name = "Color1", Parent = folder})
local Color2 = Instance.new("Color3Value",{Value = Color3.fromRGB(90, 112, 255), Name = "Color2", Parent = folder})
cresume(ccreate(function()
	while true do
		stopper.Event:Connect(function()return;end)
		swait()
		Color1 = Color3.FromRGB(random(0,255),random(0,255),random(0,255))
	end
end))

wings.Wing1.Main.Anchored = false
wings.Wing1.Secondary.Anchored = false
wings.Wing1.Center.Anchored = false
wings.Wing2.Main.Anchored = false
wings.Wing2.Secondary.Anchored = false
wings.Wing2.Center.Anchored = false
wings.Wing3.Main.Anchored = false
wings.Wing3.Secondary.Anchored = false
wings.Wing3.Center.Anchored = false
wings.Wing4.Main.Anchored = false
wings.Wing4.Secondary.Anchored = false
wings.Wing4.Center.Anchored = false
wings.Wing5.Main.Anchored = false
wings.Wing5.Secondary.Anchored = false
wings.Wing5.Center.Anchored = false
wings.Wing6.Main.Anchored = false
wings.Wing6.Secondary.Anchored = false
wings.Wing6.Center.Anchored = false

local lwingweld = wings.Wing1
local lwingweld1 = wings.Wing2
local lwingweld2 = wings.Wing3
local rwingweld3 = wings.Wing4
local rwingweld4 = wings.Wing5
local rwingweld5 = wings.Wing6
-- [Gui systems n shiz] --
local MainGui = folder.Stratospheric2
MainGui.Parent = player.PlayerGui

function GuiRecolor(color1,color2,LighestColor)
	MainGui.Frame.Spin1.ImageColor3 = color1
	MainGui.Frame.Spin2.ImageColor3 = color2
	MainGui.Frame.Spin3.ImageColor3 = color2
	MainGui.Frame.Spin4.ImageColor3 = color1
	MainGui.Frame.Shine1.ImageColor3 = LighestColor
	MainGui.Frame.Shine2.ImageColor3 = LighestColor
	MainGui.Frame.Backgound.UIGradient.Color = ColorSequence.new(color2,color1)
	MainGui.Frame.Backgound.Frame.UIGradient.Color = ColorSequence.new(color1,color2)
	MainGui.Frame.Glow.UIGradient.Color = ColorSequence.new(color2,color1)
	MainGui.Frame.Glow.Glow2.UIGradient.Color = ColorSequence.new(color1,color2)
	MainGui.Frame.MusicGui.Back.ImageColor3 = color1
	MainGui.Frame.MusicGui.Back.Glow.ImageColor3 = color2
	MainGui.ModeName.UIGradient.Color = ColorSequence.new(color1,color2)
	MainGui.ModeName.TextTop.TextColor3 = color1
	for _,v in pairs(MainGui.Frame.Vis:GetChildren()) do
		v.BackgroundColor3 = color2
	end
end

local mog = Instance.new("StringValue",{Value = 1, Name = "mog", Parent = folder})

GuiRecolor(Color2.Value,Color1.Value,Color1.Value)

function SetMode(mode)
	Mode = mode
	mog.Value = tostring(mode)
	cresume(ccreate(function()
		if Mode == "Musical" then
			MainGui.Frame.MusicGui:TweenPosition(UDim2.new(-.018, 0,.584, 0),Enum.EasingDirection.Out,Enum.EasingStyle.Bounce,1.5,true)
		elseif MainGui.Frame.MusicGui.Position ~= "{-.518, 0},{.584, 0}" then
			MainGui.Frame.MusicGui:TweenPosition(UDim2.new(-.518, 0,.584, 0),Enum.EasingDirection.In,Enum.EasingStyle.Back,.25,true)
		end
	end))
end

--[[/////////////////////////////
/////// effect functions ///////
//////////////////////////////]]

local debris-- = Instance.new("Folder",{Name = "debris", Parent = workspace})
--I don't think this is needed since it's for the old effect function that doesn't seem to be used
--I checked with Aero and the effect function wasn't used.

function sphere(cframe,sizevector,color,material,transparency,tweentime,easingstyle,easingdirection,reversebool,newproperties,decaybool,decaytime)
	local p = Instance.new("Part",{CFrame = cframe, Size = sizevector, Color = color, Material = material, Transparency = transparency, Anchored = true, CanCollide = false, CastShadow = false, Parent = debris})
	
	local mesh = Instance.new("SpecialMesh",{MeshType = "Sphere", Parent = p})
	
	local info = TweenInfo.new(tweentime,easingstyle,easingdirection,0,reversebool,0)
	local tween = Service("TweenService"):Create(p,info,newproperties)
	tween:Play()
	
	if decaybool == true then
		cresume(ccreate(function()
			wait(decaytime)
			p:Destroy()
		end))
	end
end

function cube(cframe,sizevector,color,material,transparency,tweentime,easingstyle,easingdirection,reversebool,newproperties,decaybool,decaytime)
	local p = Instance.new("Part",{CFrame = cframe, Size = sizevector, Color = color, Material = material, Transparency = transparency, Anchored = true, CanCollide = false, CastShadow = false, Parent = debris})
	local info = TweenInfo.new(tweentime,easingstyle,easingdirection,0,reversebool,0)
	Service("TweenService"):Create(p,info,newproperties):Play()
	
	if decaybool == true then
		cresume(ccreate(function()
			wait(decaytime)
			p:Destroy()
		end))
	end
end
local Effects

if workspace:FindFirstChild("Efec") then
	Effects = workspace:FindFirstChild("Efec")
else
	Effects = Instance.new("Folder",{Name = "Efec", Parent = workspace})
	Effects.Name = "Efec"
end
function WACKYEFFECT(Table)
	--Whatever:FireAllClients("WACKYEFFECT",Table,char,Effects)
	--animThing.WACKYEFFECT(Table,char,Effects)
end

function slash(position,orientation,color,material,transparency,tweentime,easingstyle,easingdirection,reversebool,newproperties,decaybool,decaytime)
	local s = folder.slash:Clone()
	s.Parent = debris
	s.Position = position
	s.Orientation = orientation
	s.Color = color
	s.Material = material
	s.Transparency = transparency
	
	local info = TweenInfo.new(tweentime,easingstyle,easingdirection,0,reversebool,0)
	Service("TweenService"):Create(s,info,newproperties):Play()
	
	if decaybool == true then
		cresume(ccreate(function()
			wait(decaytime)
			s:Destroy()
		end))
	end
end

local BilGui = Instance.new("BillboardGui", {Enabled = true, MaxDistance = 150, AlwaysOnTop = false, Active = false, Size = UDim2.new(5,0,1,0), SizeOffset = Vector2.new(0,4), LightInfluence = 0, Parent = hed})

local TxtLbl = Instance.new("TextLabel",{TextColor3 = Color3.fromRGB(113, 111, 165), TextStrokeColor3 = Color3.fromRGB(90, 112, 255), BackgroundTransparency = 1, Font = Enum.Font.SourceSansLight, TextSize = 24, Text = "AERIAL", Size = UDim2.new(2.5,0,1.5,0), Position = UDim2.new(-.75,0,.95,0), TextStrokeTransparency = 0, TextTransparency = 0, TextWrapped = true, TextScaled = true, Parent = BilGui})

local UiG = Instance.new("UIGradient",{Enabled = true, Parent = TxtLbl})

Hum.WalkSpeed = 150
Hum.JumpPower = 100
Hum.MaxHealth = "inf"
Hum.Health = "inf"
-- Game-specific stuff.
if true then -- Stratospheric Glitcher
	Hum.MaxHealth = 5000 -- PvPn't.
	Hum.Health = 5000
elseif game.PlaceId == 5121279769 then -- Another Mystery
	Hum.MaxHealth = 10000 -- You can die.
	Hum.Health = 10000
elseif game.PlaceId == 2578460148 or game.PlaceId == 3210470091 then -- Star Glitcher: FE Version, Star Glitcher Single Player
	Hum.MaxHealth = 1000000 -- You can die, but it ain't easy.
	Hum.Health = 1000000
else
	Player:Kick("You shouldn't have this.")
end

local LeftLegLight = Instance.new("PointLight",{Brightness = .5, Color = Color3.fromRGB(95,175,185), Range = 15, Parent = lleg})

local RightLegLight = Instance.new("PointLight",{Brightness = .5, Color = Color3.fromRGB(95,175,185), Range = 15, Parent = rleg})

-- Set it to where Audio actually is reliable in the Player's GUI for TimePositions.
local Audio = Instance.new("Sound", {PlaybackSpeed = 1.05, SoundId = "rbxassetid://3584953190", Volume = 4, MaxDistance = 1000, Playing = true, Looped = true, Name = "Audio", Parent = Player.PlayerGui})
Audio.Parent = Torso
--Audio.Parent = Player.PlayerGui

local RHAttch1 = Instance.new("Attachment",{Position = Vector3.new(-.4,0,0), Parent = rarm})
local RHAttch2 = Instance.new("Attachment",{Position = Vector3.new(.4,0,0), Parent = rarm})

local LHAttch1 = Instance.new("Attachment",{Position = Vector3.new(-.4,0,0), Parent = larm})
local LHAttch2 = Instance.new("Attachment",{Position = Vector3.new(.4,0,0), Parent = larm})

local RFAttch1 = Instance.new("Attachment",{Position = Vector3.new(-.4,-.7,0), Parent = rleg})
local RFAttch2 = Instance.new("Attachment",{Position = Vector3.new(.4,-.7,0), Parent = rleg})
local LFAttch1 = Instance.new("Attachment",{Position = Vector3.new(.4,-.7,0), Parent = lleg})
local LFAttch2 = Instance.new("Attachment",{Position = Vector3.new(-.4,-.7,0), Parent = lleg})

local RHT = Instance.new("Trail", rarm)
RHT.Attachment0 = RHAttch1
RHT.Attachment1 = RHAttch2
RHT.Color = ColorSequence.new(Color3.fromRGB(95,155,255))
RHT.Texture = "rbxassetid://4301778723"
RHT.TextureLength = .8
RHT.LightEmission = 1
RHT.LightInfluence = 0
RHT.FaceCamera = true
RHT.Enabled = false

local LHT = Instance.new ("Trail", larm)
LHT.Attachment0 = LHAttch1
LHT.Attachment1 = LHAttch2
LHT.Color = ColorSequence.new(Color3.fromRGB(95,155,255))
LHT.Texture = "rbxassetid://4301778723"
LHT.TextureLength = .8
LHT.LightEmission = 1
LHT.LightInfluence = 0
LHT.FaceCamera = true
LHT.Enabled = false

local RFT = Instance.new ("Trail", rleg)
RFT.Attachment0 = RFAttch1
RFT.Attachment1 = RFAttch2
RFT.Color = ColorSequence.new(Color3.fromRGB(95,155,255))
RFT.Texture = "rbxassetid://4301778723"
RFT.TextureLength = .8
RFT.LightEmission = 1
RFT.LightInfluence = 0
RFT.FaceCamera = true
RFT.Enabled = false

local LFT = Instance.new ("Trail", lleg)
LFT.Attachment0 = LFAttch1
LFT.Attachment1 = LFAttch2
LFT.Color = ColorSequence.new(Color3.fromRGB(95,155,255))
LFT.Texture = "rbxassetid://4301778723"
LFT.TextureLength = .8
LFT.LightEmission = 1
LFT.LightInfluence = 0
LFT.FaceCamera = true
LFT.Enabled = false

local Flushed = Instance.new("Decal",{Transparency = 0, Color3 = Color3.fromRGB(145,135,255), Face = "Front", Texture = "rbxassetid://982528525", Name = "Flush"})

local MoonWeld = Instance.new("Motor6D",{Part0 = folder.ScriptObjects.Moon, Part1 = rarm, C0 = cf(1,2,0), Parent = rarm})

local Loudness = 0

function Style(Trails,ExtraRings)
	for _,v in pairs(char:GetDescendants()) do
		if v:IsA("Trail") then
			v.Enabled = Trails
		end
	end
	if ExtraRings == true then
		for _,v in pairs(wings:GetDescendants()) do
			if v.Name == "MainRing" or v.Name == "SecondaryRing" then
				v.Transparency = 0
			end
		end
	else
		for _,v in pairs(wings:GetDescendants()) do
			if v.Name == "MainRing" or v.Name == "SecondaryRing" then
				v.Transparency = 1
			end
		end
	end
end

function NameColorGradient(TextBool,Text,TextColor,TextStrokeColor,Font,GradientBool,GRD1,GRD2,Rotation)
	BilGui.Enabled = TextBool
	TxtLbl.Text = Text
	TxtLbl.TextColor3 = TextColor
	TxtLbl.TextStrokeColor3 = TextStrokeColor
	TxtLbl.Font = Enum.Font[Font]
	UiG.Enabled = GradientBool
	UiG.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,GRD1),ColorSequenceKeypoint.new(1,GRD2)})
	UiG.Rotation = Rotation
	MainGui.ModeName.Text = Text
	MainGui.ModeName.TextTop.Text = Text
end

local WingFolder = folder.Wings
function nottweenedWingProperties(MainColor,SecondaryColor,TRLColor,MainMaterial,SecondaryMaterial,MainTransparency,SecondaryTransparency)
	for _,v in pairs(WingFolder:GetDescendants()) do
		if v.Name == "Main" then
			v.Color = MainColor
			v.Material = MainMaterial
			v.Transparency = MainTransparency
		elseif v:IsA("Trail") then
			v.Color = ColorSequence.new(TRLColor)
			v.Enabled = true
		elseif v.Name == "Secondary" then
			v.Color = SecondaryColor
			v.Material = SecondaryMaterial
			v.Transparency = SecondaryTransparency
		elseif v.Name == "MainRing" then
			v.Color = MainColor
		elseif v.Name == "SecondaryRing" then
			v.Color = SecondaryColor
		end
	end
end
function nottweenedWingProperties2(MoreWingsBool,MainColor,SecondaryColor,TRLColor,MainMaterial,SecondaryMaterial,MainTransparency,SecondaryTransparency)
	if MoreWingsBool == true then
		-- // Disable trails for first set of Wings (1-6) \\ --
		for _,v in pairs(folder.Wings:GetDescendants()) do
			if v:IsA("Trail") then
				v.Enabled = false
			end
		end
		-- // Shows the Extra wings since they're defined as true. \\ --
		for _,v in pairs(folder.Wings["M o r e"]:GetDescendants()) do
			if v.Name == "Main" then
				v.Transparency = 0
			elseif v:IsA('Trail') then
				v.Enabled = true
			elseif v.Name == "Secondary" then
				v.Transparency = 0
			end
		end
	elseif MoreWingsBool == false then
		-- // Re-Enables trails for first set of Wings (1-6) \\ --
		for _,v in pairs(folder.Wings:GetDescendants()) do
			if v:IsA("Trail") then
				v.Enabled = true
			end
		end
		-- // Hides the Extra wings since they aren't defined as true. \\ --
		for _,v in pairs(folder.Wings["M o r e"]:GetDescendants()) do
			if v.Name == "Main" then
				v.Transparency = 1
			elseif v:IsA('Trail') then
				v.Enabled = false
			elseif v.Name == "Secondary" then
				v.Transparency = 1
			end
		end
	end
	
	-- // Recoloring \\ --
	local colortwen = TweenInfo.new(.25 --[[<<<Length]],Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false) -- adjust if you want
	for _,v in pairs(folder.Wings["M o r e"]:GetDescendants()) do
		if v.Name == "Main" then
			v.Color = MainColor
			v.Material = MainMaterial
			v.Transparency = MainTransparency
		elseif v.ClassName == "Trail" then
			v.Color = ColorSequence.new(TRLColor)
		elseif v.Name == "Secondary" then
			v.Color = SecondaryColor
			v.Material = SecondaryMaterial
			v.Transparency = SecondaryTransparency
		end
	end
end
--ssyync's bad attempt at tweening
function WingProperties(MainColor,SecondaryColor,TRLColor,MainMaterial,SecondaryMaterial,MainTransparency,SecondaryTransparency)
	local colortwen = TweenInfo.new(.25 --[[<<<Length]],Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false) -- adjust if you want
	for i,v in pairs(WingFolder:GetDescendants()) do
		if v.Name == "Main" then
			local MainColor = Service("TweenService"):Create(v,colortwen,{Color = MainColor})
			v.Material = MainMaterial
			if WingStatus[tonumber(string.sub(v.Parent.Name, 5))] then -- Only if the wing hasn't been fired. If it has been fired, WingUnbrrr() will eventually make the wing visible.
				v.Transparency = MainTransparency
			end
			MainColor:Play()
		elseif v:IsA("Trail") then
			v.Color = ColorSequence.new(TRLColor)
			if WingStatus[tonumber(string.sub(v.Parent.Parent.Name, 5))] then	
				v.Enabled = true
			end
		elseif v.Name == "Secondary" then
			local SecondColor = Service("TweenService"):Create(v,colortwen,{Color = SecondaryColor})
			v.Material = SecondaryMaterial
			if WingStatus[tonumber(string.sub(v.Parent.Name, 5))] then
				v.Transparency = SecondaryTransparency
			end
			SecondColor:Play()
		elseif v.Name == "MainRing" then
			local MainRingColor = Service("TweenService"):Create(v,colortwen,{Color = MainColor})
			MainRingColor:Play()
		elseif v.Name == "SecondaryRing" then
			local SecondRingColor = Service("TweenService"):Create(v,colortwen,{Color = SecondaryColor})
			SecondRingColor:Play()
		end
	end
end

function WingProperties2(MoreWingsBool,MainColor,SecondaryColor,TRLColor,MainMaterial,SecondaryMaterial,MainTransparency,SecondaryTransparency)
	if MoreWingsBool == true then
		
		IsTwelveWingForm = true -- Now with 100% more wing.
		for i = 7, 12 do
			if not WingCooldown[i] then -- You will no longer magically gain wings in Endation.
				WingStatus[i] = true
			end
		end
		
		-- // Disable trails for first set of Wings (1-6) \\ --
		for _,v in pairs(folder.Wings:GetDescendants()) do
			if v:IsA("Trail") then
				v.Enabled = false
			end
		end
		-- // Shows the Extra wings since they're defined as true. \\ --
		for _,v in pairs(folder.Wings["M o r e"]:GetDescendants()) do
			if WingStatus[tonumber(string.sub(v.Parent.Name, 5))] then
				if v.Name == "Main" then
					v.Transparency = 0
				elseif v.Name == "Secondary" then
					v.Transparency = 0
				end
			elseif v:IsA('Trail') and WingStatus[tonumber(string.sub(v.Parent.Parent.Name, 5))] then
				v.Enabled = true			
			end
		end
		
	elseif MoreWingsBool == false then
		
		IsTwelveWingForm = false -- Now without 100% more wing.
		for i = 7, 12 do
			WingStatus[i] = false
		end
		
		-- // Re-Enables trails for first set of Wings (1-6) \\ --
		for _,v in pairs(folder.Wings:GetDescendants()) do
			if v:IsA("Trail") then
				if WingStatus[tonumber(string.sub(v.Parent.Parent.Name, 5))] then
					v.Enabled = true
				end
			end
		end
		-- // Hides the Extra wings since they aren't defined as true. \\ --
		for _,v in pairs(folder.Wings["M o r e"]:GetDescendants()) do
			if v.Name == "Main" then
				v.Transparency = 1
			elseif v:IsA('Trail') then
				v.Enabled = false
			elseif v.Name == "Secondary" then
				v.Transparency = 1
			end
		end
	end
	-- // Recoloring \\ --
	local colortwen = TweenInfo.new(.25 --[[<<<Length]],Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false) -- adjust if you want
	for _,v in pairs(folder.Wings["M o r e"]:GetDescendants()) do
		if v.Name == "Main" then
			local MainColor = Service("TweenService"):Create(v,colortwen,{Color = MainColor})
			v.Material = MainMaterial
			if WingStatus[tonumber(string.sub(v.Parent.Name, 5))] then
				v.Transparency = MainTransparency
			end	
		elseif v:IsA("Trail") then
			v.Color = ColorSequence.new(TRLColor)
		elseif v.Name == "Secondary" then
			local SecondColor = Service("TweenService"):Create(v,colortwen,{Color = SecondaryColor})
			v.Material = SecondaryMaterial
			if WingStatus[tonumber(string.sub(v.Parent.Name, 5))] then
				v.Transparency = SecondaryTransparency
			end	
		end
	end
end
-- // Set these for the starting mode, This is so we don't have to change the colors on the wing models on the starting mode \\ --
WingProperties(Color3.fromRGB(113, 111, 165),Color3.fromRGB(90, 112, 255),Color3.fromRGB(90, 112, 255),"Neon","Neon",0,0)
WingProperties2(false,Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),"Neon","Neon",1,1)

function LightAndTrailRecolor(LightColor1, LightColor2, TrailColors)
	RightLegLight.Color = LightColor1
	LeftLegLight.Color = LightColor2 
	for _,v in pairs(char:GetDescendants()) do
		if v:IsA("Trail") then
			v.Color = ColorSequence.new(TrailColors)
		end
	end
end

function alwaysgoforthis(ID,Vol,Time,Pitch)
	Audio.SoundId = "rbxassetid://"..ID
	Audio.Volume = Vol
	Audio.TimePosition = Time
	Audio.PlaybackSpeed = Pitch
	MainGui.Frame.MusicGui.ID.Text = ID
	MainGui.Frame.MusicGui.Speed.Text = Pitch
end

function HumVals(WalkSpeed,JumpPower)
	Hum.WalkSpeed = WalkSpeed
	Hum.JumpPower = JumpPower
end

-- Tween Values. --
function TweenAnimate(object,Aniim,time,easingstyle,easingdirection,repet,reverse,deelay)
	local infos=TweenInfo.new(time,Enum.EasingStyle[easingstyle],Enum.EasingDirection[easingdirection],repet,reverse,deelay)
	local tween = Service("TweenService"):Create(object,infos,Aniim)
	tween:Play()
	return tween
end
-- Tween Values. --

function DoubleJump() -- needs proper efx ans sounds
	if jumps >= 1 then
		jumps = jumps - 1
		local bv = Instance.new("BodyVelocity")
		bv.maxForce = Vector3.new(0, 1e9, 0)
		bv.velocity = Vector3.new(0, Hum.JumpPower, 0)
		bv.Parent = root
		local sound = Instance.new("Sound",root)
		sound.SoundId = "rbxassetid://763755889"
		sound:Play()
		cresume(ccreate(function()
			swait(25)
			bv:Destroy()
			swait(25)
			sound:Destroy()
		end))
	end
end

function GetNearestCharacter() -- Returns the nearest alive character that is not the user.
	local NearestCharacter = nil
	local NearestDistance = 2147483647
	for _, HitCharacter in pairs(workspace:GetChildren()) do
		if HitCharacter ~= char then
			local HitHumanoid = HitCharacter:FindFirstChildOfClass("Humanoid")
			if HitHumanoid and HitHumanoid.Health > 0 then
				local HitHead = HitCharacter:FindFirstChild("Head")
				if HitHead then
					local HitDistance = (HitHead.Position - hed.Position).Magnitude
					if HitDistance < NearestDistance then
						NearestCharacter = HitCharacter
						NearestDistance = HitDistance
					end
				end
			end
		end
	end
	return NearestCharacter
end

function ShowDamage(HitCharacter, Damage) -- s o u r c e s a n s l i g h t
	if HitCharacter:FindFirstChild("Head") then
		local BillboardGui = Instance.new("BillboardGui", {Size = UDim2.new(5, 0, 2.5, 0), StudsOffset = Vector3.new(0, 2, 0), AlwaysOnTop = true}) -- SourceSansLight = harder to see = bigger damage display needed
		local TextLabel = Instance.new("TextLabel")
		TextLabel.AnchorPoint = Vector2.new(.5, .5)
		TextLabel.Position = UDim2.new(.5, 0, .5, 0)
		TextLabel.Rotation = random(-5, 5)
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.BackgroundTransparency = 1
		TextLabel.Text = tostring(Damage)
		TextLabel.TextColor3 = Damage > 0 and Color3.fromRGB(255, 127, 127) or Damage == 0 and  Color3.fromRGB(191, 191, 191) or Damage < 0 and Color3.fromRGB(127, 255, 127)
		TextLabel.TextScaled = true
		TextLabel.Font = Enum.Font.SourceSansLight
		TextLabel.TextStrokeTransparency = 1
		TextLabel.Parent = BillboardGui
		BillboardGui.Parent = HitCharacter.Head
		Service("Debris"):AddItem(BillboardGui, 5)
		cresume(ccreate(function()
			for i = 1, 60 do
				BillboardGui.StudsOffset = Vector3.new(0, 2 + (i / 30), 0)
				TextLabel.TextTransparency = i / 60
				swait()
			end
		end))
	end
end

function DealDamage(HitCharacter, Damage) -- o o f
	if not HitCharacter:FindFirstChildOfClass("ForceField") or Mode == 666 then -- Vindictive stronk.
		local HitHumanoid = HitCharacter:FindFirstChildOfClass("Humanoid")
		if HitHumanoid then
			if Mode == 666 then -- Vindictive stronker.
				--Damage = huge -- yes
				--HitCharacter:BreakJoints() -- y e s
			end
			--HitHumanoid.Health = HitHumanoid.Health - Damage
			ShowDamage(HitCharacter, Damage)
			if HitHumanoid.Health <= 0 then -- OOF!
				print(Player.Name .. " game ended " .. HitCharacter.Name .. ".")
			end
		end
	end
end

function DamageCharactersWithin(GroundZero, Radius, MinDamage, MaxDamage) -- Because breaking joints is uncool.
	for _, HitCharacter in pairs(workspace:GetChildren()) do
		if HitCharacter ~= char then
			local HitHumanoid = HitCharacter:FindFirstChildOfClass("Humanoid")
			if HitHumanoid and HitHumanoid.Health > 0 then
				local HitHead = HitCharacter:FindFirstChild("Head")
				if HitHead and (HitHead.Position - GroundZero).Magnitude <= Radius then
					DealDamage(HitCharacter, random(MinDamage, MaxDamage))
				end
			end
		end
	end
end

function MakeWingProjectile(WingIndex) -- Copies a wing and returns a wing projectile that can be used for fun and profit. Does not hide the original wing. The function below needs to be run for that.
	local ThisWing = nil
	if WingIndex >= 7 then
		ThisWing = wings["M o r e"]:FindFirstChild("Wing" .. tostring(WingIndex))
	else
		ThisWing = wings:FindFirstChild("Wing" .. tostring(WingIndex))
	end
	if ThisWing then
		local WingProjectile = ThisWing:Clone()
		WingProjectile.Name = "Projectile" .. tostring(WingIndex)
		return WingProjectile -- Note that the wing projectile doesn't exist in-game yet. It has no parent.
	end
end

function HideWing(WingIndex) -- Makes a wing transparent and sets its wing status to false. Also returns a table of its original transparencies.
	local ThisWing = nil
	if WingIndex >= 7 then
		ThisWing = wings["M o r e"]:FindFirstChild("Wing" .. tostring(WingIndex))
	else
		ThisWing = wings:FindFirstChild("Wing" .. tostring(WingIndex))
	end
	if ThisWing then
		local OriginalTransparencies = {}
		for _, ThisWingPart in pairs(ThisWing:GetDescendants()) do
			if ThisWingPart:IsA("BasePart") and ThisWingPart.Name ~= "Center" then
				OriginalTransparencies[ThisWingPart.Name] = ThisWingPart.Transparency
				ThisWingPart.Transparency = 1 -- :crab: WING IS GONE :crab:
			elseif ThisWingPart.ClassName == "Trail" then -- Not a part, but ok.
				ThisWingPart.Enabled = false
			end
		end
		return OriginalTransparencies
	end
end

function WingUnbrrr(WingIndex, OriginalTransparencies) -- Actions have consequences on the generous taxpayers who enable your extravagant spending.
	local WingToUnbrrr = nil
	if WingIndex >= 7 then
		if IsTwelveWingForm then -- If you fire wing 7 in a 12 wing form, then switch to a 6 wing form, don't restore wing 7.
			WingToUnbrrr = wings["M o r e"]:FindFirstChild("Wing" .. tostring(WingIndex))
		end
	else
		WingToUnbrrr = wings:FindFirstChild("Wing" .. tostring(WingIndex))
	end
	if WingToUnbrrr then
		WingStatus[WingIndex] = true -- Wing restored.
		for _, WingPart in pairs(WingToUnbrrr:GetDescendants()) do
			if WingPart:IsA("BasePart") and OriginalTransparencies[WingPart.Name] then
				WingPart.Transparency = OriginalTransparencies[WingPart.Name]
			elseif WingPart.ClassName == "Trail" then -- Not a part, but ok.
				WingPart.Enabled = true
			end
		end
	end
end

function DelayedWingUnbrrr(WingIndex, OriginalTransparencies, Duration) -- Like above but with a built-in delay. Uses the WingCooldown system.
	cresume(ccreate(function()
		local Frames = math.ceil(Duration * 60)
		for i = Frames, 1, -1 do
			WingCooldown[WingIndex] = i
			swait()
		end
		WingCooldown[WingIndex] = nil
		WingUnbrrr(WingIndex, OriginalTransparencies)
	end))
end

function WingGoBrrr(GroundZero, Power) -- The basic attack of Stratospheric 2.
	if not GroundZero then
		local NearestCharacter = GetNearestCharacter()
		if not NearestCharacter then return end
		GroundZero = NearestCharacter.Head.Position
	end
	if not Power then Power = 1 end
	if table.find(Admins, Player.Name) then
		Power = Power * PowerMultiplier
	end
	local WingToBrrr, WingIndex = nil, nil -- Figure out which wing to brrr.
	local InitialWingIndex = 6
	if IsTwelveWingForm then
		InitialWingIndex = 12
	end
	for i = InitialWingIndex, 1, -1 do
		if WingStatus[i] then
			if i >= 7 then
				WingToBrrr = wings["M o r e"]:FindFirstChild("Wing" .. tostring(i))
			else
				WingToBrrr = wings:FindFirstChild("Wing" .. tostring(i))
			end
			if WingToBrrr then
				WingIndex = i
				break
			end
		end
	end
	--[[ -- We have WingStatus now. It keeps track much better than checking each wing's transparency.
	for i = 12, 1, -1 do
		ThisWing = wings:FindFirstChild("Wing" .. tostring(i))
		if ThisWing then
			for _, ThisWingPart in pairs(ThisWing:GetChildren()) do
				if ThisWingPart:IsA("BasePart") and ThisWingPart.Name ~= "Center" and ThisWingPart.Transparency < 1 then -- Center is always transparent.
					WingToBrrr = ThisWingPart.Parent
					break
				end
			end
		end
		if WingToBrrr then
			WingIndex = i
			break
		end
	end
	--]]
	if not WingToBrrr then
		print("No wing to brrr. Go home.")
		return
	else
		WingStatus[WingIndex] = false -- This wing is being used.
	end
	local WingProjectile = MakeWingProjectile(WingIndex)
	if WingIndex < 7 then chrt['Wing'..tostring(WingIndex)].Part0 = WingProjectile.Main end
	local OriginalTransparencies = HideWing(WingIndex)
	local ProjectileSpeed = min(Hum.WalkSpeed + 32, 200) * (Power ^ .5) -- I am speed. But not too speed. Scales with the square root of power.
	local ExplosionRadius = 12 * (Power ^ .5) -- Scales with the square root of power.
	local TriggerRadius = ExplosionRadius * (2/3)
	local BodyVelocity = Instance.new("BodyVelocity", WingProjectile.Center)
	BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
	BodyVelocity.Velocity = (GroundZero - WingProjectile.Center.Position).Unit * ProjectileSpeed
	local BodyGyro = Instance.new("BodyGyro", WingProjectile.Center)
	BodyGyro.MaxTorque = Vector3.new(500, 500, 500)
	BodyGyro.D = 350
	BodyGyro.CFrame = cf(WingProjectile.Center.Position, GroundZero) * angles(0, rad(-90), 0)
	WingProjectile.Parent = char
	WingProjectile.Center.Velocity = Torso.Velocity + (WingProjectile.Center.CFrame.RightVector * -25) + Vector3.new(random(-10, 10), random(35, 50), random(-10, 10)) -- Missile goes out and up.
	DelayedWingUnbrrr(WingIndex, OriginalTransparencies, 3)
	cresume(ccreate(function()
		for i = 1, 10 do
			swait()
		end
		BodyVelocity.Velocity = (GroundZero - WingProjectile.Center.Position).Unit * ProjectileSpeed
		BodyGyro.CFrame = cf(WingProjectile.Center.Position, GroundZero) * angles(0, rad(-90), 0)
		BodyVelocity.MaxForce = Vector3.new(500, 500, 500)
		for i = 1, 10 do
			swait()
		end
		for i = 1, 600 do
			swait()
			if i == 600 or (WingProjectile.Center.Position - GroundZero).Magnitude <= TriggerRadius or (WingProjectile.Center.Velocity.Y < 0 and WingProjectile.Center.Position.Y < GroundZero.Y) then
				local TrueGroundZero = (WingProjectile.Center.Position + GroundZero) / 2 -- Average the distances. It won't be perfectly on target, but it (hopefully) won't miss wildly either.
				DamageCharactersWithin(TrueGroundZero, ExplosionRadius, 100 * Power, 200 * Power)
				local Explosion = Instance.new("Explosion") -- Now only for the effect.
				Explosion.BlastRadius = ExplosionRadius
				Explosion.BlastPressure = 0
				Explosion.DestroyJointRadiusPercent = 0
				Explosion.Position = TrueGroundZero
				Explosion.Parent = workspace
				if WingIndex < 7 then char['Wing'..tostring(WingIndex)].Part0 = WingFolder["Wing" .. tostring(WingIndex)].Main end
				WingProjectile:Destroy() -- :crab: WING PROJECTILE IS GONE :crab:
				break
			else
				if WingIndex < 7 then
				if(chrt['Wing'..tostring(WingIndex)].Part1.Position.Magnitude - chrt.HumanoidRootPart.Position.Magnitude) > 200 then
					char['Wing'..tostring(WingIndex)].Part0 = WingFolder["Wing" .. tostring(WingIndex)].Main
				end
			end
				BodyVelocity.Velocity = (GroundZero - WingProjectile.Center.Position).Unit * ProjectileSpeed -- Correct its trajectory.
				BodyGyro.CFrame = cf(WingProjectile.Center.Position, GroundZero) * angles(0, rad(-90), 0)
			end
		end
	end))
end

function AeroStrike(GroundZero, Power) -- funi!
	if not Power then Power = 1 end
	if table.find(Admins, Player.Name) then
		Power = Power * PowerMultiplier
	end
	local FinalWingIndex = 6
	if IsTwelveWingForm then
		FinalWingIndex = 12
	end
	local AllWingsAvailable = true
	for i = 1, FinalWingIndex do
		if not WingStatus[i] then
			AllWingsAvailable = false -- A wing is missing.
			print("Wing " .. tostring(i) .. " is missing. AeroStriken't.")
			break
		end
	end
	if not AllWingsAvailable then
		return
	end
	local ProjectileSpeed = min(Hum.WalkSpeed + 48, 300) * (Power ^ .5) -- I am speed. But not too speed. Scales with the square root of power.
	local ExplosionRadius = 18 * (Power ^ .5) -- Scales with the square root of power.
	local DispersionRadius = ExplosionRadius * 1.5 -- The maximum distance away from ground zero that a wing may eventually target.
	if IsTwelveWingForm then
		DispersionRadius = DispersionRadius * (2 ^ .5) -- Double area.
	end
	local WaypointRadius = ProjectileSpeed * .15 -- When a wing is within this many studs of a waypoint, it will progress onto the next waypoint.
	local TriggerRadius = ExplosionRadius * (2/3)
	for i = 1, FinalWingIndex do
		WingStatus[i] = false
		local ThisWingProjectile = MakeWingProjectile(i)
		local TheseOriginalTransparencies = HideWing(i)
		local Azimuth = random() * 2 * pi
		local ThisDispersionRadius = (random() ^ .5) * DispersionRadius -- The math is that since we're rotating in a circle, we need to bias it towards larger (closer to the outside of the circle) numbers (.5 -> .707).
		local ThisGroundZero = GroundZero + Vector3.new(-cos(Azimuth) * ThisDispersionRadius, 0, -sin(Azimuth) * ThisDispersionRadius)
		local TheseWaypoints = {}
		-- It should be noted that Avix was too lazy to calculate proper ballistic trajectories.
		table.insert(TheseWaypoints, ThisWingProjectile.Center.Position:Lerp(ThisGroundZero, .25) + Vector3.new(0, ProjectileSpeed * .75, 0))
		table.insert(TheseWaypoints, ThisWingProjectile.Center.Position:Lerp(ThisGroundZero, .5) + Vector3.new(0, ProjectileSpeed, 0))
		table.insert(TheseWaypoints, ThisWingProjectile.Center.Position:Lerp(ThisGroundZero, .75) + Vector3.new(0, ProjectileSpeed * .75, 0))
		table.insert(TheseWaypoints, ThisGroundZero)
		local BodyVelocity = Instance.new("BodyVelocity", ThisWingProjectile.Center)
		BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
		BodyVelocity.Velocity = (TheseWaypoints[1] - ThisWingProjectile.Center.Position).Unit * ProjectileSpeed
		local BodyGyro = Instance.new("BodyGyro", ThisWingProjectile.Center)
		BodyGyro.MaxTorque = Vector3.new(500, 500, 500)
		BodyGyro.D = 350
		BodyGyro.CFrame = cf(ThisWingProjectile.Center.Position, TheseWaypoints[1]) * angles(0, rad(-90), 0)
		ThisWingProjectile.Parent = char
		ThisWingProjectile.Center.Velocity = Torso.Velocity + (ThisWingProjectile.Center.CFrame.RightVector * -25) + Vector3.new(random(-10, 10), random(35, 50), random(-10, 10)) -- Missile goes out and up.
		DelayedWingUnbrrr(i, TheseOriginalTransparencies, 3)
		cresume(ccreate(function()
			for i = 1, 10 do
				swait()
			end
			local CurrentWaypointIndex = 1
			BodyVelocity.Velocity = (TheseWaypoints[CurrentWaypointIndex] - ThisWingProjectile.Center.Position).Unit * ProjectileSpeed
			BodyGyro.CFrame = cf(ThisWingProjectile.Center.Position, TheseWaypoints[1]) * angles(0, rad(-90), 0)
			BodyVelocity.MaxForce = Vector3.new(500, 500, 500)
			for i = 1, 10 do
				swait()
			end
			for i = 1, 600 do
				swait()
				if i == 600 or (ThisWingProjectile.Center.Position - ThisGroundZero).Magnitude <= TriggerRadius or (ThisWingProjectile.Center.Velocity.Y < 0 and ThisWingProjectile.Center.Position.Y < ThisGroundZero.Y) then
					local TrueGroundZero = (ThisWingProjectile.Center.Position + ThisGroundZero) / 2 -- Average the distances. It won't be perfectly on target, but it (hopefully) won't miss wildly either.
					DamageCharactersWithin(TrueGroundZero, ExplosionRadius, 150 * Power, 300 * Power)
					local Explosion = Instance.new("Explosion") -- Now only for the effect.
					Explosion.BlastRadius = ExplosionRadius
					Explosion.BlastPressure = 0
					Explosion.DestroyJointRadiusPercent = 0
					Explosion.Position = TrueGroundZero
					Explosion.Parent = workspace
					ThisWingProjectile:Destroy() -- :crab: WING PROJECTILE IS GONE :crab:
					break
				elseif (TheseWaypoints[CurrentWaypointIndex] - ThisWingProjectile.Center.Position).Magnitude < WaypointRadius and CurrentWaypointIndex < #TheseWaypoints then -- Arrived at waypoint.
					CurrentWaypointIndex = CurrentWaypointIndex + 1
					BodyVelocity.Velocity = (TheseWaypoints[CurrentWaypointIndex] - ThisWingProjectile.Center.Position).Unit * ProjectileSpeed
					BodyGyro.CFrame = cf(ThisWingProjectile.Center.Position, TheseWaypoints[CurrentWaypointIndex]) * angles(0, rad(-90), 0)
				else
					BodyVelocity.Velocity = (TheseWaypoints[CurrentWaypointIndex] - ThisWingProjectile.Center.Position).Unit * ProjectileSpeed
					BodyGyro.CFrame = cf(ThisWingProjectile.Center.Position, TheseWaypoints[CurrentWaypointIndex]) * angles(0, rad(-90), 0)
				end
			end
		end))
	end
end

-- Artificial Heartbeat --
local ArtificialHB = Instance.new("BindableEvent", folder)
ArtificialHB.Name = "Heartbeat"

folder:WaitForChild("Heartbeat")

local tf = 0
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1/60
ArtificialHB:Fire()

local a = Service("RunService").Heartbeat:Connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * floor(tf / frame)
		end
	end
end)
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	a:Disconnect()
end)

function swait(num)
	if num == 0 or num == nil then
		task.wait()
	else
		for i = 0, num do
			task.wait()
		end
	end
end

local mouse = Player:GetMouse()

local b = mouse.Button1Down:Connect(function()
	--if Mode ~= "Musical" or Mode ~= 70 or Mode ~= "Betray" then
	WingGoBrrr(mouse.Hit.Position, 1) -- 1x power
	--end
end)

local c = mouse.KeyDown:Connect(function(k)
	-----
	-- ABILITIES
	-----
	if k == "z" and AttacksUsable["Z"] then
		local Power = 3
		if Mode == 666 or Mode == "Retaliation" then -- Actions have consequences... Also note that Vindictive always deals infinite damage (like Reality Glitcher's Exhaustion).
			Power = Power * 5
		end
		local NearestCharacter = GetNearestCharacter()
		if NearestCharacter then
			AttacksUsable["Z"] = false
			WingGoBrrr(NearestCharacter.Head.Position, Power)
			wait(1)
			AttacksUsable["Z"] = true
		end
	elseif k == "x" and AttacksUsable["X"] then
		local Power = 1
		if Mode == 666 or Mode == "Retaliation" then
			Power = Power * 5
		end
		AttacksUsable["X"] = false
		AeroStrike(Mouse.Hit.Position, Power)
		wait(5)
		AttacksUsable["X"] = true
	elseif k == "space" and Mode == 80 then
		hitfloor,posfloor=rayCast(RootPart.Position,(cf(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).LookVector,4,char)
		if hitfloor == nil then
			DoubleJump()
		end
	end
	-----
	-- MODES
	-----
	if k == "p" and sidecooldown == 0 and currentside == 1 then
		sidecooldown = 1
		currentside = 2
		swait(.3)
		sidecooldown = 0
	elseif k == "p" and sidecooldown == 0 and currentside == 2 then
		sidecooldown = 1
		currentside = 1
		swait(.3)
		sidecooldown = 0
	end
	
	local RandomTable = {"nil","ERROR","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil"}
	local Randomization = random(1,#RandomTable)
	
	if k == "q" and Mode ~= 1 and currentside == 1  then
		SetMode(1)
		Style(false,false)
		local c1 = Color3.fromRGB(113, 111, 165)
		local c2 = Color3.fromRGB(90, 112, 255)
		NameColorGradient(true,"AERIAL",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c2,c1,c1)
		WingProperties(c1,c2,c1,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(3584953190,4,0,1.05)
		HumVals(150,100)
		
		--...It's time
		
	elseif k == "b" and Mode ~= 666 and Mode == 1 and currentside == 1 and table.find(Admins, Player.Name) then
		SetMode(666)
		Style(true,false)
		local c1 = Color3.fromRGB(66,66,66)
		local c2 = Color3.fromRGB(255, 66, 66)
		NameColorGradient(true,"VINDICTIVE",c1,c2,"Gotham",true,c1,c2,90)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c1,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(4521541755,4,0,1)
		HumVals(666,66)
		
	elseif k == "m" and Mode ~= 12 and Mode == 1  and currentside == 1 then
		SetMode(12)
		Style(false,false)
		local c1 = Color3.fromRGB(13, 54, 85)
		local c2 = Color3.fromRGB(87, 114, 161)
		NameColorGradient(true,"INCLEMENT",c1,c2,"SourceSansLight",false,c2,c2,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c1,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c1,c1,c2)
		alwaysgoforthis(3669990175,4,0,1)
		HumVals(16,100)
		
	elseif k == "m" and Mode ~= 13 and Mode == 12 and currentside == 1  then
		local TST = {5110338074,5110338074,5110338074,5110338074,5110338074,5110338074,5110338074,5110338074,5260747334,5260747334}
		local MRND = random(1,#TST)
		SetMode(13)
		Style(false,false)
		local c1 = Color3.fromRGB(0,35,45)
		local c2 = Color3.fromRGB(15,125,255)
		local yes = Color3.fromRGB(0,195,255)
		local it = Color3.fromRGB(0,35,75)
		NameColorGradient(true,"TEMPEST",c1,yes,"SourceSansLight",true,yes,it,90)
		GuiRecolor(c2,c1,yes)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(TST[MRND],4	,0,1)
		HumVals(450,100)
		
	elseif k == "n" and Mode ~= "Retaliation" and Mode == 1  and currentside == 1 then--Player.Name == "StratosphericAero" and currentside == 1  then
		SetMode("Retaliation")
		Style(true,false)
		local c1 = Color3.fromRGB(0, 114, 202)
		local c2 = Color3.fromRGB(90, 0, 216)
		NameColorGradient(true,"RETALIATION",c1,c2,"SourceSansLight",true,Color3.fromRGB(85,85,95),Color3.fromRGB(255,255,255),360)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(5075685434,4,0,1)
		HumVals(1000,100)
		
	elseif k == "e" and Mode ~= 2 and currentside == 1  then
		SetMode(2)
		Style(false,false)
		local c1 = Color3.fromRGB(255,125,45)
		local c2 = Color3.fromRGB(175,0,0)
		NameColorGradient(true,"EMBER",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c2,c1,c1)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(3582753814,4,0,1.025)
		HumVals(16,100)
		
	elseif k == "r" and Mode ~= 3 and currentside == 1  then
		SetMode(3)
		Style(false,false)
		local c1 = Color3.fromRGB(0,255,125)
		local c2 = Color3.fromRGB(115,255,125)
		NameColorGradient(true,"BREEZE",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5121478426,4,0,1)
		HumVals(250,175)
		
	elseif k == "m" and Mode ~= 80 and Mode == 3  and currentside == 1 then
		SetMode(80)
		Style(false,false)
		local c1 = Color3.fromRGB(245,245,255)
		local c2 = Color3.fromRGB(255,125,50)
		NameColorGradient(true,"UPDRAFT",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c1)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4900390913,4,0,1)
		HumVals(250,350)
		
	elseif k == "t" and Mode ~= 4 and currentside == 1  then
		SetMode(4)
		Style(false,false)
		local c1 = Color3.fromRGB(255,175,125)
		local c2 = Color3.fromRGB(85,25,15)
		NameColorGradient(true,"ECLIPSE",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c1)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5129145929,4,0,1)
		HumVals(125,100)
		
	elseif k == "m" and Mode ~= "Moonlight" and Mode == 4 and currentside == 1  then
		SetMode("Moonlight")
		Style(false,false)
		local c1 = Color3.fromRGB(35,75,255)
		local c2 = Color3.fromRGB(25,45,85)
		local GradTop = Color3.fromRGB(195,195,255)
		NameColorGradient(true,"LUNAR",c1,Color3.fromRGB(45,65,125),"SourceSansLight",true,GradTop,c2,90)
		GuiRecolor(c1,c2,GradTop)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4683598946,4,0,1)
		HumVals(16,100)
		
	elseif k == "y" and Mode ~= 5 and currentside == 1  then
		SetMode(5)
		Style(false,false)
		local c1 = Color3.fromRGB(75,0,145)
		local c2 = Color3.fromRGB(100,0,255)
		NameColorGradient(true,"EUPHORIA",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5120849414,4,0,1)
		HumVals(125,100)
		
	elseif k == "m" and Mode ~= "a" and Mode == 5 and currentside == 1  then
		SetMode("a")
		Style(false,false)
		local c1 = Color3.fromRGB(0,0,90)
		local c2 = Color3.fromRGB(0,0,255)
		NameColorGradient(true,"laziness",c1,c2,"Arcade",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c1,c1,c2)
		alwaysgoforthis(3941828096,4,0,1)
		HumVals(16,100)
		
	elseif k == "m" and Mode ~= "Musical" and Mode == "a" and currentside == 1  then
		Mode = "Musical"
		SetMode("Musical")
		Style(false,false)
		local RandomChoice = random(1,7)
		local  c1 = Color3.fromRGB(0,0,0)
		local c2 = Color3.fromRGB(125,195,255)
		NameColorGradient(true,"MELODIC",c1,c2,"SourceSansLight",true,c1,c2,180)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5489895571,4,56.5,1)
		HumVals(150,100)
		
		
	elseif k == "u" and Mode ~= 6 and currentside == 1  then
		SetMode(6)
		Style(false,false)
		local c1 = Color3.fromRGB(15,0,85)
		local c2 = Color3.fromRGB(100,0,255)
		NameColorGradient(true,"EXOSPHERE",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(1327427310,4,0,1)
		HumVals(175,100)
		
	elseif k == "m" and Mode ~= 70 and Mode == 6 and currentside == 1  then
		SetMode(70)
		Style(false,true)
		local c1 = Color3.fromRGB(0,0,0)
		local c2 = Color3.fromRGB(95,75,255)
		NameColorGradient(true,"PLANETES",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(3277635612,4,0,.95)
		HumVals(250,100)
		
	elseif k == "g" and Mode ~= 7 and currentside == 1  then
		SetMode(7)
		Style(false,false)
		local c1 = Color3.fromRGB(255,175,125)
		local c2 = Color3.fromRGB(95,75,0)
		NameColorGradient(true,"ERA",c1,c2,"SourceSansLight",false,c1,c2,90)
		GuiRecolor(c2,c1,c1)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4909236861,4,0,1)
		HumVals(150,100)
		
	elseif k == "n" and Mode ~= 5000 and Mode == 7 and currentside == 1  then
		SetMode(5000)
		Style(false,false)
		local c1 = Color3.fromRGB(0,85,125)
		local c2 = Color3.fromRGB(0,155,255)
		local c3 = Color3.fromRGB(0,245,255)
		NameColorGradient(true,"VIRTUAL",c1,c2,"SourceSansLight",true,c1,c3,90)
		GuiRecolor(c1,c2,c3)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5089411966,5,0,1)
		HumVals(16,100)
		
	elseif k == "m" and Mode ~= 9999 and Mode == 7 and currentside == 1  then
		SetMode(9999)
		Style(true,false)
		local c1 = Color3.fromRGB(0,0,0)
		local c2 = Color3.fromRGB(255,255,255)
		NameColorGradient(true,"ENDATION",c1,c2,"SourceSansLight",true,c1,c2,0)
		GuiRecolor(c2,c1,c1)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(4453518004,4,164,1)
		HumVals(10000,100)
		
		
	elseif k == "h" and Mode ~= 8 and currentside == 1  then
		SetMode(8)
		Style(false,false)
		local c1 = Color3.fromRGB(120, 153, 202)
		local c2 = Color3.fromRGB(204, 141, 216)
		NameColorGradient(true,"AURORA",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(3656280279,4,0,1)
		HumVals(250,100)
		
	elseif k == "m" and Mode ~= 81 and Mode == 8 and currentside == 1  then
		SetMode(81)
		Style(false,false)
		local c1 = Color3.fromRGB(35,0,65)
		local c2 = Color3.fromRGB(95,0,255)
		local c3 = Color3.fromRGB(125,0,255)
		NameColorGradient(true,"HYPERSPACE",c1,c3,"SourceSansLight",true,c1,c3,90)
		GuiRecolor(c2,c1,c3)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(2736533997,4,3,1)
		HumVals(1500,100)
		
	elseif k == "j" and Mode ~= 9 and currentside == 1  then
		SetMode(9)
		Style(false,false)
		local c1 = Color3.fromRGB(255,95,45)
		local c2 = Color3.fromRGB(255,145,100)
		NameColorGradient(true,"PROPULSION",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5068048458,4,0,1)
		HumVals(850,100)
		
	elseif k == "m" and Mode ~= 1080 and Mode == 9 and currentside == 1  then
		SetMode(1080)
		Style(false,false)
		local c1 = Color3.fromRGB(255,0,165)
		local c2 = Color3.fromRGB(0,155,255)
		NameColorGradient(true,"HYPERACTIVITY",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4914040107,4,0,1.075)
		HumVals(1250,100)
		
	elseif k == "n" and Mode == 9 and Mode ~= "Ascend2ElectricBoogaloo" and currentside == 1  then
		SetMode("Ascend2ElectricBoogaloo")
		Style(false,true)
		local c1 = Color3.fromRGB(82,105,255)
		local c2 = Color3.fromRGB(107,142,255)
		NameColorGradient(true,"ASCEND",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(1841993327,4,0,1)
		HumVals(100,850)
		
	elseif k == "k" and Mode ~= 10 and currentside == 1  then
		SetMode(10)
		Style(false,false)
		local c1 = Color3.fromRGB(125,145,255)
		local c2 = Color3.fromRGB(95,135,175)
		NameColorGradient(true,"FROSTBITE",c1,c2,"SourceSansLight",true,c1,c2,0)
		GuiRecolor(c1,c2,c1)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c1,c1,c2)
		alwaysgoforthis(5120974726,4,0,1)
		HumVals(125,100)
		-- lighting(true,0,950,Color3.fromRGB(125,185,255),.5,2,.65,Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),.05,34,0,0,0,Color3.fromRGB(249,250,255))
		
	elseif k == "n" and Mode ~= "???" and Mode == 10 and currentside == 1  then
		SetMode("???")
		Style(false,false)
		local c1 = Color3.fromRGB(85,85,85)
		local c2 = Color3.fromRGB(115,115,115)
		NameColorGradient(true,"REDUCTION",c1,c2,"SourceSansLight",true,c1,Color3.fromRGB(255,255,255),-90)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(3064610606,5,0,.45)
		HumVals(16,100)
		--   lighting(true,0,250,Color3.fromRGB(78,78,78),.5,.7,.65,Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),.35,34,0,0,0,Color3.fromRGB(135,135,135),true,"rbxassetid://113516636","rbxassetid://113516620","rbxassetid://113516636","rbxassetid://113516636","rbxassetid://113516636","rbxassetid://113516657")
		
	elseif k == "b" and Mode ~= "Darkness" and Mode == "???" and currentside == 1  then
		SetMode("Darkness")
		Style(false,false)
		local c1 = Color3.fromRGB(45,45,50)
		local c2 = Color3.fromRGB(0,0,0)
		NameColorGradient(true,"DARKNESS",c1,c2,"SourceSansLight",true,Color3.fromRGB(0,0,0),Color3.fromRGB(255,255,255),-90)
		GuiRecolor(c1,c2,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4526122075,4,0,1)
		HumVals(16,100)
		-- lighting(true,0,50,Color3.fromRGB(15,15,20),.5,.7,.65,Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),.35,34,0,0,0,Color3.fromRGB(45,45,50),true,"rbxassetid://113516636","rbxassetid://113516620","rbxassetid://113516636","rbxassetid://113516636","rbxassetid://113516636","rbxassetid://113516657")
		
		
	elseif k == "n" and Mode ~= 999 and Mode == "???" and currentside == 1  then
		SetMode(999)
		Style(false,false)
		local c1 = Color3.fromRGB(25,45,25)
		local c2 = Color3.fromRGB(125,255,135)
		NameColorGradient(true,"DISTURBED",c1,c2,"SourceSansLight",false,c1,c1,0)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(4210933001,4,0,1)
		HumVals(450,100)
		
	elseif k == "m" and Mode ~= RandomTable[Randomization] and Mode == 10 then
		Mode = RandomTable[Randomization]
		
		if Mode == "ERROR" then
			SetMode("ERROR")
			Style(false, false)
			local c1 = Color3.fromRGB(0,0,0)
			local c2 = Color3.fromRGB(135,0,0)
			NameColorGradient(true,"FATAL_EXCEPTION",c1,c2,"SourceSansLight",false,c1,c2,180)
			GuiRecolor(c1,c2,c1)
			WingProperties(c1,c2,c2,"Neon","Neon",0,0)
			WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
			LightAndTrailRecolor(c2,c2,c1)
			alwaysgoforthis(5322723065,4,0,1)
			HumVals(650,100)
			
		elseif Mode == "nil" then
			SetMode("nil")
			Style(false,true)
			local c1 = Color3.fromRGB(0,0,0)
			local c2 = Color3.fromRGB(0,0,0)
			NameColorGradient(true,"ERRATUM",c1,c2,"SourceSansLight",false,c1,c2,180)
			GuiRecolor(c1,c2,c1)
			WingProperties(c1,c2,c2,"Neon","Neon",0,0)
			WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
			LightAndTrailRecolor(c2,c2,c1)
			alwaysgoforthis(5120996797,4,0,1)
			HumVals(650,100)
		end
	elseif k == "m" and Mode ~= "nil" and Mode == 10 and currentside == 1 then
		
		
	elseif k == "q" and Mode ~= "Complexity" and currentside == 2 then
		SetMode("Complexity")
		Style(false,false)
		local c1 = Color3.fromRGB(255,0,75)
		local c2 = Color3.fromRGB(0,135,255)
		NameColorGradient(true,"COMPLEXITY",c1,c2,"SourceSansLight",false,c1,c2,180)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c2,c1,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(4331885297,4,0,1)
		HumVals(250,100)
		
	elseif k == "e" and Mode ~= "Abstract" and currentside == 2 then
		SetMode("Abstract")
		Style(false,false)
		local c1 = Color3.fromRGB(50,50,55)
		local c2 = Color3.fromRGB(0,135,255)
		NameColorGradient(true,"ABSTRACTISM",c1,c2,"SourceSansLight",false,c1,c2,180)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c2,c1,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(4331887566,4,0,1)
		HumVals(175,100)
		
	elseif k == "t" and Mode ~= "Night" and currentside == 2 then
		SetMode("Night")
		Style(false,false)
		local c1 = Color3.fromRGB(0,0,0)
		local c2 = Color3.fromRGB(135,125,255)
		local GRDC1 = Color3.fromRGB(0,0,0)
		local GRDC2 = Color3.fromRGB(135,125,255)
		NameColorGradient(true,"TWILIGHT",Color3.fromRGB(115,95,135),c2,"SourceSansLight",true,GRDC2,GRDC1,90)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,Color3.fromRGB(115,95,135),c2,"Neon","Neon",0,0)
		WingProperties2(true,c2,c1,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(5328096072,4,2,1)
		HumVals(175,100)
		
	elseif k == "f" and Mode ~= "Betray" and currentside == 2 then
		SetMode("Betray")
		Style(false,false)
		local c1 = Color3.fromRGB(20, 20, 80)
		local c2 = Color3.fromRGB(45,95,255)
		NameColorGradient(true,"BETRAYAL",c1,c2,"SourceSansLight",false,c1,c2,180)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(true,c2,c1,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c2)
		alwaysgoforthis(4331886628,4,0,1)
		HumVals(350,100)
		
	elseif k == "g" and Mode ~= "Recogniscent" and currentside == 2 then
		SetMode("Recogniscent")
		Style(false,false)
		local c1 = Color3.fromRGB(95, 185, 255)
		local c2 = Color3.fromRGB(35, 45, 65)
		NameColorGradient(true,"RECOGNISCENT",c2,c1,"SourceSansLight",true,Color3.fromRGB(55,65,65),Color3.fromRGB(245,255,255),90)
		GuiRecolor(c2,c1,c1)
		WingProperties(c2,c1,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4739292381,4,95,1)
		HumVals(16,100)
		
	elseif k == "m" and Mode ~= "" and Mode == "Recogniscent" and currentside == 2 then
		SetMode("")
		Style(false,false)
		local c1 = Color3.fromRGB(175, 118, 239)
		local c2 = Color3.fromRGB(44, 11, 49)
		NameColorGradient(true,"NEUROSIS",c2,c1,"SourceSansLight",true,Color3.fromRGB(55,65,65),Color3.fromRGB(245,255,255),90)
		GuiRecolor(c2,c1,c1)
		WingProperties(c2,c1,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(5228293435,4,0,1)
		HumVals(350,100)
		--lighting(true,0,500,c2,0,.7,.65,Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),Color3.fromRGB(0,0,0),0,10,0,0,0,Color3.fromRGB(255,255,255),false,"rbxassetid://","rbxassetid://","rbxassetid://","rbxassetid://","rbxassetid://","rbxassetid://")
		
	elseif k == "y" and Mode ~= 55 and currentside == 2 then
		SetMode(55)
		Style(false,false)
		local c1 = Color3.fromRGB(132, 138, 204)
		local c2 = Color3.fromRGB(0,0,0)
		NameColorGradient(true,"INTERSTELLAR",c2,c1,"SourceSansLight",true,Color3.fromRGB(55,65,65),Color3.fromRGB(245,255,255),90)
		GuiRecolor(c2,c1,c1)
		WingProperties(c2,c1,c2,"Neon","Neon",0,0)
		WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4550506090,4,0,1)
		HumVals(250,100)
		
	elseif k == "u" and Mode ~= 60 and currentside == 2 then
		SetMode(60)
		Style(false,false)
		local c1 = Color3.fromRGB(114, 149, 204)
		local c2 = Color3.fromRGB(255,255,255)
		NameColorGradient(true,"CONQUEST",c2,c1,"SourceSansLight",true,Color3.fromRGB(255,255,255),Color3.fromRGB(115,145,255),90)
		GuiRecolor(c2,c1,c2)
		WingProperties(c1,c2,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c2,c2,"Neon","Neon",1,1)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(4390839374,4,0,1)
		HumVals(650,500)
		
	elseif k == "k" and Mode ~= "Frost" and currentside == 2 then
		SetMode("Frost")
		Style(false,false)
		local c1 = Color3.fromRGB(90, 206, 255)
		local c2 = Color3.fromRGB(208, 208, 208)
		NameColorGradient(true,"PERMAFROST",c2,c1,"SourceSansLight",true,Color3.fromRGB(55,65,65),Color3.fromRGB(245,255,255),90)
		GuiRecolor(c2,c1,c1)
		WingProperties(c2,c1,c2,"Neon","Neon",0,0)
		WingProperties2(false,c1,c2,c2,"Neon","Neon",0,0)
		LightAndTrailRecolor(c2,c2,c1)
		alwaysgoforthis(3941817379,4,0,1)
		HumVals(75,100)

	elseif k == "l" and Audio.Playing == true then Audio.Playing = false Audio.Volume = 0
	elseif k == "l" and Audio.Playing == false then Audio.Playing = true Audio.Volume = 3.5
		
	end
	
end)

--[[///////////////////////////
//////// AURAS /////////////
////////////////////////////]]

--folder.MusicGuiEvent.OnServerEvent:Connect(function(plr,id,speed)
--	alwaysgoforthis(id,1,0,speed)	
--end)

-- Start of Loops --
function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end

function Radian(x,y,z)
	return angles(rad(x),rad(y),rad(z))
end
cresume(ccreate(function() -- // Effects go here
	while true do 
		stopper.Event:Connect(function()return;end)
		swait()
		local hi,po=rayCast(root.Position,-root.CFrame.upVector,99999,char)
		if Mode == 1 then -- Aerial
			WACKYEFFECT({
				Time = 40,
				EffectType = "Box",
				Size = Vector3.new(.01,.07,.01),
				Size2 = Vector3.new(12, 0, 12),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = random(-3,3),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 40,
				EffectType = "Box",
				Size = Vector3.new(.01,.01,2),
				Size2 = Vector3.new(17, 0, 0),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*angles(0,random(-360,360),0),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 20,
				EffectType = "Box",
				Size = Vector3.new(.5,.01,.5),
				Size2 = Vector3.new(.01, 8, .01),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cf(random(-5,5),0,random(-5,5)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = random(-3,3),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
		elseif Mode == 2 then local lepode = cf(random(-5,5),0,random(-5,5))
			WACKYEFFECT({
				Time = 50,
				EffectType = "Box",
				Size = Vector3.new(.5,.5,.5),
				Size2 = Vector3.new(.5, .5, .5),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*lepode,
				MoveToPos = cf(po)*lepode*cf(0,5,0).p,
				RotationX = random(-7,7),
				RotationY = random(-7,7),
				RotationZ = random(-7,7),
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(.5,.5,.5),
				Size2 = Vector3.new(0, 0, 0),
				Transparency = 0,
				Transparency2 = 0,
				CFrame = root.CFrame*cf(0+3*cos(sine/32),0+1*cos(sine/64),0+3*sin(sine/32)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Box",
				Size = Vector3.new(.7,.7,.7),
				Size2 = Vector3.new(0, 0, 0),
				Transparency = .7,
				Transparency2 = .7,
				CFrame = root.CFrame*cf(0+3*cos(sine/32),0+1*cos(sine/64),0+3*sin(sine/32))*Radian(random(-360,360),random(-360,360),random(-360,360)),
				MoveToPos = nil,
				RotationX = random(-4,4),
				RotationY = random(-4,4),
				RotationZ = random(-4,4),
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
		elseif Mode == 8 then -- aurora something boogaloo
			
			
			
			
			if random(1,4) == 1 then
				
				WACKYEFFECT({
					Time = 25,
					EffectType = "Sphere",
					Size = Vector3.new(0.7,0.7,0.7),
					Size2 = Vector3.new(0, 0, 0), 
					Transparency = 1,
					Transparency2 = 0,
					CFrame = root.CFrame*CFrame.new(random(-10,10),random(-10,10),random(-10,10)),
					MoveToPos = nil,
					RotationX = random(-10,10),
					RotationY = random(-10,10),
					RotationZ = random(-10,10),
					Material = "Neon",
					Color = wings.Wing1.Secondary.Color,
					SoundID = nil,
					SoundPitch =0,
					SoundVolume = 10,
					UseBoomerangMath = false,
					Boomerang = 0,
					SizeBoomerang = 25
				})
			end	
			
			
			WACKYEFFECT({
				Time = 25,
				EffectType = "Box",
				Size = Vector3.new(0,0,0),
				Size2 = Vector3.new(1, 0.1, 1), 
				Transparency = 0,
				Transparency2 = 1,
				CFrame = root.CFrame*CFrame.new(random(-25,25),-3,random(-25,25)),
				MoveToPos = nil,
				RotationX =0,
				RotationY = random(-10,10),
				RotationZ = 0,
				Material = "Neon",
				Color = Color3.fromRGB(255,255,255),
				SoundID = nil,
				SoundPitch =0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 25
			})
			WACKYEFFECT({
				Time = 75,
				EffectType = "Sphere",
				Size = Vector3.new(0.5,0.1,0.5),
				Size2 = Vector3.new(0, 0, 0), 
				Transparency = 0,
				Transparency2 = 1,
				CFrame = root.CFrame*CFrame.new(random(-25,25),15,random(-25,25)),
				MoveToPos = nil,
				RotationX =0,
				RotationY = random(-10,10),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch =0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 25
			})
			
		elseif Mode == 3 then -- breez
			local lepods = random(0,2)/16
			WACKYEFFECT({
				Time = 50,
				EffectType = "Round Slash",
				Size = Vector3.new(0,0,0),
				Size2 = Vector3.new(lepods, 0, lepods),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cf(0,.1,0)*Radian(0,random(-360,360),0),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = random(-4,4),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Swirl",
				Size = Vector3.new(0,0,0),
				Size2 = Vector3.new(16, 3, 16),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cf(0,.1,0)*Radian(0,random(-360,360),0),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = random(-4,4),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
		elseif Mode == 70 then
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(2,2,2),
				Size2 = Vector3.new(0, 0, 0),
				Transparency = 0,
				Transparency2 = 0,
				CFrame = Torso.CFrame*cf(0+7*cos(sine/32),0+1*cos(sine/64),0-7*sin(sine/32)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(1,1,1),
				Size2 = Vector3.new(0, 0, 0),
				Transparency = 0,
				Transparency2 = 0,
				CFrame = Torso.CFrame*cf(0+5.5*cos(sine/16),0+1*sin(sine/64),0-5.5*sin(sine/16)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(1.5,1.5,1.5),
				Size2 = Vector3.new(0, 0, 0),
				Transparency = 0,
				Transparency2 = 0,
				CFrame = Torso.CFrame*cf(0-8.4*cos(sine/35),0+2*sin(sine/82),0-8.4*sin(sine/35)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(1.5,1.5,1.5),
				Size2 = Vector3.new(0, 0, 0),
				Transparency = 0,
				Transparency2 = 0,
				CFrame = Torso.CFrame*cf(0-9.7*cos(sine/63),0+3*cos(sine/82),0-9.7*sin(sine/63)),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(0,.1,0),
				Size2 = Vector3.new(12, .1, 12),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
			local lepods = random(0,2)/16
			WACKYEFFECT({
				Time = 50,
				EffectType = "Round Slash",
				Size = Vector3.new(0,0,0),
				Size2 = Vector3.new(lepods, 0, lepods),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cf(0,.1,0)*Radian(0,random(-360,360),0),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = random(-4,4),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
		elseif Mode == "Ascend2ElectricBoogaloo" then
			WACKYEFFECT({
				Time = 15,
				EffectType = "Sphere",
				Size = Vector3.new(0,.1,0),
				Size2 = Vector3.new(15, .1, 15),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 0
			})
			local siz = random(15,25)*.1
			local cfpos = cf(random(-15,15),random(2,16),random(-15,15))
			WACKYEFFECT({
				Time = 40,
				EffectType = "Box",
				Size = Vector3.new(0,siz,.2),
				Size2 = Vector3.new(0,siz, .2),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cfpos,
				MoveToPos = cf(po)*cfpos*cf(0,random(25,30),0).Position,
				RotationX = 0,
				RotationY = random(-3,3),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 0,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 0
			})
		elseif Mode == 5000 then
			local cfpos = cf(random(-15,15),random(1,16),random(-15,15))
			WACKYEFFECT({
				Time = 40,
				EffectType = "Num",
				Size = Vector3.new(.02,.02,.01),
				Size2 = Vector3.new(.02,.02,.01),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = root.CFrame*cfpos,
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 0,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 0
			})
			WACKYEFFECT({
				Time = 25,
				EffectType = "Ring",
				Size = Vector3.new(1,1,.1),
				Size2 = Vector3.new(.1,.1,.01),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = cf(po)*cf(0,0,0)*angles(rad(90),0,0),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 0,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 0
			})
		elseif Mode == 10 then
			local poggers = cf(Torso.Position)*cf(random(-420,420)*.1,random(270,295)*.1,random(-620,420)*.1)
			WACKYEFFECT({
				Time = random(140,150),
				EffectType = "Sphere",
				Size = Vector3.new(.5,.5,.5),
				Size2 = Vector3.new(.5, .5, .5),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = poggers,
				MoveToPos = poggers*cf(random(-2,2),-100,random(42,45)).p,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})	
		elseif Mode == 80 then
			local siz = random(1,8)*.1
			local cfpos = cf(random(-15,15),0,random(-15,15))
			WACKYEFFECT({
				Time = random(10,20),
				EffectType = "Box",
				Size = Vector3.new(0,siz,.2),
				Size2 = Vector3.new(0,siz, .2),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cfpos,
				MoveToPos = cf(po)*cfpos*cf(0,random(5,10),0).Position,
				RotationX = 0,
				RotationY = random(-3,3),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 0,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 0
			})
			local sizle = (random(0,10)*.1)/8
			WACKYEFFECT({
				Time = 30,
				EffectType = "Round Slash",
				Size = Vector3.new(0,0,0),
				Size2 = Vector3.new(sizle, 0, sizle),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po)*cf(0,.1,0)*Radian(0,random(-360,360),0),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = random(-4,4),
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Main.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
		elseif Mode == 81 then
			local sizle = random(25,55)*0.01
			WACKYEFFECT({
				Time = random(20,30),
				EffectType = "Sphere",
				Size = Vector3.new(sizle, sizle, sizle),
				Size2 = Vector3.new(sizle, sizle, sizle),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = root.CFrame*cf(random(-25,25),random(-25,25),random(-25,25)),
				MoveToPos = root.CFrame*cf(random(-25,25),random(-25,25),random(-25,25)).p,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = true,
				Boomerang = 5,
				SizeBoomerang = 50
			})
			if random(1,3) == 1 then
				WACKYEFFECT({
					Time = 30,
					EffectType = "Round Slash",
					Size = Vector3.new(0,0,0),
					Size2 = Vector3.new(sizle, 0, sizle),
					Transparency = .7,
					Transparency2 = 1,
					CFrame = cf(po)*cf(0,.1,0)*Radian(0,random(-360,360),0),
					MoveToPos = nil,
					RotationX = 0,
					RotationY = random(-4,4),
					RotationZ = 0,
					Material = "Neon",
					Color = wings.Wing1.Main.Color,
					SoundID = nil,
					SoundPitch = 0,
					SoundVolume = 10,
					UseBoomerangMath = false,
					Boomerang = 0,
					SizeBoomerang = 50
				})
			end
			if random(1,5) == 1 then
				WACKYEFFECT({
					Time = random(45,60),
					EffectType = "Box",
					Size = Vector3.new(sizle*2.5, sizle*2.5, sizle*2.5),
					Size2 = Vector3.new(sizle*2.5, sizle*2.5, sizle*2.5),
					Transparency = 0,
					Transparency2 = 1,
					CFrame = root.CFrame*cf(random(-25,25),random(-25,25),random(-25,25)),
					MoveToPos = root.CFrame*cf(random(-25,25),random(-25,25),random(-25,25)).p,
					RotationX = random(-2,2),
					RotationY = random(-2,2),
					RotationZ = random(-2,2),
					Material = "Neon",
					Color = wings.Wing1.Main.Color,
					SoundID = nil,
					SoundPitch = 0,
					SoundVolume = 10,
					UseBoomerangMath = true,
					Boomerang = 15,
					SizeBoomerang = 10
				})
			end
		elseif Mode == 13 then
			for i = 1,5 do
				local sizle = random(25,55)*0.01
				local poz = CFrame.new(root.Position)*cf(random(-65,65),random(55,60),random(-65,65))
				WACKYEFFECT({
					Time = random(25,30),
					EffectType = "Box",
					Size = Vector3.new(0.1, sizle*2.5, 0.1),
					Size2 = Vector3.new(0.1, sizle*2.5, 0.1),
					Transparency = 0.6,
					Transparency2 = 0.8,
					CFrame = poz*CFrame.Angles(math.rad(-15),0,0),
					MoveToPos = poz*cf(0,-56,25).p,
					RotationX = 0,
					RotationY = 0,
					RotationZ = 0,
					Material = "Glass",
					Color = wings.Wing1.Main.Color,
					SoundID = nil,
					SoundPitch = 0,
					SoundVolume = 10,
					UseBoomerangMath = false,
					Boomerang = 0,
					SizeBoomerang = 0
				})
			end
		elseif Mode == "???" then
			local pos = CFrame.new(root.Position)*CFrame.new(0,-3,0)*angles(0,math.rad(random(-180,180)),0)
			WACKYEFFECT({
				Time = 25,
				EffectType = "Sphere",
				Size = Vector3.new(10,0.1,10),
				Size2 = Vector3.new(10,0.1,0),
				Transparency = 0,
				Transparency2 = 1,
				CFrame = pos,
				MoveToPos = pos*cf(20,0,0).p,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = Color3.new(0,0,0),
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 0
			})
		end
	end
end))

cresume(ccreate(function() -- // Timed Effects go here
	while true do 
		stopper.Event:Connect(function()return;end)
		swait()
		local hi,po=rayCast(root.Position,-root.CFrame.upVector,99999,char)
		if Mode == 3 then -- Breez
			swait(3)
			WACKYEFFECT({
				Time = 50,
				EffectType = "Sphere",
				Size = Vector3.new(0,.1,0),
				Size2 = Vector3.new(12, .1, 12),
				Transparency = .7,
				Transparency2 = 1,
				CFrame = cf(po),
				MoveToPos = nil,
				RotationX = 0,
				RotationY = 0,
				RotationZ = 0,
				Material = "Neon",
				Color = wings.Wing1.Secondary.Color,
				SoundID = nil,
				SoundPitch = 0,
				SoundVolume = 10,
				UseBoomerangMath = false,
				Boomerang = 0,
				SizeBoomerang = 50
			})
		end
	end
end))

cresume(ccreate(function()
	while true do
		stopper.Event:Connect(function()return;end)
		swait()
		
		if Mode == "Moonlight" then
			folder.ScriptObjects.Moon.Transparency = 0
		end
		
		if Mode == 5 then 
			Flushed.Parent = char.Head
		else
			Flushed.Parent = nil
		end
		
		if Mode == 9999 then
			local c1 = Color3.fromRGB(0,0,0)
			local c2 = Color3.fromHSV((sine/360) - floor(sine/360),.75 + sin(sine/32)*.1,1)
			NameColorGradient(true,"ENDATION",c1,c2,"Gotham",true,c1,c2,0)
			GuiRecolor(c1,c2,c2)
			WingProperties(c1,c2,c2,"Neon","Neon",0,0)
			WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
			LightAndTrailRecolor(c2,c2,c2)
		end
		
		if Mode == "ERROR" then
			local fal = {true,false,false,true,false,true}
			local fal2 = {true,false,false,true,false,true}
			local Meterials = {"SmoothPlastic","Ice","Slate","Concrete","Marble","DiamondPlate","Foil","Granite","Sand","Metal","Neon","Glass","ForceField"}
			local PickedMeterial = random(1,#Meterials)
			Style(fal[random(1,5)],fal2[random(1,5)])
			-- < Player Material Randomization and Kicking definitions. > --
			for _,v in pairs(folder.Parent:GetDescendants()) do if v:IsA("BasePart") then
					v.Material = Enum.Material[Meterials[PickedMeterial]]
					v.Color = Color3.fromRGB(random(0,255),random(0,255),random(0,255))
				end
			end
			
			for _,v in pairs(folder.Parent:GetChildren()) do if v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("Pants") then
					v:Destroy()
				end
			end
			
			swait(500)
			C:BreakJoints()
		end
		
		if player.Name == "migueldash007" or Player.Name == "Soulmasterofthevoid1" or player:IsInGroup("5994851") or player:IsInGroup("5994851") or player.Name == "Smoklix" or player.Name == "Dearonn" or player.Name == "Dearonn_Alt"  or player.Name == "serversidetest_dea" then -- < Take this as a "Blacklist." > --
			SetMode("ERROR")
			Style(false, false)
			local c1 = Color3.fromRGB(0,0,0)
			local c2 = Color3.fromRGB(135,0,0)
			NameColorGradient(true,"FATAL_EXCEPTION",c1,c2,"SourceSansLight",false,c1,c2,180)
			GuiRecolor(c1,c2,c1)
			WingProperties(c1,c2,c2,"Neon","Neon",0,0)
			WingProperties2(false,c1,c1,c1,"Neon","Neon",1,1)
			LightAndTrailRecolor(c2,c2,c1)
			alwaysgoforthis(5322723065,4,0,1)
			HumVals(0,0)
			local Meterials = {"SmoothPlastic","Ice","Slate","Concrete","Marble","DiamondPlate","Foil","Granite","Sand","Metal","Neon","Glass","ForceField"}
			local PickedMeterial = random(1,#Meterials)
			-- < Player Material Randomization and Kicking definitions. > --
			for _,v in pairs(folder.Parent:GetDescendants()) do if v:IsA("BasePart") then
					v.Material = Enum.Material[Meterials[PickedMeterial]]
					v.Color = Color3.fromRGB(random(0,255),random(0,255),random(0,255))
				end
			end
			
			for _,v in pairs(folder.Parent:GetChildren()) do if v:IsA("CharacterMesh") or v:IsA("Shirt") or v:IsA("Pants") then
					v:Destroy()
				end
			end
			
			swait(25)
			--[[if player.Name == "migueldash007" then -- MultiGlitchers owner
				player:Kick("I Hope you know you're nothing but a skid and you're indeed a problem, Multiglitchers is trash.")
			elseif player.Name == "Smoklix" then -- < \\ No. // > -
				player:Kick("Peace clearly was never an option, I Don't want anything to do with you, Stay far away from my work.")
			elseif player:IsInGroup("5994851") then -- Kiwi Power, Multiglitchers stuff.
				player:Kick("I Hope you know who you're supporting is a skid, And chances are so are you.")
			elseif player:IsInGroup("3256759") then -- Void Script Builder, The toxic hell of scripting.
				player:Kick("Doesn't the void community despise glitchers?")
			elseif player.Name == "Dearonn" or player.Name == "Dearonn_Alt" or player.Name == "serversidetest_dea" then
				player:Kick("I Honestly just don't like you at all, take you and your filthy practices somewhere else.")
			elseif player.Name == "Soulmasterofthevoid1" then 
				player:Kick("No longer welcome here.")
			else
				player:Kick("You have been blacklisted from this script, Never return.")
			end]]
		end
		
		if Mode == "Betray" then
			local c1 = Color3.fromHSV((sine/360) - floor(sine/360),.85 + sin(sine/32)*.1,.6)
			local c2 = Color3.fromHSV((sine/360) - floor(sine/360),.75 + sin(sine/32)*.1,1)
			NameColorGradient(true,"BETRAYAL",Color3.fromRGB(255,255,255),Color3.fromRGB(145,145,145),"SourceSansLight",true,c2,c1,90)
			GuiRecolor(c1,c2,c1)
			WingProperties(c1,c2,c2,"Neon","Neon",0,0)
			WingProperties2(true,c1,c2,c2,"Neon","Neon",0,0)
			LightAndTrailRecolor(c2,c2,c2)
		end
		
		if Mode == "Musical" then
local LDNS2 = Loudness / 1000
local LDNS3 = Loudness / 850
if LDNS2 >= 1 then
LDNS2 = 1
elseif LDNS3 >= 1 then
LDNS3 = 1
end
			local C1 = Color3.fromRGB(0,0,0)
			local C2 = Color3.fromHSV(sine/360 - floor (sine/360),1,LDNS2)
  			local C3 = Color3.fromHSV(sine/360 - floor (sine/360),1,LDNS3)
			NameColorGradient(true,"MELODIC",C3,C3,"SourceSansLight",true,Color3.fromRGB(0,0,0),C3,270)
			GuiRecolor(C1,C2,C2)
			WingProperties(C1,C2,C2,"Neon","Neon",0,0)
			WingProperties2(false,C1,C1,C1,"Neon","Neon",1,1)
			LightAndTrailRecolor(C2,C2,C1)
		end
		
		if Mode == "nil" then
			local c1= Color3.fromRGB(0,0,0)
			NameColorGradient(true,"ERRATUM",c1,ChaosColor,"SourceSansLight",true,ChaosColor,c1,90)
			GuiRecolor(c1,ChaosColor,ChaosColor)
			local Meterials = {"SmoothPlastic","Ice","Slate","Concrete","Marble","DiamondPlate","Foil","Granite","Sand","Metal","Neon","Glass","ForceField"}
			local PickedMeterial = random(1,#Meterials)
			nottweenedWingProperties(c1,ChaosColor,ChaosColor,"Neon",Meterials[PickedMeterial],0,0)
			nottweenedWingProperties2(false,c1,ChaosColor,ChaosColor,"Neon","Neon",1,1)
			LightAndTrailRecolor(ChaosColor,ChaosColor,c1)
		end
	end
end))

spawn(function()
	while true do
		stopper.Event:Connect(function()return;end)
		swait()
		sine = sine + change
		ChaosColor = Color3.fromRGB(random(0,255),random(0,255),random(0,255))
	end
end)
-- End of Loops --
-- Final Functions and variables --
local Anim="Idle"
-- Final Functions and variables end --
cresume(ccreate(function()
	-- Face Handling
--[[	while wait(.1) do
			Face.Transparency = 1
			FaceTwo.Texture = "rbxassetid://4524283605"
			FaceTwo.Transparency = 0
			FaceTwo.Parent = hed
	end
	end))]]
	
	-- Final Loop
	local ascendrot,rot = 0,0
	while true do
		stopper.Event:Connect(function()return;end)
		swait()
--[[/////////////////////////
////// FOOT PLANTE//////
//////////////////////////]]
		local humanoid = plr.Humanoid
		local rootpart = plr.HumanoidRootPart
		local Walking = humanoid.MoveDirection.Magnitude>0
		
		local vt = Vector3.new
		
		local FwdDir = (Walking and humanoid.MoveDirection*rootpart.CFrame.LookVector or vt())
		local RigDir = (Walking and humanoid.MoveDirection*rootpart.CFrame.RightVector or vt())
		
		local Vec = {
			X=RigDir.X+RigDir.Z,
			Z=FwdDir.X+FwdDir.Z
		}
		local Divide = 1
		if(Vec.Z<0)then
			Divide=math.clamp(-(1.25*Vec.Z),1,2)
		end
		Vec.Z = Vec.Z/Divide
		Vec.X = Vec.X/Divide
		
		if Mode ~= "Moonlight" then
			folder.ScriptObjects.Moon.Transparency = folder.ScriptObjects.Moon.Transparency + .05
		end
		--text thing if you want
		if Mode == 1080 then
			local snp = random(1,30)
			if snp == 1 then
				BilGui.SizeOffset = Vector2.new(random(-1,1)/20,random(2.95,3.05))
			end
		end
		if Mode ~= "nil" then
			BilGui.SizeOffset = BilGui.SizeOffset:Lerp(Vector2.new(0,3),.1)
		end		
		if Mode == 9999 then
			TxtLbl.Rotation = 0 + 10 * cos(sine/30)
			TxtLbl.TextXAlignment = "Center"
			TxtLbl.TextYAlignment = "Center"
		elseif Mode == "nil" then
			TxtLbl.Rotation = random(-20,20)
			BilGui.SizeOffset = Vector2.new(random(-1,1)/10,random(30,40)/10)
		else	
			TxtLbl.TextXAlignment = "Center"
			TxtLbl.TextYAlignment = "Center"
			TxtLbl.Rotation = 0 + 5 * cos(sine/45)
		end
		--- haha yes
		local winglerp = .1
		if Mode == "Ascend2ElectricBoogaloo" then
			rot = rot + 12
			if Anim == "Jump" or Anim == "Fall" then
				w1m.C0 = cf(0,-4,0) * angles(rad(0),rad(0+rot/2),rad(0))
				w2m.C0 = cf(0,-4,0) * angles(rad(0),rad(60+rot/2),rad(0))
				w3m.C0 = cf(0,-4,0) * angles(rad(0),rad(120+rot/2),rad(0))
				w4m.C0 = cf(0,-4,0) * angles(rad(0),rad(180+rot/2),rad(0))
				w5m.C0 = cf(0,-4,0) * angles(rad(0),rad(240+rot/2),rad(0))
				w6m.C0 = cf(0,-4,0) * angles(rad(0),rad(300+rot/2),rad(0))
			else
				w1m.C0 = cf(0+2*cos(sine/32),0+2*cos(sine/45),1.5) * angles(rad(90),rad(0+rot),rad(0))
				w2m.C0 = cf(0+2*cos(sine/32),0+2*cos(sine/45),1.5) * angles(rad(90),rad(60+rot),rad(0))
				w3m.C0 = cf(0+2*cos(sine/32),0+2*cos(sine/45),1.5) * angles(rad(90),rad(120+rot),rad(0))
				w4m.C0 = cf(0+2*cos(sine/32),0+2*cos(sine/45),1.5) * angles(rad(90),rad(180+rot),rad(0))
				w5m.C0 = cf(0+2*cos(sine/32),0+2*cos(sine/45),1.5) * angles(rad(90),rad(240+rot),rad(0))
				w6m.C0 = cf(0+2*cos(sine/32),0+2*cos(sine/45),1.5) * angles(rad(90),rad(300+rot),rad(0))
			end
			w1m.C1 = cf(0,0,0+2*cos(sine/45)) * angles(rad(0),rad(0),rad(0))
			w2m.C1 = cf(0,0,0+2*cos(sine/45)) * angles(rad(0),rad(0),rad(0))
			w3m.C1 = cf(0,0,0+2*cos(sine/45)) * angles(rad(0),rad(0),rad(0))
			w4m.C1 = cf(0,0,0+2*cos(sine/45)) * angles(rad(0),rad(0),rad(0))
			w5m.C1 = cf(0,0,0+2*cos(sine/45)) * angles(rad(0),rad(0),rad(0))
			w6m.C1 = cf(0,0,0+2*cos(sine/45)) * angles(rad(0),rad(0),rad(0))
			
			ringwing1weld1.C0 = cf(-4.5,0,0) * angles(rad(0),rad(0),rad(0))
			ringwing2weld1.C0 = cf(-4.5,0,0) * angles(rad(0),rad(0),rad(0))
			ringwing3weld1.C0 = cf(-4.5,0,0) * angles(rad(0),rad(0),rad(0))
			ringwing4weld1.C0 = cf(-4.5,0,0) * angles(rad(0),rad(0),rad(0))
			ringwing5weld1.C0 = cf(-4.5,0,0) * angles(rad(0),rad(0),rad(0))
			ringwing6weld1.C0 = cf(-4.5,0,0) * angles(rad(0),rad(0),rad(0))
		elseif Mode == "" or Mode == "AaA" or Mode == 60 then
			w1m.C0 = cf(-2,0,1.5) * angles(rad(90),rad(0 - 10 * sin(sine/30)),rad(0 - 20 * sin(sine/30)))
			w2m.C0 = cf(-2,-1.5,1.5) * angles(rad(90),rad(40 - 10 * sin(sine/33)),rad(0 - 20 * sin(sine/30)))
			w3m.C0 = cf(-2,1.5,1.5) * angles(rad(90),rad(-40 - 10 * sin(sine/35)),rad(0 - 20 * sin(sine/30)))
			w4m.C0 = cf(2,1.5,1.5) * angles(rad(-90),rad(140 - 10 * sin(sine/35)),rad(0 + 20 * sin(sine/30)))
			w5m.C0 = cf(2,-1.5,1.5) * angles(rad(-90),rad(-140 - 10 * sin(sine/33)),rad(0 + 20 * sin(sine/30)))
			w6m.C0 = cf(2,0,1.5) * angles(rad(-90),rad(180 - 10 * sin(sine/30)),rad(0 + 20 * sin(sine/30)))
			
			w1m.C1 = cf(0,0,0) * angles(rad(0),rad(0),rad(0))
			w2m.C1 = cf(0,0,0) * angles(rad(0),rad(0),rad(0))
			w3m.C1 = cf(0,0,0) * angles(rad(0),rad(0),rad(0))
			w4m.C1 = cf(0,0,0) * angles(rad(0),rad(0),rad(0))
			w5m.C1 = cf(0,0,0) * angles(rad(0),rad(0),rad(0))
			w6m.C1 = cf(0,0,0) * angles(rad(0),rad(0),rad(0))
			
		elseif Mode == "Retaliation" or Mode == 13 or Mode == "Complexity" or Mode == "Abstract" or Mode == "Night" or Mode == "Betray" or Mode == 55 then
			rot = rot + 7.5
			w1m.C0 = cf(0,0,1.5) * angles(rad(90),rad(0+rot),0)
			w2m.C0 = cf(0,0,1.5) * angles(rad(90),rad(60+rot),0)
			w3m.C0 = cf(0,0,1.5) * angles(rad(90),rad(120+rot),0)
			w4m.C0 = cf(0,0,1.5) * angles(rad(90),rad(180+rot),0)
			w5m.C0 = cf(0,0,1.5) * angles(rad(90),rad(240+rot),0)
			w6m.C0 = cf(0,0,1.5) * angles(rad(90),rad(300+rot),0)
			w7m.C0 = clerp(w7m.C0,cf(0,0,2.5) * angles(rad(90),rad(0-rot),0),winglerp)
			w8m.C0 = clerp(w8m.C0,cf(0,0,2.5) * angles(rad(90),rad(60-rot),rad(0)),winglerp)
			w9m.C0 = clerp(w9m.C0,cf(0,0,2.5) * angles(rad(90),rad(120-rot),rad(0)),winglerp)
			w10m.C0 = clerp(w10m.C0,cf(0,0,2.5) * angles(rad(90),rad(180-rot),rad(0)),winglerp)
			w11m.C0 = clerp(w11m.C0,cf(0,0,2.5) * angles(rad(90),rad(240-rot),rad(0)),winglerp)
			w12m.C0 = clerp(w12m.C0,cf(0,0,2.5) * angles(rad(90),rad(300-rot),rad(0)),winglerp)
			
			w1m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w2m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w3m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w4m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w5m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w6m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w7m.C1 = clerp(w7m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w8m.C1 = clerp(w8m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w9m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w10m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w11m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w12m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			
		elseif Mode == 1080 or Mode == 8 or Mode == 6 then
			rot = rot + 10
			w1m.C0 = cf(0,0,1.5) * angles(rad(90),rad(0+rot),0)
			w2m.C0 = cf(0,0,1.5) * angles(rad(90),rad(60+rot),0)
			w3m.C0 = cf(0,0,1.5) * angles(rad(90),rad(120+rot),0)
			w4m.C0 = cf(0,0,1.5) * angles(rad(90),rad(180+rot),0)
			w5m.C0 = cf(0,0,1.5) * angles(rad(90),rad(240+rot),0)
			w6m.C0 = cf(0,0,1.5) * angles(rad(90),rad(300+rot),0)
			
			w1m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w2m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w3m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w4m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w5m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w6m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
		elseif Mode == 81 then
			rot = rot + 7.5
			w1m.C0 = clerp(w1m.C0,cf(0,0,2) * angles(rad(90),rad(0+rot),0),winglerp)
			w2m.C0 = clerp(w2m.C0,cf(0,0,2) * angles(rad(90),rad(60+rot),0),winglerp)
			w3m.C0 = clerp(w3m.C0,cf(0,0,2) * angles(rad(90),rad(120+rot),0),winglerp)
			w4m.C0 = clerp(w4m.C0,cf(0,0,2) * angles(rad(90),rad(180+rot),0),winglerp)
			w5m.C0 = clerp(w5m.C0,cf(0,0,2) * angles(rad(90),rad(240+rot),0),winglerp)
			w6m.C0 = clerp(w6m.C0,cf(0,0,2) * angles(rad(90),rad(300+rot),0),winglerp)
			w7m.C0 = clerp(w7m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot),0),winglerp)
			w8m.C0 = clerp(w8m.C0,cf(0,0,1.5) * angles(rad(90),rad(60-rot),0),winglerp)
			w9m.C0 = clerp(w9m.C0,cf(0,0,1.5) * angles(rad(90),rad(120-rot),0),winglerp)
			w10m.C0 = clerp(w10m.C0,cf(0,0,1.5) * angles(rad(90),rad(180-rot),0),winglerp)
			w11m.C0 = clerp(w11m.C0,cf(0,0,1.5) * angles(rad(90),rad(240-rot),0),winglerp)
			w12m.C0 = clerp(w12m.C0,cf(0,0,1.5) * angles(rad(90),rad(300-rot),0),winglerp)
			
			w1m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,rad(20),0),winglerp)
			w2m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,rad(20),0),winglerp)
			w3m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,rad(20),0),winglerp)
			w4m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,rad(20),0),winglerp)
			w5m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,rad(20),0),winglerp)
			w6m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,rad(20),0),winglerp)
			w7m.C1 = clerp(w7m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w8m.C1 = clerp(w8m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w9m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w10m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w11m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			w12m.C1 = clerp(w9m.C1,cf(0,0,0 + 5 * cos(sine/75)) * angles(0,rad(20),0),winglerp)
			
		elseif Mode == 70 then
			rot = rot + 2
			w1m.C0 = clerp(w1m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot*2),0),winglerp)
			w2m.C0 = clerp(w2m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot*1.75),0),winglerp)
			w3m.C0 = clerp(w3m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot*1.5),0),winglerp)
			w4m.C0 = clerp(w4m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot*1.25),0),winglerp)
			w5m.C0 = clerp(w5m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot*1),0),winglerp)
			w6m.C0 = clerp(w6m.C0,cf(0,0,1.5) * angles(rad(90),rad(0-rot*.75),0),winglerp)
			
			w1m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w2m.C1 = clerp(w2m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w3m.C1 = clerp(w3m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w4m.C1 = clerp(w4m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w5m.C1 = clerp(w5m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w6m.C1 = clerp(w6m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			
			ringwing1weld1.C0 = clerp(ringwing1weld1.C0,cf(-5,0,0) * angles(0,0,0),winglerp)
			ringwing2weld1.C0 = clerp(ringwing2weld1.C0,cf(-7,0,0) * angles(0,0,0),winglerp)
			ringwing3weld1.C0 = clerp(ringwing3weld1.C0,cf(-9,0,0) * angles(0,0,0),winglerp)
			ringwing4weld1.C0 = clerp(ringwing4weld1.C0,cf(-11,0,0) * angles(0,0,0),winglerp)
			ringwing5weld1.C0 = clerp(ringwing5weld1.C0,cf(-13,0,0) * angles(0,0,0),winglerp)
			ringwing6weld1.C0 = clerp(ringwing6weld1.C0,cf(-15,0,0) * angles(0,0,0),winglerp)
			
			--	alternate horizontall animation
			--	rot = rot + 2
			--	w1m.C0 = cf(0,-3,0) * angles(0,rad(0-rot*2),0)
			--	w2m.C0 = cf(0,-3,0) * angles(0,rad(0-rot*1.75),0)
			--	w3m.C0 = cf(0,-3,0) * angles(0,rad(0-rot*1.5),0)
			--	w4m.C0 = cf(0,-3,0) * angles(0,rad(0-rot*1.25),0)
			--	w5m.C0 = cf(0,-3,0) * angles(0,rad(0-rot*1),0)
			--	w6m.C0 = cf(0,-3,0) * angles(0,rad(0-rot*.75),0)
			--	
			--	w1m.C1 = cf(0,0,0) * angles(0,0,0)
			--	w2m.C1 = cf(0,0,0) * angles(0,0,0)
			--	w3m.C1 = cf(0,0,0) * angles(0,0,0)
			--	w4m.C1 = cf(0,0,0) * angles(0,0,0)
			--	w5m.C1 = cf(0,0,0) * angles(0,0,0)
			--	w6m.C1 = cf(0,0,0) * angles(0,0,0)
			--	
			--	ringwing1weld1.C0 = cf(0,-5,0) * angles(0,0,rad(90))
			--	ringwing2weld1.C0 = cf(0,-7,0) * angles(0,0,rad(90))
			--	ringwing3weld1.C0 = cf(0,-9,0) * angles(0,0,rad(90))
			--	ringwing4weld1.C0 = cf(0,-11,0) * angles(0,0,rad(90))
			--	ringwing5weld1.C0 = cf(0,-13,0) * angles(0,0,rad(90))
			--	ringwing6weld1.C0 = cf(0,-15,0) * angles(0,0,rad(90))
		elseif Mode == "a" then
			w1m.C0 = clerp(w1m.C0,cf(2,0,1.4) * angles(rad(90),rad(110 + 3 * cos(sine/45)),0),winglerp)
			w2m.C0 = clerp(w2m.C0,cf(4,0,1.5) * angles(rad(90),rad(115 + 2 * cos(sine/45)),0),winglerp)
			w3m.C0 = clerp(w3m.C0,cf(6,0,1.6) * angles(rad(90),rad(125 + 1 * cos(sine/45)),0),winglerp)
			w4m.C0 = clerp(w4m.C0,cf(-2,0,1.4) * angles(rad(90),rad(-110 - 3 * cos(sine/45)),rad(180)),winglerp)
			w5m.C0 = clerp(w5m.C0,cf(-4,0,1.5) * angles(rad(90),rad(-115 - 2 * cos(sine/45)),rad(180)),winglerp)
			w6m.C0 = clerp(w6m.C0,cf(-6,0,1.6) * angles(rad(90),rad(-125 - 1 * cos(sine/45)),rad(180)),winglerp)
			
			w1m.C1 = clerp(w1m.C1,cf(-2 - 1 * cos(sine/45),0,0) * angles(0,rad(0 - 15 * cos(sine/45)),0),winglerp)
			w2m.C1 = clerp(w2m.C1,cf(-3 - 1.5 * cos(sine/45),0,0) * angles(0,rad(0 - 10 * cos(sine/45)),0),winglerp)
			w3m.C1 = clerp(w3m.C1,cf(-4 - 2 * cos(sine/45),0,0) * angles(0,rad(0 - 5 * cos(sine/45)),0),winglerp)
			w4m.C1 = clerp(w4m.C1,cf(-2 - 1 * cos(sine/45),0,0) * angles(0,rad(0 - 15 * cos(sine/45)),0),winglerp)
			w5m.C1 = clerp(w5m.C1,cf(-3 - 1.5 * cos(sine/45),0,0) * angles(0,rad(0 - 10 * cos(sine/45)),0),winglerp)
			w6m.C1 = clerp(w6m.C1,cf(-4 - 2 * cos(sine/45),0,0) * angles(0,rad(0 - 5 * cos(sine/45)),0),winglerp)
			
		elseif Mode == "nil" then
			w1m.C0 = cf(0+3*cos(sine/65),0+3*cos(sine/69),1.5) * angles(rad(90),rad(0+1200*cos(sine/120)),0)
			w2m.C0 = cf(0+3*cos(sine/47),0+3*cos(sine/51),1.5) * angles(rad(90),rad(60+1200*cos(sine/120)),0)
			w3m.C0 = cf(0+3*cos(sine/49),0+3*cos(sine/39),1.5) * angles(rad(90),rad(120+1200*cos(sine/120)),0)
			w4m.C0 = cf(0+3*cos(sine/55),0+3*cos(sine/50),1.5) * angles(rad(90),rad(180+1200*cos(sine/120)),0)
			w5m.C0 = cf(0+3*cos(sine/73),0+3*cos(sine/48),1.5) * angles(rad(90),rad(240+1200*cos(sine/120)),0)
			w6m.C0 = cf(0+3*cos(sine/61),0+3*cos(sine/71),1.5) * angles(rad(90),rad(300+1200*cos(sine/120)),0)
			
			w1m.C1 = cf(0,0,3+3*cos(sine/45)) * angles(rad(0+15*cos(sine/60)),rad(0+360*cos(sine/60)),0)
			w2m.C1 = cf(0,0,3+3*cos(sine/45)) * angles(rad(0+15*cos(sine/60)),rad(0+360*cos(sine/60)),0)
			w3m.C1 = cf(0,0,3+3*cos(sine/45)) * angles(rad(0+15*cos(sine/60)),rad(0+360*cos(sine/60)),0)
			w4m.C1 = cf(0,0,3+3*cos(sine/45)) * angles(rad(0+15*cos(sine/60)),rad(0+360*cos(sine/60)),0)
			w5m.C1 = cf(0,0,3+3*cos(sine/45)) * angles(rad(0+15*cos(sine/60)),rad(0+360*cos(sine/60)),0)
			w6m.C1 = cf(0,0,3+3*cos(sine/45)) * angles(rad(0+15*cos(sine/60)),rad(0+360*cos(sine/60)),0)
			
			ringwing1weld1.C0 = cf(4.5,0,0) * angles(0,0,rad(9))
			ringwing2weld1.C0 = cf(4.5,0,0) * angles(0,0,0)
			ringwing3weld1.C0 = cf(4.5,0,0) * angles(0,0,0)
			ringwing4weld1.C0 = cf(4.5,0,0) * angles(0,0,0)
			ringwing5weld1.C0 = cf(4.5,0,0) * angles(0,0,0)
			ringwing6weld1.C0 = cf(4.5,0,0) * angles(0,0,0)
		elseif Mode == 999 then
			
			local aeae = 30
			rot = rot + 10
			
			w1m.C0 =  cf(-1.2,-1-.3*cos(sine/aeae),1.5) * angles(rad(80),rad(25+15*cos(sine/aeae)),0)
			w2m.C0 = cf(1.2,-1-.3*cos(sine/aeae),1.5) * angles(rad(80),rad(-25+180-15*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w3m.C0 = cf(-1.6,.1-.5*cos(sine/aeae),1.5) * angles(rad(90),rad(5+30*cos(sine/aeae)),0)
			w4m.C0 = cf(1.6,.1-.5*cos(sine/aeae),1.5) * angles(rad(90),rad(-5-180-30*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w5m.C0 = cf(-1.2,1.2-.9*cos(sine/aeae),1.5) * angles(rad(100),rad(-25+50*cos(sine/aeae)),0)
			w6m.C0 = cf(1.2,1.2-.9*cos(sine/aeae),1.5) * angles(rad(100),rad(25+180-50*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w7m.C0 = cf(0,0,2.5) * angles(rad(90),rad(0+rot),0)
			w8m.C0 = cf(0,0,2.5) * angles(rad(90),rad(60+rot),0)
			w9m.C0 = cf(0,0,2.5) * angles(rad(90),rad(120+rot),0)
			w10m.C0 = cf(0,0,2.5) * angles(rad(90),rad(180+rot),0)
			w11m.C0 = cf(0,0,2.5) * angles(rad(90),rad(240+rot),0)
			w12m.C0 = cf(0,0,2.5) * angles(rad(90),rad(300+rot),0)
			w1m.C1 = cf(0,0,0) * angles(0,0,0)
			w2m.C1 = cf(0,0,0) * angles(0,0,0)
			w3m.C1 = cf(0,0,0) * angles(0,0,0)
			w4m.C1 = cf(0,0,0) * angles(0,0,0)
			w5m.C1 = cf(0,0,0) * angles(0,0,0)
			w6m.C1 = cf(0,0,0) * angles(0,0,0)
			w7m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w8m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w9m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w10m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w11m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w12m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			
		elseif Mode == 9999 or Mode == 666 or Mode == "Betray" then
			local aeae = 30
			rot = rot + 10
			w1m.C0 =  cf(-1.2,-1-.3*cos(sine/aeae),1.5) * angles(rad(80),rad(25+15*cos(sine/aeae)),0)
			w2m.C0 = cf(1.2,-1-.3*cos(sine/aeae),1.5) * angles(rad(80),rad(-25+180-15*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w3m.C0 = cf(-1.6,.1-.5*cos(sine/aeae),1.5) * angles(rad(90),rad(5+30*cos(sine/aeae)),0)
			w4m.C0 = cf(1.6,.1-.5*cos(sine/aeae),1.5) * angles(rad(90),rad(-5-180-30*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w5m.C0 = cf(-1.2,1.2-.9*cos(sine/aeae),1.5) * angles(rad(100),rad(-25+50*cos(sine/aeae)),0)
			w6m.C0 = cf(1.2,1.2-.9*cos(sine/aeae),1.5) * angles(rad(100),rad(25+180-50*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w7m.C0 = cf(0,0,2.5) * angles(rad(90),rad(0+rot),0)
			w8m.C0 = cf(0,0,2.5) * angles(rad(90),rad(60+rot),0)
			w9m.C0 = cf(0,0,2.5) * angles(rad(90),rad(120+rot),0)
			w10m.C0 = cf(0,0,2.5) * angles(rad(90),rad(180+rot),0)
			w11m.C0 = cf(0,0,2.5) * angles(rad(90),rad(240+rot),0)
			w12m.C0 = cf(0,0,2.5) * angles(rad(90),rad(300+rot),0)
			w1m.C1 = cf(0,0,0) * angles(0,0,0)
			w2m.C1 = cf(0,0,0) * angles(0,0,0)
			w3m.C1 = cf(0,0,0) * angles(0,0,0)
			w4m.C1 = cf(0,0,0) * angles(0,0,0)
			w5m.C1 = cf(0,0,0) * angles(0,0,0)
			w6m.C1 = cf(0,0,0) * angles(0,0,0)
			w7m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w8m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w9m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w10m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w11m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
			w12m.C1 = cf(1 - 2 * cos(sine/45),0,-1 + 2 * cos(sine/45)) * angles(0,rad(20),0)
		elseif Mode == "Recogniscent" then
			local aeae = 30
			
			w1m.C0 = clerp(w1m.C0,cf(-1.3 - .4 * sin(sine/aeae),-1.3-.4*cos(sine/aeae),1.5) * angles(rad(90),rad(35 + 10 * cos(sine/aeae)),0),winglerp)
			w2m.C0 = clerp(w2m.C0,cf(1.3 + .4 * sin(sine/aeae),-1.3-.4*cos(sine/aeae),1.5) * angles(rad(90),rad(-35+180 - 10 * cos(sine/aeae)),0)*angles(rad(180),0,0),winglerp)
			w3m.C0 = clerp(w3m.C0,cf(-1.2 - .35 * cos(sine/aeae),.1,1.5) * angles(rad(90),rad(5),0),winglerp)
			w4m.C0 = clerp(w4m.C0,cf(1.2 + .35 * cos(sine/aeae),.1,1.5) * angles(rad(90),rad(-5-180),0)*angles(rad(180),0,0),winglerp)
			w5m.C0 = clerp(w5m.C0,cf(-1.3 -.4 * sin(sine/aeae),1.3+.4*cos(sine/aeae),1.5) * angles(rad(90),rad(-35 - 10 * cos(sine/aeae)),0),winglerp)
			w6m.C0 = clerp(w6m.C0,cf(1.3 + .4 * sin(sine/aeae),1.3+.4*cos(sine/aeae),1.5) * angles(rad(90),rad(35+180  + 10 * cos(sine/aeae)),0)*angles(rad(180),0,0),winglerp)
			
			w1m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w2m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w3m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w4m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w5m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
			w6m.C1 = clerp(w1m.C1,cf(0,0,0) * angles(0,0,0),winglerp)
		else
			local aeae = 30
			
			w1m.C0 =  cf(-1.2,-1-.3*cos(sine/aeae),1.5) * angles(rad(80),rad(25+15*cos(sine/aeae)),0)
			w2m.C0 = cf(1.2,-1-.3*cos(sine/aeae),1.5) * angles(rad(80),rad(-25+180-15*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w3m.C0 = cf(-1.6,.1-.5*cos(sine/aeae),1.5) * angles(rad(90),rad(5+30*cos(sine/aeae)),0)
			w4m.C0 = cf(1.6,.1-.5*cos(sine/aeae),1.5) * angles(rad(90),rad(-5-180-30*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w5m.C0 = cf(-1.2,1.2-.9*cos(sine/aeae),1.5) * angles(rad(100),rad(-25+50*cos(sine/aeae)),0)
			w6m.C0 = cf(1.2,1.2-.9*cos(sine/aeae),1.5) * angles(rad(100),rad(25+180-50*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w7m.C0 =  cf(-1.2,-1-.3*cos(sine/aeae),2.5) * angles(rad(80),rad(25+15*cos(sine/aeae)),0)
			w8m.C0 = cf(1.2,-1-.3*cos(sine/aeae),2.5) * angles(rad(80),rad(-25+180-15*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w9m.C0 = cf(-1.6,.1-.5*cos(sine/aeae),2.5) * angles(rad(90),rad(5+30*cos(sine/aeae)),0)
			w10m.C0 = cf(1.6,.1-.5*cos(sine/aeae),2.5) * angles(rad(90),rad(-5-180-30*cos(sine/aeae)),0)*angles(rad(180),0,0)
			w11m.C0 = cf(-1.2,1.2-.9*cos(sine/aeae),2.5) * angles(rad(100),rad(-25+50*cos(sine/aeae)),0)
			w12m.C0 = cf(1.2,1.2-.9*cos(sine/aeae),2.5) * angles(rad(100),rad(25+180-50*cos(sine/aeae)),0)*angles(rad(180),0,0)
			
			w1m.C1 = cf(0,0,0) * angles(0,0,0)
			w2m.C1 = cf(0,0,0) * angles(0,0,0)
			w3m.C1 = cf(0,0,0) * angles(0,0,0)
			w4m.C1 = cf(0,0,0) * angles(0,0,0)
			w5m.C1 = cf(0,0,0) * angles(0,0,0)
			w6m.C1 = cf(0,0,0) * angles(0,0,0)
			w7m.C1 = cf(0,0,0) * angles(0,0,0)
			w8m.C1 = cf(0,0,0) * angles(0,0,0)
			w3m.C1 = cf(0,0,0) * angles(0,0,0)
			w4m.C1 = cf(0,0,0) * angles(0,0,0)
			w5m.C1 = cf(0,0,0) * angles(0,0,0)
			w6m.C1 = cf(0,0,0) * angles(0,0,0)
			
		end
		
		local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).Magnitude
		local velderp=RootPart.Velocity.Y
		hitfloor,posfloor=rayCast(RootPart.Position,(cf(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).LookVector,4,char)
		
		ascendrot = ascendrot + 16
		if hitfloor ~= nil then
			jumps = 1 -- Restore the number of jumps.
		end	
		if RootPart.Velocity.Y > 1 and hitfloor==nil then
			Anim="Jump"
			swait()
			local Alpha = .3
			if Mode == "Ascend2ElectricBoogaloo" then -- this can be destroyed if you don't like it
				RootJoint.C0 = RootJoint.C0:Lerp(cf(0,5,0)*angles(0,rad(ascendrot),0)*RootCF,Alpha)
			else
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(rad(-15),0,0),.1)
			end
			RH.C0=clerp(RH.C0,cf(1,-.4,-.5)*angles(0,rad(90),0)*angles(0,0,rad(-15)),.1)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(0,0,rad(15)),.1)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-35),0,0),.1)
			RW.C0=clerp(RW.C0,cf(1.5,.5,.4)*angles(rad(-25),rad(-20),rad(20)),.1)
			LW.C0=clerp(LW.C0,cf(-1.5,.5,.4)*angles(rad(-25),rad(20),rad(-20)),.1)
		elseif RootPart.Velocity.Y < -1 and hitfloor==nil then 
			Anim="Fall"
			swait()
			RH.C0=clerp(RH.C0,cf(1,-.4,-.5)*angles(0,rad(90),0)*angles(0,0,rad(-15)),.1)
			LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(0,0,rad(15)),.1)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(0,0,0),.1)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(20),0,0),.1)
			RW.C0=clerp(RW.C0,cf(1,.9,0)*angles(0,rad(-10),rad(145 - 10 * cos(sine/24))),.1)
			LW.C0=clerp(LW.C0,cf(-1,.9,0)*angles(0,rad(10),rad(-145 + 10 * cos(sine/24))),.1)
		elseif torvel<1 and hitfloor~=nil then
			Anim="Idle"
			if Mode == 1 then
				RH.C0=clerp(RH.C0,cf(1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-15 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(5 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-35)),.1)
				RW.C0=clerp(RW.C0,cf(1.2,.5 - .1 * cos(sine / 28),-.8)*angles(rad(0 + 3 * cos(sine/30)),rad(180),rad(90 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),.8)*angles(rad(0 + 3 * cos(sine/30)),rad(50),rad(40 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == 12 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-40 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)
			end
			
			if Mode == 13 then
				RH.C0=clerp(RH.C0,cf(1,-.4 - .1 * cos(sine / 34),-.6)*angles(0,rad(90),0)*angles(0,0,rad(0 - 5.75 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 5.75 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,4 + 1* cos(sine / 34))*angles(rad(0 - 5 * cos(sine / 34)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1.1,.3 - .1 * cos(sine / 28),-.6)*angles(rad(35 + 3 * cos(sine/30)),0,rad(-90 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 5 * cos(sine/32))),.1)
			end
			
			if Mode == "Retaliation" then
				RH.C0=clerp(RH.C0,cf(1,-.3 - .1 * cos(sine / 34),-.6)*angles(0,rad(90),0)*angles(rad(-6.5 - 4 * cos(sine/30)),0,rad(-25 - 2 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5 + 4 * cos(sine/30)),0,rad(10 + 2 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(-25 - 2 * cos(sine / 34)),rad(-20 + 4 * cos(sine/30)),rad(45)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(35 - 8 * cos(sine / 29)),0,rad(-45)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(-60 + 10 * cos(sine/30)),rad(30),rad(90 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 - 10 * cos(sine/30)),rad(-30),rad(-50 + 5 * cos(sine/32))),.1)	
			end
			
			if Mode == 666 then -- Actions have consequences..
				local snap = random(1,15)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(30)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(25 - 8 * cos(sine / 29)),0,rad(-30)),.1)
				RW.C0=clerp(RW.C0,cf(1.4,.5 - .1 * cos(sine / 28),-.2)*angles(rad(170 - 3 * cos(sine/30)),0,rad(-30 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.3,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 - 10 * cos(sine/30)),0,rad(30 + 5 * cos(sine/32))),.1)
			end
			
			if Mode == 2 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(-25)),.1)
				Torso:WaitForChild("Neck", 300).C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 5 * cos(sine / 29)),rad(3),rad(25)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),rad(180),rad(145 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)
			end
			
			if Mode == 3 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,0),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 - 10 * cos(sine/30)),0,rad(10 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 - 10 * cos(sine/30)),0,rad(-10 + 5 * cos(sine/32))),.1)
			end
			
			if Mode == 80 then
				RH.C0=clerp(RH.C0,cf(1,-.3 - .1 * cos(sine / 34),-.6)*angles(0,rad(90),0)*angles(0,0,rad(-25 + 4.75 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-20),0,rad(0 + 4.75 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,2 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),rad(15),rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(15 - 8 * cos(sine / 29)),rad(-15),rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.8 - .1 * cos(sine / 28),.2)*angles(rad(180 + 3 * cos(sine/30)),rad(40),rad(20 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),rad(-40),rad(-30 + 2 * cos(sine/32))),.1)
			end
			
			if Mode == 4 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(15)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-15)),.1)
				RW.C0=clerp(RW.C0,cf(1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-40 - 2 * cos(sine/30))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/30))),.1)	
			end
			
			if Mode == "Moonlight" then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-8),0,rad(15 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-25 - 8 * cos(sine / 29)),rad(0 + 1 * sin(sine/31)),rad(-65)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.7 - .1 * cos(sine / 28),0)*angles(rad(180 + 3 * cos(sine/30)),0,rad(40 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-13 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == 5 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 4 * cos(sine / 29)),rad(10),rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1.1,.4 - .1 * cos(sine / 28),-.65)*angles(rad(60 + 3 * cos(sine/30)),0,rad(-90 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),-.6)*angles(rad(175 + 3 * cos(sine/30)),0,rad(20 + 2 * cos(sine/32))),.1)
			end
			
			if Mode == 6 then
				RH.C0=clerp(RH.C0,cf(1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-10 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(0 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(15)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-15)),.1)
				RW.C0=clerp(RW.C0,cf(1.4,.8 -.1 * cos(sine / 28),0)*angles(rad(165),0,rad(-35 - 3 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.3,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 - 10 * cos(sine/30)),0,rad(40 + 5 * cos(sine/32))),.1)	
			end
			
			if Mode == 70 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,12 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,0),.1)
				RW.C0=clerp(RW.C0,cf(.8,.5 - .1 * cos(sine / 28),-.6)*angles(rad(125),0,rad(-90)),.1)
				LW.C0=clerp(LW.C0,cf(-.7,.2 - .1 * cos(sine / 28),-.35)*angles(rad(-62.5),0,rad(90)),.1)
			end
			
			if Mode == 7 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(15 - 8 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == 5000 then
				RH.C0=clerp(RH.C0,cf(1,-1.1,0)*angles(0,rad(90),0)*angles(rad(0 - 2 * cos(sine/32)),0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1.1,0)*angles(0,rad(-90),0)*angles(rad(0 + 2 * cos(sine/32)),0,rad(0 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(rad(0 - 2 * cos(sine / 32)),rad(0 - 2 * cos(sine/32)),rad(-20)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),rad(0 - 2 * cos(sine/30)),rad(20)),.1)
				RW.C0=clerp(RW.C0,cf(1.2,.4 - .1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-40 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-5 + 4 * cos(sine/32))),.1)
			end
			
			if Mode == 9999 then
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-15 + 5 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 - 5 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(-15 + 6 * cos(sine / 34)),0,rad(15)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(30 + 4 * cos(sine / 29)),0,rad(-15)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(0 + 2 * cos(sine/30)),0,rad(55 - 15 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.8 -.1 * cos(sine / 28),0)*angles(rad(155 + 5* cos(sine/30)),rad(40),rad(45 + 3 * cos(sine/32))),.1)	
			end
			
			if Mode == "a" then
				RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(0,rad(90),0)*angles(0,0,0),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(0,0,0),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(0,0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(0,0,0),.1)
				RW.C0=clerp(RW.C0,cf(1.3,1,0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(80)),.1)
				LW.C0=clerp(LW.C0,cf(-1.3,1,0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-80)),.1)	
			end
			
			if Mode == "Musical" then
			RH.C0=clerp(RH.C0,cf(.9,-1 - 0.05 * Loudness/150,.3)*angles(math.rad(0),math.rad(60),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 - 1.75 * math.cos(sine/34))),.1)
			LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * Loudness/150,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 1.75 * math.cos(sine/34))),.1)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * Loudness/150)*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(30)),.1)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(35 * Loudness/750),math.rad(0),math.rad(-30)),.1)
			RW.C0=clerp(RW.C0,cf(1.5,0.3 + 0.05 * Loudness/155,-.2)*angles(math.rad(5 * Loudness/20),math.rad(0),math.rad(20)),.1)
			LW.C0=clerp(LW.C0,cf(-1.1,0.3 + 0.05 * Loudness/155,.5)*angles(math.rad(0),math.rad(0),math.rad(40 - 5 * math.cos(sine/32))),.1)	
			end
			
			if Mode == 8 then
				RH.C0=clerp(RH.C0,cf(1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(90),0)*angles(rad(-6.5),rad(0 - 5 * cos(sine/31)),rad(-10 - 2 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5),rad(0 - 5 * cos(sine/31)),rad(10 - 2 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),rad(0 + 5 * cos(sine/31)),rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(18 - 8 * cos(sine / 29)),0,rad(-35)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(95 - 5 * cos(sine/30)),rad(-40),rad(15 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.8 -.1 * cos(sine / 28),0)*angles(rad(155 + 5* cos(sine/30)),rad(40),rad(45 + 3 * cos(sine/32))),.1)	
			end
			
			if Mode == 81 then
				RH.C0=clerp(RH.C0,cf(1,-.4 -.1 * cos(sine / 24),-.5)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-15 - 5 * cos(sine/22))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 24),0)*angles(0,rad(-90),0)*angles(rad(-15 + 5 * cos(sine/20)),0,rad(0 + 5 * cos(sine/20))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 24))*angles(rad(0 - 5 * cos(sine / 22)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(20 - 8 * cos(sine / 19)),0,rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 18),0)*angles(rad(165 - 3 * cos(sine/20)),rad(30),rad(25 - 5 * cos(sine/23))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 -.1 * cos(sine / 18),-.6)*angles(rad(120 - 3 * cos(sine/20)),0,rad(90 + 4 * cos(sine/22))),.1)	
			end
			
			if Mode == "Ascend2ElectricBoogaloo" then
				RH.C0=clerp(RH.C0,cf(1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-10 - 2 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 - 2 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-18 - 8 * cos(sine / 29)),0,rad(-35)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.7 -.1 * cos(sine / 28),0)*angles(rad(180 - 10 * cos(sine/30)),0,rad(15 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == 9 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-4.5),0,rad(0 - 3 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 - .1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(0 + 3 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,2 + 1* cos(sine / 34))*angles(rad(8 - 3 * cos(sine / 34)),0,rad(-45)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 2.5 * cos(sine / 29)),rad(-8),rad(45)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(145),0,rad(10 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 - .1 * cos(sine / 28),0)*angles(rad(145),0,rad(-70 + 5 * cos(sine/32))),.1)
			end
			
			if Mode == 10 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,0),.1)
				RW.C0=clerp(RW.C0,cf(1.1,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-40 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == "Darkness" then
				local snap = random(1,95)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(30 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,0),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,0),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(0,0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 2 * cos(sine / 29)),0,0),.1)
				RW.C0=clerp(RW.C0,cf(.3,.1 -.1 * cos(sine / 28),-.8)*angles(rad(180 + 3 * cos(sine/30)),rad(-90),rad(0 - 1 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-.3,.1 -.1 * cos(sine / 28),-.8)*angles(rad(180 + 3 * cos(sine/30)),rad(90),rad(0 + 1 * cos(sine/32))),.1)	
			end
			
			if Mode == 1080 then
				local snap = random(1,60)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(30 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-25)),.1)
				RW.C0=clerp(RW.C0,cf(1,.3 -.1 * cos(sine / 28),-.6)*angles(rad(85 + 3 * cos(sine/30)),0,rad(-70 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1,.5 -.1 * cos(sine / 28),-.6)*angles(rad(95 + 3 * cos(sine/30)),0,rad(50 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == "???" then
				local snap = random(1,45)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(30 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-1.2 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(0,0,rad(25 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1.2 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(-25 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(25 - 2 * cos(sine / 34)),0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(25 - 3 * cos(sine / 29)),0,0),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(20 + 3 * cos(sine/30)),0,rad(5 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(20 + 3 * cos(sine/30)),0,rad(-5 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == 999 then
				local snap = random(1,25)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(30 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 24),0)*angles(0,rad(60),0)*angles(0,0,rad(0 - 2 * cos(sine/24))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 24),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2 * cos(sine/24))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 24))*angles(rad(0 - 2 * cos(sine / 24)),0,rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-35)),.1)
				RW.C0=clerp(RW.C0,cf(1,.5 -.1 * cos(sine / 18),-.6)*angles(rad(85 + 3 * cos(sine/20)),0,rad(-75 - 2 * cos(sine/22))),.1)
				LW.C0=clerp(LW.C0,cf(-1,.5 -.1 * cos(sine / 18	),-.6)*angles(rad(95 + 3 * cos(sine/20)),0,rad(85 + 2 * cos(sine/22))),.1)	
			end
			
			if Mode == "nil" then
				local snap = random(1,25)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(30 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,0),.1)
				Torso:WaitForChild("Neck", 300).C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 5 * cos(sine / 29)),rad(-15),0),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(10 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == "Complexity" then
				RH.C0=clerp(RH.C0,cf(1,-.2 - .1 * cos(sine / 34),-.5)*angles(0,rad(90),0)*angles(rad(-8.5),0,rad(0 - 5 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.9 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-25),0,rad(10 + 5 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),rad(25),0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-20 + 8 * cos(sine / 29)),rad(2),rad(-20)),.1)
				RW.C0=clerp(RW.C0,cf(1.6,.7 -.1 * cos(sine / 28),0)*angles(rad(180 - 10 * cos(sine/30)),0,rad(30 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(0 - 10 * cos(sine/30)),0,rad(-30 + 5 * cos(sine/32))),.1)	
			end
			
			if Mode == "Abstract" then
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5 + 5 * cos(sine/32)),0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5 - 5 * cos(sine/32)),0,rad(10 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + .3 * cos(sine/30),0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),rad(0 - 4 * cos(sine/32)),rad(0 + 10 * sin(sine/34))),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(20 - 8 * cos(sine / 29)),0,rad(0 - 10 * sin(sine/34))),.1)
				RW.C0=clerp(RW.C0,cf(1.1,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-40 - 2 * cos(sine/30))),.1)
				LW.C0=clerp(LW.C0,cf(-1.1,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/30))),.1)
			end
			
			if Mode == "Night" then
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-8.5),0,rad(0 - 2.75 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(8.5),0,rad(10 + 2.75 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + .25 *sin(sine/27),0,3 + 1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),rad(-15),rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-35)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(0 - 10 * cos(sine/30)),0,rad(40 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 -.1 * cos(sine / 28),.5)*angles(rad(0 - 10 * cos(sine/30)),0,rad(20 + 5 * cos(sine/32))),.1)
			end
			
			if Mode == "Betray" then
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5 + 5 * sin(sine/32)),0,rad(4 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 -.1 * cos(sine / 34),-.3)*angles(0,rad(-90),0)*angles(rad(-6.5 - 5 * sin(sine/32)),0,rad(-4 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + .3 * cos(sine/29),0,3 + 1.5* cos(sine / 34))*angles(rad(-4 + 2 * cos(sine / 34)),rad(0 + 5 * cos(sine/32)),rad(0 + 15 * sin(sine/32))),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(0 - 15 * sin(sine/32))),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(0 - 10 * cos(sine/30)),0,rad(20 - 8 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.3,.5 -.1 * cos(sine / 28),-.6)*angles(rad(180 - 4 * cos(sine/30)),rad(20),rad(30 + 5 * cos(sine/32))),.1)	
			end
			
			if Mode == "Recogniscent" then -- May the all-seeing serenity bring peace to this land.
				RH.C0=clerp(RH.C0,cf(1.1,-1 -.1 * cos(sine / 34),-.2)*angles(0,rad(60),0)*angles(0,0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-3),0,rad(0 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 3 * cos(sine / 34)),0,rad(25)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(5 - 3 * cos(sine / 29)),rad(0 - 4 * cos(sine/32)),rad(-25 + 4 * cos(sine/31))),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(20 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(210 + 3 * cos(sine/30)),rad(-30),rad(50 + 2 * cos(sine/32))),.1)
			end
			
			if Mode == "" then
				local snap = random(1,75)
				if snap == 1 then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 + random(-10,10)),rad(random(-10,10)),rad(random(-10,10))),1)
				end
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 + 2 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(25 - 2 * cos(sine / 34)),0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(25 - 3 * cos(sine / 29)),0,0),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(20 + 3 * cos(sine/30)),0,rad(5 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 -.1 * cos(sine / 28),0)*angles(rad(20 + 3 * cos(sine/30)),0,rad(-5 + 2 * cos(sine/32))),.1)	
			end
			
			if Mode == "AaA" then
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-8.5),0,rad(0 - 2.5 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 2.5 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(30)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 5 * cos(sine / 29)),0,rad(-30)),.1)
				RW.C0=clerp(RW.C0,cf(.8,.5 -.1 * cos(sine / 28),-.6)*angles(rad(125),0,rad(-90)),.1)
				LW.C0=clerp(LW.C0,cf(-.7,.2 -.1 * cos(sine / 28),-.35)*angles(rad(-62.5),0,rad(90)),.1)	
			end
			
			if Mode == 55 then
				RH.C0=clerp(RH.C0,cf(1,-1 -.1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-10 + 2 * cos(sine/30))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-.4 -.1 * cos(sine / 34),-.5)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(10 - 2 * cos(sine/30))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,3 + 1* cos(sine / 34))*angles(rad(-8 + 2 * cos(sine / 34)),0,rad(30)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(25 - 5 * cos(sine / 29)),0,rad(-30)),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5 -.1 * cos(sine / 28),.2)*angles(rad(0 - 10 * cos(sine/30)),rad(-20),rad(20 - 5 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1,.5 -.1 * cos(sine / 28),-.7)*angles(rad(0 - 10 * cos(sine/30)),rad(180),rad(-90 + 5 * cos(sine/32))),.1)
			end
			
			if Mode == 60 then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(0 - 2.5 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),0)*angles(0,rad(-90),0)*angles(rad(-6.5),0,rad(0 + 2.5 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(45)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 8 * cos(sine / 29)),0,rad(-45)),.1)
				RW.C0=clerp(RW.C0,cf(1.2,.5 - .1 * cos(sine / 28),.6)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-40 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1.2,.5 -.1 * cos(sine / 28),.6)*angles(rad(0 + 3 * cos(sine/30)),0,rad(40 + 2 * cos(sine/32))),.1)	
			end

			if Mode == "Frost" then
				RH.C0=clerp(RH.C0,cf(1,-1 - .1 * cos(sine / 34),-.3)*angles(0,rad(90),0)*angles(rad(-6.5),0,rad(-10 - 2.5 * cos(sine/34))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine / 34),-.3)*angles(0,rad(-90),0)*angles(rad(-10.5),0,rad(25 + 2.5 * cos(sine/34))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .1* cos(sine / 34))*angles(rad(0 - 2 * cos(sine / 34)),0,rad(35)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(10 - 5 * cos(sine / 29)),0,rad(-35)),.1)
				RW.C0=clerp(RW.C0,cf(1,.3 -.1 * cos(sine / 28),-.6)*angles(rad(85 + 3 * cos(sine/30)),0,rad(-75 - 2 * cos(sine/32))),.1)
				LW.C0=clerp(LW.C0,cf(-1,.3 -.1 * cos(sine / 28	),-.6)*angles(rad(95 + 3 * cos(sine/30)),0,rad(85 + 2 * cos(sine/32))),.1)	
			end
			-- root.RotVelocity.Y
		elseif torvel>2 and torvel<22 and hitfloor~=nil then
			Anim="Walk"
			if Mode == "a" then
				RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(0,rad(90),0)*angles(0,0,0),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(0,0,0),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(0,0,0),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(0,0,0),.1)
				RW.C0=clerp(RW.C0,cf(1.3,1,0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(80)),.1)
				LW.C0=clerp(LW.C0,cf(-1.3,1,0)*angles(rad(0 + 3 * cos(sine/30)),0,rad(-80)),.1)	
				
			elseif Mode == "Moonlight" then
				RH.C0=clerp(RH.C0,cf(1,-1 + .1 * cos(sine/14),0 + .5 * cos(sine/14))*angles(0,rad(90 + 5 * sin(sine/14)),0)*angles(rad(0 + 1.5 * sin(sine/12)),0,rad(0 + 50 * sin(sine/14))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - .1 * cos(sine/14),0 - .5 * cos(sine/14))*angles(0,rad(-90 + 5 * sin(sine/14)),0)*angles(rad(0 - 1.5 * sin(sine/12)),0,rad(0 + 50 * sin(sine/14))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .175* cos(sine / 7))*angles(rad(15),rad(0 + 1.5 * sin(sine/12)),rad(0 - 8 * sin(sine/14))),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(5),rad(0 - 1.5 * sin(sine/12)),rad(0 + 8 * sin(sine/14))),.1)
				RW.C0=clerp(RW.C0,cf(1.1,0-.1 * cos(sine / 28),0)*angles(rad(180),0,rad(120)),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5,0)*angles(rad(0 - 65 * sin(sine/13)),rad(0 + 8 * sin(sine/14)),0),.1)	
				
			else
				
				local s, S = sin, sine
				local S1, S2, S3 = sine/11, sine/5.5, sine/10
				RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(0,rad(90),0)*angles(rad(0 + 1 * s(S1)),rad(0 + 10 * s(S3)),rad(0 + 45 * s(S1))),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(rad(0 - 1 * s(S1)),rad(0 + 10 * s(S3)),rad(0 + 45 * s(S1))),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .15 * s(S2))*angles(rad(8),rad(0 + 1 * s(S1)),rad(0 - 10 * s(S3))),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(6),rad(0 - 1 * s(S1)),rad(0 + 10 * s(S3))),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.5,0)*angles(rad(0 - 45 * s(S3)),rad(0 + 10 * s(S3)),0),.1)
				LW.C0=clerp(LW.C0,cf(-1.5,.5,0)*angles(rad(0 + 45 * s(S3)),rad(0 + 10 * s(S3)),0),.1)			

			end
			
		elseif torvel>=22 and hitfloor~=nil then
			Anim="Run"
			if Mode == 1 or Mode == 3 or Mode == "" or Mode == 80 or Mode == 6 or Mode == "nil" or Mode == 8 or Mode == 55 or Mode == 9 or Mode == 13 or Mode == "Ascend2ElectricBoogaloo" or Mode == 999 or Mode == 4 or Mode == 9999 or Mode == 666 or Mode == 81 or Mode == "Retaliation" or Mode == "Complexity" or Mode == "Abstract" or Mode == "Rem" or Mode == "Betray" or Mode == "Night" then -- Flying
				RH.C0=clerp(RH.C0,cf(1,-.5,-.6)*angles(0,rad(90),0)*angles(rad(1.5),0,rad(-20 - 5 * cos(sine / 34))),.2)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(rad(1),0,rad(20 + 2 * cos(sine / 38))),.2)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - .15 * cos(sine / 47),-.5,2.5 + .25 * cos(sine / 28))*angles(rad(60*Vec.Z),rad(0-30*Vec.X - root.RotVelocity.Y),rad(0 - root.RotVelocity.Y *4.5 + 3 * cos(sine / 47))),.05)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-40*Vec.Z - 5 * cos(sine / 52)),rad(0 - 3 * cos(sine / 37)),rad(0 + 2 * cos(sine / 78))),.2)
				RW.C0=clerp(RW.C0,cf(1.5,.5 + .05 * cos(sine / 28),0)*angles(rad(-8 - 4 * cos(sine / 59)),rad(-20 + 7 * cos(sine / 62)),rad(20 + 5 * cos(sine / 50))),.2)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 + .1 * cos(sine / 28),0)*angles(rad(-8 - 3 * cos(sine / 55)),rad(20 + 8 * cos(sine / 67)),rad(-20 - 4 * cos(sine / 29))),.2)
				
			elseif Mode == 70 then -- Higher Flying
				RH.C0=clerp(RH.C0,cf(1,-.5,-.6)*angles(0,rad(90),0)*angles(rad(1.5),0,rad(-20 - 5 * cos(sine / 34))),.2)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(rad(1),0,rad(20 + 2 * cos(sine / 38))),.2)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - .15 * cos(sine / 47),-.5,12 + .25 * cos(sine / 28))*angles(rad(60*Vec.Z),rad(0-30*Vec.X - root.RotVelocity.Y),rad(0 - root.RotVelocity.Y *4.5 + 3 * cos(sine / 47))),.05)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-40*Vec.Z - 5 * cos(sine / 52)),rad(0 - 3 * cos(sine / 37)),rad(0 + 2 * cos(sine / 78))),.2)
				RW.C0=clerp(RW.C0,cf(1.5,.5 + .05 * cos(sine / 28),0)*angles(rad(-8 - 4 * cos(sine / 59)),rad(-20 + 7 * cos(sine / 62)),rad(20 + 5 * cos(sine / 50))),.2)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 + .1 * cos(sine / 28),0)*angles(rad(-8 - 3 * cos(sine / 55)),rad(20 + 8 * cos(sine / 67)),rad(-20 - 4 * cos(sine / 29))),.2)
				
			elseif Mode == 5 or Mode == 7 or Mode == 10 or Mode == "Musical" or Mode == 60 or Mode == "Frost" then -- Epic run
				local s = sin local S1 = sine/6 local S2 = sine/3 local S3 = sine/5 local S4 = sine/2.5
				RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(rad(0),rad(90),rad(0))*angles(rad(0 + 1 * s(S1)),rad(0 - 2.5 * s(S4)),rad(0 + 75 * s(S3))),.15)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(rad(0),rad(-90),rad(0))*angles(rad(0 - 1 * s(S1)),rad(0 + 2.5 * s(S4)),rad(0 + 75 * s(S3))),.15)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .2 * s(S2))*angles(rad(15),rad(0 + 1 * s(S1)),rad(0 - 15 * s(S3))),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-5),rad(0 - 1.5 * s(S1)),rad(0 + 15 * s(S3))),.1)
				RW.C0=clerp(RW.C0,cf(1.5,.4,0 + .2 * s(S3))*angles(rad(0 - 75 * s(S3)),rad(0 - 15 * s(S4)),rad(0 + 15 * s(S3))),.2)
				LW.C0=clerp(LW.C0,cf(-1.5,.4,0 - .2 * s(S3))*angles(rad(0 + 75 * s(S3)),rad(0 - 15 * s(S4)),rad(0 + 15 * s(S3))),.2)	
				
			elseif Mode == 1080 then -- Hyperactivity run.. this is gonna suck so bad
				local MS = sin local A = .4 local MSine = 4 local HSine = 2 local Sine2 = 3
				RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(0,rad(90),0)*angles(0,0,rad(0 + 75 * MS(sine/MSine))),A)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(0,rad(-90),0)*angles(0,0,rad(0 + 75 * MS(sine/MSine))),A)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + .15 * MS(sine/HSine))*angles(rad(25),0,rad(0 + 10 * MS(sine/MSine))),A)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-15),0,rad(0 - 10 * MS(sine/MSine))),A)
				RW.C0=clerp(RW.C0,cf(1.5,.35,0 + .5 * MS(sine/Sine2))*angles(rad(0 - 125 * MS(sine/Sine2)),rad(0),rad(0)),A)
				LW.C0=clerp(LW.C0,cf(-1.5,.35,0 - .5 * MS(sine/Sine2))*angles(rad(0 + 125 * MS(sine/Sine2)),rad(0),rad(0)),A)
				
			else
				RH.C0=clerp(RH.C0,cf(1,-.5,-.6)*angles(rad(0),rad(90),rad(0))*angles(rad(1.5),rad(0),rad(-20 - 5 * cos(sine / 34))),.2)
				LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(rad(0),rad(-90),rad(0))*angles(rad(1),rad(0),rad(20 + 2 * cos(sine / 38))),.2)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - .15 * cos(sine / 47),-.5,2.5 + .25 * cos(sine / 28))*angles(rad(70),rad(0 - root.RotVelocity.Y),rad(0 - root.RotVelocity.Y *4.5 + 3 * cos(sine / 47))),.05)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(rad(-17 - 5 * cos(sine / 52)),rad(0 - 3 * cos(sine / 37)),rad(0 + 2 * cos(sine / 78))),.2)
				RW.C0=clerp(RW.C0,cf(1.5,.5 + .05 * cos(sine / 28),0)*angles(rad(-8 - 4 * cos(sine / 59)),rad(-20 + 7 * cos(sine / 62)),rad(20 + 5 * cos(sine / 50))),.2)
				LW.C0=clerp(LW.C0,cf(-1.5,.5 + .1 * cos(sine / 28),0)*angles(rad(-8 - 3 * cos(sine / 55)),rad(20 + 8 * cos(sine / 67)),rad(-20 - 4 * cos(sine / 29))),.2)
			end
		end
	end
end))
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	b:Disconnect()
	c:Disconnect()
end)
