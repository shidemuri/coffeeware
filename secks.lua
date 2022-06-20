--_reanimate()
--getgenv().Reanimation = 'Simple'
--loadstring(game:HttpGet('https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/ReanimMain.lua'))()
getgenv()._reanimate()
--[[

    - padero#0001 (made for pendulum hub dm me if you think otherwise)
    - note from coffeeware: pendulum hub premium
    - tescalus (did aligning cuz me lazy xd plus he pog champ)


	HATS REQUIRED:

	https://www.roblox.com/catalog/12548563/Asimov-Outlaw
	https://www.roblox.com/catalog/29532720/Mizaru
	https://www.roblox.com/catalog/20011897/Space-Cop
	https://www.roblox.com/catalog/6211939438/Loose-Black-Anime-Side-Buns
	https://www.roblox.com/catalog/7291817449/Neko-Anime-Head-Black-Eyes-White-Skin
	https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair
	https://www.roblox.com/catalog/451220849/Lavender-Updo
	https://www.roblox.com/catalog/48474313/Red-Roblox-Cap
	https://www.roblox.com/catalog/63690008/Pal-Hair

]]


local folder = game:GetObjects('rbxassetid://9206853840')[1]
-- i might make an instance serializer later
folder.Parent = workspace.non
local Victim = folder.Victim
Victim.Parent = workspace.non

--// stuff from the serversided script \\--
NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end
function newMotor(P0,P1,C0,C1)
	return NewInstance('Weld',P0,{Part0=P0,Part1=P1,C0=C0,C1=C1})
end

folder.NoNoGui.Parent = game:GetService('CoreGui')
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	game:GetService('CoreGui'):FindFirstChild('NoNoGui'):Destroy()
end)

--// Shortcut Variables \\--
local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local CF = {N=CFrame.new,A=CFrame.Angles,fEA=CFrame.fromEulerAnglesXYZ}
local C3 = {tRGB= function(c3) return c3.r*255,c3.g*255,c3.b*255 end,N=Color3.new,RGB=Color3.fromRGB,HSV=Color3.fromHSV,tHSV=Color3.toHSV}
local V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}
local M = {C=math.cos,R=math.rad,S=math.sin,P=math.pi,RNG=math.random,MRS=math.randomseed,H=math.huge,RRNG = function(min,max,div) return math.rad(math.random(min,max)/(div or 1)) end}
local R3 = {N=Region3.new}
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players


local Player = game:GetService('Players').LocalPlayer
local Char = workspace.non
Position = Instance.new("StringValue",Char)
Position.Name  = "Position2"
Position.Value = "Doggy Style"
local Mouse = Player:GetMouse();
local Hum = Char:FindFirstChildOfClass'Humanoid'
local Torso = Char.Torso
local RArm = Char["Right Arm"]
local LArm = Char["Left Arm"]
local RLeg = Char["Right Leg"]
local LLeg = Char["Left Leg"]	
local Root = Char:FindFirstChild'HumanoidRootPart'
local Head = Char.Head
local Sine = 0;
local Change = 1
local Attack=false
local NeutralAnims=true
local timePos=30;
local walking=true;
local legAnims=true;
local Victim = Char:WaitForChild("Victim")
local Position = Char.Position2.Value
local DoggoLoop = false;
local BJLoop = false;
local CowgirlLoop = false;
local GayLoop = false;


local movement = 8
local footsound=0;
local WalkSpeed=16;
local Combo=0;

Char.HumanoidRootPart.Anchored = true

wsasa = newMotor(folder.Position.Weld,Root)
Positionv = folder.Position
Positionv.Parent = Char

NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

local welds = {}

local Head2 = Victim:WaitForChild'Head'
local Torso2 = Victim:WaitForChild'Torso'
local LArm2 = Victim:WaitForChild'Left Arm'
local RArm2 = Victim:WaitForChild'Right Arm'
local LLeg2 = Victim:WaitForChild'Left Leg'
local RLeg2 = Victim:WaitForChild'Right Leg'
local Root2 = Victim:WaitForChild'HumanoidRootPart'

--[[local NK,RJ,RH,RS,LH,LS,NK2,RJ2,RH2,RS2,LH2,LS2=unpack(welds)
NK = {
    ["Part0"] = Char.Torso,
    ["Part1"] = Char.Head
}

RJ = {
    ["Part0"] = Char.HumanoidRootPart,
    ["Part1"] = Char.Torso
}

RS = {
    ["Part0"] = Char.Torso,
    ["Part1"] = Char["Right Arm"]
}

LS = {
    ["Part0"] = Char.Torso,
    ["Part1"] = Char["Left Arm"]
}

RH = {
    ["Part0"] = Char.Torso,
    ["Part1"] = Char["Right Leg"]
}

LH = {
    ["Part0"] = Char.Torso,
    ["Part1"] = Char["Left Leg"]
}]]

wsasa.Part1 = Char.HumanoidRootPart

