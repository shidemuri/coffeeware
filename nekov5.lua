getgenv()._reanimate()
local folder = game:GetObjects('rbxassetid://10107385072')[1]
folder.Parent = workspace.non

local falsechar = folder:FindFirstChild('DefaultCharacter6')
falsechar:SetPrimaryPartCFrame(workspace.non.HumanoidRootPart.CFrame)
local limbs = {"Head","Torso","Left Leg","Right Leg","Left Arm","Right Arm"}
for _,v in ipairs(workspace.non:GetChildren()) do if v.Name == 'CharacterMesh' then v:Destroy() end end
workspace.non.Head:FindFirstChildOfClass('Decal').Transparency = 1
getgenv().RealRig.Head:FindFirstChildOfClass('Decal').Transparency=1
for _,v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do if v:IsA('Accessory') then v.Handle.Transparency = 1 end end
for _,v in ipairs(getgenv().RealRig:GetChildren()) do if v:IsA('BasePart') then v.Transparency = 1 end end
for _,v in ipairs(falsechar:GetChildren()) do
    print(v.Name, table.find(limbs, v.Name))
    if table.find(limbs, v.Name) then
        for _,t in ipairs(v:GetChildren()) do
            if v.Name == 'Head' then
                for _,c in ipairs(v:GetChildren()) do
                    if c.Name == 'BTWeld' then
                        c.Part0 = workspace.non.Head
                    end
                end
            end
            if v.Name == 'Left Arm' then
                for _,c in ipairs(v['Left Arm']:GetChildren()) do
                    if c.Name == 'BTWeld' and c.Part1.Name == 'Left Arm' then
                        c.Part1 = workspace.non['Left Arm']
                    end
                end
            end
            if v.Name == 'Right Arm' then
                v:FindFirstChild('Right Arm'):FindFirstChild('BTWeld').Part0 = workspace.non['Right Arm']
            end
            if v.Name == 'Left Leg' then
                v.BTWeld.Part0 = workspace.non['Left Leg']
            end
            if v.Name == 'Right Leg' then
                v.BTWeld.Part0 = workspace.non['Right Leg']
            end
            if v.Name == 'Torso' then
                v.BTWeld.Part0 = workspace.non['Torso']
                if v:FindFirstChild('Torso') then
                    for _,c in ipairs(v.Torso.Butt['Right Butt']:GetChildren()) do
                        if c.Part1.Name == 'Torso' then c.Part1 = workspace.non['Torso'] end
                    end
                end
            end
            
            if not t:IsA('Motor6D') and not t:IsA('Attachment') then t.Parent = workspace.non[v.Name] end
        end
    end
end
--folder.explos.Parent = workspace.non
--local fakehef = folder:FindFirstChild('fakehef')
--fakehef.Parent = workspace.non

local rarmweld = Instance.new('Weld', workspace.non['Right Arm']['Right Arm'])
rarmweld.Part0 = workspace.non['Right Arm']['Right Arm']
rarmweld.Part1 = workspace.non['Right Arm']
rarmweld.C0 = CFrame.new(0,0,0)
rarmweld.Name = 'BTWeld'

falsechar.HumanoidRootPart:Destroy()














---------------------------
--/                     \--
-- Script By: 123jl123	 --
--\                     /--
---------------------------
--local remote = NS ([=[

local TweenService = game:GetService("TweenService")
local RbxUtility = loadstring(game:HttpGet('https://raw.githubusercontent.com/Roblox/Core-Scripts/master/CoreScriptsRoot/Libraries/RbxUtility.lua'))()
local Create = RbxUtility.Create



local Player = game.Players.LocalPlayer


ZTfade=false 
ZT=false

EffectPack = folder.Extras:Clone()
folder.Extras:Destroy()
local agresive = false
Target = Vector3.new()
Character= Player.Character
Torso = Character.Torso
Head = Character.Head
Humanoid = Character.Humanoid
LeftArm = Character["Left Arm"]
LeftLeg = Character["Left Leg"]
RightArm = Character["Right Arm"]
RightLeg = Character["Right Leg"]
RootPart = Character["HumanoidRootPart"]
local Anim="Idle"
local inairvel=0
local WalkAnimStep = 0
local sine = 0
local change = 1
Animstep = 0
WalkAnimMove=0.05
Combo = 0
local attack=false
local RJ = Character.HumanoidRootPart:FindFirstChild("RootJoint")
local Neck = Character.Torso:FindFirstChild("Neck")
local MAINRUINCOLOR = BrickColor.new("Lily white")

local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14) 
local NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)


local forWFB = 0
local forWRL = 0


Effects=Instance.new("Folder",Character)
Effects.Name="Effects"
it=Instance.new
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
local cn = CFrame.new
mr=math.rad
mememode=false
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

local lastid= "http://www.roblox.com/asset/?id=876316256"
local s2=it("Sound",Character)
local CurId = 1
s2.EmitterSize = 30
local s2c=s2:Clone()

playsong = true

s2.SoundId = lastid
	if playsong == true then
	s2:play()		
	elseif playsong == false then
	s2:stop()			
	end
lastsongpos= 0

crosshair = Instance.new("BillboardGui",Character)
crosshair.Size = UDim2.new(10,0,10,0)
crosshair.Enabled = false
imgl = Instance.new("ImageLabel",crosshair)
imgl.Position = UDim2.new(0,0,0,0)
imgl.Size = UDim2.new(1,0,1,0)
imgl.Image = "rbxassetid://578065407"
imgl.BackgroundTransparency = 1
imgl.ImageTransparency = .7
imgl.ImageColor3 = Color3.new(1,1,1)
	crosshair.StudsOffset = Vector3.new(0,0,-1)

--//=================================\\
--||          LOCAL IDS
--\\=================================//

local GROWL = 1544355717
local ROAR = 528589382
local ECHOBLAST = 376976397
local CAST = 459523898
local ALCHEMY = 424195979
local BUILDUP = 698824317
local BIGBUILDUP = 874376217
local IMPACT = 231917744
local LARGE_EXPLOSION = 168513088
local TURNUP = 299058146

if Character:FindFirstChild("Animate")then
	Character.Animate:Destroy()
end

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end


	

	CFuncs = {
Part = {Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	
	local Part = Create("Part")({Parent = Parent, Reflectance = Reflectance, Transparency = Transparency, CanCollide = false, Locked = true, BrickColor = BrickColor.new(tostring(BColor)), Name = Name, Size = Size, Material = Material})
	RemoveOutlines(Part)
	return Part
end
}
, 
Mesh = {Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
}
, 
Mesh = {Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
}
, 
Weld = {Create = function(Parent, Part0, Part1, C0, C1)
	
	local Weld = Create("Weld")({Parent = Parent, Part0 = Part0, Part1 = Part1, C0 = C0, C1 = C1})
	return Weld
end
}
, 
Sound = {Create = function(id, par, vol, pit)
	
	coroutine.resume(coroutine.create(function()
		
		local S = Create("Sound")({Volume = vol, Pitch = pit or 1, SoundId  = "http://www.roblox.com/asset/?id="..id, Parent = par or workspace})
		wait()
		S:play()
		game:GetService("Debris"):AddItem(S, 6)
	end
))
end
}
, 
ParticleEmitter = {Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
	
	local fp = Create("ParticleEmitter")({Parent = Parent, Color = ColorSequence.new(Color1, Color2), LightEmission = LightEmission, Size = Size, Texture = Texture, Transparency = Transparency, ZOffset = ZOffset, Acceleration = Accel, Drag = Drag, LockedToPart = LockedToPart, VelocityInheritance = VelocityInheritance, EmissionDirection = EmissionDirection, Enabled = Enabled, Lifetime = LifeTime, Rate = Rate, Rotation = Rotation, RotSpeed = RotSpeed, Speed = Speed, VelocitySpread = VelocitySpread})
	return fp
end
}
}











	coroutine.resume(coroutine.create(function() wait(.5)
	
local	outfit = EffectPack.Outfit:Clone()
	
	for i, v in pairs(outfit:GetChildren()) do
		if v:IsA("Shirt") or v:IsA("Pants")or v:IsA("BodyColors")or v:IsA("CharacterMesh") then
			v.Parent = Character
		end
		local blush = Instance.new("Decal",Head)
blush.Texture = "rbxassetid://898404027"
blush.Face = "Front"
CFuncs["Sound"].Create("rbxassetid://294861193", Character, 9,1)
			if v:IsA("BasePart")  then
				local at1 = v:FindFirstChildOfClass("Attachment")
				local at2 = nil
for i, v2 in pairs(Character:GetDescendants()) do
	
if v2:IsA("Attachment") and v2.Name == at1.Name and v2.Parent.Parent == Character  then
	at2 = v2
end
	
end		

v.Parent = at2.Parent 
local Weldhat = weld(v,at2.Parent,v,CF())
Weldhat.C0 = CF(at2.Position)*ANGLES(mr(at2.Orientation.x),mr(at2.Orientation.y),mr(at2.Orientation.z))
Weldhat.C1 = CF(at1.Position)*ANGLES(mr(at1.Orientation.x),mr(at1.Orientation.y),mr(at1.Orientation.z))
end	
	end	
	
end))
--//=================================\\
--|| SAZERENOS ARTIFICIAL HEARTBEAT
--\\=================================//
Frame_Speed = 1 / 30
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

local hbcon = game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
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
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()hbcon:Disconnect()end)
--//=================================\\
--\\=================================//

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

---------------
--[Functions]--
---------------
so = function(id, par, vol, pit)

CFuncs.Sound.Create(id, par, vol, pit)


end

function weld(parent,part0,part1,c0)
local weld=it("Weld") 
weld.Parent=parent
weld.Part0=part0 
weld.Part1=part1 
weld.C0=c0
return weld
end

rayCast = function(Pos, Dir, Max, Ignore)
  
  return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end

function SetTween(SPart,CFr,MoveStyle2,outorin2,AnimTime)
local MoveStyle = Enum.EasingStyle[MoveStyle2]
local outorin = Enum.EasingDirection[outorin2]


local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end

if SPart.Name=="Bullet" then
dahspeed=1	
end

local tweeningInformation = TweenInfo.new(
	AnimTime/dahspeed,	
	MoveStyle,
	outorin,
	0,
	false,
	0
)
local MoveCF = CFr
local tweenanim = TweenService:Create(SPart,tweeningInformation,MoveCF)
tweenanim:Play()
end

function GatherAllInstances(Parent,ig)
	local Instances = {}
	local Ignore=nil
if	ig ~= nil then
Ignore = ig	
end
	
	local function GatherInstances(Parent,Ignore)
		for i, v in pairs(Parent:GetChildren()) do
			
			if v ~= Ignore then
				GatherInstances(v,Ignore)
			table.insert(Instances, v) end
		end
	end
	GatherInstances(Parent,Ignore)
	return Instances
end