--[[local NKweld = newMotor(Torso,Head,CF.N(0,1.5,0),CF.N())
local RJweld = newMotor(Root,Torso,CF.N(),CF.N())
local RSweld = newMotor(Torso,RLeg,CF.N(.5,-1,0),CF.N(0,1,0))
local LHweld = newMotor(Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
local RHweld = newMotor(Torso,RArm,CF.N(.5,-1,0),CF.N(0,1,0))
local LHweld = newMotor(Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))]]
local NKweld = newMotor(Torso,Head,CF.N(0,1.5,0),CF.N())
local RJweld = newMotor(Root,Torso,CF.N(),CF.N())
local RHweld = newMotor(Torso,RLeg,CF.N(.5,-1,0),CF.N(0,1,0))
local RSweld = newMotor(Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
local LHweld = newMotor(Torso,LLeg,CF.N(-.5,-1,0),CF.N(0,1,0))
local LSweld = newMotor(Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
local NK2weld = newMotor(Torso2,Head2,CF.N(0,1.5,0),CF.N())
local RJ2weld = newMotor(Root2,Torso2,CF.N(),CF.N())
local RH2weld = newMotor(Torso2,RLeg2,CF.N(.5,-1,0),CF.N(0,1,0))
local RS2weld = newMotor(Torso2,RArm2,CF.N(1.5,.5,0),CF.N(0,.5,0))
local LH2weld = newMotor(Torso2,LLeg2,CF.N(-.5,-1,0),CF.N(0,1,0))
local LS2weld = newMotor(Torso2,LArm2,CF.N(-1.5,.5,0),CF.N(0,.5,0))
NK,RJ,RH,RS,LH,LS,NK2,RJ2,RH2,RS2,LH2,LS2 = NKweld, RJweld, RHweld, RSweld, LHweld, LSweld, NK2weld, RJ2weld, RH2weld, RS2weld, LH2weld, LS2weld
table.insert(welds,NKweld)
table.insert(welds,LHweld)
table.insert(welds,RJweld)
table.insert(welds,RSweld)
table.insert(welds,LSweld)
table.insert(welds,RHweld)

table.insert(welds,NK2weld)
table.insert(welds,LH2weld)
table.insert(welds,RJ2weld)
table.insert(welds,RS2weld)
table.insert(welds,LS2weld)
table.insert(welds,RH2weld)


local NKC0,RJC0,RHC0,RSC0,LHC0,LSC0 = NKweld.C0,RJweld.C0,RHweld.C0,RSweld.C0,LHweld.C0,LSweld.C0

--tf is this shit

--[[if(req.Recievers.sync)then req:DelReciever("sync")end
if(req.Recievers.playMusic)then req:DelReciever("playMusic")end
if(req.Recievers.effect)then req:DelReciever("effect")end
if(req.Recievers.stop)then req:DelReciever("stop")end
if(req.Recievers.ShowDamage)then req:DelReciever("ShowDamage")end]]

function makeMusic(id,pit,timePos)
	local sound = Torso:FindFirstChild(script.Name.."song")
	if(not sound)then 
		sound = NewInstance("Sound",Torso,{Name=script.Name.."song",Volume=5,Pitch=(pit or 1),Looped=true})
		NewInstance("EqualizerSoundEffect",sound,{HighGain=0,MidGain=2,LowGain=30})
	end
	if(id=='stop')then
		if(sound)then
			sound:Stop()
		end
	else
		local timePos = typeof(timePos)=='number' and timePos or sound.TimePosition
		sound.Volume = 5
		sound.Name = script.Name.."song"
		sound.Looped=true
		sound.SoundId = "rbxassetid://"..id
		sound.Pitch=(pit or 1)
		sound:Play()
		sound.TimePosition = timePos
	end
	return sound;
end


function playMusic(id,pitch,timePos)
	return makeMusic(id,pitch,timePos)
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
	v:Stop(0);
end

-- SCRIPT STUFF --
local Frame_Speed = 60 -- The frame speed for swait. 1 is automatically divided by this
--// Artificial HB \\--

local ArtificialHB = script:FindFirstChild'Heartbeat' or IN("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

local tf = 0
local allowframeloss = true
local tossremainder = true
local lastframe = tick()
local frame = 1/Frame_Speed
ArtificialHB:Fire()

local piss = game:GetService("RunService").Stepped:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	ArtificialHB:Destroy()
	piss:Disconnect()
end)

--// Effects \\--


if(workspace:FindFirstChild(script.Name..'Effects'))then
	workspace[script.Name..'Effects']:destroy()
end

local Effects=NewInstance("Folder",Char)
Effects.Name=script.Name..'Effects'


function ShowDamage(Pos, Text, Time, Color)
	local Pos = Pos or V3.N(0, 0, 0)
	local Text = tostring(Text or "")
	local Time = Time or 2
	local Color = Color or C3.N(1, 0, 1)
	local EffectPart = Part(Effects,Color,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),CFrame.new(Pos),true,false)
	EffectPart.Transparency=1
	local BillboardGui = NewInstance("BillboardGui",EffectPart,{
		Size = UDim2.new(3,0,3,0),
		Adornee = EffectPart,
	})
	
	local TextLabel = NewInstance("TextLabel",BillboardGui,{
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		TextColor3 = Color,
		TextScaled = true,
		Font = Enum.Font.ArialBold, 
	})
	S.Debris:AddItem(EffectPart, Time+.5)
	delay(0, function()
		local rot=math.random(-10,10)/15
		local raise=.2
		local Frames = Time/Frame_Speed
		for i=0,1.1,.02 do
			swait()
			TextLabel.Rotation=TextLabel.Rotation+rot
			raise=raise-.008
			EffectPart.Position = EffectPart.Position + Vector3.new(0, raise, 0)
			TextLabel.TextTransparency=i
			TextLabel.TextStrokeTransparency=i
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end


local baseSound = IN("Sound")
function Sound(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = baseSound:Clone()
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or Torso
	return Sound
end
function Part(parent,color,material,size,cframe,anchored,cancollide)
	local part = IN("Part")
	part.Parent = parent or Char
	part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface,part.BottomSurface=10,10
	part.Size = size or V3.N(1,1,1)
	part.CFrame = cframe or CF.N(0,0,0)
	part.CanCollide = cancollide or false
	part.Anchored = anchored or false
	return part
end

function Weld(part0,part1,c0,c1)
	local weld = IN("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or CF.N()
	weld.C1 = c1 or CF.N()
	return weld
end

function Mesh(parent,meshtype,meshid,textid,scale,offset)
	local part = IN("SpecialMesh")
	part.MeshId = meshid or ""
	part.TextureId = textid or ""
	part.Scale = scale or V3.N(1,1,1)
	part.Offset = offset or V3.N(0,0,0)
	part.MeshType = meshtype or Enum.MeshType.Sphere
	part.Parent = parent
	return part
end

function GotEffect(data)
	-- just for easy reference
	local color = data.Color or Color3.new(.7,.7,.7);
	local endcolor = data.EndColor or nil;
	local mat = data.Material or Enum.Material.SmoothPlastic;
	local cframe = data.CFrame or CFrame.new();
	local endpos = data.EndPos or nil;
	local meshdata = data.Mesh or {}
	local sounddata = data.Sound or {}
	local size = data.Size or Vector3.new(1,1,1)
	local endsize = data.EndSize or Vector3.new(6,6,6)
	local rotinc = data.RotInc or {0,0,0} -- ONLY FOR LEGACY SYSTEM
	local transparency = data.Transparency or NumberRange.new(0,1)
	local acceleration = data.Acceleration or nil; -- ONLY FOR LEGACY SYSTEM
	local endrot = data.EndRotation or {0,0,0} -- ONLY FOR EXPERIMENTAL SYSTEM
	local style = data.Style or false; -- ONLY FOR EXPERIMENTAL SYSTEM
	local lifetime = data.Lifetime or 1;
	local system = data.FXSystem;
	local S,PM;
	
	local P = Part(workspace,color,mat,Vector3.new(1,1,1),cframe,true,false)
	
	if(meshdata == "Blast")then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://20329976','',size,Vector3.new(0,0,-size.X/8))
	elseif(meshdata == 'Ring')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://559831844','',size,Vector3.new(0,0,0))
	elseif(meshdata == 'Slash1')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(size.X/10,.001,size.Z/10),Vector3.new(0,0,0))
	elseif(meshdata == 'Slash2')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(size.X/1000,size.Y/100,size.Z/100),Vector3.new(0,0,0))
	elseif(meshdata == 'Tornado1')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://443529437','',size/10,Vector3.new(0,0,0))
	elseif(meshdata == 'Tornado2')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://168892432','',size/4,Vector3.new(0,0,0))
	elseif(meshdata == 'Skull')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://4770583','',size*2,Vector3.new(0,0,0))
	elseif(meshdata == 'Crystal')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://9756362','',size,Vector3.new(0,0,0))
	elseif(meshdata == 'Cloud')then
		PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://1095708','',size,Vector3.new(0,0,0))
	elseif(typeof(meshdata) == 'table')then
		local Type = meshdata.Type or Enum.MeshType.Brick
		local ID = meshdata.ID or '';
		local Tex = meshdata.Texture or '';
		local Offset = meshdata.Offset or Vector3.new(0,0,0)
		PM = Mesh(P,Type,ID,Tex,size,Offset)
	else
		PM = Mesh(P,Enum.MeshType.Brick,'','',size)
	end
	
	local startTrans = typeof(transparency) == 'number' and transparency or typeof(transparency) == 'NumberRange' and transparency.Min or typeof(transparency) == 'table' and transparency[1] or 0
	local endTrans = typeof(transparency) == 'NumberRange' and transparency.Max or typeof(transparency) == 'table' and transparency[2] or 1
	
			
	P.Transparency = startTrans
	local random = Random.new();
	game:service'Debris':AddItem(P,lifetime+3)
	
	
	-- actual effect stuff
	local mult = 1;
	if(PM.MeshId == 'rbxassetid://20329976')then
		PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
	elseif(PM.MeshId == 'rbxassetid://4770583')then
		mult = 2
	elseif(PM.MeshId == 'rbxassetid://168892432')then
		mult = .25
	elseif(PM.MeshId == 'rbxassetid://443529437')then
		mult = .1
	elseif(PM.MeshId == 'rbxassetid://443529437')then
		mult = .1
	end
			
	coroutine.wrap(function()
		if(system == 'Legacy' or system == 1 or system == nil)then
			local frames = (typeof(lifetime) == 'NumberRange' and random:NextNumber(lifetime.Min,lifetime.Max) or typeof(lifetime) == 'number' and lifetime or 1)*Frame_Speed
			for i = 0, frames do
				local div = (i/frames)
				P.Transparency=(startTrans+(endTrans-startTrans)*div)
				
				PM.Scale = size:lerp(endsize*mult,div)
				
				local RotCF=CFrame.Angles(0,0,0)
				
				if(rotinc == 'random')then
					RotCF=CFrame.Angles(math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)))
				elseif(typeof(rotinc) == 'table')then
					RotCF=CFrame.Angles(unpack(rotinc))
				end
				
				if(PM.MeshId == 'rbxassetid://20329976')then
					PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
				end
				
				if(endpos and typeof(endpos) == 'CFrame')then
					P.CFrame=cframe:lerp(endpos,div)*RotCF
				elseif(acceleration and typeof(acceleration) == 'table' and acceleration.Force)then
					local force = acceleration.Force;
					if(typeof(force)=='CFrame')then
						force=force.p;
					end
					if(typeof(force)=='Vector3')then
						if(acceleration.LookAt)then
							P.CFrame=(CFrame.new(P.Position,force)+force)*RotCF
						else
							P.CFrame=(P.CFrame+force)*RotCF
						end
					end
				else
					P.CFrame=P.CFrame*RotCF
				end
				
				if(endcolor and typeof(endcolor) == 'Color3')then
					P.Color = color:lerp(endcolor,div)
				end
				swait()
			end
			P:destroy()
		elseif(system == 'Experimental' or system == 2)then
			local info = TweenInfo.new(lifetime,style,Enum.EasingDirection.InOut,0,false,0)
			local info2 = TweenInfo.new(lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
			if(style == Enum.EasingStyle.Elastic)then
				info = TweenInfo.new(lifetime*2,style,Enum.EasingDirection.Out,0,false,0)
			elseif(style == Enum.EasingStyle.Bounce)then
				info = TweenInfo.new(lifetime,style,Enum.EasingDirection.Out,0,false,0)
			end
			local tweenPart = game:service'TweenService':Create(P,info2,{
				CFrame=(typeof(endpos) == 'CFrame' and endpos or P.CFrame)*CFrame.Angles(unpack(endrot)),
				Color=typeof(endcolor) == 'Color3' and endcolor or color,
				Transparency=endTrans,
			})
			local off = Vector3.new(0,0,0)
			if(PM.MeshId == 'rbxassetid://20329976')then off=Vector3.new(0,0,(endsize*mult).Z/8) end
			
			local tweenMesh = game:service'TweenService':Create(PM,info,{
				Scale=endsize*mult,
				Offset=off,
			})
			tweenPart:Play()
			tweenMesh:Play()
		end
	end)()
end

function Effect(data)
	return GotEffect(data)
end

function Trail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			Effect(data)
			swait()
		end	
	end)()
end
local origin = Char.Victim
local IdentificationID = math.random(-999999, 999999)



function RemovePants(character)
	for i, v in pairs(character:GetDescendants()) do
		if v:IsA("Shirt") then
			v:Destroy()
		end
	end
end

function RemoveShirt(character)
	for i, v in pairs(character:GetDescendants()) do
		if v:IsA("Pants") then
			v:Destroy()
		end
	end
end

function RemovePieces(character)
	for i, v in pairs(character:GetDescendants()) do
		if v:IsA("Clothing") then
			v:Destroy()
		end
	end
end

function ConnectModelToBodyPart(model, character, bodypart)
	local g = model:clone()
	g.Parent = character
	local C = g:GetChildren()
	for i=1, #C do
		if C[i]:IsA("BasePart") then
			local W = Instance.new("Weld")
			W.Part0 = g.Middle
			W.Part1 = C[i]
			local CJ = CFrame.new(g.Middle.Position)
			W.C0 = g.Middle.CFrame:inverse()*CJ
			W.C1 = C[i].CFrame:inverse()*CJ
			W.Parent = g.Middle
		end
			local Y = Instance.new("Weld")
			Y.Part0 = bodypart
			Y.Part1 = g.Middle
			Y.C0 = CFrame.new(0, 0, 0)
			Y.Parent = Y.Part0
	end

	local Clones = g:GetChildren()
	for i, Clone in pairs(Clones) do
		if Clone:IsA("BasePart") then
			Clone.Anchored = false
			Clone.CanCollide = false
			if Clone.Name == "Pow" then
				Clone.Color = bodypart.Color
			end
		end
	end
	
	g.Middle.Transparency = 1