function weld(parent,part0,part1,c0)
local weld=it("Weld") 
weld.Parent=parent
weld.Part0=part0 
weld.Part1=part1 
weld.C0=c0
return weld
end
function joint(parent,part0,part1,c0)
local weld=it("Motor6D") 
weld.Parent=parent
weld.Part0=part0 
weld.Part1=part1 
weld.C0=c0
return weld
end
ArmorParts = {}
--ArmorParts = {}
function WeldAllTo(Part1,Part2,scan,Extra)
local EXCF = Part2.CFrame * Extra	
for i, v3 in pairs(scan:GetDescendants()) do
	if v3:isA("BasePart") then	
local STW=weld(v3,v3,Part1,EXCF:toObjectSpace(v3.CFrame):inverse() )
					v3.Anchored=false
					v3.Massless = true
					v3.CanCollide=false						
v3.Parent = Part1			
v3.Locked = true	
	if not v3:FindFirstChild("Destroy") then
				table.insert(ArmorParts,{Part = v3,Par = v3.Parent,Col = v3.Color,Mat=v3.Material.Name })	
else
	v3:Destroy()	
	end				
					end
end
Part1.Transparency=1
--Part2:Destroy()
end



function JointAllTo(Part1,Part2,scan,Extra)
local EXCF = Part2.CFrame * Extra	
for i, v3 in pairs(scan:GetDescendants()) do
	if v3:isA("BasePart") then	
local STW=joint(v3,v3,Part1,EXCF:toObjectSpace(v3.CFrame):inverse() )
					v3.Anchored=false
					v3.Massless = true
					v3.CanCollide=false						
v3.Parent = Part1			
v3.Locked = true	
	if not v3:FindFirstChild("Destroy") then
			--	table.insert(ArmorParts,{Part = v3,Par = v3.Parent,Col = v3.Color,Mat=v3.Material.Name })	
else
	v3:Destroy()	
	end				
					end
end
Part1.Transparency=1
--Part2:Destroy()
end







--------------------------------------------Claws
local RClaw = EffectPack.Part:Clone()
RClaw.Parent = Character
RClaw.Name = "RightClaw"
RCW=weld(RightArm,RightArm,RClaw,cf(0,0,0))

--------------------------------------------
local LClaw = EffectPack.Part:Clone()
LClaw.Parent = Character
LClaw.Name = "LeftClaw"
LCW=weld(LeftArm,LeftArm,LClaw,cf(0,0,0))

--------------------------------------------
tailw = Torso:WaitForChild("Tail").Weld
tailc0 = tailw.C0

for _,v in pairs(folder.Armor:children()) do
		if v:IsA("Model")  then
			
			if  Character:FindFirstChild(""..v.Name) then
				local Part1=Character:FindFirstChild(""..v.Name)
				local Part2=v.Handle

WeldAllTo(Part1,Part2,v,CFrame.new(0,0,0))

			end
			
			
		end
end	

local SToneTexture = Create("Texture")({
	
	
	Texture = "http://www.roblox.com/asset/?id=1693385655",
    Color3 = Color3.new(163/255, 162/255, 165/255),
	
})

function AddStoneTexture(part)
	coroutine.resume(coroutine.create(function()
	for i = 0,6,1 do
local Tx = SToneTexture:Clone()
Tx.Face = i
Tx.Parent=part
end
	end))
end

New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end



function Tran(Num)
local GivenLeter = ""
if Num == "1" then
GivenLeter = "a"	
elseif Num == "2" then
GivenLeter = "b"
elseif Num == "3" then
GivenLeter = "c"
elseif Num == "4" then
GivenLeter = "d"
elseif Num == "5" then
GivenLeter = "e"
elseif Num == "6" then
GivenLeter = "f"
elseif Num == "7" then
GivenLeter = "g"
elseif Num == "8" then
GivenLeter = "h"
elseif Num == "9" then
GivenLeter = "i"
elseif Num == "10" then
GivenLeter = "j"
elseif Num == "11" then
GivenLeter = "k"
elseif Num == "12" then
GivenLeter = "l"
elseif Num == "13" then
GivenLeter = "m"
elseif Num == "14" then
GivenLeter = "n"
elseif Num == "15" then
GivenLeter = "o"
elseif Num == "16" then
GivenLeter = "p"
elseif Num == "17" then
GivenLeter = "q"
elseif Num == "18" then
GivenLeter = "r"
elseif Num == "19" then
GivenLeter = "s"
elseif Num == "20" then
GivenLeter = "t"
elseif Num == "21" then
GivenLeter = "u"
elseif Num == "22" then
GivenLeter = "v"
elseif Num == "23" then
GivenLeter = "w"
elseif Num == "24" then
GivenLeter = "x"
elseif Num == "25" then
GivenLeter = "y"
elseif Num == "26" then
GivenLeter = "z"
elseif Num == "27" then
GivenLeter = "_"
elseif Num == "28" then
GivenLeter = "0"
elseif Num == "29" then
GivenLeter = "1"
elseif Num == "30" then
GivenLeter = "2"	
elseif Num == "31" then
GivenLeter = "3"
elseif Num == "32" then
GivenLeter = "4"
elseif Num == "33" then
GivenLeter = "5"
elseif Num == "34" then
GivenLeter = "6"
elseif Num == "35" then
GivenLeter = "7"
elseif Num == "36" then
GivenLeter = "8"
elseif Num == "37" then
GivenLeter = "9"
end
return GivenLeter
	
end

function MaybeOk(Mode,Extra)
local ReturningValue = ""
if Mode == 1 then
	
	

	--	v.C0 = CFrame.new(1,1,1)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
		
		--print(v.C0)
local GivenText	= ""	
local	msg = 	Extra
local Txt = ""
local FoundTime=0
local LastFound = 0
        delay(wait(0),function()
                for v3 = 1, #msg do
                    
if string.sub(msg,0+v3,v3) == ","	then

local TheN = string.sub(msg,LastFound,v3-1)


local NumTranslate = Tran(string.sub(msg,LastFound,v3-1))



FoundTime = FoundTime + 1


GivenText = GivenText..NumTranslate

LastFound=v3+1
Txt=""
end
    Txt=string.sub(msg,1,v3)		


       --    Gui.ExtentsOffset = Vector3.new(0,3,0)


      --  Gui.ExtentsOffset = Vector3.new(0,3,0)                    
wait()
 -- Gui.ExtentsOffset = Vector3.new(0,3,0)   
                end;		

	 	ReturningValue=GivenText
	      for v3 = 1, #Txt do
                        Txt=string.sub(msg,-1,v3)


             




   end;
             --   Gui:remove()
        end)	
	

elseif Mode == 2 then
	
print("fat")
end



while ReturningValue == "" do wait() end
return ReturningValue
	
end

function CreateMesh2(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart2(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local S = IT("Sound")
function CreateSound2(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end


	function WACKYEFFECT(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or VT(1,1,1))
	local ENDSIZE = (Table.Size2 or VT(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Torso.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color or C3(1,1,1))
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	coroutine.resume(coroutine.create(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart2(3, Effects, MATERIAL, 0, TRANSPARENCY, BRICKC("Pearl"), "Effect", VT(1,1,1), true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound2(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
		end
		EFFECT.Color = COLOR
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "Sphere", "", "", SIZE, VT(0,0,0))
				elseif TYPE == "Cylinder" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "Cylinder", "", "", SIZE, VT(0,0,0))	
		elseif TYPE == "Block" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)
				elseif TYPE == "Cube" then
			MSH = IT("BlockMesh",EFFECT)
			MSH.Scale = VT(SIZE.X,SIZE.X,SIZE.X)	
			
		elseif TYPE == "Wave" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "559831844", "", VT(SIZE.X,SIZE.X,0.1), VT(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "662586858", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "662585058", "", VT(SIZE.X/10,0,SIZE.X/10), VT(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "4770583", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "9756362", "", SIZE, VT(0,0,0))
		elseif TYPE == "Crown" then
			MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "173770780", "", SIZE, VT(0,0,0))
		end
		if MSH ~= nil then
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude/TIME
			end
			local GROWTH = SIZE - ENDSIZE
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
			
				SetTween(EFFECT,{CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))},"Quad","InOut",TIME/60)
			else
		
			SetTween(EFFECT,{CFrame = CFRAME},"Quad","InOut",0)
				
			end
			
			
			
			wait()
			
			SetTween(EFFECT,{Transparency = EFFECT.Transparency - TRANS},"Quad","InOut",TIME/60)
			
							if TYPE == "Block" then
	
					SetTween(EFFECT,{CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))},"Quad","InOut",0)
				else

					SetTween(EFFECT,{CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))},"Quad","InOut",0)
					
				end
							if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation

					SetTween(EFFECT,{CFrame=CF(MOVEDIRECTION)},"Quad","InOut",TIME/60)
						SetTween(EFFECT,{Orientation=ORI},"Quad","InOut",TIME/60)
				
					
							end
							MSH.Scale = MSH.Scale - GROWTH/TIME
									SetTween(MSH,{Scale=ENDSIZE},"Quad","InOut",TIME/60)
										if TYPE == "Wave" then
				
						SetTween(MSH,{Offset=VT(0,0,-MSH.Scale.X/8)},"Quad","InOut",TIME/60)
				end
			for LOOP = 1, TIME+1 do
				wait(.05)

				--SetTween(EFFECT,{Transparency = EFFECT.Transparency - TRANS/TIME},"Quad","InOut",0)
				
				
				if TYPE == "Block" then
	
	--				SetTween(EFFECT,{CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))},"Quad","InOut",0)
				else

	--				SetTween(EFFECT,{CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))},"Quad","InOut",0)
					
				end
				if MOVEDIRECTION ~= nil then
					local ORI = EFFECT.Orientation

--					SetTween(EFFECT,{CFrame=CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)},"Quad","InOut",0)
--						SetTween(EFFECT,{Orientation=ORI},"Quad","InOut",0)
				
					
				end
			end
				game:GetService("Debris"):AddItem(EFFECT, 15)
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				SOUND.Stopped:Connect(function()
					EFFECT:remove()
				end)
			end
		else
			if PLAYSSOUND == false then
				EFFECT:remove()
			else
				repeat wait() until SOUND.Playing == false
				EFFECT:remove()
			end
		end
	end))
end	
----------------------
--[End Of Functions]--
----------------------






------------------
--[Gun]--
------------------












function CreatePart( Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part"){
		
		Parent = Parent,
		Reflectance = Reflectance,
		Transparency = Transparency,
		CanCollide = false,
		Locked = true,
		BrickColor = BrickColor.new(tostring(BColor)),
		Name = Name,
		Size = Size,
		Material = Material,
	}
	RemoveOutlines(Part)
	return Part
end

------------------
--[End of Gun]--
------------------

---------------
--[Particles]--
---------------


local Particle2_1 = Create("ParticleEmitter"){
Color = ColorSequence.new(Color3.new (1,1,1),  Color3.new (170/255, 255/255, 255/255)),
Transparency =  NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.75,.4),NumberSequenceKeypoint.new(1,1)}),
Size = NumberSequence.new({NumberSequenceKeypoint.new(0,.5),NumberSequenceKeypoint.new(1,.0)}),
Texture = "rbxassetid://241922778",
Lifetime = NumberRange.new(0.55,0.95),
Rate = 100,
VelocitySpread = 180,
Rotation = NumberRange.new(0),
RotSpeed = NumberRange.new(-200,200),
Speed = NumberRange.new(8.0),
LightEmission = 1,
LockedToPart = false,
Acceleration = Vector3.new(0, 0, 0),
EmissionDirection = "Top",
Drag = 4,
Enabled = false
}


local BEGONE_Particle = Create("ParticleEmitter"){
Color = ColorSequence.new(Color3.new (1,1,1), Color3.new (1, 1, 1)),
Transparency =  NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.1,0),NumberSequenceKeypoint.new(0.3,0),NumberSequenceKeypoint.new(0.5,.2),NumberSequenceKeypoint.new(1,1)}),
Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.15,1.5),NumberSequenceKeypoint.new(.75,1.5),NumberSequenceKeypoint.new(1,0)}),
Texture = "rbxassetid://936193661",
Lifetime = NumberRange.new(1.5),
Rate = 100,
VelocitySpread = 0,
Rotation = NumberRange.new(0),
RotSpeed = NumberRange.new(-10,10),
Speed = NumberRange.new(0),
LightEmission = .25,
LockedToPart = true,
Acceleration = Vector3.new(0, -0, 0),
EmissionDirection = "Top",
Drag = 4,
ZOffset = 1,
Enabled = false
}


----------------------
--[End Of Particles]--
----------------------





-----------------



	Damagefunc = function(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	
		if hit.Parent == nil then
		return 
	end
	local h = hit.Parent:FindFirstChildOfClass("Humanoid")
	for _,v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
		if	h.Health > 0.0001 then
				h = v else   end
		end
	end
	
	if h == nil then
		return 
		elseif h ~= nil and h.Health < 0.001 then
		return 
	elseif  h ~= nil and h.Parent:FindFirstChild("Fly away") then
		return
	end
	
	
	--gg
	
--local FoundTorso = hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso")	
		coroutine.resume(coroutine.create(function()	
if h.Health >9999999 and minim <9999 and Type~= "IgnoreType" and(h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")) and not h.Parent:FindFirstChild("Fly away")then
	
	
	local FATag = Instance.new("Model",h.Parent)

	FATag.Name = "Fly away"
game:GetService("Debris"):AddItem(FATag, 2.5)	
	
	
	for _,v in pairs(h.Parent:children()) do
		if v:IsA("BasePart")and v.Parent:FindFirstChildOfClass("Humanoid") then
			v.Anchored=true
		end
	end	

wait(.25)
	
if 	h.Parent:FindFirstChildOfClass("Body Colors")then
h.Parent:FindFirstChildOfClass("Body Colors"):Destroy()
end


	local FoundTorso = h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
	
	coroutine.resume(coroutine.create(function()	
		
		
local YourGone = Instance.new("Part")
		YourGone.Reflectance = 0
		YourGone.Transparency = 1
		YourGone.CanCollide = false
		YourGone.Locked = true
		YourGone.Anchored=true
		YourGone.BrickColor = BrickColor.new("Really blue")
		YourGone.Name = "YourGone"
		YourGone.Size = Vector3.new()
		YourGone.Material = "SmoothPlastic"
		YourGone:BreakJoints()
		YourGone.Parent = FoundTorso		
		YourGone.CFrame = FoundTorso.CFrame
				
	local NewParticle = Instance.new("ParticleEmitter")
NewParticle.Parent = YourGone
NewParticle.Acceleration =  Vector3.new(0,0,0)
NewParticle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10),NumberSequenceKeypoint.new(1,.0)})
NewParticle.Color = ColorSequence.new(Color3.new (1,0,0), Color3.new (1, 0, 0))
NewParticle.Lifetime = NumberRange.new(0.55,0.95)
NewParticle.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.25,.0),NumberSequenceKeypoint.new(1,1)})
NewParticle.Speed = NumberRange.new(0,0.0)
NewParticle.ZOffset = 2
NewParticle.Texture = "rbxassetid://243660364"
NewParticle.RotSpeed = NumberRange.new(-0,0)
NewParticle.Rotation = NumberRange.new(-180,180)
NewParticle.Enabled = false
game:GetService("Debris"):AddItem(YourGone, 3)	
for i = 0,2,1 do
NewParticle:Emit(1)
so("1448044156", FoundTorso,2, 1)
h.Parent:BreakJoints()
YourGone.CFrame = FoundTorso.CFrame
	for _,v in pairs(h.Parent:children()) do
		if v:IsA("BasePart")and v.Parent:FindFirstChildOfClass("Humanoid") then
			v.Anchored=false
--			v.Material = "Neon"
			--v.BrickColor = BrickColor.new("Really red")
			if v:FindFirstChildOfClass("SpecialMesh")then
	--v:Destroy()
			end	
						if v:FindFirstChildOfClass("Decal") and v.Name == "face" then
--	v:Destroy()
end		
					local vp = Create("BodyVelocity")({P = 500, maxForce = Vector3.new(1000, 1000, 1000), velocity = Vector3.new(math.random(-10,10),4,math.random(-10,10)) })
										
				vp.Parent = v		
						game:GetService("Debris"):AddItem(vp, math.random(50,100)/1000)				
			
			
		end
		
		
		
	end	

	
	
wait(.2)	
end
wait(.1)	
NewParticle:Emit(3)
so("1448044156", FoundTorso,2, .8)
h.Parent:BreakJoints()
YourGone.CFrame = FoundTorso.CFrame
	for _,v in pairs(h.Parent:children()) do
		if v:IsA("BasePart")and v.Parent:FindFirstChildOfClass("Humanoid") then
			v.Anchored=false
--			v.Material = "Neon"
			--v.BrickColor = BrickColor.new("Really red")
			if v:FindFirstChildOfClass("SpecialMesh")then
	--v:Destroy()
			end	
						if v:FindFirstChildOfClass("Decal") and v.Name == "face" then
--	v:Destroy()
end		
					local vp = Create("BodyVelocity")({P = 500, maxForce = Vector3.new(1000, 1000, 1000), velocity = Vector3.new(math.random(-10,10),4,math.random(-10,10)) })
										
				vp.Parent = v		
						game:GetService("Debris"):AddItem(vp, math.random(100,200)/1000)				
			
			
		end
		
		
		
	end	

	
	
	
	end))
	



wait(.1)



	
	
	
	
	end
	
	
	end))
	if h ~= nil and hit.Parent ~= Character and hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil and hit.Parent.DebounceHit.Value == true then
			return 
		end
		local c = Create("ObjectValue")({Name = "creator", Value = game:service("Players").LocalPlayer, Parent = h})
		game:GetService("Debris"):AddItem(c, 0.5)
		if HitSound ~= nil and HitPitch ~= nil then
			so(HitSound, hit, 1, HitPitch)
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil and block.className == "IntValue" and block.Value > 0 then
			blocked = true
			block.Value = block.Value - 1
			print(block.Value)
		end
	if blocked == false then
			--h.Health = h.Health - Damage
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Color3.new(0,0,0))
		else
			--h.Health = h.Health - Damage / 2
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Color3.new(0,0,0))
			
		end
			
			
			
			--[[local FoundTorso = h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
			local bodvol = Create("BodyVelocity")({P = 500, maxForce = Vector3.new(math.huge, 0, math.huge), velocity = CFrame.new(Part.Position,FoundTorso.Position).lookVector * knockback, Parent = hit})
			local rl = Create("BodyAngularVelocity")({P = 3000, maxTorque = Vector3.new(5000, 5000, 5000) * 5, angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)), Parent = hit})
			game:GetService("Debris"):AddItem(bodvol, 2)
			game:GetService("Debris"):AddItem(rl, 0.125)]]



		elseif Type == "Knockdown2" then
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit

		elseif Type == "Normal" then
				local FoundTorso = h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
		
					
	
		elseif Type== "Fire" 	then
			local HTorso = hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso")

							local tags = 0
						for _,v2 in next, HTorso:GetChildren() do 
							if v2:IsA("Folder") and v2.Name == "OnFire" then
								tags=tags+1
							end
						end	
						
if tags < 2 then
											
					local fireef = EffectPack.FireEffect:Clone()
					
					local tag = Instance.new("Folder",HTorso)
					tag.Name = "OnFire"					
					 game:GetService("Debris"):AddItem(tag, 4.5) 
			for _,v in next, fireef:GetDescendants() do if v:IsA("ParticleEmitter") or v:IsA("SpotLight")  then    game:GetService("Debris"):AddItem(v, 5) 	 v.Parent = HTorso
			coroutine.resume(coroutine.create(function()	
				for i = 1,35 do 
								coroutine.resume(coroutine.create(function()	
					v:Emit(2) end))
						coroutine.resume(coroutine.create(function()	
							Damagefunc(HTorso, HTorso, 4/2, 6/2, 0, "Normal", RootPart, 0.1, "1273118342", math.random(10,30)/10)
						end))
						if HTorso.Parent:FindFirstChildOfClass("Humanoid")  and HTorso.Parent:FindFirstChildOfClass("Humanoid").Health > .01 then
							else 	
                                for _,v2 in next, HTorso.Parent:GetDescendants() do  
                                    if v2:isA("BasePart") then 
                                        --SetTween(v2,{Color=C3(0,0,0)},"Quad","Out",.5)
                                     end 
                                 end 
                                break
						end
					wait(.1)
					end
			end))	
				
				  end  end
		
					
		fireef:Destroy()		
			else-- print("Hit Max")		
		end			
		elseif Type== "Instakill" 	then
					coroutine.resume(coroutine.create(function()	
if  (h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")) and not h.Parent:FindFirstChild("Fly away")then
	
	

wait(.25)


	local FoundTorso = h.Parent:FindFirstChild("Torso") or h.Parent:FindFirstChild("UpperTorso")
	
	coroutine.resume(coroutine.create(function()	
		
		
local YourGone = Instance.new("Part")
		YourGone.Reflectance = 0
		YourGone.Transparency = 1
		YourGone.CanCollide = false
		YourGone.Locked = true
		YourGone.Anchored=true
		YourGone.BrickColor = BrickColor.new("Really blue")
		YourGone.Name = "YourGone"
		YourGone.Size = Vector3.new()
		YourGone.Material = "SmoothPlastic"
		YourGone:BreakJoints()
		YourGone.Parent = FoundTorso		
		YourGone.CFrame = FoundTorso.CFrame
				
	local NewParticle = Instance.new("ParticleEmitter")
NewParticle.Parent = YourGone
NewParticle.Acceleration =  Vector3.new(0,0,0)
NewParticle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10),NumberSequenceKeypoint.new(1,.0)})
NewParticle.Color = ColorSequence.new(Color3.new (1,0,0), Color3.new (1, 0, 0))
NewParticle.Lifetime = NumberRange.new(0.55,0.95)
NewParticle.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.25,.0),NumberSequenceKeypoint.new(1,1)})
NewParticle.Speed = NumberRange.new(0,0.0)
NewParticle.ZOffset = 2
NewParticle.Texture = "rbxassetid://243660364"
NewParticle.RotSpeed = NumberRange.new(-0,0)
NewParticle.Rotation = NumberRange.new(-180,180)
NewParticle.Enabled = false
game:GetService("Debris"):AddItem(YourGone, 3)	
for i = 0,2,1 do
NewParticle:Emit(1)
so("1448044156", FoundTorso,2, 1)
YourGone.CFrame = FoundTorso.CFrame
	for _,v in pairs(h.Parent:children()) do
		if v:IsA("BasePart")and v.Parent:FindFirstChildOfClass("Humanoid") then			
			
			
		end
		
		
		
	end	

	
	