end

function RemoveChange(character)
	if character:FindFirstChild("ChestMesh") then
		character.ChestMesh:Destroy()
	end
	if character:FindFirstChild("LeftArmMesh") then
		character.LeftArmMesh:Destroy()
	end
	if character:FindFirstChild("RightArmMesh") then
		character.RightArmMesh:Destroy()
	end
	if character:FindFirstChild("LeftLegMesh") then
		character.LeftLegMesh:Destroy()
	end
	if character:FindFirstChild("RightLegMesh") then
		character.RightLegMesh:Destroy()
	end
	if character:FindFirstChild("HeadMesh") then
		character.HeadMesh:Destroy()
	end
	character.PlayerHasAChange:Destroy()
end

function ChangeCharacter(character)
	if true then
		RemovePieces(character)
	end
	

	
	--Life debounce
	local ChangeGiven = Instance.new("IntValue")
	ChangeGiven.Name = "PlayerHasAChange"
	ChangeGiven.Value = IdentificationID
	ChangeGiven.Parent = character
	--
	
	--Attach the parts
	if origin:FindFirstChild("ChestMesh") then
		ConnectModelToBodyPart(origin.ChestMesh, character, character["Torso"])
	end
	if origin:FindFirstChild("LeftArmMesh") then
		ConnectModelToBodyPart(origin.LeftArmMesh, character, character["Left Arm"])
	end
	if origin:FindFirstChild("RightArmMesh") then
		ConnectModelToBodyPart(origin.RightArmMesh, character, character["Right Arm"])
	end
	if origin:FindFirstChild("LeftLegMesh") then
		ConnectModelToBodyPart(origin.LeftLegMesh, character, character["Left Leg"])
	end
	if origin:FindFirstChild("RightLegMesh") then
		ConnectModelToBodyPart(origin.RightLegMesh, character, character["Right Leg"])
	end
	if origin:FindFirstChild("HeadMesh") then
		ConnectModelToBodyPart(origin.HeadMesh, character, character["Head"])
	end
	--
end

	
	local character = Victim
	if character == nil then
		return
	end
	
	if character:findFirstChild("Humanoid") ~= nil then
		if character:findFirstChild("PlayerHasAChange") then
			if character.PlayerHasAChange.Value ~= IdentificationID then
				--RemoveChange(character)
	
				--ChangeCharacter(character)

			end
		else
			--ChangeCharacter(character)

		end
	end	

print(NK2.Part0.Parent.Name)
function ClientTrail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			GotEffect(data)
			swait()
		end	
	end)()
end

function syncStuff(data)
	local neut,legwelds,c0s,c1s,sine,mov,walk,inc=unpack(data)
	local head0,torso0,rleg0,rarm0,lleg0,larm0,head02,torso02,rleg02,rarm02,lleg02,larm02=unpack(c0s)
	local head1,torso1,rleg1,rarm1,lleg1,larm1,head12,torso12,rleg12,rarm12,lleg12,larm12=unpack(c1s)
	legAnims=legwelds
	NeutralAnims=neut
	if(not neut)then
		NK.C0=head0
		RJ.C0=torso0
		RH.C0=rleg0
		RS.C0=rarm0
		LH.C0=lleg0
		LS.C0=larm0
		
		NK.C1=head1
		RJ.C1=torso1
		RH.C1=rleg1
		RS.C1=rarm1
		LH.C1=lleg1
		LS.C1=larm1
		
		NK2.C0=head02
		RJ2.C0=torso02
		RH2.C0=rleg02
		RS2.C0=rarm02
		LH2.C0=lleg02
		LS2.C0=larm02
		
		NK2.C1=head12
		RJ2.C1=torso12
		RH2.C1=rleg12
		RS2.C1=rarm12
		LH2.C1=lleg12
		LS2.C1=larm12
	end
	movement=mov
	walking=walk
	Change=inc
	if(Sine-sine>.8 or Sine-sine<-.8)then
		Sine=sine
	end
end

--[[if(req:Pull("sync"))then syncStuff(req:Pull("sync")) end

req:AddReciever("sync",function(syncdata)if(data.User~=data.Local)then syncStuff(syncdata) end end)

req:AddReciever("stop",function()
	script:destroy()
	script.Disabled=false
	error("done")
end)


if data.Local ==  data.User then
Player.PlayerGui:WaitForChild("NoNoGui"):WaitForChild("Fuck").MouseButton1Click:Connect(function()
RequestCharacterChange:FireServer(tostring(Player.PlayerGui:WaitForChild("NoNoGui"):WaitForChild("What").Text))
end)

Player.PlayerGui:WaitForChild("NoNoGui"):WaitForChild("Ass").MouseButton1Click:Connect(function()
PushHostChange:FireServer(tostring(Player.PlayerGui:WaitForChild("NoNoGui"):WaitForChild("What").Text))
end)


end]]

function LoopDoggyStyle()
NeutralAnims = false
legAnims = false
Attack = true
Countt = 1

game:service'UserInputService'.InputBegan:connect(function(io,gpe)
if(gpe)then return end
if(io.KeyCode==Enum.KeyCode.Z )then
DoggoLoop = false
end
end)

repeat
swait()

for i = 0,10 do
swait()
  	local Alpha = .3
  	RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,-0.6)*CF.A(math.rad(10),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.3,0.1,-0.5)*CF.A(math.rad(35),math.rad(0),math.rad(15)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.4,0,-0.5)*CF.A(math.rad(35),math.rad(0),math.rad(-10)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(5),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.9,0)*CF.A(math.rad(-25),math.rad(0),math.rad(0)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,0)*CF.A(math.rad(-25),math.rad(0),math.rad(0)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1.7,-0.5)*CF.A(math.rad(-125),math.rad(0),math.rad(0)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-0.9,1.3,-0.1)*CF.A(math.rad(-170),math.rad(0),math.rad(40)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1,1.5,0)*CF.A(math.rad(-160),math.rad(0),math.rad(-25)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.2,0.7)*CF.A(math.rad(90.3),math.rad(-19.9),math.rad(1.8)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.6,-0.8,-0.1)*CF.A(math.rad(85),math.rad(0),math.rad(-5)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.7,-0.8,-0.1)*CF.A(math.rad(85),math.rad(0),math.rad(5)),Alpha)