wait(.2)	
end
wait(.1)	
NewParticle:Emit(3)
so("1448044156", FoundTorso,2, .8)
YourGone.CFrame = FoundTorso.CFrame
	for _,v in pairs(h.Parent:children()) do
		if v:IsA("BasePart")and v.Parent:FindFirstChildOfClass("Humanoid") then
		end
	end	
	end))
wait(.1)
	end
	end))
		elseif Type == "HPSteal" then

			
					elseif Type == "Impale" then






	

CFuncs.Sound.Create("http://www.roblox.com/asset/?id=268249319", Spike, .8, 2)	
			
		
		wait(1)
		elseif Type == "IgnoreType" then
			

			
			
			
				elseif Type == "Up" then
						elseif Type == "Snare" then
							elseif Type == "Freeze2" then
										end
											local debounce = Create("BoolValue")({Name = "DebounceHit", Parent = hit.Parent, Value = true})
											game:GetService("Debris"):AddItem(debounce, Delay)
											c = Instance.new("ObjectValue")
											c.Name = "creator"
											c.Value = Player
											c.Parent = h
											game:GetService("Debris"):AddItem(c, 0.5)
										end



	ShowDamage = function(Pos, Text, Time, Color)
	
	local Rate = 0.033333333333333
	if not Pos then
		local Pos = Vector3.new(0, 0, 0)
	end
	local Text = Text or ""
	local Time = Time or 2
	if not Color then
		local Color = Color3.new(1, 0.545098, 0.552941)
	end
	local EffectPart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui")({Size = UDim2.new(2, 0, 2, 0), Adornee = EffectPart, Parent = EffectPart})
	local TextLabel = Create("TextLabel")({BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = ""..Text.."", TextColor3 = Color, TextScaled = true, Font = Enum.Font.SourceSansBold, Parent = BillboardGui})
	TextLabel.TextTransparency=1
	game.Debris:AddItem(EffectPart, Time + 0.1)
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		
		local Frames = Time / Rate
		
		
		
--print(Frames)
	
		EffectPart.CFrame=CFrame.new(Pos)
		wait()	TextLabel.TextTransparency=0
		SetTween(TextLabel,{TextTransparency=1},"Quad","In",Frames/60)
		SetTween(TextLabel,{Rotation=math.random(-25,25)},"Elastic","InOut",Frames/60)
		SetTween(TextLabel,{TextColor3=Color3.new(1,0,0)},"Elastic","InOut",Frames/60)

SetTween(EffectPart,{CFrame = CFrame.new(Pos) + Vector3.new(math.random(-5,5), math.random(1,5), math.random(-5,5))},"Quad","InOut",Frames/60)


		wait(Frames/60)
		
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end
)
end

	MagniDamage = function(Part, magni, mindam, maxdam, knock, Type2)
		
		
		
		
local Type=""




if  mememode == true then
 
Type=	"Instakill"

else
Type=Type2
end 
if Type2 == "NormalKnockdown" then
	Type= "Knockdown"
end
		
	for _,c in pairs(workspace:children()) do
		
		
		
		
		
		local hum = c:FindFirstChild("Humanoid")
	for _,v in pairs(c:children()) do
		if v:IsA("Humanoid") then
			hum = v
		end
	end	
		
		
		
		
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= magni and c.Name ~= Player.Name then
					Damagefunc(Part, head, mindam, maxdam, knock, Type, RootPart, 0.1, "851453784", 1.2)
				end
			end
		end
	end
end


function CFMagniDamage(HTCF,magni, mindam, maxdam, knock, Type)
local DGP = Instance.new("Part")

DGP.Parent = Character
DGP.Size = Vector3.new(0.05, 0.05, 0.05)
DGP.Transparency = 1
DGP.CanCollide = false
DGP.Anchored = true
RemoveOutlines(DGP)
DGP.Position=DGP.Position + Vector3.new(0,-.1,0)
DGP.CFrame = HTCF

coroutine.resume(coroutine.create(function()
MagniDamage(DGP, magni, mindam, maxdam, knock, Type)
end))
game:GetService("Debris"):AddItem(DGP, .05)


DGP.Archivable = false
end



-----------------

function BulletHitEffectSpawn(EffectCF,EffectName)
local MainEffectHolder=Instance.new("Part",Effects)	
		MainEffectHolder.Reflectance = 0
		MainEffectHolder.Transparency = 1
		MainEffectHolder.CanCollide = false
		MainEffectHolder.Locked = true
		MainEffectHolder.Anchored=true
		MainEffectHolder.BrickColor = BrickColor.new("Bright green")
		MainEffectHolder.Name = "Bullet"
		MainEffectHolder.Size = Vector3.new(.05,.05,.05)	
		MainEffectHolder.Material = "Neon"
		MainEffectHolder:BreakJoints()
		MainEffectHolder.CFrame = EffectCF
		local EffectAttach=Instance.new("Attachment",MainEffectHolder)	
			game:GetService("Debris"):AddItem(MainEffectHolder, 15)

				if EffectName == "Explode" then
			EffectAttach.Orientation = Vector3.new(90,0,0)




	local	SpawnedParticle1 =  EffectPack.Bang2:Clone()
            SpawnedParticle1.Parent = MainEffectHolder
          SpawnedParticle1:Emit(150)

		
	
	local	SpawnedParticle2 =  EffectPack.Bang1:Clone()
            SpawnedParticle2.Parent = MainEffectHolder
          SpawnedParticle2:Emit(25)
	
		

	local	SpawnedParticle3 =  EffectPack.Bang3:Clone()
            SpawnedParticle3.Parent = MainEffectHolder
          SpawnedParticle3:Emit(185)
		game:GetService("Debris"):AddItem(MainEffectHolder, 2)				
		
			
		end	






				if EffectName == "Spark" then

			EffectAttach.Orientation = Vector3.new(90,0,0)




	local	SpawnedParticle1 =  EffectPack.Spark:Clone()
            SpawnedParticle1.Parent = MainEffectHolder
          SpawnedParticle1:Emit(1)

		
	

		game:GetService("Debris"):AddItem(MainEffectHolder, 2)				
		
			
		end	



				if EffectName == "ShockWave" then

			EffectAttach.Orientation = Vector3.new(90,0,0)




	local	SpawnedParticle1 =  EffectPack.ShockWave1:Clone()
            SpawnedParticle1.Parent = MainEffectHolder
          SpawnedParticle1:Emit(0)
	local	SpawnedParticle2 =  EffectPack.ShockWave2:Clone()
            SpawnedParticle2.Parent = MainEffectHolder
          SpawnedParticle2:Emit(2)
		
	

		game:GetService("Debris"):AddItem(MainEffectHolder, 2)				
		
			
		end	




				if EffectName == "Nuke" then
					so(923073285,MainEffectHolder,8,2)
			EffectAttach.Orientation = Vector3.new(0,0,0)
					local EffectAttach2=Instance.new("Attachment",MainEffectHolder)	
			EffectAttach2.Orientation = Vector3.new(0,0,0)




	local	SpawnedParticle1 =  EffectPack.Nuke_Flash:Clone()
            SpawnedParticle1.Parent = EffectAttach
          SpawnedParticle1:Emit(20)

		
	
	local	SpawnedParticle2 =  EffectPack.Nuke_Smoke:Clone()
            SpawnedParticle2.Parent = EffectAttach2
          SpawnedParticle2.Enabled = true
		coroutine.resume(coroutine.create(function()
			
	for i = 0,2,.025/1.5 do


SpawnedParticle2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.15,.5+(i/4)),NumberSequenceKeypoint.new(.95,.5+(i/4)),NumberSequenceKeypoint.new(1,1)})
Swait()		
	end
	SpawnedParticle2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)})
	
		      SpawnedParticle2.Enabled = false	
		end))
		

	local	SpawnedParticle3 =  EffectPack.Nuke_Wave:Clone()
            SpawnedParticle3.Parent = EffectAttach
          SpawnedParticle3:Emit(185)
		game:GetService("Debris"):AddItem(EffectAttach, 10)				
		
			
		end	











		
end

	


--[[
		for i, v in pairs(C:GetChildren()) do
if v:IsA("Accessory")then
v:Destroy()	
end
if v:IsA("BasePart")then
v.Transparency =1
if v.Name == "Head" then
	v:FindFirstChildOfClass("Decal"):Destroy()
end
end
		end--]]
--[[













local tweeningInformation = TweenInfo.new(
	0.5,	
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
--]]


local RJW=weld(RJ.Parent,RJ.Part0,RJ.Part1,RJ.C0)
RJW.C1 = RJ.C1
RJW.Name = RJ.Name

local NeckW=weld(Neck.Parent,Neck.Part0,Neck.Part1,Neck.C0)
NeckW.C1 = Neck.C1
NeckW.Name = Neck.Name


--print(WRJ.Parent.Name)

local RW=weld(Torso,Torso,RightArm,cf(0,0,0))

local LW=weld(Torso,Torso,LeftArm,cf(0,0,0))

local RH=weld(Torso,Torso,RightLeg,cf(0,0,0))

local LH=weld(Torso,Torso,LeftLeg,cf(0,0,0))



RW.C1 = cn(0, 0.5, 0)
LW.C1 = cn(0, 0.5, 0)
RH.C1 = cn(0, 1, 0) *CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
LH.C1 = cn(0, 1, 0) *CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))






--------
--(#Torso)
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)},"Quad","InOut",0.1)
--------
--(#Head)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)},"Quad","InOut",0.1)
--------
--(#Right Arm)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)},"Quad","InOut",0.1)
--------
--(#Left Arm)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)},"Quad","InOut",0.1)
--------
--(#Right Leg)
SetTween(RH,{C0=CFrame.new(.5, -0.90, 0)},"Quad","InOut",0.1)
--------
--(#Left Leg)
SetTween(LH,{C0=CFrame.new(-.5, -0.90, 0)},"Quad","InOut",0.1)



--[[
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
--]]


function AT1()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-40))},"Quad","InOut",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(40))},"Quad","InOut",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(30),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(30),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(RH,{C0=CFrame.new(.5, -.6, -.4)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(20),math.rad(0),math.rad(20))},"Quad","InOut",0.2)