end

local Sexo = Sound(Victim:WaitForChild'Torso',3099459397,math.random(1,1.8),1.1,false,nil,true)
Sexo.TimePosition =  4
Countt = Countt + 1

local ScreamsAndMoans = {2440889605,2440891382,2440889869,2440888376}
if Countt == 4 then
Countt = 1
ID = nil
Decision = math.random(1,4)
for i,v in pairs(ScreamsAndMoans) do
if i == Decision then
ID = v
end
end
sse = Sound(Victim.Head,ID,1,1,false,nil,true)
Victim.Head.CustomMouthFrownRoundedTiltedFlip.Texture = "http://www.roblox.com/asset/?id=2661147529"
spawn(function()
repeat
swait()
until sse.Playing == false
Victim.Head.CustomMouthFrownRoundedTiltedFlip.Texture = "http://www.roblox.com/asset/?id=3039452348"
end)
end


for i = 0,10 do
swait()
	local Alpha = .3
  	RJ.C0 = RJ.C0:lerp(CF.N(0,-0.1,-0.7)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.3,0.2,-0.3)*CF.A(math.rad(65),math.rad(0),math.rad(15)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.4,0.2,-0.4)*CF.A(math.rad(65),math.rad(0),math.rad(-10)),Alpha)
  	NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.9,0.1)*CF.A(math.rad(20),math.rad(0),math.rad(0)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0.1)*CF.A(math.rad(20),math.rad(0),math.rad(0)),Alpha)
	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1.7,-0.1)*CF.A(math.rad(-125),math.rad(0),math.rad(0)),Alpha)
	LS2.C0 = LS2.C0:lerp(CF.N(-0.9,1.3,-0.1)*CF.A(math.rad(-170),math.rad(0),math.rad(35)),Alpha)
	RS2.C0 = RS2.C0:lerp(CF.N(1,1.5,0)*CF.A(math.rad(-160),math.rad(0),math.rad(-20)),Alpha)
	NK2.C0 =NK2.C0:lerp(CF.N(0,1.2,0.7)*CF.A(math.rad(85),math.rad(-20),math.rad(0)),Alpha)
	LH2.C0 = LH2.C0:lerp(CF.N(-0.6,-0.8,0)*CF.A(math.rad(110),math.rad(0),math.rad(-5)),Alpha)
	RH2.C0 = RH2.C0:lerp(CF.N(0.7,-0.9,0)*CF.A(math.rad(110),math.rad(0),math.rad(5)),Alpha)	
end

until DoggoLoop == false

Attack = false
legAnims = true
NeutralAnims = true
end


function LoopBlowJob()
NeutralAnims = false
legAnims = false
Attack = true
Countt = 1

game:service'UserInputService'.InputBegan:connect(function(io,gpe)
if(gpe)then return end
if(io.KeyCode==Enum.KeyCode.Z)then
BJLoop = false
end
end)

repeat
swait()

for i = 0,20 do
swait()
  	local Alpha = .1
  	RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4,-0.4)*CF.A(math.rad(70.3),math.rad(-1.7),math.rad(19.9)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.4,0.4,-0.4)*CF.A(math.rad(65.6),math.rad(3.4),math.rad(-19.7)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(math.rad(0),math.rad(10),math.rad(0)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1.1,0)*CF.A(math.rad(-160),math.rad(0),math.rad(-180)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-1.3,0.8,-0.2)*CF.A(math.rad(114.4),math.rad(5.1),math.rad(14.1)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1.3,0.8,-0.3)*CF.A(math.rad(118.7),math.rad(-8.3),math.rad(-18.3)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.5,-1.1,-1)*CF.A(math.rad(-70),math.rad(0),math.rad(-10)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.5,-1.1,-1)*CF.A(math.rad(-70),math.rad(0),math.rad(10)),Alpha)
end

local Sexo = Sound(Victim.Torso,2767339245,math.random(1,2),1.1,false,nil,true)
Sexo.TimePosition =  8.4

for i = 0,20 do
swait()
	local Alpha = .1
  	RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.4,0.3,-0.5)*CF.A(math.rad(55.3),math.rad(-1.7),math.rad(19.9)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.4,0.3,-0.5)*CF.A(math.rad(50.6),math.rad(3.4),math.rad(-19.7)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.1)*CF.A(math.rad(-25),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(math.rad(0),math.rad(10),math.rad(0)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1.2,0.1)*CF.A(math.rad(-150),math.rad(0),math.rad(-180)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-1.3,0.4,0)*CF.A(math.rad(119.4),math.rad(5.1),math.rad(14.1)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1.3,0.4,0)*CF.A(math.rad(123.7),math.rad(-8.3),math.rad(-18.3)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.5,-0.8,-1.1)*CF.A(math.rad(-60),math.rad(0),math.rad(-10)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.5,-0.8,-1.1)*CF.A(math.rad(-60),math.rad(0),math.rad(10)),Alpha)
end

until BJLoop == false

Attack = false
legAnims = true
NeutralAnims = true
end


function LoopCowGirl()
NeutralAnims = false
legAnims = false
Attack = true
Countt = 1

game:service'UserInputService'.InputBegan:connect(function(io,gpe)
if(gpe)then return end
if(io.KeyCode==Enum.KeyCode.Z )then
CowgirlLoop = false
end
end)

repeat
swait()

for i = 0,10 do
swait()
  	local Alpha = .3
  	RJ.C0 = RJ.C0:lerp(CF.N(0,-2.2,-0.1)*CF.A(math.rad(70),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-0.8,0.6,0.5)*CF.A(math.rad(-162.9),math.rad(0),math.rad(45.2)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.2,0.6,0.6)*CF.A(math.rad(14.9),math.rad(-1.3),math.rad(-164.8)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-5),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,-0.1)*CF.A(math.rad(15),math.rad(0),math.rad(-10)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.1)*CF.A(math.rad(15),math.rad(0),math.rad(5)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-0.7,0.8)*CF.A(math.rad(-5),math.rad(0),math.rad(0)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-1.3,-0.1,0)*CF.A(math.rad(-15),math.rad(0),math.rad(10)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1.3,-0.1,0)*CF.A(math.rad(-15),math.rad(0),math.rad(-10)),Alpha)
  	NK2.C0:lerp(CF.N(0,1.5,-0.3)*CF.A(math.rad(-15),math.rad(0),math.rad(0)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.7,-0.4,-0.8)*CF.A(math.rad(20),math.rad(0),math.rad(-10)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.6,-0.5,-0.8)*CF.A(math.rad(20),math.rad(0),math.rad(10)),Alpha)