wait(.2/dahspeed)	

--coroutine.resume(coroutine.create(function()	
--	so("1428541279", RightArm,1.6, math.random(120,220)/100)


CFMagniDamage(RootPart.CFrame*CF(0,-1,-1),7,10,20,20,"Normal")
--end))

SetTween(RJW,{C0=RootCF*CFrame.new(0,-1,0)*angles(math.rad(-40),math.rad(0),math.rad(40))},"Back","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-40))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(-30),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(-30),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(120),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-60),math.rad(0),math.rad(-20))},"Back","Out",0.2)





wait(.2/dahspeed)	


attack = false	
end




function AT2()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed

SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(60))},"Quad","InOut",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-60))},"Quad","InOut",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(90),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(RH,{C0=CFrame.new(.5, -.5, -.4)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)

CFMagniDamage(RootPart.CFrame*CF(0,-0,-1),9,10,15,0,"Normal")

wait(.2/dahspeed)	

SetTween(RJW,{C0=RootCF*CFrame.new(0,-1,0)*angles(math.rad(0),math.rad(0),math.rad(-70))},"Back","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(70))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(-20),math.rad(-90))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, -0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Back","Out",0.2)


wait(.2/dahspeed)	
attack = false		
end

function AT3()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(120))},"Quad","In",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-80))},"Quad","InOut",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(90),math.rad(0),math.rad(20))},"Quad","InOut",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(20),math.rad(-0),math.rad(-0))},"Quad","InOut",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, -0)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -.8, 0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)

wait(.2/dahspeed)	
CFMagniDamage(RootPart.CFrame*CF(-2,-.25,-1),9,20,30,10,"Knockdown")

SetTween(RJW,{C0=RootCF*CFrame.new(0,-1,0)*angles(math.rad(20),math.rad(0),math.rad(-0))},"Back","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(90))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(20),math.rad(-0),math.rad(-0))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, -0)*angles(math.rad(-40),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.2)
wait(.2/dahspeed)
attack = false		
end



function AT4()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed

SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(-80))},"Quad","InOut",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(80))},"Quad","InOut",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(-20),math.rad(-70),math.rad(-90))},"Quad","InOut",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, -.0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -.5, -0.4)*angles(math.rad(20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)

CFMagniDamage(RootPart.CFrame*CF(0,-0,-1),9,30,45,0,"Normal")
so("3051417237", LeftArm,3, math.random(100,155)/100)
wait(0.2/dahspeed)	

SetTween(RJW,{C0=RootCF*CFrame.new(0,-1,0)*angles(math.rad(20),math.rad(0),math.rad(45))},"Back","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(-45))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(-0),math.rad(-90))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, -0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-10),math.rad(0),math.rad(0))},"Back","Out",0.2)


wait(.2/dahspeed)	
attack = false		
end





function AT5()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed

SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(80))},"Quad","InOut",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-80))},"Quad","InOut",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(-20),math.rad(70),math.rad(90))},"Quad","InOut",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(-90))},"Quad","InOut",0.2)
SetTween(RH,{C0=CFrame.new(.5, -.5, -0.4)*angles(math.rad(20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, -0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Quad","InOut",0.2)

CFMagniDamage(RootPart.CFrame*CF(0,-0,-1),9,30,45,0,"Normal")
so("3051417237", RightArm,3, math.random(100,155)/80)
wait(0.2/dahspeed)	

SetTween(RJW,{C0=RootCF*CFrame.new(0,-1,0)*angles(math.rad(20),math.rad(0),math.rad(-45))},"Back","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(45))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(90))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(-0),math.rad(0))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, -0)*angles(math.rad(-10),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Back","Out",0.2)


wait(.2/dahspeed)	
attack = false		
end




function AT6()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed


SetTween(RJW,{C0=RootCF*CFrame.new(0,-1,-.3)*angles(math.rad(45),math.rad(0),math.rad(0))},"Quad","Out",0.3)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Quad","Out",0.3)
SetTween(RW,{C0=CFrame.new(1.1 , 0.5, -.3)*angles(math.rad(20),math.rad(115),math.rad(90))},"Quad","In",0.15)
SetTween(LW,{C0=CFrame.new(-1.1, 0.5, -.3)*angles(math.rad(20),math.rad(-115),math.rad(-90))},"Quad","In",0.15)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(-60),math.rad(0),math.rad(0))},"Quad","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(60),math.rad(0),math.rad(0))},"Quad","Out",0.3)

so("3051417237", Torso,3,  math.random(140,185)/80)
CFMagniDamage(RootPart.CFrame*CF(-1.4,-0,-1),9,40,55,10,"Knockdown")
CFMagniDamage(RootPart.CFrame*CF(1.4,-0,-1),9,40,55,10,"Knockdown")

wait(0.175/dahspeed)	

SetTween(RJW,{C0=RootCF*CFrame.new(0,-1.7,-.4)*angles(math.rad(45),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(90))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(-90))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(65),math.rad(0),math.rad(0))},"Back","Out",0.2)



wait(.2/dahspeed)	
attack = false		
end


function AT7()
attack=true	
local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end --/dahspeed
so("3051417237", Torso,3, .8)

coroutine.resume(coroutine.create(function()	
	for i = 1,2 do Swait(3)
so("3051417087", RightArm,3, math.random(100,155)/100) end
end))
for i =1,10,1 do 
SetTween(RJW,{C0=RootCF*CFrame.new(0,-1.7+.17*i,-.4)*angles(math.rad(25-5*i),math.rad(0),math.rad(36*i))},"Quad","Out",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(180),math.rad(0),math.rad(90))},"Quad","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(-90))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(-25),math.rad(0),math.rad(0))},"Quad","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(25),math.rad(0),math.rad(0))},"Quad","Out",0.2)
CFMagniDamage(RootPart.CFrame*CF(1.4,-0,-1+.17*i),9,10,15,10,"Knockdown")
Swait()
end



attack = false		
end
--[[
how to make an cat fly


	SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-20))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.25)*angles(math.rad(0),math.rad(0),math.rad(40))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
Swait(.1*30)
for i = 1,100,0.3 do	
	SetTween(RJW,{C0=RootCF*CFrame.new(-20.5*math.sin(i),20.5*math.cos(i),i/.5)*angles(math.rad(25-4.5*10*i),math.rad(0),math.rad(36*i*2))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-80))},"Quad","InOut",0.15)
SetTween(RW,{C0=CFrame.new(1.5 , 0.65, -.0)*angles(math.rad(160+2*i),math.rad(0),math.rad(30-3*i))},"Quad","Out",0.15)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.15)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0+6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0-6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
Swait() end	

	SetTween(RJW,{C0=RootCF*CFrame.new(0,0,20)*angles(math.rad(-20),math.rad(0),math.rad(-20))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(90),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
Swait(1.1*30)


]]--

function joke()
attack = true
for i = 1,100,0.1 do	
	SetTween(RJW,{C0=RootCF*CFrame.new(-150.5*(i/10)*math.sin(i),150.5*(i/10)*math.cos(i),10*i*(i/10))*angles(math.rad(25-4.5*10*i),math.rad(0),math.rad(36*i*2))},"Quad","InOut",0.05)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-80))},"Quad","InOut",0.15)
SetTween(RW,{C0=CFrame.new(1.5 , 0.65, -.0)*angles(math.rad(160+2*i),math.rad(0),math.rad(30-3*i))},"Quad","Out",0.15)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.15)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0+6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0-6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
Swait() end	
attack = false	
end

















function Attack1()
	attack = true
	
		Humanoid.JumpPower = 0	
	Humanoid.WalkSpeed=0.1	
	so("299058146", RightArm,2,2.5)
	SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-20))},"Back","Out",0.6)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20))},"Back","Out",0.6)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(-10),math.rad(0),math.rad(20))},"Back","Out",0.6)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(-20))},"Back","Out",0.6)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(-20),math.rad(0),math.rad(0))},"Back","Out",0.6)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(20),math.rad(0),math.rad(0))},"Back","Out",0.6)
Swait(.2*30)
						
		coroutine.resume(coroutine.create(function()
local EffectAttach=Instance.new("Attachment",RightArm)				
EffectAttach.Orientation = Vector3.new(0,0,0)
EffectAttach.Position =  Vector3.new(0,-1,0)
	local	SpawnedParticle1 =  EffectPack.Spark:Clone()
            SpawnedParticle1.Parent = EffectAttach
          SpawnedParticle1:Emit(1)

		game:GetService("Debris"):AddItem(EffectAttach, 2)				
		end))
			
	
	
		  local TheGunHandle = Instance.new("Part")
		TheGunHandle.Reflectance = 0
		TheGunHandle.Transparency = 1
		TheGunHandle.CanCollide = false
		TheGunHandle.Locked = true
		TheGunHandle.Anchored=false
		TheGunHandle.BrickColor = BrickColor.new("Really blue")
		TheGunHandle.Name = "BHandle"
		TheGunHandle.Size = Vector3.new(2.5,1,2.5)
		TheGunHandle.Material = "SmoothPlastic"
		TheGunHandle:BreakJoints()
		TheGunHandle.Parent = Effects		
		TheGunHandle.CFrame = RootPart.CFrame	
		TheGunHandle.Massless = false
		
		local SWeld=weld(TheGunHandle,RootPart,TheGunHandle,cf(0,0,-3)*angles(math.rad(0),math.rad(0),math.rad(0)))
		local IsHit = false
local function onTouch(HitPa)
	if IsHit == false then
		local c = HitPa.Parent
				local h = HitPa.Parent:FindFirstChild("Humanoid")
	for _,v in pairs(HitPa.Parent:children()) do
		if v:IsA("Humanoid") then
	
				h = v end
		
	end 
		local head = c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
		local realhead = c:FindFirstChild("Head")
	if h ~= nil and head ~= nil and realhead ~= nil then
	
	IsHit = true
	--head.Anchored=true
	coroutine.resume(coroutine.create(function()
	TheGunHandle:Destroy()
end))
----------------------------------------------------------------------------------------------------------------------------------	
	
			  local TheFlyHandle = Instance.new("Part")
		TheFlyHandle.Reflectance = 0
		TheFlyHandle.Transparency = 1
		TheFlyHandle.CanCollide = false
		TheFlyHandle.Locked = true
		TheFlyHandle.Anchored=true
		TheFlyHandle.BrickColor = BrickColor.new("Really blue")
		TheFlyHandle.Name = "FHandle"
		TheFlyHandle.Size = Vector3.new(1,1,1)
		TheFlyHandle.Material = "SmoothPlastic"
		TheFlyHandle:BreakJoints()
		TheFlyHandle.Parent = Effects		
		TheFlyHandle.CFrame = RootPart.CFrame	
		TheFlyHandle.Massless = false

 local thejoint =joint(TheFlyHandle,RootPart,TheFlyHandle,cf())


local risingnum=(25-4.5*1)



local EffectAttach=Instance.new("Attachment",RightArm)				
EffectAttach.Orientation = Vector3.new(0,0,0)
EffectAttach.Position =  Vector3.new(0,-1,0)
	local	SpawnedParticle1 =  EffectPack.UpperCutSmoke:Clone()
            SpawnedParticle1.Parent = EffectAttach
          SpawnedParticle1.Enabled = true

		game:GetService("Debris"):AddItem(EffectAttach, 5)				


so("231917750", Torso,2,0.9)
for i = 1,10,0.4 do	
	SetTween(RJW,{C0=RootCF*CFrame.new(-0.5*math.sin(i),0.5*math.cos(i),0)*angles(math.rad(25-4.5*i),math.rad(0),math.rad(36*i*2))},"Quad","InOut",0.05)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-80))},"Quad","InOut",0.15)
SetTween(RW,{C0=CFrame.new(1.5 , 0.65, -.0)*angles(math.rad(160+2*i),math.rad(0),math.rad(30-3*i))},"Quad","Out",0.15)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.15)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0+6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0-6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)

	--SetTween(head,{CFrame=RootPart.CFrame*CF(0,  0,-1)*angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))},"Quad","InOut",0.05)	
	
	
	
		SetTween(thejoint,{C0=CFrame.new(0,-i*2,i/2)},"Quad","InOut",0.05)
		
		risingnum = risingnum+75
		if risingnum > 180 then risingnum = -180 print(1) end
		if risingnum > -45 and  risingnum < 45 then
				BulletHitEffectSpawn(head.CFrame,"ShockWave")
				so("471882019", head,3,2.5)
	end
Swait()

				

 end	
 SpawnedParticle1.Enabled = false

				coroutine.resume(coroutine.create(function()
local EffectAttach=Instance.new("Attachment",RightArm)				
EffectAttach.Orientation = Vector3.new(0,0,0)
EffectAttach.Position =  Vector3.new(0,-1,0)
	local	SpawnedParticle1 =  EffectPack.Spark:Clone()
            SpawnedParticle1.Parent = EffectAttach
          SpawnedParticle1:Emit(1)

		game:GetService("Debris"):AddItem(EffectAttach, 2)				
		end))
				coroutine.resume(coroutine.create(function()
local EffectAttach=Instance.new("Attachment",LeftArm)				
EffectAttach.Orientation = Vector3.new(0,0,0)
EffectAttach.Position =  Vector3.new(0,-1,0)
	local	SpawnedParticle1 =  EffectPack.Spark:Clone()
            SpawnedParticle1.Parent = EffectAttach
          SpawnedParticle1:Emit(1)

		game:GetService("Debris"):AddItem(EffectAttach, 2)				
		end))
	so("782353117", Torso,2,0.9)
so("588738949", RightArm,3,math.random(90,110)/100)
so("588738949", LeftArm,3,math.random(90,110)/100)
	SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(-65),math.rad(0),math.rad(-0))},"Back","Out",0.3)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(65),math.rad(0),math.rad(0))},"Back","Out",0.3)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(90),math.rad(0),math.rad(90))},"Back","Out",0.3)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(90),math.rad(0),math.rad(-90))},"Back","Out",0.3)
SetTween(RH,{C0=CFrame.new(.5, -.7, -.2)*angles(math.rad(-40),math.rad(0),math.rad(0))},"Back","Out",0.3)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-30),math.rad(0),math.rad(0))},"Back","Out",0.3)

		SetTween(thejoint,{C0=CFrame.new(0,-30,5)},"Back","Out",0.6)
	
for i = 1,3 do 
	--SetTween(head,{CFrame=RootPart.CFrame*CF(0,  0,-6)*angles(mr(0),mr(180),mr(0))},"Quad","Out",0.1)	

Swait(0.1*30)
end






for i = 1,2.5,.225 do	
	SetTween(RJW,{C0=RootCF*CFrame.new(0,2+(-0.75*i),20-1.8*i)*angles(math.rad(15+30*i*2),math.rad(0),math.rad(-0))},"Quad","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-25),math.rad(0),math.rad(0))},"Quad","Out",0.3)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(170),math.rad(0),math.rad(90-(90/2.0)*i))},"Quad","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(170),math.rad(0),math.rad(-90+(90/2.0)*i))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(40),math.rad(0),math.rad(0))},"Quad","Out",0.3)
SetTween(LH,{C0=CFrame.new(-.5, -1, -0)*angles(math.rad(40),math.rad(0),math.rad(0))},"Quad","Out",0.3)
Swait()
	
		SetTween(thejoint,{C0=CFrame.new(0,-(20-1.8*i),13-1.2*i)},"Quad","Out",0.2)
	
 end
	so("231917750", Torso,5,0.9)
local EffectAttach2=Instance.new("Attachment",Torso)				
EffectAttach2.Orientation = Vector3.new(0,0,0)
EffectAttach2.Position =  Vector3.new(0,0,0)
	local	SpawnedParticle2 =  EffectPack.SmashSmoke:Clone()
            SpawnedParticle2.Parent = EffectAttach2
          SpawnedParticle2.Enabled = true

		game:GetService("Debris"):AddItem(EffectAttach2, 7)				



	
	coroutine.resume(coroutine.create(function()	
local parsave = c.Parent
c.Parent = Effects
  local  hitground,hitgp,dir = rayCast(Torso.Position, CFrame.new(Torso.Position,(RootPart.CFrame*CF(0,  -4,-10)).p).lookVector, 54, Character)
c.Parent = parsave
	SetTween(head,{CFrame=cf(hitgp-VT(0,0,0),Torso.Position)*angles(mr(0),mr(180),mr(-45))},"Quad","In",0.3) Swait(.3*30)	so("231917744", head,4,1.25) BulletHitEffectSpawn(CF(hitgp,hitgp+dir),"Explode") end))	
			coroutine.resume(coroutine.create(function()	
				Swait(0.3*30)
				--[[]]
			end))				
		
					SetTween(thejoint,{C0=CFrame.new(0,0,27)},"Quad","In",0.3)
	SetTween(RJW,{C0=RootCF*CFrame.new(0,-0,-.5)*angles(math.rad(85),math.rad(0),math.rad(-0))},"Quad","Out",0.2)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-65),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(130),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(130),math.rad(0),math.rad(-0))},"Back","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(-25),math.rad(0),math.rad(0))},"Back","Out",0.2)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-25),math.rad(0),math.rad(0))},"Back","Out",0.2)
Swait(0.3*30)
	
  SpawnedParticle2.Enabled = false
	SetTween(RJW,{C0=RootCF*CFrame.new(0,-0,0)*angles(math.rad(-0),math.rad(0),math.rad(-0))},"Quad","Out",0.25)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(35),math.rad(0),math.rad(0))},"Back","Out",0.25)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(30),math.rad(0),math.rad(30))},"Back","Out",0.25)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(30),math.rad(0),math.rad(-30))},"Back","Out",0.25)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(10),math.rad(0),math.rad(0))},"Back","Out",0.25)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(-10),math.rad(0),math.rad(0))},"Back","Out",0.25)
Swait(0.25*30)
	TheFlyHandle:Destroy()		
	
	
	attack = false	
----------------------------------------------------------------------------------------------------------------------------------

	




		
	end
	
	end	
	end		
local combothingy = TheGunHandle.Touched:connect(onTouch)	
Swait(.5*30)
if TheGunHandle.Parent == Effects then	
	combothingy:disconnect()
	TheGunHandle:Destroy()
	attack = false
	end
while true do Swait()
	
if attack == false then 
	break
end	
	
end	
	print("aaaaaaaaaaaaaaaaaa")
	combothingy:disconnect()	
		Humanoid.JumpPower = 60	
	Humanoid.WalkSpeed=16	
	
	
	

end




function Attack6()
	
	for i, v in pairs(GatherAllInstances(Effects)) do
	if v.Name == "Zombie" then
		v.Parent:Destroy()
	end
	end
end

	local NewInstance = function(instance,parent,properties)
		local inst = Instance.new(instance,parent)
		if(properties)then
			for i,v in next, properties do
				pcall(function() inst[i] = v end)
			end
		end
		return inst;
	end

function chatfunc(text)
		coroutine.wrap(function()
			if(Character:FindFirstChild'ChatGUI')then Character.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Character,{Name='ChatGUI',Size=UDim2.new(0,100,0,40),StudsOffset=Vector3.new(0,2.753,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=MAINRUINCOLOR.Color,TextStrokeColor3=Color3.new(0,0,0),BorderSizePixel=0,Font=Enum.Font.SourceSansBold,TextSize=28,TextStrokeTransparency=0,Size=UDim2.new(1,0,.5,0)})
		coroutine.resume(coroutine.create(function()
			repeat Swait()
			--lol
			until Txt.Transparency > 1
			end))
			for i = 1, #text do
				delay(i/25, function()
				so("131238032", Head,5, math.random(20,32)/35)
					Txt.Text = text:sub(1,i)
				end)
			end
			delay((#text/25)+2.6, function()
				wait(0.2)
            for i = 1, 15 do
	       Swait()
	       Txt.TextTransparency = Txt.TextTransparency + 1/15
	       Txt.TextStrokeTransparency = Txt.TextStrokeTransparency + 1/15
            end
			end)
			delay((#text/25)+3, function()
				BBG:destroy()
			end)
		end)()
end

function ClickCombo()
if Anim == "Fall" or Anim == "Jump" then
if Combo == 0 then		
--DownAT()	
end
else
	if agresive == false then				
if Combo == 0 then
AT1()	
Combo = 1
elseif Combo == 1 then
AT2()	
Combo = 2	
elseif Combo == 2 then
AT3()
Combo = 0	
elseif Combo == 3 then
Combo = 0	
ClickCombo()	
end

else
if Combo == 0 then
AT4()	
Combo = 1
elseif Combo == 1 then
AT5()	
Combo = 2	
elseif Combo == 2 then
AT6()
Combo = 3	
elseif Combo == 3 then
AT7()
Combo = 0	
end

end
end
end
chatfunc("Advanced Neko Script V.2 (SAFE)")




local Hold = false


Button1DownF=function()

	Hold= true
	while Hold == true do
	if attack == false then
ClickCombo()
	else
		
	end Swait()
	end
	 
	

	



	
end





Button1UpF=function()

if Hold==true then

Hold = false

end	
	
end

	
	
	KeyUpF=function(key)


	
end

KeyDownF=function(key)
key = key:lower()
if  key == "f"   and attack == false then
--Attack1()
if agresive == false then 
SetTween(RCW,{C0=CF(0,-.75,0)},"Quad","Out",.5)
SetTween(LCW,{C0=CF(0,-.75,0)},"Quad","Out",.5)
agresive= true
so("3051417649", RightArm,1.5, .8)
so("3051417649", LeftArm,1.5, .8)
so("418252437", Head,5, math.random(20,32)/35)
chatfunc("Claws: ON")
lastid= "http://www.roblox.com/asset/?id=1228696343"
else
	SetTween(RCW,{C0=CF(0,-0,0)},"Quad","In",.5)
SetTween(LCW,{C0=CF(0,-0,0)},"Quad","In",.5)
agresive= false
so("3051417791", RightArm,1.5, .8)
so("3051417791", LeftArm,1.5, .8)
chatfunc("Claws: OFF")
lastid= "http://www.roblox.com/asset/?id=876542935"
end

end
if  key == "r"   and attack == false then


attack = true 
local laying = true
while laying == true do
	

SetTween(RJW,{C0=RootCF*CFrame.new(0,0,-2.20)*angles(math.rad(75),math.rad(5* math.cos(sine / 8 )),math.rad(5* math.cos(sine / 8 )))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-60),math.rad(15* math.sin(sine / 8 )),math.rad(0))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1 , 1.2, -.9)*angles(math.rad(250),math.rad(5* math.cos(sine / 8 )),math.rad(-15+5* math.cos(sine / 8 )))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1, 1.2, -.9)*angles(math.rad(250),math.rad(5* math.cos(sine / 8 )),math.rad(15+5* math.cos(sine / 8 )))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -.9-.1* math.cos(sine / 8 ), -.4+.4* math.cos(sine / 8 ))*angles(math.rad(-50+35* math.cos(sine / 8 )),math.rad(5* math.cos(sine / 8 )),math.rad(-15* math.cos(sine / 8 )))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -.9+.1* math.cos(sine / 8 ), -.4-.4* math.cos(sine / 8 ))*angles(math.rad(-50-35* math.cos(sine / 8 )),math.rad(5* math.cos(sine / 8 )),math.rad(-15* math.cos(sine / 8 )))},"Quad","InOut",0.1)

	SetTween(tailw,{C0=CF(-.2* math.cos(sine / 8 ),0,.30+.15* math.sin(sine / 4 ))*ANGLES(mr(80+10* math.sin(sine / 4 )),mr(10* math.cos(sine / 8 )),mr(10-30* math.cos(sine / 8 )))},"Quad","In",.1)
	Swait()
	if (Humanoid.MoveDirection * Vector3.new(1, 0, 1)).magnitude > .5 then
	laying = false	
	end