end

local Sexo = Sound(Victim:WaitForChild'Torso',3099459397,math.random(1,1.8),1.1,false,nil,true)
Sexo.TimePosition =  4
Countt = Countt + 1

local ScreamsAndMoans = {2440889605,2440891382,2440889869,2440888376}
if Countt == 4 then
Countt = 1
ID = nil
Decision = math.random(1,4)
for i,v in pairs(ScreamsAndMoans) do
if i == Decision then
ID = v
end
end
sse = Sound(Victim.Head,ID,1,1,false,nil,true)
Victim.Head.CustomMouthFrownRoundedTiltedFlip.Texture = "http://www.roblox.com/asset/?id=2661147529"
spawn(function()
repeat
swait()
until sse.Playing == false
Victim.Head.CustomMouthFrownRoundedTiltedFlip.Texture = "http://www.roblox.com/asset/?id=3039452348"
end)
end


for i = 0,10 do
swait()
	local Alpha = .3
  	RJ.C0 = RJ.C0:lerp(CF.N(0,-2.3,-0.1)*CF.A(math.rad(70),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-0.8,0.6,0.4)*CF.A(math.rad(-162.9),math.rad(0),math.rad(45.2)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.2,0.6,0.5)*CF.A(math.rad(14.9),math.rad(-1.3),math.rad(-164.8)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,-0.1)*CF.A(math.rad(20),math.rad(0),math.rad(-10)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.1)*CF.A(math.rad(20),math.rad(0),math.rad(5)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1,0.8)*CF.A(math.rad(-5),math.rad(0),math.rad(0)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-1.3,0.2,0.1)*CF.A(math.rad(-30),math.rad(0),math.rad(10)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1.3,0.2,0.1)*CF.A(math.rad(-30),math.rad(0),math.rad(-10)),Alpha)
  	NK2.C0:lerp(CF.N(-0.1,1.6,-0.3)*CF.A(math.rad(-30),math.rad(0),math.rad(0)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.7,-0.2,-0.6)*CF.A(math.rad(30),math.rad(0),math.rad(-10)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.6,-0.2,-0.6)*CF.A(math.rad(30),math.rad(0),math.rad(10)),Alpha)
end

until CowgirlLoop == false

Attack = false
legAnims = true
NeutralAnims = true
end


function LoopGay()
NeutralAnims = false
legAnims = false
Attack = true
Countt = 1

game:service'UserInputService'.InputBegan:connect(function(io,gpe)
if(gpe)then return end
if(io.KeyCode==Enum.KeyCode.Z )then
GayLoop = false
end
end)

repeat
swait()

for i = 0,10 do
swait()
	local Alpha = .3
  	RJ.C0 = RJ.C0:lerp(CF.N(0,0,-1.3)*CF.A(math.rad(15),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.2,0.1,-0.5)*CF.A(math.rad(40),math.rad(0),math.rad(25)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.3,0.1,-0.4)*CF.A(math.rad(50),math.rad(0),math.rad(-25)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0.1)*CF.A(math.rad(-35),math.rad(0),math.rad(-5)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.6,-1,0.1)*CF.A(math.rad(-35),math.rad(0),math.rad(5)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-2,-0.8)*CF.A(math.rad(0),math.rad(-89.8),math.rad(90)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-0.8,1.2,0.1)*CF.A(math.rad(85),math.rad(0.9),math.rad(-4.9)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(0.1,0.5,-0.8)*CF.A(math.rad(116.2),math.rad(3.2),math.rad(-39.9)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(math.rad(-10.3),math.rad(-14.8),math.rad(-2.7)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.6,-0.9,-0.1)*CF.A(math.rad(15),math.rad(0),math.rad(0)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.8,-0.8,0)*CF.A(math.rad(-12.4),math.rad(8.5),math.rad(85.9)),Alpha)
end

local Sexo = Sound(Victim.Torso,3099459397,math.random(1,1.8),1.1,false,nil,true)
Sexo.TimePosition =  4
Countt = Countt + 1


local ScreamsAndMoans = {2440889605,2440891382,2440889869,2440888376}
if Countt == 4 then
Countt = 1
ID = nil
Decision = math.random(1,4)
for i,v in pairs(ScreamsAndMoans) do
if i == Decision then
ID = v
end
end
sse = Sound(Victim.Head,ID,1,1,false,nil,true)
Victim.Head.CustomMouthFrownRoundedTiltedFlip.Texture = "http://www.roblox.com/asset/?id=2661147529"
spawn(function()
repeat
swait()
until sse.Playing == false
Victim.Head.CustomMouthFrownRoundedTiltedFlip.Texture = "http://www.roblox.com/asset/?id=3039452348"
end)
end

for i = 0,10 do
swait()
	local Alpha = .3
  	RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.8)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.2,0.3,-0.6)*CF.A(math.rad(55),math.rad(0),math.rad(25)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.3,0.2,-0.5)*CF.A(math.rad(65),math.rad(0),math.rad(-25)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(-5)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.6,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(5)),Alpha)
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-2,-1.5)*CF.A(math.rad(0),math.rad(-89.8),math.rad(90)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-0.8,1.1,0.1)*CF.A(math.rad(95),math.rad(0),math.rad(-5)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(0.1,0.4,-0.8)*CF.A(math.rad(120),math.rad(0),math.rad(-40)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(math.rad(-10.3),math.rad(-14.8),math.rad(-2.7)),Alpha)
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.6,-0.9,-0.1)*CF.A(math.rad(15),math.rad(0),math.rad(0)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.9,-0.9,0)*CF.A(math.rad(-12.4),math.rad(8.5),math.rad(55.9)),Alpha)
end

until GayLoop == false

Attack = false
legAnims = true
NeutralAnims = true
end