end


attack = false


end
if  key == "z"   and attack == false then
Attack1()
end
if  key == "x"   and attack == false then
Attack2()
end
if  key == "c"   and attack == false then
Attack3()
end
if  key == "v"   and attack == false then
--Attack4()
end
if  key == "f"   and attack == false then
--Attack5()
end
--if  key == "y"   and attack == false then
--joke()
--end

--just no

if  key == "t"   and attack == false then
--Tuant()
attack = true

SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(30))},"Back","Out",0.3)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-30))},"Back","Out",0.3)
SetTween(RW,{C0=CFrame.new(1.3 , 0.5, -.0)*angles(math.rad(120),math.rad(0),math.rad(-40))},"Back","Out",0.3)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.3)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.3)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Back","Out",0.3)	
Swait(.3*30)	

chatfunc("^v^")
so("3051419970", Character,4, .9)
change = 4.3
for i = 1,4,0.1 do 
	
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,-.1-.05* math.cos(sine / 8))*angles(math.rad(1+1* math.cos(sine / 8)),math.rad(0),math.rad(30+1* math.cos(sine / 8)))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-30+1* math.cos(sine / 8)))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.3 , 0.5, -.0)*angles(math.rad(120),math.rad(0),math.rad(-40))},"Quad","InOut",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(RH,{C0=CFrame.new(.5, -.95+.05* math.cos(sine / 8), -.2+.05* math.cos(sine / 8))*angles(math.rad(-10+1* math.cos(sine / 8)),math.rad(25* math.cos(sine / 16)),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -.95+.05* math.cos(sine / 8), 0)*angles(math.rad(1+1* math.cos(sine / 8)),math.rad(0),math.rad(0))},"Quad","InOut",0.1)	
Swait()	
end
attack = false
end
if  key == "p"   and attack == false  and Player.Name=="123jl123" then
if mememode == false then
	mememode=true
	
	--so("1499015636", Character,3, 1)
	lastid= "http://www.roblox.com/asset/?id=876542935"








 


lastsongpos = 0
s2.TimePosition = lastsongpos
	
	
else
	mememode=false
	CurId=CurId-1
	KeyDownF("n")
	
end
end


if  key == "0"  then
if isruning == false then
isruning=true	
end
end






	if key == "m" then	
	
	if playsong == true then
playsong = false	
	s2:stop()	
	elseif playsong == false then
playsong = true	

	
	s2:play()				
	end
					
	end



	if key == "n" and mememode == false then	






CurId = CurId + 1
		
if CurId > 5 then
CurId = 1	

end
chatfunc("now playing song Nr"..CurId)
if CurId == 1 then
lastid= "http://www.roblox.com/asset/?id=876316256"
elseif CurId == 2 then
lastid= "http://www.roblox.com/asset/?id=148453883"
elseif CurId == 3 then
lastid= "http://www.roblox.com/asset/?id=2899621215"
elseif CurId == 4 then
lastid= "http://www.roblox.com/asset/?id=256006025"
elseif CurId == 5 then
lastid= "http://www.roblox.com/asset/?id=396979089"

elseif CurId == 6 then
lastid= "http://www.roblox.com/asset/?id=968322964"



end 


lastsongpos = 0
s2.TimePosition = lastsongpos
	
					
	end


end

 Humanoid.HealthChanged:connect(function() GainCharge(Humanoid) end) 				
local event = Instance.new("BindableEvent")
coroutine.resume(coroutine.create(function()
while true do 
    event.Event:Connect(function()return;end)
	sine = sine + change
    hitfloor = rayCast(RootPart.Position, CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0)).lookVector, 4, Character)
if Character:FindFirstChild("Sound") then
Character:FindFirstChild("Sound"):Destroy()	
end
  local torvel = (Humanoid.MoveDirection * Vector3.new(1, 0, 1)).magnitude
    local velderp = RootPart.Velocity.y
if RootPart.Velocity.y > 1 and hitfloor == nil then
Anim = "Jump"

elseif RootPart.Velocity.y < -1 and hitfloor == nil then
Anim = "Fall"
elseif Humanoid.Sit == true then
Anim = "Sit"	
elseif torvel < .5 and hitfloor ~= nil  then
Anim = "Idle"
elseif torvel > .5 and  hitfloor ~= nil  then

Anim = "Walk"




else
Anim = ""
	
end 


local Ccf=RootPart.CFrame
--warn(Humanoid.MoveDirection*RootPart.CFrame.lookVector)
local Walktest1 = Humanoid.MoveDirection*Ccf.LookVector
local Walktest2 = Humanoid.MoveDirection*Ccf.RightVector
--warn(Walktest1.Z.."/"..Walktest1.X)
--warn(Walktest2.Z.."/"..Walktest2.X)
forWFB = Walktest1.X+Walktest1.Z
forWRL = Walktest2.X+Walktest2.Z





--print(Humanoid.MoveDirection)
--warn(Torso.CFrame.lookVector)



coroutine.resume(coroutine.create(function()
	

	if s2.Parent == nil or s2 == nil  then

s2 = s2c:Clone()
s2.Parent = Torso
	s2.Name = "BGMusic"
--	s2.SoundId = lastid
	s2.Pitch = 1
	s2.Volume = 1.5
	s2.Looped = true
	s2.archivable = false
	s2.TimePosition = lastsongpos
	if playsong == true then
	s2:play()		
	elseif playsong == false then
	s2:stop()			
	end
	
	
	else
lastsongpos=s2.TimePosition		
	s2.Pitch = 1
	
	s2.Volume = 1.5

s2.Looped = true
s2.SoundId = lastid
s2.EmitterSize = 30
	end
	
	
	
end))




inairvel=torvel*1

--forWRL
if inairvel > 30 then
inairvel=30	
end
inairvel=inairvel/50*2



if attack == false then
if Anim == "Jump" then
		change = 0.60*2
SetTween(RJW,{C0=RootCF* cn(0, 0 + (0.0395/2) * math.cos(sine / 8), -0.1 + 0.0395 * math.cos(sine / 8)) * angles(math.rad(-6.5 - 1.5 * math.cos(sine / 8))+(inairvel*forWFB)/2, math.rad(0)-(inairvel*forWRL)/2, math.rad(0))},"Quad","Out",0.25)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(-26.5 + 2.5 * math.cos(sine / 8)), math.rad(0), math.rad(-0))},"Quad","Out",0.25)
SetTween(RW,{C0=cf(1.4 + .05 * math.cos(sine / 8) , 0.5 + .05 * math.cos(sine / 8), .0) * angles(math.rad(140 - 2 * math.cos(sine / 8 )), math.rad(-5), math.rad(8 + 4 * math.cos(sine / 8)))},"Quad","Out",0.2)
SetTween(LW,{C0=cf(-1.4 + .05 * math.cos(sine / 8), 0.5 + .05 * math.cos(sine / 8), .0) * angles(math.rad(140 - 2 * math.cos(sine / 8 )), math.rad(5), math.rad(-8 - 4 * math.cos(sine / 8 )))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -0.85+ .05 * math.cos(sine / 15), -.2) * CFrame.Angles(math.rad(-15 -1* math.cos(sine / 10)),math.rad(0),math.rad(0))},"Quad","InOut",0.075)
SetTween(LH,{C0=CFrame.new(-.5, -0.35+ .05 * math.cos(sine / 15), -.4) * CFrame.Angles(math.rad(-25 +1* math.cos(sine / 10)),math.rad(0),math.rad(0))},"Quad","InOut",0.075)


				
elseif Anim == "Fall" then 
		change = 0.60*2