local asdasd = game:service'UserInputService'.InputBegan:connect(function(io,gpe)
	if(gpe or Attack)then return end
	
	if(io.KeyCode==Enum.KeyCode.Z and Attack == false and Position == "Doggy Style")then
		DoggoLoop = true
		LoopDoggyStyle()
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and Position == "Blowjob")then
		BJLoop = true
		LoopBlowJob()
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and Position == "Cowgirl")then
		CowgirlLoop = true
		LoopCowGirl()
	elseif(io.KeyCode==Enum.KeyCode.Z and Attack == false and Position == "FuckMeSidewaysAndCallMeGay")then
		GayLoop = true
		LoopGay()
	end
	
	if(io.KeyCode==Enum.KeyCode.One and Attack == false and Position ~= "Doggy Style")then
		Char.Position2.Value = ("Doggy Style")
	elseif(io.KeyCode==Enum.KeyCode.Two and Attack == false and Position ~= "Blowjob")then
		Char.Position2.Value = ("Blowjob")
	elseif(io.KeyCode==Enum.KeyCode.Three and Attack == false and Position ~= "Cowgirl")then
		Char.Position2.Value = ("Cowgirl")
	elseif(io.KeyCode==Enum.KeyCode.Four and Attack == false and Position ~= "FuckMeSidewaysAndCallMeGay")then
		Char.Position2.Value = ("FuckMeSidewaysAndCallMeGay")
	end