SetTween(RJW,{C0=RootCF*cn(0, 0 + (0.0395/2) * math.cos(sine / 8), -0.5 + 0.0395 * math.cos(sine / 8)) * angles(math.rad(5.5 - 1.5 * math.cos(sine / 8))-(inairvel*forWFB)/2, math.rad(0)+(inairvel*forWRL)/2, math.rad(0))},"Quad","Out",0.35)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(26.5 + 2.5 * math.cos(sine / 8)), math.rad(0), math.rad(-0))},"Quad","Out",0.25)
SetTween(RW,{C0=cf(1.4 + .05 * math.cos(sine / 8) , 0.5 + .05 * math.cos(sine / 8), .0) * angles(math.rad(105 - 2 * math.cos(sine / 8 )), math.rad(-15), math.rad(80 + 4 * math.cos(sine / 8)))},"Quad","Out",0.2)
SetTween(LW,{C0=cf(-1.4 + .05 * math.cos(sine / 8), 0.5 + .05 * math.cos(sine / 8), .0) * angles(math.rad(105 - 2 * math.cos(sine / 8 )), math.rad(15), math.rad(-80 - 4 * math.cos(sine / 8 )))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -0.15+ .05 * math.cos(sine / 15), -.4) * CFrame.Angles(math.rad(-15 -1* math.cos(sine / 10)),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -0.55+ .05 * math.cos(sine / 15), -.4) * CFrame.Angles(math.rad(-0 +1* math.cos(sine / 10)),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
	

	
elseif Anim == "Idle" then
	
	
	local dahspeed=1
if attack == true and mememode == true then
	dahspeed=5
end



if agresive == false then

				change = (0.60*1.75)*dahspeed
	Humanoid.JumpPower = 60	
	Humanoid.WalkSpeed=16	
	
	
		
local ADNum = 0	
SetTween(RJW,{C0=RootCF*cn(0, 0, -0.1 + 0.0395 * math.cos(sine / 8 +ADNum* math.cos(sine / 8*2))) * angles(math.rad(1.5 - 1 * math.cos(sine / 8)), math.rad((0 + 0* math.cos(sine / 8)/20)), math.rad(-20))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*angles(math.rad(6.5 - 3.5 * math.sin(sine / 8 +ADNum* math.cos(sine / 8*2))), math.rad(2.5-5.5 * math.cos(sine / 16)), math.rad(20 - 6.5 * math.cos(sine / 15 +.4* math.cos(sine / 10))))},"Quad","InOut",0.1)
SetTween(RW,{C0=cf(1 + .0 * math.cos(sine / 8) , 0.5 + .05 * math.cos(sine / 8), 0.5) * angles(math.rad(0 + 3 * math.sin(sine / 8 )), math.rad(-5), math.rad(-15 + 4 * math.cos(sine / 8)))},"Quad","Out",0.2)
SetTween(LW,{C0=cf(-1 + .0 * math.cos(sine / 8), 0.5 + .05 * math.cos(sine / 8), 0.5) * angles(math.rad(0 + 3 * math.sin(sine / 8 )), math.rad(5), math.rad(15 - 4 * math.cos(sine / 8 )))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -0.95- .04 * math.cos(sine / 8 +ADNum* math.cos(sine / 8*2)), 0) * CFrame.Angles(math.rad(0 - 1 * math.cos(sine / 8)),math.rad(0),math.rad(-9- 0.0 * math.cos(sine / 8)))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -0.95- .04 * math.cos(sine / 8 +ADNum* math.cos(sine / 8*2)), 0) * CFrame.Angles(math.rad(0 - 1 * math.cos(sine / 8)),math.rad(20),math.rad(9- 0.0 * math.cos(sine / 8)))},"Quad","InOut",0.1)
else


				change = (0.60*1.75)*dahspeed
	Humanoid.JumpPower = 60	
	Humanoid.WalkSpeed=16	
	
	
		
local ADNum = 0	
SetTween(RJW,{C0=RootCF*cn(0, 0, -0.1 + 0.0395 * math.cos(sine / 8 +ADNum* math.cos(sine / 8*2))) * angles(math.rad(1.5 - 1 * math.cos(sine / 8)), math.rad((0 + 0* math.cos(sine / 8)/20)), math.rad(0))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*angles(math.rad(6.5 - 3.5 * math.sin(sine / 8 +ADNum* math.cos(sine / 8*2))), math.rad(2.5-5.5 * math.cos(sine / 16)), math.rad(20 - 6.5 * math.cos(sine / 15 +.4* math.cos(sine / 10))))},"Quad","InOut",0.1)
SetTween(RW,{C0=cf(1.45 + .0 * math.cos(sine / 8) , 0.5 + .05 * math.cos(sine / 8), 0) * angles(math.rad(0 + 3 * math.sin(sine / 8 )), math.rad(-5), math.rad(15 + 4 * math.cos(sine / 8)))},"Quad","Out",0.2)
SetTween(LW,{C0=cf(-1.45 + .0 * math.cos(sine / 8), 0.5 + .05 * math.cos(sine / 8), 0) * angles(math.rad(0 + 3 * math.sin(sine / 8 )), math.rad(5), math.rad(-15 - 4 * math.cos(sine / 8 )))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -0.95- .04 * math.cos(sine / 8 +ADNum* math.cos(sine / 8*2)), 0) * CFrame.Angles(math.rad(0 - 1 * math.cos(sine / 8)),math.rad(0),math.rad(-9- 0.0 * math.cos(sine / 8)))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -0.95- .04 * math.cos(sine / 8 +ADNum* math.cos(sine / 8*2)), 0) * CFrame.Angles(math.rad(0 - 1 * math.cos(sine / 8)),math.rad(0),math.rad(9- 0.0 * math.cos(sine / 8)))},"Quad","InOut",0.1)

end






		 
elseif Anim == "Walk" then
	
	if agresive == false then

local speed=1.0
if mememode == true then
	speed=4
end


	change = 2.4*speed
	Humanoid.JumpPower = 60*speed
	Humanoid.WalkSpeed=16*speed


	local RH2 = cf(-forWRL/7 * math.cos(sine / 8 ),0,forWFB/7 * math.cos(sine / 8 ))*angles(math.rad(-forWFB*30) * math.cos(sine / 8 ),0,math.rad(-forWRL*30) * math.cos(sine / 8 ))
	local LH2 = cf(forWRL/7 * math.cos(sine / 8 ),0,-forWFB/7 * math.cos(sine / 8 ))*angles(math.rad(forWFB*30) * math.cos(sine / 8 ),0,math.rad(forWRL*30) * math.cos(sine / 8 ))

SetTween(RJW,{C0=RootCF*CFrame.new(0, 0 , -0.05 + 0.055 * math.cos(sine / 4) + -math.sin(sine / 4) / 8) * angles(math.rad((forWFB*2 - forWFB  * math.cos(sine / 4))*7), math.rad((-forWRL*2 - -forWRL  * math.cos(sine / 4))*5) , math.rad(8 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0, 0, 0 + 0.025 * math.cos(sine / 4)) * angles(math.rad((-forWFB*1 - -forWFB  * math.cos(sine / 4))*7), math.rad((forWRL*2 - forWRL  * math.cos(sine / 4))*3.5), math.rad(-forWRL*45+-8 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)
SetTween(RW,{C0=cf(1.45 + .0 * math.cos(sine / 8) , 0.5 + forWRL/50* math.cos(sine / 8), 0)   * angles(math.rad(0 + forWFB*15 * math.cos(sine / 8 )), math.rad(0), math.rad(8 + forWRL*5 * math.cos(sine / 8)))},"Quad","Out",WalkAnimMove/speed)
SetTween(LW,{C0=cf(-1.45 + .0 * math.cos(sine / 8), 0.5 + forWRL/50  * math.cos(sine / 8), 0)  * angles(math.rad(0 - forWFB*15 * math.cos(sine / 8 )), math.rad(0), math.rad(-8 - forWRL*5 * math.cos(sine / 8 )))},"Quad","Out",WalkAnimMove/speed)
SetTween(RH,{C0=CFrame.new(.5, -0.85+ .15 * math.sin(sine / 8 ), -.15+.15* math.cos(sine / 8 ))*RH2 * CFrame.Angles(math.rad(0 - 5 * math.cos(sine / 8)),math.rad(0),math.rad(2.5- 0.0 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)
SetTween(LH,{C0=CFrame.new(-.5, -0.85- .15 * math.sin(sine / 8 ), -.15-.15* math.cos(sine / 8 ))*LH2 * CFrame.Angles(math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0),math.rad(-2.5- 0.0 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)

	
	else
	
	
	
	local speed=1.6
if mememode == true then
	speed=4
end


	change = 2.5*speed
	Humanoid.JumpPower = 60*speed
	Humanoid.WalkSpeed=22*speed


	local RH2 = cf(-forWRL/9 * math.cos(sine / 8 ),0,forWFB/7 * math.cos(sine / 8 ))*angles(math.rad(-forWFB*60) * math.cos(sine / 8 ),0,math.rad(-forWRL*25) * math.cos(sine / 8 ))
	local LH2 = cf(forWRL/9 * math.cos(sine / 8 ),0,-forWFB/7 * math.cos(sine / 8 ))*angles(math.rad(forWFB*60) * math.cos(sine / 8 ),0,math.rad(forWRL*25) * math.cos(sine / 8 ))

SetTween(RJW,{C0=RootCF*CFrame.new(0, 0 , -0.05 - 0.1 * math.cos(sine / 4) + -math.sin(sine / 4) / 8) * angles(math.rad(forWFB*25 - -forWFB), math.rad((-forWRL*2 - -forWRL  * math.cos(sine / 4))*0) , math.rad(8 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0, 0, 0 + 0.025 * math.cos(sine / 4)) * angles(math.rad(0), math.rad((forWRL*2 - forWRL  * math.cos(sine / 4))*3.5), math.rad(-forWRL*45+-8 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)
SetTween(RW,{C0=cf(1.5 + .0 * math.cos(sine / 8) , 0.5 + .05 * math.cos(sine / 8), 0) * angles(math.rad(forWFB*-65 - -forWFB), math.rad(-5), math.rad(6 - 6 * math.cos(sine / 8)))},"Quad","Out",0.2)
SetTween(LW,{C0=cf(-1.45 + .0 * math.cos(sine / 8), 0.5 + .05  * math.cos(sine / 8), 0)  * angles(math.rad(forWFB*-65 - -forWFB), math.rad(5), math.rad(-6 +6 * math.cos(sine / 8 )))},"Quad","Out",0.2)
SetTween(RH,{C0=CFrame.new(.5, -0.95+ .25 * math.sin(sine / 8 ), -.1+.25* math.cos(sine / 8 ))*RH2 * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0- 0.0 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)
SetTween(LH,{C0=CFrame.new(-.5, -0.95- .25 * math.sin(sine / 8 ), -.1-.25* math.cos(sine / 8 ))*LH2 * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0- 0.0 * math.cos(sine / 8)))},"Quad","InOut",WalkAnimMove/speed)

		
end
		
	
elseif Anim == "Sit" then	
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(90),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(90),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
	
end
end
if   attack == false and not (agresive==true and Anim == "Walk") then
		SetTween(tailw,{C0=tailc0*CF(0,.2,0)*ANGLES(mr(4+2* math.cos(sine / 8 )),0,mr(20+20* math.cos(sine / 16 )))},"Quad","In",.1)
	
		
end
Swait(Animstep*30)
end
end))

local mouse = Player:GetMouse()

local a = mouse.KeyDown:Connect(KeyDownF)
local b = mouse.KeyUp:Connect(KeyUpF)
local c = mouse.Button1Down:Connect(Button1DownF)

local d = mouse.Button1Up:Connect(Button1UpF)

local e = mouse.Move:Connect(function()
    if mouse.Target then
        Target = mouse.Target
    end
end)
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()event:Fire()for _,v in ipairs({a,b,c,d,e}) do v:Disconnect() end end)
--[[game.Players.LocalPlayer.Character.Humanoid.Ragdoll:Connect(function(state)
    if state == true then game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false) end
end)]]