end)

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	asdasd:Disconnect()
end)
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["SeeMonkey"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = Torso2 -- What your welding the hat to (has to be a BasePart)
Torso2.Transparency = 1
Weld.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["SeeMonkey"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["SeeMonkey"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["Pal Hair"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = LArm2 -- What your welding the hat to (has to be a BasePart)
LArm2.Transparency = 1
Weld.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["Pal Hair"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["Pal Hair"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["LavanderHair"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = RArm2 -- What your welding the hat to (has to be a BasePart)
RArm2.Transparency = 1
Weld.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["LavanderHair"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["LavanderHair"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["Robloxclassicred"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = LLeg2 -- What your welding the hat to (has to be a BasePart)
LLeg2.Transparency = 1
Weld.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["Robloxclassicred"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["Robloxclassicred"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["Pink Hair"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = RLeg2 -- What your welding the hat to (has to be a BasePart)
RLeg2.Transparency = 1
Weld.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["Pink Hair"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["Pink Hair"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()

local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["Space Cop"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = Torso2 -- What your welding the hat to (has to be a BasePart)
RLeg2.Transparency = 1
Weld.C0 = CFrame.new(-.5,-1,.5)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["Space Cop"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["Space Cop"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["SpaceHelmetB"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = Torso2 -- What your welding the hat to (has to be a BasePart)
RLeg2.Transparency = 1
Weld.C0 = CFrame.new(.5,-1,.5)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)) -- Offset & Angles
local hat1 = game:GetService("Workspace").non[game.Players.LocalPlayer.Name]["SpaceHelmetB"].Handle:FindFirstChildOfClass("SpecialMesh")
game:GetService('Workspace').non["SpaceHelmetB"].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
hat1:Destroy()

local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["Neko Idol Anime Head"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = Head2 -- What your welding the hat to (has to be a BasePart)
Head2.Transparency = 1
Weld.C0 = CFrame.new(0, 0, 0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)) -- Offset & Angles

local plr = game.Players.LocalPlayer
local chr = plr.Character
local hat2 = chr["LooseSideBuns"].Handle -- The hat you choose
hat2:BreakJoints()
local Weld = Instance.new("Weld", game.Players.LocalPlayer.Character)
-- Tips for past John (Tescalus)

Weld.Part1 = hat2 -- (Hat)
Weld.Part0 = Head2 -- What your welding the hat to (has to be a BasePart)
Weld.C0 = CFrame.new(0, -.65, .21)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)) -- Offset & Angles
game:GetService("Workspace").non.Victim.Head.LongHairHeadBandBrown:Destroy()

local footstepSounds = {
	[Enum.Material.Grass]=510933218;
	[Enum.Material.Metal]=1263161138;
	[Enum.Material.CorrodedMetal]=1263161138;
	[Enum.Material.DiamondPlate]=1263161138;
	[Enum.Material.Wood]=2452053757;
	[Enum.Material.WoodPlanks]=2452053757;
	[Enum.Material.Sand]=134456884;
	[Enum.Material.Snow]=2452051182;
}

local a = game['Run Service'].Heartbeat:Connect(function()
	Victim.HumanoidRootPart.CFrame = Char:WaitForChild("Position",60).NewTorsoPos.CFrame
	Sine=Sine+Change
	Position = Char.Position2.Value
	local hitfloor,posfloor = workspace:FindPartOnRayWithIgnoreList(Ray.new(Root.CFrame.p,((CFrame.new(Root.Position,Root.Position - Vector3.new(0,1,0))).lookVector).unit * (4)), {Effects,Char})
	local Walking = (math.abs(Root.Velocity.x) > 1 or math.abs(Root.Velocity.z) > 1)
	local State = (Hum.PlatformStand and 'Paralyzed' or Hum.Sit and 'Sit' or not hitfloor and Root.Velocity.y < -1 and "Fall" or not hitfloor and Root.Velocity.y > 1 and "Jump" or hitfloor and Walking and "Walk" or hitfloor and "Idle")
	Hum.WalkSpeed = WalkSpeed
	local sidevec = math.clamp((Root.Velocity*Root.CFrame.rightVector).X+(Root.Velocity*Root.CFrame.rightVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local forwardvec =  math.clamp((Root.Velocity*Root.CFrame.lookVector).X+(Root.Velocity*Root.CFrame.lookVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local sidevelocity = sidevec/Hum.WalkSpeed
	local forwardvelocity = forwardvec/Hum.WalkSpeed
	
	local lhit,lpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(LLeg.CFrame.p,((CFrame.new(LLeg.Position,LLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char})
	local rhit,rpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(RLeg.CFrame.p,((CFrame.new(RLeg.Position,RLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char})
	

	if Position == "Doggy Style" then
		local Alpha = .3
		Change = 1
 if(NeutralAnims)then
  	RJ.C0 = RJ.C0:lerp(CF.N(0,-0.1,-0.7)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.3,0.2,-0.3)*CF.A(math.rad(65),math.rad(0),math.rad(15)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.4,0.2,-0.4)*CF.A(math.rad(65),math.rad(0),math.rad(-10)),Alpha)
  	NK.C0 =NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(-10),math.rad(0),math.rad(0)),Alpha)
  end

  if(legAnims)then
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.9,0.1)*CF.A(math.rad(20),math.rad(0),math.rad(0)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0.1)*CF.A(math.rad(20),math.rad(0),math.rad(0)),Alpha)
  end

	if(NeutralAnims)then
	  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1.7,-0.1)*CF.A(math.rad(-125),math.rad(0),math.rad(0)),Alpha)
	  	LS2.C0 = LS2.C0:lerp(CF.N(-0.9,1.3,-0.1)*CF.A(math.rad(-170),math.rad(0),math.rad(35)),Alpha)
	  	RS2.C0 = RS2.C0:lerp(CF.N(1,1.5,0)*CF.A(math.rad(-160),math.rad(0),math.rad(-20)),Alpha)
	  	NK2.C0 =NK2.C0:lerp(CF.N(0,1.2,0.7)*CF.A(math.rad(85),math.rad(-20),math.rad(0)),Alpha)
	end
		
	if(legAnims)then
	  	LH2.C0 = LH2.C0:lerp(CF.N(-0.6,-0.8,0)*CF.A(math.rad(110),math.rad(0),math.rad(-5)),Alpha)
	  	RH2.C0 = RH2.C0:lerp(CF.N(0.7,-0.9,0)*CF.A(math.rad(110),math.rad(0),math.rad(5)),Alpha)	
	end
	
	elseif Position == "Blowjob" then
  	local Alpha = .3
  if(NeutralAnims)then
  	RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4,-0.4)*CF.A(math.rad(70.3),math.rad(-1.7),math.rad(19.9)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.4,0.4,-0.4)*CF.A(math.rad(65.6),math.rad(3.4),math.rad(-19.7)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  end
  if(legAnims)then
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(math.rad(0),math.rad(10),math.rad(0)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  end

  if(NeutralAnims)then
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1.1,0)*CF.A(math.rad(-160),math.rad(0),math.rad(-180)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-1.4,0.4,-0.4)*CF.A(math.rad(70.3),math.rad(-1.7),math.rad(19.9)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1.4,0.4,-0.4)*CF.A(math.rad(65.6),math.rad(3.4),math.rad(-19.7)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  end
  if(legAnims)then
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.5,-1.1,-1)*CF.A(math.rad(-70),math.rad(0),math.rad(-10)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.5,-1.1,-1)*CF.A(math.rad(-70),math.rad(0),math.rad(10)),Alpha)
  end
	elseif Position == "Cowgirl" then
  	local Alpha = .3
  if(NeutralAnims)then
  	RJ.C0 = RJ.C0:lerp(CF.N(0,-2.3,-0.1)*CF.A(math.rad(70),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-0.8,0.6,0.4)*CF.A(math.rad(-162.9),math.rad(0),math.rad(45.2)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.2,0.6,0.5)*CF.A(math.rad(14.9),math.rad(-1.3),math.rad(-164.8)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  end
  if(legAnims)then
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,-0.1)*CF.A(math.rad(20),math.rad(0),math.rad(-10)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.5,-1,-0.1)*CF.A(math.rad(20),math.rad(0),math.rad(5)),Alpha)
  end

  if(NeutralAnims)then
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-1,0.8)*CF.A(math.rad(-5),math.rad(0),math.rad(0)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-1.3,0.2,0.1)*CF.A(math.rad(-30),math.rad(0),math.rad(10)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(1.3,0.2,0.1)*CF.A(math.rad(-30),math.rad(0),math.rad(-10)),Alpha)
	NK2.C0 = NK2.C0:lerp(CF.N(-0.1,1.6,-0.3)*CF.A(math.rad(-30),math.rad(0),math.rad(0)),Alpha)
  end
  if(legAnims)then
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.7,-0.2,-0.6)*CF.A(math.rad(30),math.rad(0),math.rad(-10)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.6,-0.2,-0.6)*CF.A(math.rad(30),math.rad(0),math.rad(10)),Alpha)
  end
	elseif Position == "FuckMeSidewaysAndCallMeGay" then
    	local Alpha = .3
  if(NeutralAnims)then
  	RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.8)*CF.A(math.rad(0),math.rad(0),math.rad(0)),Alpha)
  	LS.C0 = LS.C0:lerp(CF.N(-1.2,0.3,-0.6)*CF.A(math.rad(55),math.rad(0),math.rad(25)),Alpha)
  	RS.C0 = RS.C0:lerp(CF.N(1.3,0.2,-0.5)*CF.A(math.rad(65),math.rad(0),math.rad(-25)),Alpha)
  	NK.C0 = NK.C0:lerp(CF.N(0,1.5,-0.1)*CF.A(math.rad(-20),math.rad(0),math.rad(0)),Alpha)
  end
  if(legAnims)then
  	LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(-5)),Alpha)
  	RH.C0 = RH.C0:lerp(CF.N(0.6,-1,0)*CF.A(math.rad(0),math.rad(0),math.rad(5)),Alpha)
  end

  if(NeutralAnims)then
  	RJ2.C0 = RJ2.C0:lerp(CF.N(0,-2,-1.5)*CF.A(math.rad(0),math.rad(-89.8),math.rad(90)),Alpha)
  	LS2.C0 = LS2.C0:lerp(CF.N(-0.8,1.1,0.1)*CF.A(math.rad(95),math.rad(0),math.rad(-5)),Alpha)
  	RS2.C0 = RS2.C0:lerp(CF.N(0.1,0.4,-0.8)*CF.A(math.rad(120),math.rad(0),math.rad(-40)),Alpha)
  	NK2.C0 = NK2.C0:lerp(CF.N(0,1.5,-0.2)*CF.A(math.rad(-10.3),math.rad(-14.8),math.rad(-2.7)),Alpha)
  end
  if(legAnims)then
  	LH2.C0 = LH2.C0:lerp(CF.N(-0.6,-0.9,-0.1)*CF.A(math.rad(15),math.rad(0),math.rad(0)),Alpha)
  	RH2.C0 = RH2.C0:lerp(CF.N(0.9,-0.9,0)*CF.A(math.rad(-12.4),math.rad(8.5),math.rad(55.9)),Alpha)
  end
		

		end

		
	--[[if(data.User==data.Local)then
		local syncStuff={
			NeutralAnims;
			legAnims;
			{NK.C0,RJ.C0,RH.C0,RS.C0,LH.C0,LS.C0,NK2.C0,RJ2.C0,RH2.C0,RS2.C0,LH2.C0,LS2.C0};
			{NK.C1,RJ.C1,RH.C1,RS.C1,LH.C1,LS.C1,NK2.C1,RJ2.C1,RH2.C1,RS2.C1,LH2.C1,LS2.C1};
			Sine;
			movement;
			walking;	
			Change
			--// OPTIONAL SYNC \\--
		}
		req:Push("SetVariableAndBroadcast","sync",syncStuff)
	end	]]
end)

game.Players.LocalPlayer.Character.Humanoid.Died:connect(function()
	a:Disconnect()
end)
