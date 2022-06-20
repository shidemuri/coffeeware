getgenv()._reanimate()


------------
--Assassin--
---------------------------------
--By CKbackup (Sugarie Saffron)--
---------------------------------

wait(1/60)
Effects = { }
local Player = game:service'Players'.LocalPlayer
local chara = Player.Character
local Humanoid = chara:FindFirstChildOfClass("Humanoid")
local LeftArm = chara["Left Arm"]
local RightArm = chara["Right Arm"]
local LeftLeg = chara["Left Leg"]
local RightLeg = chara["Right Leg"]
local Head = chara.Head
local Torso = chara.Torso
local Camera = workspace.CurrentCamera
local RootPart = chara.HumanoidRootPart
local RootJoint = RootPart.RootJoint
local attack = false
local Anim = 'Idle'
local attacktype = 1
local delays = false
local play = true
local targetted = nil
local Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local velocity = RootPart.Velocity.y
local sine = 0
local change = 1
local doe = 0
FELOADLIBRARY = {}
loadstring(game:GetObjects("rbxassetid://5209815302")[1].Source)()
local RbxUtility = FELOADLIBRARY
local Create = RbxUtility.Create
local debby = game:GetService("Debris")
Humanoid.WalkSpeed = 16

local currentwep = "Knife"
local healing = false

local pshots = 17
local sshots = 8
local snshots = 10

Humanoid.Animator.Parent = nil
chara.Animate.Parent = nil

local newMotor = function(part0, part1, c0, c1)
local w = Create('Motor'){
Parent = part0,
Part0 = part0,
Part1 = part1,
C0 = c0,
C1 = c1,
}
return w
end

function clerp(a, b, t)
return a:lerp(b, t)
end

RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)

local RW = newMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0)) 
local LW = newMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
local RH = newMotor(Torso, RightLeg, CFrame.new(.5, -2, 0), CFrame.new(0, 0, 0))
local LH = newMotor(Torso, LeftLeg, CFrame.new(-.5, -2, 0), CFrame.new(0, 0, 0))
RootJoint.C1 = CFrame.new(0, 0, 0)
RootJoint.C0 = CFrame.new(0, 0, 0)
Torso.Neck.C1 = CFrame.new(0, 0, 0)
Torso.Neck.C0 = CFrame.new(0, 1.5, 0)

local rarmc1 = RW.C1
local larmc1 = LW.C1
local rlegc1 = RH.C1
local llegc1 = LH.C1

local resetc1 = false

function PlayAnimationFromTable(table, speed, bool)
RootJoint.C0 = clerp(RootJoint.C0, table[1], speed) 
Torso.Neck.C0 = clerp(Torso.Neck.C0, table[2], speed) 
RW.C0 = clerp(RW.C0, table[3], speed) 
LW.C0 = clerp(LW.C0, table[4], speed) 
RH.C0 = clerp(RH.C0, table[5], speed) 
LH.C0 = clerp(LH.C0, table[6], speed) 
if bool == true then
if resetc1 == false then
resetc1 = true
RootJoint.C1 = RootJoint.C1
Torso.Neck.C1 = Torso.Neck.C1
RW.C1 = rarmc1
LW.C1 = larmc1
RH.C1 = rlegc1
LH.C1 = llegc1
end
end
end

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")
frame = 0.03333333333333
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()
local asd = game:GetService("RunService").Heartbeat:connect(function(s, p)
tf = tf + s
if tf >= frame then
if allowframeloss then
script.Heartbeat:Fire()
lastframe = tick()
else
for i = 1, math.floor(tf / frame) do
script.Heartbeat:Fire()
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
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()asd:Disconnect()ArtificialHB:Destroy()end)
function swait(num)
if num == 0 or num == nil then
ArtificialHB.Event:wait()
else
for i = 0, num do
ArtificialHB.Event:wait()
end
end
end

local TargetPoint = Vector3.new()
function getNearestGuy()
--local Distance = nil
--for i, v in pairs(workspace:GetDescendants()) do
--if v:IsA("Model") then
--if v:FindFirstChildOfClass("Humanoid") then
--if v:FindFirstChildOfClass("Humanoid").Health > 0 then
--if v:FindFirstChild("Head") then
--if v ~= chara then
--if Distance ~= nil then
--if (v.Head.Position - RootPart.Position).magnitude <= Distance then
--TargetPoint = v.Head.Position - Vector3.new(0,1.5,0)
--end 
--elseif Distance == nil then
--Distance = (v.Head.Position - RootPart.Position).magnitude
--TargetPoint = v.Head.Position - Vector3.new(0,1.5,0)
--end
--end 
--end 
--end
--end 
--end
--end
end
--[[local mousemoveevent = script:WaitForChild("MouseMoveEvent")
mousemoveevent.OnServerEvent:connect(function(ply,pos,targ)
if ply == Player then
	TargetPoint = pos
end
end)]]
Player:GetMouse().Move:connect(function()
    TargetPoint = Player:GetMouse().Hit.Position
end)

function RemoveOutlines(part)
part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end

function so(id,par,pit,vol)
local sou = Instance.new("Sound", par or workspace)
if par == chara then
sou.Parent = chara.Torso
end
sou.Volume = vol
sou.Pitch = pit or 1
sou.SoundId = "rbxassetid://" .. id
sou.PlayOnRemove = true
sou:Destroy()
end

--This is just for builds--
New = function(Object, Parent, Name, Data)
local Object = Instance.new(Object)
for Index, Value in pairs(Data or {}) do
Object[Index] = Value
end
Object.Parent = Parent
Object.Name = Name
return Object
end

SniperPart = New("Part",chara,"SniperPart",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.299999923, 5.59999752, 1.20000005),CFrame = CFrame.new(12.6994934, 10.8995457, -104.84919, -0.999997199, 0.000127014282, 7.70353145e-05, -0.000136496106, -1.00000858, -7.61961637e-05, 8.27468975e-05, -8.1929189e-05, 0.999997139),CanCollide = false,})
Mesh = New("SpecialMesh",SniperPart,"Mesh",{Scale = Vector3.new(1.5, 1.5, 1.5),MeshId = "http://www.roblox.com/asset?id=71947387",TextureId = "http://www.roblox.com/asset?id=71947339",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",SniperPart,"Weld",{Part0 = SniperPart,Part1 = RightArm,C0 = CFrame.new(0, 0, 0, -1, -3.8146934e-06, 2.64410255e-06, 3.81311042e-06, -1, -1.81502128e-06, 2.6441096e-06, -1.81501105e-06, 1),C1 = CFrame.new(-0.0998973846, -2.69990635, -0.250015259, -1, -7.88987098e-10, -1.34516404e-23, 7.88987098e-10, 1, 3.40985073e-14, -1.34516388e-23, -3.40985073e-14, -1),})
SniperF = New("Part",chara,"SniperF",{Transparency = 1,Transparency = 1,Size = Vector3.new(0.0999997407, 0.100000001, 0.0999999866),CFrame = CFrame.new(12.6998749, 8.04950333, -104.599442, 0.999997199, -0.000123199745, 7.43909914e-05, 0.000132682762, 1.00000858, -7.4381489e-05, -8.01031056e-05, 8.01138667e-05, 0.999997139),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,})
Weld = New("ManualWeld",SniperF,"Weld",{Part0 = SniperF,Part1 = SniperPart,C1 = CFrame.new(0, 2.84999847, 0.249984741, -1, -3.8146934e-06, 2.64410255e-06, 3.81311042e-06, -1, -1.81502128e-06, 2.6441096e-06, -1.81501105e-06, 1),})

ShottyPart = New("Part",chara,"ShottyPart",{FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.300000012, 3, 0.600000024),CFrame = CFrame.new(-14.4535122, 9.59664345, -109.497604, -0.999997258, 0.000102982318, -9.57794546e-05, -0.000112362795, -1.00000811, -0.00097725715, -9.01586318e-05, -0.000982958474, 0.999996722),CanCollide = false,})
Mesh = New("SpecialMesh",ShottyPart,"Mesh",{VertexColor = Vector3.new(2, 2, 2),MeshId = "http://www.roblox.com/asset/?id=71947462",TextureId = "http://www.roblox.com/asset/?id=150079972",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",ShottyPart,"Weld",{Part0 = ShottyPart,Part1 = RightArm,C0 = CFrame.new(0, 0, 0, -1, 2.03055642e-05, -0.00017026384, -2.01518324e-05, -0.999999583, -0.000902848784, -0.000170282117, -0.00090284535, 0.999999642),C1 = CFrame.new(-0.149913788, -2.39947891, -0.197479248, -1, 2.0288815e-05, 0.000126775703, 2.02955143e-05, 1, 5.28392593e-05, -0.000126774627, 5.28418313e-05, -1),})
ShotgunF = New("Part",chara,"ShotgunF",{Transparency = 1,Transparency = 1,Size = Vector3.new(0.0999997407, 0.100000001, 0.0999999866),CFrame = CFrame.new(-14.4533739, 7.94634056, -109.249107, 0.999997258, -0.000123201316, 7.43909841e-05, 0.000132681205, 1.00000846, -7.43815326e-05, -8.01031274e-05, 8.01137649e-05, 0.999997258),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,})
Weld = New("ManualWeld",ShotgunF,"Weld",{Part0 = ShotgunF,Part1 = ShottyPart,C1 = CFrame.new(7.62939453e-06, 1.65004492, 0.25012207, -1, 2.03055642e-05, -0.00017026384, -2.01518324e-05, -0.999999583, -0.000902848784, -0.000170282117, -0.00090284535, 0.999999642),})

PistolPart = New("Part",chara,"PistolPart",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.200000003, 1, 1.60000014),CFrame = CFrame.new(18.0989876, 7.69964027, -101.500366, -0.999996424, 0.000773654203, -0.00101959216, -0.0010287785, 0.000385828374, 1.00000811, 0.00077976333, 0.999996781, -0.000379299192),CanCollide = false,BackSurface = Enum.SurfaceType.Weld,BottomSurface = Enum.SurfaceType.Weld,FrontSurface = Enum.SurfaceType.Weld,LeftSurface = Enum.SurfaceType.Weld,RightSurface = Enum.SurfaceType.Weld,TopSurface = Enum.SurfaceType.Weld,})
Mesh = New("SpecialMesh",PistolPart,"Mesh",{Scale = Vector3.new(2, 2, 2),MeshId = "http://www.roblox.com/asset?id=77882703",TextureId = "http://www.roblox.com/asset?id=77882618",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",PistolPart,"Weld",{Part0 = PistolPart,Part1 = RightArm,C0 = CFrame.new(0, 0, 0, -0.999996424, -0.0010287785, 0.00077976333, 0.000773654203, 0.000385828374, 0.999996781, -0.00101959216, 1.00000811, -0.000379299192),C1 = CFrame.new(-0.198720932, -1.50034809, -0.199378967, -1, -0.00026502274, 0.000159957795, -0.000264997128, 1, 0.000160029536, -0.0001600002, 0.000159987132, -1),})
Pistol2Part = New("Part",chara,"Pistol2Part",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.200000003, 1, 1.60000014),CFrame = CFrame.new(20.7989807, 7.70241833, -101.502472, -0.999996424, 0.000773654203, -0.00101959216, -0.0010287785, 0.000385828374, 1.00000811, 0.00077976333, 0.999996781, -0.000379299192),CanCollide = false,BackSurface = Enum.SurfaceType.Weld,BottomSurface = Enum.SurfaceType.Weld,FrontSurface = Enum.SurfaceType.Weld,LeftSurface = Enum.SurfaceType.Weld,RightSurface = Enum.SurfaceType.Weld,TopSurface = Enum.SurfaceType.Weld,})
Mesh = New("SpecialMesh",Pistol2Part,"Mesh",{Scale = Vector3.new(2, 2, 2),MeshId = "http://www.roblox.com/asset?id=77882703",TextureId = "http://www.roblox.com/asset?id=77882618",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",Pistol2Part,"Weld",{Part0 = Pistol2Part,Part1 = LeftArm,C0 = CFrame.new(0, 0, 0, -0.999999404, -0.000896037673, 0.000699733966, 0.000699321856, 0.000460113079, 0.999999642, -0.00089635927, 0.999999523, -0.000459486182),C1 = CFrame.new(0.101261139, -1.49828005, -0.19770813, -0.999999046, -0.00013233356, 7.98649926e-05, -0.000129168649, 1.00000286, 7.99051195e-05, -7.79679685e-05, 7.79874026e-05, -0.999999046),})
PistolF = New("Part",chara,"PistolF",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000003, 0.199999988, 0.200000003),CFrame = CFrame.new(18.1002274, 6.79980469, -101.100029, -0.999996781, 0.00116357114, 0.000773530744, -0.0011731172, -1.00000811, 0.000386120519, 0.000779943191, 0.000379309029, 0.999996781),CanCollide = false,})
Weld = New("ManualWeld",PistolF,"Weld",{Part0 = PistolF,Part1 = PistolPart,C0 = CFrame.new(0, 0, 0, -0.999999642, -0.00104037486, 0.000699925295, 0.00104033854, -0.999999404, 0.000459507515, 0.000699198456, 0.000460405223, 0.999999642),C1 = CFrame.new(-1.33514404e-05, 0.399993896, -0.899982452, -0.999999404, -0.000896037673, 0.000699733966, 0.000699321856, 0.000460113079, 0.999999642, -0.00089635927, 0.999999523, -0.000459486182),})
Pistol2F = New("Part",chara,"Pistol2F",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000003, 0.199999988, 0.200000003),CFrame = CFrame.new(20.8002224, 6.80258274, -101.102135, -0.999996781, 0.00116357114, 0.000773530744, -0.0011731172, -1.00000811, 0.000386120519, 0.000779943191, 0.000379309029, 0.999996781),CanCollide = false,})
Weld = New("ManualWeld",Pistol2F,"Weld",{Part0 = Pistol2F,Part1 = Pistol2Part,C0 = CFrame.new(0, 0, 0, -0.999999642, -0.00104037486, 0.000699925295, 0.00104033854, -0.999999404, 0.000459507515, 0.000699198456, 0.000460405223, 0.999999642),C1 = CFrame.new(-1.52587891e-05, 0.399993896, -0.899982452, -0.999999404, -0.000896037673, 0.000699733966, 0.000699321856, 0.000460113079, 0.999999642, -0.00089635927, 0.999999523, -0.000459486182),})

Knife = New("Part",chara,"Knife",{BrickColor = BrickColor.new("Really black"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000018, 3, 0.600000024),CFrame = CFrame.new(18.1000671, 8.20049858, -102.599922, 0.999997199, -7.43909914e-05, -0.000123201287, 0.000132681176, 7.43816781e-05, 1.00000858, -8.01031129e-05, -0.999997139, 8.01140704e-05),CanCollide = false,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",Knife,"Mesh",{MeshId = "rbxassetid://121944778",TextureId = "rbxassetid://121944805",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",Knife,"Weld",{Part0 = Knife,Part1 = RightArm,C0 = CFrame.new(0, 0, 0, 1, -1.83178334e-11, -9.29553131e-20, -8.93234474e-20, 1.9826904e-10, -1, 1.83178334e-11, 1, 1.9826904e-10),C1 = CFrame.new(-0.200113297, -0.99965477, 0.900268555, -0.999999046, -0.00013233356, 7.98649926e-05, -0.000129168649, 1.00000286, 7.99051195e-05, -7.79679685e-05, 7.79874026e-05, -0.999999046),})
Knife2 = New("Part",chara,"Knife2",{BrickColor = BrickColor.new("Really black"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000018, 3, 0.600000024),CFrame = CFrame.new(20.800066, 8.20085621, -102.600151, 0.999997199, -7.43909914e-05, -0.000123201287, 0.000132681176, 7.43816781e-05, 1.00000858, -8.01031129e-05, -0.999997139, 8.01140704e-05),CanCollide = false,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",Knife2,"Mesh",{MeshId = "rbxassetid://121944778",TextureId = "rbxassetid://121944805",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",Knife2,"Weld",{Part0 = Knife2,Part1 = LeftArm,C0 = CFrame.new(0, 0, 0, 1, -1.83178334e-11, -9.29553131e-20, -8.93234474e-20, 1.9826904e-10, -1, 1.83178334e-11, 1, 1.9826904e-10),C1 = CFrame.new(0.0998783112, -1.00001431, 0.900054932, -0.999999046, -0.00013233356, 7.98649926e-05, -0.000129168649, 1.00000286, 7.99051195e-05, -7.79679685e-05, 7.79874026e-05, -0.999999046),})

SheathPart = New("Part",chara,"SheathPart",{BrickColor = BrickColor.new("Really black"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(-4.70037603, 7.11581182, -105.941528, 0.000411997637, 0.000128002648, 1, 0.765914023, -0.642943084, -0.00023325636, 0.642943025, 0.765914023, -0.000362930034),CanCollide = false,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",SheathPart,"Mesh",{Scale = Vector3.new(0.419999987, 2.5, 5),MeshId = "rbxassetid://504776834",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",SheathPart,"Weld",{Part0 = SheathPart,Part1 = LeftLeg,C0 = CFrame.new(0, 0, 0, 0.000411997637, 0.765914023, 0.642943025, 0.000128002648, -0.642943084, 0.765914023, 1, -0.00023325636, -0.000362930034),C1 = CFrame.new(-0.399157524, -0.0849089622, 0.44103241, -1, -0.000285560207, 0.000172345346, -0.000285530492, 1, 0.000172423926, -0.000172394575, 0.000172374697, -1),})
KnifeH = New("Part",chara,"KnifeH",{BrickColor = BrickColor.new("Really black"),FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(-4.70015621, 7.43445921, -105.543449, 1, -0.000408680877, -0.00014000498, -0.000222999661, -0.765914917, 0.642942011, -0.000369990012, -0.642941952, -0.765914917),CanCollide = false,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",KnifeH,"Mesh",{MeshId = "rbxassetid://121944778",TextureId = "rbxassetid://121944805",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",KnifeH,"Weld",{Part0 = KnifeH,Part1 = LeftLeg,C0 = CFrame.new(0, 0, 0, 1, -0.000222999661, -0.000369990012, -0.000408680877, -0.765914917, -0.642941952, -0.00014000498, 0.642942011, -0.765914917),C1 = CFrame.new(-0.399399757, 0.23380661, 0.043006897, -1, -0.000285560207, 0.000172345346, -0.000285530492, 1, 0.000172423926, -0.000172394575, 0.000172374697, -1),})
PistolH = New("Part",chara,"PistolH",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(-6.49966383, 7.78175831, -105.575996, -1, 0.000318881212, -5.09696583e-05, -0.000277000305, -0.765891254, 0.642970145, 0.000165993857, 0.642970145, 0.765891314),CanCollide = false,BackSurface = Enum.SurfaceType.Weld,BottomSurface = Enum.SurfaceType.Weld,FrontSurface = Enum.SurfaceType.Weld,LeftSurface = Enum.SurfaceType.Weld,RightSurface = Enum.SurfaceType.Weld,TopSurface = Enum.SurfaceType.Weld,})
Mesh = New("SpecialMesh",PistolH,"Mesh",{Scale = Vector3.new(2, 2, 2),MeshId = "http://www.roblox.com/asset?id=77882703",TextureId = "http://www.roblox.com/asset?id=77882618",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",PistolH,"Weld",{Part0 = PistolH,Part1 = RightLeg,C0 = CFrame.new(0, 0, 0, -1, -0.000277000305, 0.000165993857, 0.000318881212, -0.765891254, 0.642970145, -5.09696583e-05, 0.642970145, 0.765891314),C1 = CFrame.new(0.399995804, 0.581613064, 0.0758972168, -1, -0.000285560207, 0.000172345346, -0.000285530492, 1, 0.000172423926, -0.000172394575, 0.000172374697, -1),})
ShottyH = New("Part",chara,"ShottyH",{FormFactor = Enum.FormFactor.Custom,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(-5.59976482, 8.30091476, -106.050423, 9.99167696e-06, 1, 3.19996834e-05, 5.30095167e-05, -3.20002146e-05, 1, 1, -9.98998075e-06, -5.30098368e-05),CanCollide = false,})
Mesh = New("SpecialMesh",ShottyH,"Mesh",{VertexColor = Vector3.new(2, 2, 2),MeshId = "http://www.roblox.com/asset/?id=71947462",TextureId = "http://www.roblox.com/asset/?id=150079972",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",ShottyH,"Weld",{Part0 = ShottyH,Part1 = Torso,C0 = CFrame.new(0, 0, 0, 9.99167696e-06, 5.30095167e-05, 1, 1, -3.20002146e-05, -9.98998075e-06, 3.19996834e-05, 1, -5.30098368e-05),C1 = CFrame.new(-8.48770142e-05, -0.899636269, 0.55027771, -1, -0.000285560207, 0.000172345346, -0.000285530492, 1, 0.000172423926, -0.000172394575, 0.000172374697, -1),})
SniperH = New("Part",chara,"SniperH",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(-5.47727585, 9.23893642, -106.150467, 0.000373998424, 0.865912914, 0.500194848, 0.000229012818, -0.500194967, 0.865912855, 0.999999881, -0.000209299018, -0.000385377265),CanCollide = false,})
Mesh = New("SpecialMesh",SniperH,"Mesh",{Scale = Vector3.new(1.5, 1.5, 1.5),MeshId = "http://www.roblox.com/asset?id=71947387",TextureId = "http://www.roblox.com/asset?id=71947339",MeshType = Enum.MeshType.FileMesh,})
Weld = New("ManualWeld",SniperH,"Weld",{Part0 = SniperH,Part1 = Torso,C0 = CFrame.new(0, 0, 0, 0.000373998424, 0.000229012818, 0.999999881, 0.865912914, -0.500194967, -0.000209299018, 0.500194848, 0.865912855, -0.000385377265),C1 = CFrame.new(-0.122859001, 0.0383329391, 0.650466919, -1, -0.000285560207, 0.000172345346, -0.000285530492, 1, 0.000172423926, -0.000172394575, 0.000172374697, -1),})

Knife2.Transparency = 1
Pistol2Part.Transparency = 1
PistolPart.Transparency = 1
ShottyPart.Transparency = 1
SniperPart.Transparency = 1
KnifeH.Transparency = 1

function CreateTrailObj(parent,color1,color2,ofsx,ofsz)
local Att1 =  New("Attachment",parent,"Att1",{Position = Vector3.new(ofsx,parent.Size.Y/2,ofsz)})
local Att2 =  New("Attachment",parent,"Att2",{Position = Vector3.new(ofsx,-(parent.Size.Y/2),ofsz)})
local TEff = New("Trail",parent,"TrailEff",{Color = ColorSequence.new({ColorSequenceKeypoint.new(0,BrickColor.new(color1).Color),ColorSequenceKeypoint.new(1,BrickColor.new(color2).Color)}),Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,.5),NumberSequenceKeypoint.new(1,1)}),Attachment0 = Att1,Attachment1 = Att2,Enabled = false,Lifetime = .5,MinLength = .001})
return TEff
end

LLTr = CreateTrailObj(LeftLeg,"White","White",0,0)
RLTr = CreateTrailObj(RightLeg,"White","White",0,0)
LATr = CreateTrailObj(LeftArm,"White","White",0,0)
RATr = CreateTrailObj(RightArm,"White","White",0,0)

local p1mit = Instance.new("ParticleEmitter",Knife)
p1mit.Texture = "rbxasset://textures/particles/fire_main.dds"
p1mit.Color = ColorSequence.new(Color3.new(.6,0,0))
p1mit.Size = NumberSequence.new(1,0)
p1mit.Lifetime = NumberRange.new(2)
p1mit.Rate = 0
p1mit.Enabled = false
p1mit.Acceleration = Vector3.new(0,-10,0)
p1mit.Rotation = NumberRange.new(0,359)
p1mit.Speed = NumberRange.new(0)
p1mit.Enabled = false
local p2mit = p1mit:Clone()
p2mit.Parent = Knife2

local tr1
local tr2
spawn(function()
local Att1 =  New("Attachment",Knife,"Att1",{Position = Vector3.new(0,1.3,.2)})
local Att2 =  New("Attachment",Knife,"Att2",{Position = Vector3.new(0,-.5,.2)})
tr1 = New("Trail",Knife,"TrailEff",{Color = ColorSequence.new(Color3.new(.8,.8,.8)),Transparency = NumberSequence.new(0,1),Attachment0 = Att1,Attachment1 = Att2,Enabled = false,Lifetime = .5,MinLength = .001})
end)

spawn(function()
local Att1 =  New("Attachment",Knife2,"Att1",{Position = Vector3.new(0,1.3,.2)})
local Att2 =  New("Attachment",Knife2,"Att2",{Position = Vector3.new(0,-.5,.2)})
tr2 = New("Trail",Knife2,"TrailEff",{Color = ColorSequence.new(Color3.new(.8,.8,.8)),Transparency = NumberSequence.new(0,1),Attachment0 = Att1,Attachment1 = Att2,Enabled = false,Lifetime = .5,MinLength = .001})
end)

local scr = Instance.new("ScreenGui",Player:FindFirstChildOfClass("PlayerGui"))
local fr1 = Instance.new("Frame",scr)
fr1.AnchorPoint = Vector2.new(1,.5)
fr1.BackgroundTransparency = 1
fr1.BorderSizePixel = 0
fr1.Position = UDim2.new(1,0,.6,0)
fr1.Size = UDim2.new(0,150,0,200)
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
scr:Destroy()
end)

local imgbase = Instance.new("ImageLabel")
imgbase.BackgroundTransparency = 1
imgbase.BorderSizePixel = 0
imgbase.Size = UDim2.new(0,50,0,50)
imgbase.ImageColor3 = Color3.new(.3,.3,.3)

local img1 = imgbase:Clone()
img1.Parent = fr1
img1.Image = "rbxassetid://949752421"
img1.ImageColor3 = Color3.new(1,1,1)
local img2 = imgbase:Clone()
img2.Parent = fr1
img2.Position = UDim2.new(0,0,0,50)
img2.Image = "rbxassetid://97886725"
local img3 = imgbase:Clone()
img3.Parent = fr1
img3.Position = UDim2.new(0,0,0,100)
img3.Image = "rbxassetid://31929291"
local img4 = imgbase:Clone()
img4.Parent = fr1
img4.Position = UDim2.new(0,0,0,150)
img4.Image = "rbxassetid://39422857"

imgbase:Destroy()

local txtbase = Instance.new("TextLabel")
txtbase.BackgroundTransparency = 1
txtbase.BorderSizePixel = 0
txtbase.Size = UDim2.new(0,100,0,50)
txtbase.Font = "Highway"
txtbase.TextSize = 30
txtbase.TextColor3 = Color3.new(.3,.3,.3)
txtbase.TextStrokeColor3 = Color3.new(0,0,0)
txtbase.TextStrokeTransparency = 0

local txt1 = txtbase:Clone()
txt1.Parent = fr1
txt1.Text = "â"
txt1.TextSize = 60
txt1.TextColor3 = Color3.new(1,1,1)
txt1.Position = UDim2.new(0,50,0,0)
local txt2 = txtbase:Clone()
txt2.Parent = fr1
txt2.Text = "17/17"
txt2.Position = UDim2.new(0,50,0,50)
local txt3 = txtbase:Clone()
txt3.Parent = fr1
txt3.Text = "8/8"
txt3.Position = UDim2.new(0,50,0,100)
local txt4 = txtbase:Clone()
txt4.Parent = fr1
txt4.Text = "10/10"
txt4.Position = UDim2.new(0,50,0,150)

txtbase:Destroy()

local fr2 = Instance.new("Frame",scr)
fr2.AnchorPoint = Vector2.new(.5,.5)
fr2.BackgroundColor3 = Color3.new(0,0,0)
fr2.BorderColor3 = Color3.new(0,0,0)
fr2.BorderSizePixel = 5
fr2.Position = UDim2.new(.5,0,.8,0)
fr2.Size = UDim2.new(0,300,0,30)

local hpbar = Instance.new("Frame",fr2)
hpbar.BackgroundColor3 = Color3.new(0,1,0)
hpbar.BorderSizePixel = 0
hpbar.Size = UDim2.new(1,0,1,0)
local hptext = Instance.new("TextLabel",fr2)
hptext.BackgroundTransparency = 1
hptext.BorderSizePixel = 0
hptext.LayoutOrder = -1
hptext.Size = UDim2.new(0,100,1,0)
hptext.Font = "Highway"
hptext.Text = " + 100"
hptext.TextColor3 = Color3.new(1,1,1)
hptext.TextSize = 30
hptext.TextXAlignment = "Left"

local e;
coroutine.wrap(function()
e = game:GetService("RunService").Heartbeat:Connect(function()
swait()
txt2.Text = pshots.."/17"
txt3.Text = sshots.."/8"
txt4.Text = snshots.."/10"
end)
end)()

local li = Instance.new("SpotLight",Head)
li.Angle = 90
li.Brightness = 50
li.Shadows = true
li.Range = 30
li.Enabled = false

function rayCast(Position, Direction, Range, Ignore)
return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

function FindNearestTorso(Position, Distance, SinglePlayer)
if SinglePlayer then
return (SinglePlayer.Head.CFrame.p - Position).magnitude < Distance
end
local List = {}
for i, v in pairs(workspace:GetDescendants()) do
if v:IsA("Model") then
if v:findFirstChild("Head") then
if v ~= chara then
if (v.Head.Position - Position).magnitude <= Distance then
table.insert(List, v)
end 
end 
end 
end 
end
return List
end

EffectModel = Create("Model"){
Parent = chara,
Name = "Effects",
}

--Effect Functions--
Effects = {

Block = function(cf,partsize,meshstart,meshadd,matr,colour,spin,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = partsize
p.Anchored = true
p.CanCollide = false
p.Material = matr
p.CFrame = cf
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("BlockMesh",p)
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
if spin == true then
p.CFrame = p.CFrame * CFrame.Angles(math.random(-50,50),math.random(-50,50),math.random(-50,50))
end
end
p:Destroy()
end)()
return p
end,

Sphere = function(cf,partsize,meshstart,meshadd,matr,colour,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = partsize
p.Anchored = true
p.CanCollide = false
p.Material = matr
p.CFrame = cf
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("SpecialMesh",p)
m.MeshType = "Sphere"
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
end
p:Destroy()
end)()
return p
end,

Cylinder = function(cf,partsize,meshstart,meshadd,matr,colour,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = partsize
p.Anchored = true
p.CanCollide = false
p.Material = matr
p.CFrame = cf
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("CylinderMesh",p)
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
end
p:Destroy()
end)()
return p
end,

Wave = function(cf,meshstart,meshadd,colour,spin,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = Vector3.new()
p.Anchored = true
p.CanCollide = false
p.CFrame = cf
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("SpecialMesh",p)
m.MeshId = "rbxassetid://20329976"
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
p.CFrame = p.CFrame * CFrame.Angles(0,math.rad(spin),0)
end
p:Destroy()
end)()
return p
end,

Ring = function(cf,meshstart,meshadd,colour,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = Vector3.new()
p.Anchored = true
p.CanCollide = false
p.CFrame = cf
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("SpecialMesh",p)
m.MeshId = "rbxassetid://3270017"
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
end
p:Destroy()
end)()
return p
end,

Meshed = function(cf,meshstart,meshadd,colour,meshid,textid,spin,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = Vector3.new()
p.Anchored = true
p.CanCollide = false
p.CFrame = cf
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("SpecialMesh",p)
m.MeshId = meshid
m.TextureId = textid
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
p.CFrame = p.CFrame * CFrame.Angles(0,math.rad(spin),0)
end
p:Destroy()
end)()
return p
end,

Explode = function(cf,partsize,meshstart,meshadd,matr,colour,move,inverse,factor)
local p = Instance.new("Part",EffectModel)
p.BrickColor = BrickColor.new(colour)
p.Size = partsize
p.Anchored = true
p.CanCollide = false
p.Material = matr
p.CFrame = cf * CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
if inverse == true then
p.Transparency = 1
else
p.Transparency = 0
end
local m = Instance.new("SpecialMesh",p)
m.MeshType = "Sphere"
m.Scale = meshstart
coroutine.wrap(function()
for i=0,1,factor do
swait()
if inverse == true then
p.Transparency = 1-i
else
p.Transparency = i
end
m.Scale = m.Scale + meshadd
p.CFrame = p.CFrame * CFrame.new(0,move,0)
end
p:Destroy()
end)()
return p
end,

}

function GetDudesTorso(c)
local torsy = (c:findFirstChild("Torso") or c:findFirstChild("UpperTorso"))
if torsy ~= nil then
return torsy
end
end

function BodyVel(part,faws)
--[[local bodyvel = Instance.new("BodyVelocity",part)
local pep = 10000000
bodyvel.P = pep
bodyvel.MaxForce = Vector3.new(pep,pep,pep)
bodyvel.Velocity = faws
debby:AddItem(bodyvel,.2)]]
end

function Dmg(dude,dmg,env,faws,trip,efftyp,toim)
if dude and dude ~= chara then
if dude:FindFirstChild("HITO") then return end
if toim ~= 0 then
local debounce = Instance.new("BoolValue",dude)
debounce.Name = "HITO"
debby:AddItem(debounce,toim)
end
local hum = dude:FindFirstChildOfClass("Humanoid")
local dam = dmg+math.random(-env,env)
local teksu = "-"..dam
if hum then
local finhel = hum.Health - dam
if (finhel <= 0 and dude:FindFirstChild("DEATHED")==nil) or dmg == math.huge or hum.Health > 1000000 then
teksu = "DEATH"
--dude:BreakJoints()
Instance.new("BoolValue",dude).Name = "DEATHED"
--local soaa = Instance.new("Sound",dude.Head)
--local cho = math.random(1,5)
--if cho == 1 then
--soaa.SoundId = "rbxassetid://111896685"
--elseif cho == 2 then
--soaa.SoundId = "rbxassetid://535528169"
--elseif cho == 3 then
--soaa.SoundId = "rbxassetid://1080363252"
--elseif cho == 4 then
--soaa.SoundId = "rbxassetid://147758746"
--elseif cho == 5 then
--soaa.SoundId = "rbxassetid://626777433"
--soaa.Volume = .2
--soaa.TimePosition = 1
--end
--game:service'Debris':AddItem(soaa,6)
--soaa:Play()
end
if dmg ~= math.huge then
--hum.Health = hum.Health - dam
end
end
coroutine.wrap(function()
local naeeym2 = Instance.new("BillboardGui",dude)
naeeym2.Size = UDim2.new(0,100,0,40)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = dude:FindFirstChild("Head")
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = teksu
tecks2.Font = "Fantasy"
tecks2.TextSize = 24
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = Color3.new(1,1,1)
tecks2.TextStrokeColor3 = Color3.new(0,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)
swait(10)
for i = 0,1,.05 do
swait()
tecks2.Position = tecks2.Position - UDim2.new(0,0,.005,0)
tecks2.TextStrokeTransparency = i
tecks2.TextTransparency = i
end
naeeym2:Destroy()
end)()
local torsy = GetDudesTorso(dude)
if torsy then
local amtt = dam/5
if amtt > 30 then
amtt = 30
end
--for i=1,amtt do
--local blp = Instance.new("Part",workspace)
--blp.Size = Vector3.new(.3,.3,.3)
--blp.BrickColor = BrickColor.new("Crimson")
--blp.CFrame = torsy.CFrame*CFrame.Angles(math.random(-50,50),math.random(-50,50),math.random(-50,50))
--blp.Velocity = torsy.CFrame.lookVector*math.random(-8,-8) + torsy.CFrame.rightVector*math.random(-8,8) + Vector3.new(0,math.random(0,5),0)
--blp.RotVelocity = Vector3.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))
----local blm = Instance.new("SpecialMesh",blp)
----blm.MeshType = "Sphere"
--coroutine.wrap(function()
--swait(10)
--blp.Orientation = Vector3.new(0,blp.Orientation.y,0)
--for i=0,1,.1  do
--swait()
--blp.Transparency = i
--blp.Size = blp.Size + Vector3.new(.05,-.05,.05)
--end
--blp:Destroy()
--end)()
--end
if efftyp == "Blunt" then
puncheff(torsy)
elseif efftyp == "Sharp" then
slasheff(torsy)
coroutine.wrap(function()
if Knife.Transparency == 0 then
p1mit.Enabled = true
swait(10)
p1mit.Enabled = false
elseif Knife2.Transparency == 0 then
p2mit.Enabled = true
swait(10)
p2mit.Enabled = false
end
end)()
elseif efftyp == "Shot" then
so(144884872,torsy,.9,1)
end
if faws ~= 0 then
BodyVel(torsy,faws)
end
if trip == true then
torsy.CFrame = torsy.CFrame * CFrame.Angles(math.rad(-90),0,0)
torsy.RotVelocity = Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
end
end
end
end

function MagnitudeDmg(par,magni,dmg,env,faws,trip,efftyp,toim)

end

function CamShake(par,magni,env,dur)
--[[for _, c in pairs(workspace:GetDescendants()) do
local hum = c:FindFirstChildOfClass("Humanoid")
if hum ~= nil and c:FindFirstChild("SHAKE")==nil then
local head = GetDudesTorso(c)
if head ~= nil then
local targ = head.Position - par.Position
local mag = targ.magnitude
if magni >= mag then
local sheiku = script:FindFirstChild("SHAKE"):Clone()
sheiku.Parent = c
sheiku:FindFirstChild("Env").Value = env
sheiku:FindFirstChild("Dur").Value = dur
sheiku.Disabled = false
end
end
end
end]]
end

function puncheff(par)
if par.Parent:FindFirstChild("DebounceHit")==nil then
so(386946017,par,math.random(80,120)/100,1)
Effects.Sphere(par.CFrame,Vector3.new(1,1,1),Vector3.new(1,1,1),Vector3.new(.1,.1,.1),"Neon","White",false,.1)
end
end

function slasheff(par)
if par.Parent:FindFirstChild("DebounceHit")==nil then
local cho = math.random(1,3)
--if cho == 1 then
--so(444667824,par,1,1)
--elseif cho == 2 then
--so(444667844,par,1,1)
--elseif cho == 3 then
so(444667859,par,1,1)
--end
--function(cf,partsize,meshstart,meshadd,matr,colour,factor)
Effects.Sphere(par.CFrame*CFrame.Angles(math.random(0,360),math.random(0,360),math.random(0,360)),Vector3.new(.5,.5,.5),Vector3.new(1,0,1),Vector3.new(-.1,5,-.1),"Neon","White",false,.1)
CamShake(par,3,.3,.5)
end
end

local mus = Instance.new("Sound",Head)
mus.Name = "mus"
mus.SoundId = "rbxassetid://1205101253"
mus.Looped = true
mus.Volume = 1
mus:Play()

local hat = game.Players.LocalPlayer.Character['White SS'].Handle
local alignto = Knife
hat:BreakJoints()
local weld = Instance.new("Weld",hat)
weld.Part0 = alignto
weld.Part1 = hat
weld.C0 = CFrame.new(0, 0, 0.1) * CFrame.Angles(math.rad(135), math.rad(0), 0)

local hat2 = game.Players.LocalPlayer.Character['Meshes/RainbowSniperAccessory'].Handle
hat2:BreakJoints()
local weld2 = Instance.new("Weld",hat2)
weld2.Part0 = SniperH
weld2.Part1 = hat2
weld2.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(45))
--CFrame.new(0, 3, -0.1) * CFrame.Angles(math.rad(90), math.rad(88), math.rad(48))

local hat3 = game.Players.LocalPlayer.Character['Police K4LAS [Back]'].Handle
hat3:BreakJoints()
local weld3 = Instance.new("Weld",hat3)
weld3.Part0 = ShottyH
weld3.Part1 = hat3
weld3.C0 =  CFrame.new(0,0,0) * CFrame.Angles(math.rad(-90),0, math.rad(180))

local hat4 = game.Players.LocalPlayer.Character['Cartoony Rainbow Mk.50'].Handle
hat4:BreakJoints()
local weld4 = Instance.new("Weld",hat4)
weld4.Part0 = PistolH
weld4.Part1 = hat4
weld4.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0), math.rad(0))

function pistolrel()
so(1550642637,RightArm,1,1)
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 0.999997139, -4.7385779e-06, -2.86100999e-06, -4.7385779e-06, 1.00000858, -2.86102522e-06, -2.86100999e-06, -2.86102522e-06, 0.999997139),
CFrame.new(-1.46538582e-06, 1.54692137, -0.209853828, 0.999997139, -3.46518846e-06, -4.29317652e-06, -4.7385779e-06, 0.939701736, 0.342020184, -2.86100999e-06, -0.342021644, 0.939689159),
CFrame.new(0.854522765, 0.222398087, -0.774409652, 0.642788053, 0.754401922, 0.133024976, -0.133024052, 0.280929208, -0.950473666, -0.754406512, 0.593246639, 0.280933827),
CFrame.new(-1.18730974, -0.126011491, 0.160054311, 0.939689338, -0.342021286, -4.37337985e-06, 0.321391821, 0.883031905, 0.342020124, -0.116979986, -0.321394384, 0.939689398),
CFrame.new(0.500016809, -2.00003767, -8.24034214e-06, 0.866021514, -4.7385779e-06, -0.500001311, -5.50745335e-06, 1.00000858, -1.17754098e-07, 0.499996305, -2.86102522e-06, 0.866024435),
CFrame.new(-0.499971688, -2.00002766, 5.84125519e-06, 0.939690948, -4.7385779e-06, 0.34201622, -3.47528271e-06, 1.00000858, -4.29806732e-06, -0.342021704, -2.86102522e-06, 0.939689159),
}, .4, false)
end
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1, -1.52100554e-13, 0, -1.52100554e-13, 1, 0, 0, 0, 1),
CFrame.new(-2.09808386e-05, 1.54693103, -0.209845006, 1, -2.72848411e-12, 0, -1.52100554e-13, 0.939695656, 0.342012048, 0, -0.342012107, 0.939695597),
CFrame.new(0.854516387, 0.222410649, -0.774412334, 0.642794192, 0.754400432, 0.133024991, -0.133015573, 0.280934572, -0.950464487, -0.754402101, 0.593258619, 0.280930132),
CFrame.new(-0.694014966, -0.00153057277, -0.320706695, 0.178141281, -0.439670682, 0.880315483, 0.965236425, 0.251975238, -0.0694777295, -0.191270396, 0.862089396, 0.469273359),
CFrame.new(0.500024974, -2.00003481, -2.33650208e-05, 0.866023839, 1.13859137e-07, -0.500002801, -5.56927262e-06, 1, -9.41847611e-06, 0.500002801, 1.09412758e-05, 0.866023839),
CFrame.new(-0.499960899, -2.00003171, -2.0518899e-05, 0.939693093, -5.80151482e-06, 0.342018753, 3.82894905e-06, 1, 6.44255488e-06, -0.342018694, -4.74444823e-06, 0.939693213),
}, .4, false)
end
so(1550643261,RightArm,1,1)
pshots = 17
end

function shotgunreload()
for ab=1,8-sshots do
for i=0,1,.25 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 0.999997139, -4.7385779e-06, -2.86100999e-06, -4.7385779e-06, 1.00000858, -2.86102522e-06, -2.86100999e-06, -2.86102522e-06, 0.999997139),
CFrame.new(-1.46538582e-06, 1.54692137, -0.209853828, 0.999997139, -3.46518846e-06, -4.29317652e-06, -4.7385779e-06, 0.939701736, 0.342020184, -2.86100999e-06, -0.342021644, 0.939689159),
CFrame.new(0.854522765, 0.222398087, -0.774409652, 0.642788053, 0.754401922, 0.133024976, -0.133024052, 0.280929208, -0.950473666, -0.754406512, 0.593246639, 0.280933827),
CFrame.new(-1.18730974, -0.126011491, 0.160054311, 0.939689338, -0.342021286, -4.37337985e-06, 0.321391821, 0.883031905, 0.342020124, -0.116979986, -0.321394384, 0.939689398),
CFrame.new(0.500016809, -2.00003767, -8.24034214e-06, 0.866021514, -4.7385779e-06, -0.500001311, -5.50745335e-06, 1.00000858, -1.17754098e-07, 0.499996305, -2.86102522e-06, 0.866024435),
CFrame.new(-0.499971688, -2.00002766, 5.84125519e-06, 0.939690948, -4.7385779e-06, 0.34201622, -3.47528271e-06, 1.00000858, -4.29806732e-06, -0.342021704, -2.86102522e-06, 0.939689159),
}, .4, false)
end
so(254833667,RightArm,1,1)
for i=0,1,.25 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1, -1.52100554e-13, 0, -1.52100554e-13, 1, 0, 0, 0, 1),
CFrame.new(-2.09808386e-05, 1.54693103, -0.209845006, 1, -2.72848411e-12, 0, -1.52100554e-13, 0.939695656, 0.342012048, 0, -0.342012107, 0.939695597),
CFrame.new(0.854516387, 0.222410649, -0.774412334, 0.642794192, 0.754400432, 0.133024991, -0.133015573, 0.280934572, -0.950464487, -0.754402101, 0.593258619, 0.280930132),
CFrame.new(-0.694014966, -0.00153057277, -0.320706695, 0.178141281, -0.439670682, 0.880315483, 0.965236425, 0.251975238, -0.0694777295, -0.191270396, 0.862089396, 0.469273359),
CFrame.new(0.500024974, -2.00003481, -2.33650208e-05, 0.866023839, 1.13859137e-07, -0.500002801, -5.56927262e-06, 1, -9.41847611e-06, 0.500002801, 1.09412758e-05, 0.866023839),
CFrame.new(-0.499960899, -2.00003171, -2.0518899e-05, 0.939693093, -5.80151482e-06, 0.342018753, 3.82894905e-06, 1, 6.44255488e-06, -0.342018694, -4.74444823e-06, 0.939693213),
}, .4, false)
end
end
sshots = 8
end

function sniperreload()
so(231020282,RightArm,1,1)
for i=0,3,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(5.77146693e-07, -1.10000515, 2.49431691e-11, 0.499998987, -5.24676352e-07, -0.866025984, -2.62357275e-07, 1, 4.54372014e-07, 0.866025984, -2.26755021e-11, 0.499998987),
CFrame.new(-0.0883058012, 1.46577156, -0.0321406126, 0.34201926, -0.321393728, 0.883022606, 0, 0.939692736, 0.342019945, -0.939693034, -0.116977401, 0.321392953),
CFrame.new(0.6246773, 0.104275584, -0.932195127, 0.383021295, 0.866025984, -0.321393371, -0.642788053, 0, -0.76604414, -0.663414121, 0.499998987, 0.556671143),
CFrame.new(-0.937001705, -0.262758374, 0.235416457, 0.709746599, -0.562669337, 0.423866868, 0.563250303, 0.814636171, 0.138264596, -0.423094451, 0.140610322, 0.895108819),
CFrame.new(0.951329529, -1.22445107, 0.145094752, 0.499998987, -0.866025984, 0, 0, 0, 1, -0.866025984, -0.499998987, 0),
CFrame.new(-0.75982517, -0.899992943, -0.150008053, 0.499998987, 0, 0.866025984, 0, 1, 0, -0.866025984, 0, 0.499998987),
}, .1, false)
end
for i=0,.5,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(5.77146693e-07, -1.10000515, 2.49431691e-11, 0.499998987, -5.24676352e-07, -0.866025984, -2.62357275e-07, 1, 4.54372014e-07, 0.866025984, -2.26755021e-11, 0.499998987),
CFrame.new(-0.0631337017, 1.48287761, -0.07564459, 0.764022708, -0.133022606, 0.63132751, 0.0301539954, 0.98480773, 0.171010077, -0.64448446, -0.111618526, 0.756426692),
CFrame.new(0.599330187, 0.415035963, -1.08464372, 0.406897634, 0.754407227, -0.515076756, -0.633023202, -0.17364794, -0.754405677, -0.658571184, 0.633021474, 0.406900346),
CFrame.new(-1.08033061, 0.170879692, -1.140697, 0.334739238, -0.0533845425, 0.940797448, 0.908181429, -0.247989208, -0.337206155, 0.251309216, 0.967290759, -0.0345288515),
CFrame.new(0.951331437, -1.22445107, 0.145091444, 0.499998987, -0.866025984, 0, 0, 0, 1, -0.866025984, -0.499998987, 0),
CFrame.new(-0.759816706, -0.899992943, -0.150007531, 0.499998987, 0, 0.866025984, 0, 1, 0, -0.866025984, 0, 0.499998987),
}, .2, false)
end
so(293309896,RightArm,1,1)
for i=0,1.5,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(5.77146693e-07, -1.10000515, 2.49431691e-11, 0.499998987, -5.24676352e-07, -0.866025984, -2.62357275e-07, 1, 4.54372014e-07, 0.866025984, -2.26755021e-11, 0.499998987),
CFrame.new(-0.0631337017, 1.48287761, -0.07564459, 0.764022708, -0.133022606, 0.63132751, 0.0301539954, 0.98480773, 0.171010077, -0.64448446, -0.111618526, 0.756426692),
CFrame.new(0.599330187, 0.415035963, -1.08464372, 0.406897634, 0.754407227, -0.515076756, -0.633023202, -0.17364794, -0.754405677, -0.658571184, 0.633021474, 0.406900346),
CFrame.new(-1.08033061, 0.170879692, -1.140697, 0.334739238, -0.0533845425, 0.940797448, 0.908181429, -0.247989208, -0.337206155, 0.251309216, 0.967290759, -0.0345288515),
CFrame.new(0.951331437, -1.22445107, 0.145091444, 0.499998987, -0.866025984, 0, 0, 0, 1, -0.866025984, -0.499998987, 0),
CFrame.new(-0.759816706, -0.899992943, -0.150007531, 0.499998987, 0, 0.866025984, 0, 1, 0, -0.866025984, 0, 0.499998987),
}, .2, false)
end
snshots = 10
end

function switchweps(chosen)
attack = true
Humanoid.WalkSpeed = 1
if currentwep == "Knife" then
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000417, 1.0153105e-09, 1.01863407e-10, 1.0153105e-09, 1.00000417, 1.01863407e-10, 1.01863407e-10, 1.01863407e-10, 1),
CFrame.new(-0.0347477943, 1.432706, -0.1850788, 0.984809697, -6.51056325e-07, 0.173648879, -0.0593907498, 0.939694762, 0.336824596, -0.163176462, -0.342019856, 0.925416648),
CFrame.new(0.293174297, -0.354033977, -0.9000144, 0.383022904, 0.908679962, 0.166127622, -0.663413048, 0.395739228, -0.635041595, -0.642790139, 0.133023694, 0.754404128),
CFrame.new(-1.20950091, -0.132228643, 0.260999858, 0.939694703, -0.342020631, -3.71568603e-07, 0.321394295, 0.883023918, 0.342021734, -0.116977692, -0.321394831, 0.939692318),
CFrame.new(0.50006038, -2.00010228, 3.47271562e-05, 0.984809756, 6.4061237e-07, -0.17364867, -7.06446372e-07, 1.00000215, -3.23256245e-07, 0.173648313, 4.41126758e-07, 0.984807789),
CFrame.new(-0.499968469, -2.000103, -3.59266996e-05, 0.984809935, -9.64528013e-08, 0.173648283, 1.53979272e-07, 1.00000215, -3.1181844e-07, -0.17364791, 3.33922799e-07, 0.984807909),
}, .3, false)
end
so(211134014,Knife,1,1)
elseif currentwep == "Pistol" then
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000489, -4.41247039e-12, 1.16415322e-10, -4.41247039e-12, 1.00000489, 1.16415322e-10, 1.16415322e-10, 1.16415322e-10, 1),
CFrame.new(-2.32979655e-05, 1.50008512, -1.26212835e-05, 0.939695001, 2.70047167e-08, -0.342020929, 0.0593913868, 0.984810174, 0.163176581, 0.336824089, -0.173648462, 0.925416589),
CFrame.new(1.28574872, -0.0637521744, -7.64642391e-06, 0.984810054, 0.173648909, -7.22357072e-08, -0.173648909, 0.984810114, -1.7262355e-06, -2.28523277e-07, 1.71268766e-06, 1),
CFrame.new(-1.61959648, 0.275078326, 0.00631473958, 0.939695179, 0.342020661, 1.46635284e-06, -0.321394771, 0.883024096, 0.342021495, 0.116976559, -0.321394831, 0.939692557),
CFrame.new(0.500071108, -2.00013995, 2.2888009e-05, 1.00000489, -4.41247039e-12, 1.16415322e-10, -4.41247039e-12, 1.00000489, 1.16415322e-10, 1.16415322e-10, 1.16415322e-10, 1),
CFrame.new(-0.499975741, -2.00013947, -5.34060528e-05, 1.00000489, -4.41247039e-12, 1.16415322e-10, -4.41247039e-12, 1.00000489, 1.16415322e-10, 1.16415322e-10, 1.16415322e-10, 1),
}, .3, false)
end
elseif currentwep == "Shotgun" then
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(3.13278833e-05, -0.0192397144, -0.170645922, 1.00000191, 3.41483101e-05, -4.71123058e-05, -2.54476363e-05, 0.984809697, 0.173648506, 5.23263298e-05, -0.173648193, 0.984807849),
CFrame.new(0.049214907, 1.48270142, -0.0852823704, 0.866024673, 0.0868258402, -0.492405146, -1.95205212e-06, 0.984807909, 0.173647866, 0.500001609, -0.15038231, 0.852867961),
CFrame.new(1.50005758, 0.0683976784, 0.187952459, 1.00000012, -5.00145688e-07, 8.65955371e-07, 1.73811713e-07, 0.939692736, 0.342019975, -9.84779035e-07, -0.342020005, 0.939692736),
CFrame.new(-1.50004637, 0.0683947429, -0.187911183, 1.00000012, 3.46981324e-07, 1.96967449e-06, 3.47630703e-07, 0.939692557, -0.34202069, -1.96955807e-06, 0.34202069, 0.939692557),
CFrame.new(0.500083208, -1.98039222, -0.175920665, 1.00000191, -2.54476363e-05, 5.23263298e-05, 3.41483101e-05, 0.984809697, -0.173648193, -4.71123058e-05, 0.173648506, 0.984807849),
CFrame.new(-0.499945432, -1.98041487, -0.175941259, 1.00000191, -2.54476363e-05, 5.23263298e-05, 3.41483101e-05, 0.984809697, -0.173648193, -4.71123058e-05, 0.173648506, 0.984807849),
}, .3, false)
end
elseif currentwep == "Sniper" then
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000012, -4.51194637e-12, 0, -4.51194637e-12, 1.00000012, 0, 0, 0, 1),
CFrame.new(-2.2309232e-05, 1.50007844, -7.43056899e-06, 0.866025925, -3.86730449e-07, -0.499999285, 9.83127393e-08, 1.00000012, -6.03191438e-07, 0.499999285, 4.73228283e-07, 0.866025925),
CFrame.new(1.41953111, 0.142448068, 0.525516391, 0.470114946, -0.170514092, 0.865977585, -0.478125989, -0.8739236, 0.0874825567, 0.741881073, -0.455173224, -0.492371738),
CFrame.new(-1.57326913, 0.273198128, 2.96527305e-05, 0.866025627, 0.499999672, -7.68020982e-07, -0.499999672, 0.866025686, -1.25718361e-06, 3.65398591e-08, 1.47275568e-06, 1),
CFrame.new(0.500061095, -2.00012088, 2.28881836e-05, 1.00000012, -4.51194637e-12, 0, -4.51194637e-12, 1.00000012, 0, 0, 0, 1),
CFrame.new(-0.499973357, -2.0001204, -5.34057617e-05, 1.00000012, -4.51194637e-12, 0, -4.51194637e-12, 1.00000012, 0, 0, 0, 1),
}, .3, false)
end
end

weld2.Part0 = SniperH
weld2.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(45))
weld3.Part0 = ShottyH
weld3.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(-90),0, math.rad(180))
weld4.Part0 = PistolH
weld4.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0), math.rad(0))

Knife.Transparency = 1
PistolPart.Transparency = 1
ShottyPart.Transparency = 1
SniperPart.Transparency = 1

KnifeH.Transparency = 0
PistolH.Transparency = 0
ShottyH.Transparency = 0
SniperH.Transparency = 0

txt1.TextColor3 = Color3.new(.3,.3,.3)
txt2.TextColor3 = Color3.new(.3,.3,.3)
txt3.TextColor3 = Color3.new(.3,.3,.3)
txt4.TextColor3 = Color3.new(.3,.3,.3)
img1.ImageColor3 = Color3.new(.3,.3,.3)
img2.ImageColor3 = Color3.new(.3,.3,.3)
img3.ImageColor3 = Color3.new(.3,.3,.3)
img4.ImageColor3 = Color3.new(.3,.3,.3)

if currentwep == chosen then
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000417, 1.0153105e-09, 1.01863407e-10, 1.0153105e-09, 1.00000417, 1.01863407e-10, 1.01863407e-10, 1.01863407e-10, 1),
CFrame.new(-0.0347477943, 1.432706, -0.1850788, 0.984809697, -6.51056325e-07, 0.173648879, -0.0593907498, 0.939694762, 0.336824596, -0.163176462, -0.342019856, 0.925416648),
CFrame.new(0.293174297, -0.354033977, -0.9000144, 0.383022904, 0.908679962, 0.166127622, -0.663413048, 0.395739228, -0.635041595, -0.642790139, 0.133023694, 0.754404128),
CFrame.new(-1.20950091, -0.132228643, 0.260999858, 0.939694703, -0.342020631, -3.71568603e-07, 0.321394295, 0.883023918, 0.342021734, -0.116977692, -0.321394831, 0.939692318),
CFrame.new(0.50006038, -2.00010228, 3.47271562e-05, 0.984809756, 6.4061237e-07, -0.17364867, -7.06446372e-07, 1.00000215, -3.23256245e-07, 0.173648313, 4.41126758e-07, 0.984807789),
CFrame.new(-0.499968469, -2.000103, -3.59266996e-05, 0.984809935, -9.64528013e-08, 0.173648283, 1.53979272e-07, 1.00000215, -3.1181844e-07, -0.17364791, 3.33922799e-07, 0.984807909),
}, .3, false)
end
so(211059653,Knife,1,1)
KnifeH.Transparency = 1
Knife.Transparency = 0
txt1.TextColor3 = Color3.new(1,1,1)
img1.ImageColor3 = Color3.new(1,1,1)
currentwep = "Knife"
elseif chosen == "Pistol" then
weld4.Part0 = PistolPart
weld4.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0), math.rad(0))
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000489, -4.41247039e-12, 1.16415322e-10, -4.41247039e-12, 1.00000489, 1.16415322e-10, 1.16415322e-10, 1.16415322e-10, 1),
CFrame.new(-2.32979655e-05, 1.50008512, -1.26212835e-05, 0.939695001, 2.70047167e-08, -0.342020929, 0.0593913868, 0.984810174, 0.163176581, 0.336824089, -0.173648462, 0.925416589),
CFrame.new(1.28574872, -0.0637521744, -7.64642391e-06, 0.984810054, 0.173648909, -7.22357072e-08, -0.173648909, 0.984810114, -1.7262355e-06, -2.28523277e-07, 1.71268766e-06, 1),
CFrame.new(-1.61959648, 0.275078326, 0.00631473958, 0.939695179, 0.342020661, 1.46635284e-06, -0.321394771, 0.883024096, 0.342021495, 0.116976559, -0.321394831, 0.939692557),
CFrame.new(0.500071108, -2.00013995, 2.2888009e-05, 1.00000489, -4.41247039e-12, 1.16415322e-10, -4.41247039e-12, 1.00000489, 1.16415322e-10, 1.16415322e-10, 1.16415322e-10, 1),
CFrame.new(-0.499975741, -2.00013947, -5.34060528e-05, 1.00000489, -4.41247039e-12, 1.16415322e-10, -4.41247039e-12, 1.00000489, 1.16415322e-10, 1.16415322e-10, 1.16415322e-10, 1),
}, .3, false)
end
so(166196557,RightArm,1,1)
PistolH.Transparency = 1
PistolPart.Transparency = 0
txt2.TextColor3 = Color3.new(1,1,1)
img2.ImageColor3 = Color3.new(1,1,1)
currentwep = "Pistol"
if pshots <= 0 then
pistolrel()
end
elseif chosen == "Shotgun" then
weld3.Part0 = ShottyPart
weld3.C0 = CFrame.new(0,-0.1,-0.2) * CFrame.Angles(math.rad(-90),0, math.rad(180))
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(3.13278833e-05, -0.0192397144, -0.170645922, 1.00000191, 3.41483101e-05, -4.71123058e-05, -2.54476363e-05, 0.984809697, 0.173648506, 5.23263298e-05, -0.173648193, 0.984807849),
CFrame.new(0.049214907, 1.48270142, -0.0852823704, 0.866024673, 0.0868258402, -0.492405146, -1.95205212e-06, 0.984807909, 0.173647866, 0.500001609, -0.15038231, 0.852867961),
CFrame.new(1.50005758, 0.0683976784, 0.187952459, 1.00000012, -5.00145688e-07, 8.65955371e-07, 1.73811713e-07, 0.939692736, 0.342019975, -9.84779035e-07, -0.342020005, 0.939692736),
CFrame.new(-1.50004637, 0.0683947429, -0.187911183, 1.00000012, 3.46981324e-07, 1.96967449e-06, 3.47630703e-07, 0.939692557, -0.34202069, -1.96955807e-06, 0.34202069, 0.939692557),
CFrame.new(0.500083208, -1.98039222, -0.175920665, 1.00000191, -2.54476363e-05, 5.23263298e-05, 3.41483101e-05, 0.984809697, -0.173648193, -4.71123058e-05, 0.173648506, 0.984807849),
CFrame.new(-0.499945432, -1.98041487, -0.175941259, 1.00000191, -2.54476363e-05, 5.23263298e-05, 3.41483101e-05, 0.984809697, -0.173648193, -4.71123058e-05, 0.173648506, 0.984807849),
}, .3, false)
end
so(255061173,RightArm,1,1)
ShottyH.Transparency = 1
ShottyPart.Transparency = 0
txt3.TextColor3 = Color3.new(1,1,1)
img3.ImageColor3 = Color3.new(1,1,1)
currentwep = "Shotgun"
elseif chosen == "Sniper" then
weld2.Part0 = SniperPart
weld2.C0 = CFrame.new(0,-0.2, 0) * CFrame.Angles(math.rad(90), math.rad(-92), math.rad(45))
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000012, -4.51194637e-12, 0, -4.51194637e-12, 1.00000012, 0, 0, 0, 1),
CFrame.new(-2.2309232e-05, 1.50007844, -7.43056899e-06, 0.866025925, -3.86730449e-07, -0.499999285, 9.83127393e-08, 1.00000012, -6.03191438e-07, 0.499999285, 4.73228283e-07, 0.866025925),
CFrame.new(1.41953111, 0.142448068, 0.525516391, 0.470114946, -0.170514092, 0.865977585, -0.478125989, -0.8739236, 0.0874825567, 0.741881073, -0.455173224, -0.492371738),
CFrame.new(-1.57326913, 0.273198128, 2.96527305e-05, 0.866025627, 0.499999672, -7.68020982e-07, -0.499999672, 0.866025686, -1.25718361e-06, 3.65398591e-08, 1.47275568e-06, 1),
CFrame.new(0.500061095, -2.00012088, 2.28881836e-05, 1.00000012, -4.51194637e-12, 0, -4.51194637e-12, 1.00000012, 0, 0, 0, 1),
CFrame.new(-0.499973357, -2.0001204, -5.34057617e-05, 1.00000012, -4.51194637e-12, 0, -4.51194637e-12, 1.00000012, 0, 0, 0, 1),
}, .3, false)
end
so(1498950813,RightArm,1,1)
SniperH.Transparency = 1
SniperPart.Transparency = 0
txt4.TextColor3 = Color3.new(1,1,1)
img4.ImageColor3 = Color3.new(1,1,1)
currentwep = "Sniper"
end

Humanoid.WalkSpeed = 16
attack = false
end

function knifestab()
attack = true
Humanoid.WalkSpeed = 16
for i=0,1,.25 do
swait()
PlayAnimationFromTable({		
CFrame.new(-0.000117930649, -2.16348841e-08, -7.90364793e-05, 0.64278698, -0.00012647656, 0.766044974, 1.61708813e-05, 1, 0.000151534361, -0.766044974, -8.49460121e-05, 0.64278698),
CFrame.new(4.01744073e-05, 1.50000286, 0.000353095587, 0.64278698, 1.61708813e-05, -0.766044974, -0.00012647656, 1, -8.49460121e-05, 0.766044974, 0.000151534361, 0.64278698),
CFrame.new(0.466985971, 1.22963774, -0.639021218, -6.45965338e-06, 0.866024137, 0.500002265, 0.984807491, -0.0868200287, 0.150388524, 0.173650324, 0.492406905, -0.852866471),
CFrame.new(-1.50000262, 0.0634034351, 0.309811026, 1, 1.28149986e-06, -8.22544098e-06, 2.99929525e-06, 0.866025448, 0.5, 7.77840614e-06, -0.49999997, 0.866025388),
CFrame.new(0.50001657, -2.00001597, 1.37835741e-05, 0.64278686, 4.54951078e-07, -0.766045094, -8.69269741e-07, 1, -1.35521987e-07, 0.766045094, 7.53010681e-07, 0.64278686),
CFrame.new(-0.499961853, -2.00001669, -1.52587891e-05, 1, 1.45519152e-11, 0, 1.45519152e-11, 1, 0, 0, 0, 1),
}, .4, false)
end
Humanoid.WalkSpeed = 2
tr1.Enabled = true
so(200632136,Knife,math.random(9,11)/10,1)
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(6.73532486e-05, -0.0142026246, -1.91379452, 0.642823815, -8.42338923e-05, 0.766014099, -0.262003213, 0.939663291, 0.21997124, -0.719813824, -0.342100888, 0.604015827),
CFrame.new(5.23869894e-05, 1.50000405, 0.000345003995, 0.642786682, 1.60187483e-05, -0.766045332, -0.000126790037, 1.00000012, -8.55028629e-05, 0.766045213, 0.000152081251, 0.642786682),
CFrame.new(0.998481274, 1.06966388, -0.439240575, -0.26202774, 0.0297024846, 0.964603126, 0.93969065, -0.219823405, 0.26202932, 0.219825253, 0.975087404, 0.0296886563),
CFrame.new(-1.49997985, 0.0634022504, 0.309802085, 1, 1.13248825e-06, -8.64267349e-06, 3.35276127e-06, 0.866025805, 0.499999642, 8.10623169e-06, -0.499999642, 0.866025627),
CFrame.new(0.992708325, -1.73965216, -0.41339314, 0.642790794, -0.262022853, -0.719836116, 3.37498095e-05, 0.939692318, -0.342021197, 0.766041756, 0.219823748, 0.604034364),
CFrame.new(-0.756015062, -2.00166965, 0.0843268856, 0.642790794, 0.261980176, -0.719851673, 3.37463644e-05, 0.939693332, 0.342018634, 0.766041756, -0.219870716, 0.604017258),
}, .5, false)
MagnitudeDmg(Knife,1.5,100,0,RootPart.CFrame.lookVector*5,false,"Sharp",.5)
end
Humanoid.WalkSpeed = 16
tr1.Enabled = false
attack = false
end

function wepknifestab()
attack = true
Humanoid.WalkSpeed = 2
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000179143899, 4.94844912e-08, -0.000147477331, 0.500000775, 1.22923609e-06, -0.86602509, -0.000292493496, 1.00000012, -0.000167452119, 0.866025031, 0.000337032834, 0.500000775),
CFrame.new(-0.000420931523, 1.50010991, -7.43984856e-06, 0.500000775, -0.000292493496, 0.866025031, 1.22923609e-06, 1.00000012, 0.000337032834, -0.86602509, -0.000167452119, 0.500000775),
CFrame.new(0.839951992, 0.256004274, -0.958486319, 0.499996692, 0.813799739, 0.2961981, 4.75931301e-06, 0.342016816, -0.939693928, -0.866027415, 0.469845295, 0.171003401),
CFrame.new(-1.22089827, -0.164978445, -0.0866824239, 0.983905554, -0.138054684, 0.113450736, 0.176127508, 0.856396437, -0.485349834, -0.0301539302, 0.497520208, 0.866928339),
CFrame.new(0.500076354, -2.00016046, 1.52737084e-05, 1.00000012, -1.45519152e-11, 2.98023224e-08, -1.45519152e-11, 1.00000012, -7.27595761e-12, 2.98023224e-08, -7.27595761e-12, 1.00000012),
CFrame.new(-0.499987543, -2.00015903, -5.56111336e-05, 0.499999285, 9.37507139e-07, 0.866025865, -1.2402096e-06, 1.00000012, -3.66519089e-07, -0.866025925, -8.90795491e-07, 0.499999374),
}, .5, false)
end
so(211059653,Knife2,1,1)
Knife2.Transparency = 0
KnifeH.Transparency = 1
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000175330031, 1.00539501e-06, -0.000154084992, 0.500003099, 1.22933841e-06, -0.866029263, -0.000292495621, 1.00000453, -0.000167453458, 0.866029143, 0.000337033416, 0.500003219),
CFrame.new(-0.00041242165, 1.50012219, -6.93052425e-06, 0.500003099, -0.000292495621, 0.866029143, 1.22933841e-06, 1.00000453, 0.000337033416, -0.866029263, -0.000167453458, 0.500003219),
CFrame.new(1.09288597, 0.364121079, -0.802504063, 0.748180747, 0.593714058, 0.296199232, 0.116981708, 0.321389914, -0.939695835, -0.653104663, 0.737710655, 0.171003729),
CFrame.new(-0.688675284, 1.32965851, -0.712965548, 0.334458649, -0.800666928, -0.49706617, -0.926752567, -0.375185549, -0.0192363095, -0.171089798, 0.46709004, -0.867502213),
CFrame.new(0.500086367, -2.00017858, 1.52748289e-05, 1.00000489, -7.13043846e-10, 2.98023224e-08, -7.13043846e-10, 1.00000441, -5.31144906e-10, 2.98023224e-08, -5.31144906e-10, 1.00000489),
CFrame.new(-0.499991834, -2.00017858, -5.22881746e-05, 0.500001609, 9.36794095e-07, 0.866030037, -1.24011513e-06, 1.00000441, -3.673631e-07, -0.866030157, -8.91312084e-07, 0.500001788),
}, .5, false)
end
tr2.Enabled = true
so(200632136,Knife2,math.random(9,11)/10,1)
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(-2.50339508e-06, -0.116524018, -2.23838973, 0.342018872, -5.0964772e-08, -0.939693093, 0.321393877, 0.939692676, 0.11697726, 0.883022726, -0.342020035, 0.321392655),
CFrame.new(-6.99047723e-06, 1.49998283, -2.62057279e-06, 0.342018872, 1.1920929e-07, 0.939693093, -5.0964772e-08, 1, -1.49011612e-07, -0.939693093, -7.4505806e-09, 0.342018902),
CFrame.new(1.22636616, 0.263386577, -0.809811354, 0.939690471, 0.342026293, 1.16229057e-06, -0.0593909174, 0.163175166, -0.984808028, -0.336830378, 0.925414443, 0.173647419),
CFrame.new(-1.32934356, 1.10000336, -0.700607181, -1.1920929e-07, 0.342020571, -0.939692616, -1, -4.47034836e-08, 1.49011612e-07, 7.4505806e-09, 0.939692497, 0.342020541),
CFrame.new(0.977364421, -1.93956006, -0.0584065914, 0.854759812, -0.518661916, -0.0193820298, 0.5132581, 0.850225329, -0.116975099, 0.0771495849, 0.0900376588, 0.99294579),
CFrame.new(-0.972516656, -1.19701695, -0.393972486, 0.183487743, 0.321393877, 0.92899859, 0.0593910404, 0.939692676, -0.336824, -0.981226325, 0.11697726, 0.153334215),
}, .4, false)
MagnitudeDmg(Knife2,1.5,100,0,RootPart.CFrame.lookVector*5,false,"Sharp",.5)
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000175330031, 1.00539501e-06, -0.000154084992, 0.500003099, 1.22933841e-06, -0.866029263, -0.000292495621, 1.00000453, -0.000167453458, 0.866029143, 0.000337033416, 0.500003219),
CFrame.new(-0.00041242165, 1.50012219, -6.93052425e-06, 0.500003099, -0.000292495621, 0.866029143, 1.22933841e-06, 1.00000453, 0.000337033416, -0.866029263, -0.000167453458, 0.500003219),
CFrame.new(1.09288597, 0.364121079, -0.802504063, 0.748180747, 0.593714058, 0.296199232, 0.116981708, 0.321389914, -0.939695835, -0.653104663, 0.737710655, 0.171003729),
CFrame.new(-0.688675284, 1.32965851, -0.712965548, 0.334458649, -0.800666928, -0.49706617, -0.926752567, -0.375185549, -0.0192363095, -0.171089798, 0.46709004, -0.867502213),
CFrame.new(0.500086367, -2.00017858, 1.52748289e-05, 1.00000489, -7.13043846e-10, 2.98023224e-08, -7.13043846e-10, 1.00000441, -5.31144906e-10, 2.98023224e-08, -5.31144906e-10, 1.00000489),
CFrame.new(-0.499991834, -2.00017858, -5.22881746e-05, 0.500001609, 9.36794095e-07, 0.866030037, -1.24011513e-06, 1.00000441, -3.673631e-07, -0.866030157, -8.91312084e-07, 0.500001788),
}, .5, false)
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000179143899, 4.94844912e-08, -0.000147477331, 0.500000775, 1.22923609e-06, -0.86602509, -0.000292493496, 1.00000012, -0.000167452119, 0.866025031, 0.000337032834, 0.500000775),
CFrame.new(-0.000420931523, 1.50010991, -7.43984856e-06, 0.500000775, -0.000292493496, 0.866025031, 1.22923609e-06, 1.00000012, 0.000337032834, -0.86602509, -0.000167452119, 0.500000775),
CFrame.new(0.839951992, 0.256004274, -0.958486319, 0.499996692, 0.813799739, 0.2961981, 4.75931301e-06, 0.342016816, -0.939693928, -0.866027415, 0.469845295, 0.171003401),
CFrame.new(-1.22089827, -0.164978445, -0.0866824239, 0.983905554, -0.138054684, 0.113450736, 0.176127508, 0.856396437, -0.485349834, -0.0301539302, 0.497520208, 0.866928339),
CFrame.new(0.500076354, -2.00016046, 1.52737084e-05, 1.00000012, -1.45519152e-11, 2.98023224e-08, -1.45519152e-11, 1.00000012, -7.27595761e-12, 2.98023224e-08, -7.27595761e-12, 1.00000012),
CFrame.new(-0.499987543, -2.00015903, -5.56111336e-05, 0.499999285, 9.37507139e-07, 0.866025865, -1.2402096e-06, 1.00000012, -3.66519089e-07, -0.866025925, -8.90795491e-07, 0.499999374),
}, .5, false)
end
so(211134014,Knife2,1,1)
Knife2.Transparency = 1
KnifeH.Transparency = 0
Humanoid.WalkSpeed = 16
tr2.Enabled = false
attack = false
end

function pistolshoot()
attack = true
Humanoid.WalkSpeed = 2
CamShake(RightArm,3,.2,.3)
getNearestGuy()
local part, pos = rayCast(PistolF.Position,((TargetPoint+Vector3.new(math.random(-10,10)/10,math.random(-10,10)/10,math.random(-10,10)/10)) - PistolF.Position),200,chara)
local aimo = Instance.new("Part",Camera)
aimo.Anchored = true
aimo.Size = Vector3.new()
aimo.Transparency = 1
aimo.CanCollide = false
aimo.CFrame = CFrame.new(pos)
Effects.Meshed(PistolF.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),Vector3.new(),Vector3.new(.0025,.0001,.0025),"","rbxassetid://662585058","",0,false,.1)
Effects.Block(PistolF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.3,.3,.3),"Neon","Bright yellow",true,false,.1)
Effects.Block(PistolF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.6,.6,.6),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new(pos),Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.1,.1,.1),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new((PistolF.Position + pos)/2,pos),Vector3.new(.2,.2,(PistolF.Position - pos).magnitude),Vector3.new(0,0,1),Vector3.new(.1,.1,0),"Neon","Bright yellow",false,false,.1)
MagnitudeDmg(aimo,3,18,2,RootPart.CFrame.lookVector*2,false,"Shot",.1)
so(1583819337,PistolPart,math.random(90,110)/100,2)
local hitpt = Instance.new("Part",EffectModel)
hitpt.Size = Vector3.new(0,0,.3)
hitpt.CFrame = PistolPart.CFrame * CFrame.new(0,.465,.5)-- * CFrame.Angles(math.rad(90),0,0)
hitpt.Velocity = RootPart.CFrame.rightVector*10+Vector3.new(0,5,0)
local hitm = Instance.new("SpecialMesh",hitpt)
hitm.MeshId = "rbxassetid://94295100"
hitm.TextureId = "rbxassetid://94287792"
hitm.Scale = Vector3.new(3,3,3.5)
coroutine.wrap(function()
swait(120)
for i = 0,1,.1 do
swait()
hitpt.Transparency = i
end
hitpt:Destroy()
end)()
for i=0,1,.5 do
swait()
PlayAnimationFromTable({		
CFrame.new(-6.51180744e-06, -1.04836988e-06, 0.199993119, 0.499999166, -7.89761714e-07, 0.866025329, 1.24944251e-08, 1.00000143, -9.25385962e-07, -0.866025865, -4.76837158e-07, 0.499998331),
CFrame.new(-1.63912773e-07, 1.49998271, -1.7285347e-06, 0.49240312, 0.0868238658, -0.866025865, -0.173648998, 0.984809101, -4.76837158e-07, 0.852868617, 0.150382623, 0.499998331),
CFrame.new(1.5115397, 0.924184561, 0.283434004, 0.157807171, -0.832470179, 0.531121731, 0.368540525, -0.449346781, -0.813798606, 0.916118145, 0.324162781, 0.235890016),
CFrame.new(-1.4999913, -2.68245174e-07, -2.32076964e-05, 0.939692736, 0.342020005, 1.78813934e-07, -0.342020422, 0.939693928, 1.06019513e-06, 1.1920929e-06, -2.65240669e-06, 0.999999046),
CFrame.new(0.673204184, -2.00000215, -0.100005746, 0.766043723, 1.24944251e-08, -0.642788589, -5.80049061e-07, 1.00000143, -7.07089043e-07, 0.642788231, -9.25385962e-07, 0.766042709),
CFrame.new(-0.326797545, -2.00000572, -0.0999965966, 1, 1.24944251e-08, 2.08616257e-07, 1.24944251e-08, 1.00000143, -9.25385962e-07, 2.08616257e-07, -9.25385962e-07, 0.999999046),
}, .5, false)
end
pshots = pshots - 1
aimo:Destroy()
if pshots <= 0 then
pistolrel()
end
for i=0,1,.5 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 0.499999166, -7.89761714e-07, 0.866025329, 1.24944251e-08, 1.00000143, -9.25385962e-07, -0.866025865, -4.76837158e-07, 0.499998331),
CFrame.new(1.41561031e-06, 1.49998701, 1.01327896e-06, 0.49240312, 0.0868238658, -0.866025865, -0.173648998, 0.984809101, -4.76837158e-07, 0.852868617, 0.150382623, 0.499998331),
CFrame.new(1.67497301, 0.733016193, 0.303117812, 0.433011949, -0.866025865, 0.249999687, 0.500000238, -4.76837158e-07, -0.866026938, 0.749999404, 0.499998331, 0.433013648),
CFrame.new(-1.49999261, -3.8444914e-06, 7.30986267e-06, 0.939692736, 0.342020005, 1.78813934e-07, -0.342020422, 0.939693928, 1.06019513e-06, 1.1920929e-06, -2.65240669e-06, 0.999999046),
CFrame.new(0.499994516, -2.00000048, 1.52587891e-05, 0.766043723, 1.24944251e-08, -0.642788589, -5.80049061e-07, 1.00000143, -7.07089043e-07, 0.642788231, -9.25385962e-07, 0.766042709),
CFrame.new(-0.499984771, -1.99999857, 9.37584991e-06, 1, 1.24944251e-08, 2.08616257e-07, 1.24944251e-08, 1.00000143, -9.25385962e-07, 2.08616257e-07, -9.25385962e-07, 0.999999046),
}, .5, false)
end
Humanoid.WalkSpeed = 16
attack = false
end

function shotgunshoot()
attack = true
Humanoid.WalkSpeed = 2
Effects.Block(ShotgunF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.4,.4,.4),"Neon","Bright yellow",true,false,.1)
Effects.Block(ShotgunF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.7,.7,.7),"Neon","Bright yellow",true,false,.1)
CamShake(RightArm,3,.4,.3)
for i=1,2 do
Effects.Meshed(ShotgunF.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),Vector3.new(),Vector3.new(.003,.0001,.003),"","rbxassetid://662585058","",0,false,.1)
end
getNearestGuy()
local mop = TargetPoint
for ab=1,5 do
local part, pos = rayCast(ShotgunF.Position,((mop+Vector3.new(math.random(-20,20)/10,math.random(-20,20)/10,math.random(-20,20)/10)) - ShotgunF.Position),50,chara)
local aimo = Instance.new("Part",Camera)
aimo.Anchored = true
aimo.Size = Vector3.new()
aimo.Transparency = 1
aimo.CanCollide = false
aimo.CFrame = CFrame.new(pos)
Effects.Block(CFrame.new(pos),Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.1,.1,.1),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new((ShotgunF.Position + pos)/2,pos),Vector3.new(.2,.2,(ShotgunF.Position - pos).magnitude),Vector3.new(0,0,1),Vector3.new(.1,.1,0),"Neon","Bright yellow",false,false,.1)
MagnitudeDmg(aimo,3,36,2,RootPart.CFrame.lookVector*2,false,"Shot",0)
aimo:Destroy()
end
so(636319463,ShottyPart,math.random(90,110)/100,2)
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(-0.0426755287, -1.07805381e-05, 0.0753384382, 0.50000298, 4.92750078e-05, -0.86603117, -4.60350348e-05, 1.00000274, 3.5977002e-05, 0.8660326, 2.4223591e-05, 0.499999166),
CFrame.new(0.0426297933, 1.49998486, -0.0245249029, 0.50000298, -4.60350348e-05, 0.8660326, 4.92750078e-05, 1.00000274, 2.4223591e-05, -0.86603117, 3.5977002e-05, 0.499999166),
CFrame.new(1.12515163, 0.548250377, -0.496726394, 0.500168204, 0.813741982, -0.296093225, 0.000139903248, -0.342011213, -0.939698875, -0.865935743, 0.469959229, -0.171180338),
CFrame.new(-1.14305413, 0.864631057, -1.00320852, 0.407486796, 0.113466412, 0.906143069, 0.682771206, -0.696794927, -0.219786346, 0.606456578, 0.708240092, -0.361407727),
CFrame.new(0.413448215, -1.9999907, -0.0500168577, 1.00000775, -2.18424248e-07, -1.28149986e-06, -2.18424248e-07, 1.00000286, 2.70940654e-06, -1.28149986e-06, 2.70940654e-06, 1.00000453),
CFrame.new(-0.586602032, -1.99999666, -0.0500271767, 0.500002861, -2.56561325e-05, 0.86603272, 2.89498093e-05, 1.00000286, 1.24069702e-05, -0.866031229, 2.43783397e-05, 0.499998987),
}, .4, false)
end
so(1676656467,RightArm,1,1)
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(-0.0426480025, 2.5987938e-06, -0.0246586762, 0.500004113, 5.21446345e-05, -0.866026759, -3.8554077e-05, 0.999998689, 3.87465407e-05, 0.866027117, 8.27422991e-06, 0.499998033),
CFrame.new(0.0426570028, 1.49997389, -0.0245179161, 0.500004113, -3.8554077e-05, 0.866027117, 5.21446345e-05, 0.999998689, 8.27422991e-06, -0.866026759, 3.87465407e-05, 0.499998033),
CFrame.new(1.26703095, 0.386247098, -0.414777607, 0.500184178, 0.749944627, -0.432900131, 0.00013010815, -0.499997675, -0.866026044, -0.865921021, 0.433114439, -0.250186145),
CFrame.new(-1.04589081, 0.850564957, -0.914023519, -0.0296139717, -0.375769794, 0.926241755, 0.528010428, -0.792688966, -0.304709554, 0.848720849, 0.480043083, 0.221882805),
CFrame.new(0.500037611, -1.99999917, 2.00857448e-05, 1.00000358, -2.6606067e-06, -2.56299973e-06, -2.6606067e-06, 0.999998689, -1.14691647e-06, -2.56299973e-06, -1.14691647e-06, 1.00000024),
CFrame.new(-0.500000834, -1.9999944, 5.96046448e-06, 0.500003934, -1.81733503e-05, 0.866027236, 3.18790844e-05, 0.999998748, -3.55727752e-06, -0.866026998, 2.71143635e-05, 0.499997854),
}, .4, false)
end
local hitpt = Instance.new("Part",EffectModel)
hitpt.Size = Vector3.new(.2,.2,.6)
hitpt.CFrame = ShottyPart.CFrame * CFrame.new(0,-.2,.1) * CFrame.Angles(math.rad(-90),0,0)
hitpt.Velocity = RootPart.CFrame.rightVector*10+Vector3.new(0,5,0)
local hitm = Instance.new("SpecialMesh",hitpt)
hitm.MeshId = "rbxassetid://94248124"
hitm.TextureId = "rbxassetid://94219470"
hitm.Scale = Vector3.new(1,1,1)
coroutine.wrap(function()
swait(120)
for i = 0,1,.1 do
swait()
hitpt.Transparency = i
end
hitpt:Destroy()
end)()
sshots = sshots - 1
if sshots <= 0 then
shotgunreload()
end
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(-0.04265441, 3.46730985e-06, -0.0246547386, 0.500000179, 5.24776005e-05, -0.866025448, -3.59067635e-05, 1, 3.98650955e-05, 0.866025448, 1.11636218e-05, 0.500000179),
CFrame.new(0.0426664874, 1.49997485, -0.0245260373, 0.500000179, -3.59067635e-05, 0.866025448, 5.24776005e-05, 1, 1.11636218e-05, -0.866025448, 3.98650955e-05, 0.500000179),
CFrame.new(1.12514198, 0.548240304, -0.496717662, 0.500165403, 0.813733816, -0.296094865, 0.00014318082, -0.34201628, -0.939694107, -0.865930021, 0.469960093, -0.171181217),
CFrame.new(-1.14299285, 0.864633799, -1.00319052, 0.407490432, 0.113461196, 0.906133711, 0.68276906, -0.696790278, -0.219794586, 0.606446922, 0.708244324, -0.361403227),
CFrame.new(0.500045896, -2.00000525, 7.62939635e-06, 1.00000024, 1.45519152e-11, 0, 1.45519152e-11, 1, 0, 0, 0, 1.00000024),
CFrame.new(-0.500002563, -2.00000548, -8.34465027e-07, 0.5, -1.55070338e-05, 0.866025567, 3.21887746e-05, 1, -6.78202923e-07, -0.866025567, 2.82154051e-05, 0.5),
}, .4, false)
end
Humanoid.WalkSpeed = 16
attack = false
end

function snipershoot()
attack = true
Humanoid.WalkSpeed = 1
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(4.7639071e-07, -1.10001194, -1.51601284e-07, 0.500000477, -4.33079322e-07, -0.866027892, -1.05399764e-07, 1.00000358, 4.57277082e-07, 0.866024017, 1.37818347e-07, 0.499997526),
CFrame.new(0.167016879, 1.34998727, -0.199010611, 0.556670308, 0.321388304, 0.766046166, -0.500001013, 0.866026938, 6.41028782e-06, -0.663415313, -0.383027822, 0.642783642),
CFrame.new(0.911282957, 0.475031316, -0.628563344, 0.500000417, 0.866024017, 8.59218545e-08, -3.88375781e-07, 1.37818347e-07, -1.00000358, -0.866027892, 0.499997526, -4.20934384e-07),
CFrame.new(-1.21131861, 0.352097392, -0.894729018, 0.03015434, 0.171006948, 0.984807253, 0.984811544, -0.17364794, -1.001839e-06, 0.171009108, 0.969847143, -0.173650116),
CFrame.new(0.951322317, -1.22446108, 0.145102695, 0.500000417, -0.866024017, 1.71279837e-07, 1.1826463e-07, -1.37818347e-07, 1.00000358, -0.866027892, -0.499997526, -1.18554784e-08),
CFrame.new(-0.759828508, -0.900001526, -0.149999052, 0.500000417, 1.71279837e-07, 0.866024017, 1.1826463e-07, 1.00000358, 1.37818347e-07, -0.866027892, -1.18554784e-08, 0.499997526),
}, .4, false)
end
getNearestGuy()
local part, pos = rayCast(SniperF.Position,((TargetPoint+Vector3.new(math.random(-1,1)/10,math.random(-1,1)/10,math.random(-1,1)/10)) - SniperF.Position),2000,chara)
local aimo = Instance.new("Part",Camera)
aimo.Anchored = true
aimo.Size = Vector3.new()
aimo.Transparency = 1
aimo.CanCollide = false
aimo.CFrame = CFrame.new(pos)
CamShake(RightArm,3,.5,.3)
for i=1,3 do
Effects.Meshed(SniperF.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),Vector3.new(),Vector3.new(.0035,.0001,.0035),"","rbxassetid://662585058","",0,false,.1)
end
Effects.Block(SniperF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.6,.6,.6),"Neon","Bright yellow",true,false,.1)
Effects.Block(SniperF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.8,.8,.8),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new(pos),Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.1,.1,.1),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new((SniperF.Position + pos)/2,pos),Vector3.new(.2,.2,(SniperF.Position - pos).magnitude),Vector3.new(0,0,1),Vector3.new(.1,.1,0),"Neon","Bright yellow",false,false,.1)
MagnitudeDmg(aimo,3,100,1,RootPart.CFrame.lookVector*2,false,"Shot",.1)
so(1188020502,SniperPart,math.random(90,110)/100,2)
local hitpt = Instance.new("Part",EffectModel)
hitpt.Size = Vector3.new(.2,.2,.6)
hitpt.CFrame = SniperPart.CFrame * CFrame.new(0,.2,.1) * CFrame.Angles(math.rad(90),0,0)
hitpt.Velocity = RootPart.CFrame.rightVector*10+Vector3.new(0,5,0)
local hitm = Instance.new("SpecialMesh",hitpt)
hitm.MeshId = "rbxassetid://94295100"
hitm.TextureId = "rbxassetid://94287792"
hitm.Scale = Vector3.new(6,6,7)
coroutine.wrap(function()
swait(120)
for i = 0,1,.1 do
swait()
hitpt.Transparency = i
end
hitpt:Destroy()
end)()
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(2.50265002e-05, -1.10002279, 0.200007886, 0.500002146, -3.76800926e-07, -0.866029978, 7.4937816e-08, 1.00000739, 4.94749656e-07, 0.86602205, 3.01832188e-07, 0.499995917),
CFrame.new(0.167014852, 1.34999704, -0.199008107, 0.556671381, 0.321389109, 0.766043961, -0.500002861, 0.866030276, 6.54973655e-06, -0.663417339, -0.383028954, 0.642782569),
CFrame.new(1.04456306, 0.514713466, -0.551627755, 0.499997109, 0.852867961, -0.150390312, -1.31521729e-05, -0.173648402, -0.984811425, -0.866029978, 0.49240002, -0.0868116468),
CFrame.new(-1.25996089, 0.489358723, -1.10211217, 0.212837413, 0.0678575933, 0.974727511, 0.797067821, -0.589060187, -0.133035436, 0.565143704, 0.805237114, -0.179465353),
CFrame.new(0.778114498, -1.22446704, 0.0451110713, 0.500002146, -0.86602205, 3.5509629e-07, 1.89445245e-07, -3.01832188e-07, 1.00000739, -0.866029978, -0.499995917, 1.52761004e-08),
CFrame.new(-0.933037996, -0.900004268, -0.249980167, 0.500002146, 3.5509629e-07, 0.86602205, 1.89445245e-07, 1.00000739, 3.01832188e-07, -0.866029978, 1.52761004e-08, 0.499995917),
}, .4, false)
end
snshots = snshots - 1
aimo:Destroy()
if snshots <= 0 then
sniperreload()
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(4.7639071e-07, -1.10001194, -1.51601284e-07, 0.500000477, -4.33079322e-07, -0.866027892, -1.05399764e-07, 1.00000358, 4.57277082e-07, 0.866024017, 1.37818347e-07, 0.499997526),
CFrame.new(0.167016879, 1.34998727, -0.199010611, 0.556670308, 0.321388304, 0.766046166, -0.500001013, 0.866026938, 6.41028782e-06, -0.663415313, -0.383027822, 0.642783642),
CFrame.new(0.911282957, 0.475031316, -0.628563344, 0.500000417, 0.866024017, 8.59218545e-08, -3.88375781e-07, 1.37818347e-07, -1.00000358, -0.866027892, 0.499997526, -4.20934384e-07),
CFrame.new(-1.21131861, 0.352097392, -0.894729018, 0.03015434, 0.171006948, 0.984807253, 0.984811544, -0.17364794, -1.001839e-06, 0.171009108, 0.969847143, -0.173650116),
CFrame.new(0.951322317, -1.22446108, 0.145102695, 0.500000417, -0.866024017, 1.71279837e-07, 1.1826463e-07, -1.37818347e-07, 1.00000358, -0.866027892, -0.499997526, -1.18554784e-08),
CFrame.new(-0.759828508, -0.900001526, -0.149999052, 0.500000417, 1.71279837e-07, 0.866024017, 1.1826463e-07, 1.00000358, 1.37818347e-07, -0.866027892, -1.18554784e-08, 0.499997526),
}, .4, false)
end
Humanoid.WalkSpeed = 16
attack = false
end

function pistol2shoot()
attack = true
Humanoid.WalkSpeed = 2
weld4.Part0 = Pistol2Part
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000184101125, 5.04431128e-08, -0.000150338426, 0.500005603, 1.22921699e-06, -0.866033554, -0.000292496145, 1.00001001, -0.000167453618, 0.866025388, 0.000337033183, 0.500001013),
CFrame.new(-0.000420940924, 1.50013995, -7.44290446e-06, 0.500005603, -0.000292496145, 0.866025388, 1.22921699e-06, 1.00001001, 0.000337033183, -0.866033554, -0.000167453618, 0.500001013),
CFrame.new(1.07864964, 0.497787654, -0.827312827, 0.812867165, 0.580278814, -0.0502792969, -0.0143589694, -0.0663333088, -0.997701764, -0.582282901, 0.811714172, -0.0455874838),
CFrame.new(0.205326244, -0.00924482942, -0.802453697, -0.432021976, -0.765640318, -0.476609319, -0.0512114279, 0.548448205, -0.834623814, 0.900416195, -0.33616206, -0.276147217),
CFrame.new(0.500085354, -2.00019813, 1.89718667e-05, 1.00000286, -2.50292942e-09, -4.02331352e-06, -2.50292942e-09, 1.00000989, -1.43336365e-09, -4.02331352e-06, -1.43336365e-09, 1.00000751),
CFrame.new(-0.499986112, -2.0001986, -4.31090593e-05, 0.500004113, 9.35033313e-07, 0.866026223, -1.24029475e-06, 1.00000989, -3.6941492e-07, -0.866034448, -8.92294338e-07, 0.499999523),
}, .5, false)
end
so(166196557,LeftArm,1,1)
Pistol2Part.Transparency = 0
PistolH.Transparency = 1
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000189566548, 4.85283067e-08, -0.000144683872, 0.499996573, 1.23889242e-06, -0.866027534, -0.000292498793, 1.00000012, -0.000167442151, 0.866027474, 0.000337032456, 0.499996573),
CFrame.new(-0.00042946852, 1.50016332, -7.94494554e-06, 0.499996573, -0.000292498793, 0.866027474, 1.23889242e-06, 1.00000012, 0.000337032456, -0.866027534, -0.000167442151, 0.499996573),
CFrame.new(0.998134136, 0.446251094, -1.11091995, 0.783737183, 0.500254512, 0.36810562, 0.159336776, 0.410895228, -0.897650898, -0.60030663, 0.762174964, 0.242324889),
CFrame.new(-1.60379899, 0.657177448, 0.290532261, 0.395718038, 0.901369691, -0.175898328, -0.292884171, -0.0576668307, -0.954407454, -0.870417237, 0.429194063, 0.241177052),
CFrame.new(0.500091672, -2.00022912, 3.0502677e-05, 1.00000024, 0, -2.98023224e-08, 0, 1.00000012, 0, -2.98023224e-08, 0, 1.00000012),
CFrame.new(-0.499991387, -2.00022721, -4.65214252e-05, 0.499995053, 9.27539077e-07, 0.866028368, -1.23065342e-06, 1.00000012, -3.60509148e-07, -0.866028428, -8.85520421e-07, 0.499995083),
}, .4, false)
end
local num = 4
if pshots <= 3 then
num = pshots
end
for aba=1,num do
CamShake(RightArm,3,.2,.3)
getNearestGuy()
local part, pos = rayCast(Pistol2F.Position,((TargetPoint+Vector3.new(math.random(-15,15)/10,math.random(-15,15)/10,math.random(-15,15)/10)) - Pistol2F.Position),200,chara)
local aimo = Instance.new("Part",Camera)
aimo.Anchored = true
aimo.Size = Vector3.new()
aimo.Transparency = 1
aimo.CanCollide = false
aimo.CFrame = CFrame.new(pos)
for i=1,3 do
Effects.Meshed(Pistol2F.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),Vector3.new(),Vector3.new(.0025,.0015,.0025),"","rbxassetid://662585058","",0,false,.1)
end
Effects.Block(Pistol2F.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.3,.3,.3),"Neon","Bright yellow",true,false,.1)
Effects.Block(Pistol2F.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.6,.6,.6),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new(pos),Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.1,.1,.1),"Neon","Bright yellow",true,false,.1)
Effects.Block(CFrame.new((Pistol2F.Position + pos)/2,pos),Vector3.new(.2,.2,(Pistol2F.Position - pos).magnitude),Vector3.new(0,0,1),Vector3.new(.1,.1,0),"Neon","Bright yellow",false,false,.1)
MagnitudeDmg(aimo,3,18,2,RootPart.CFrame.lookVector*2,false,"Shot",.1)
so(1583819337,Pistol2Part,math.random(90,110)/100,2)
local hitpt = Instance.new("Part",EffectModel)
hitpt.Size = Vector3.new(0,0,.3)
hitpt.CFrame = Pistol2Part.CFrame * CFrame.new(0,.465,.1)-- * CFrame.Angles(math.rad(90),0,0)
hitpt.Velocity = RootPart.CFrame.rightVector*10+Vector3.new(0,5,0)
local hitm = Instance.new("SpecialMesh",hitpt)
hitm.MeshId = "rbxassetid://94295100"
hitm.TextureId = "rbxassetid://94287792"
hitm.Scale = Vector3.new(3,3,3.5)
coroutine.wrap(function()
swait(2)
for i = 0,1,.1 do
swait()
hitpt.Transparency = i
end
hitpt:Destroy()
end)()
for i=0,1,.5 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000161223114, -1.64846442e-05, 0.0998439789, 0.500000834, 1.23897951e-06, -0.866034865, -0.000292500015, 1.00000441, -0.000167442922, 0.86603111, 0.000337033882, 0.499998719),
CFrame.new(-0.00042947242, 1.50017548, -7.94528023e-06, 0.500000834, -0.000292500015, 0.86603111, 1.23897951e-06, 1.00000441, 0.000337033882, -0.866034865, -0.000167442922, 0.499998719),
CFrame.new(0.998145998, 0.446257651, -1.11093545, 0.783742428, 0.500255764, 0.36810708, 0.159337461, 0.410896987, -0.897654712, -0.600312531, 0.762179732, 0.242326021),
CFrame.new(-1.66605222, 0.85397166, 0.254648387, 0.313735187, 0.832365632, -0.456884146, -0.243486553, -0.394562453, -0.886024356, -0.917765141, 0.389220238, 0.0788824111),
CFrame.new(0.41350022, -2.00026441, -0.0499946438, 1.00000536, 0, -1.81794167e-06, 0, 1.00000441, -7.27595761e-11, -1.81794167e-06, -7.27595761e-11, 1.00000751),
CFrame.new(-0.586586297, -2.00026202, -0.050061062, 0.499999285, 9.27539077e-07, 0.866031885, -1.23056634e-06, 1.00000441, -3.60538252e-07, -0.866035759, -8.85622285e-07, 0.499997169),
}, .5, false)
end
pshots = pshots - 1
aimo:Destroy()
for i=0,1,.5 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000189566548, 4.85283067e-08, -0.000144683872, 0.499996573, 1.23889242e-06, -0.866027534, -0.000292498793, 1.00000012, -0.000167442151, 0.866027474, 0.000337032456, 0.499996573),
CFrame.new(-0.00042946852, 1.50016332, -7.94494554e-06, 0.499996573, -0.000292498793, 0.866027474, 1.23889242e-06, 1.00000012, 0.000337032456, -0.866027534, -0.000167442151, 0.499996573),
CFrame.new(0.998134136, 0.446251094, -1.11091995, 0.783737183, 0.500254512, 0.36810562, 0.159336776, 0.410895228, -0.897650898, -0.60030663, 0.762174964, 0.242324889),
CFrame.new(-1.60379899, 0.657177448, 0.290532261, 0.395718038, 0.901369691, -0.175898328, -0.292884171, -0.0576668307, -0.954407454, -0.870417237, 0.429194063, 0.241177052),
CFrame.new(0.500091672, -2.00022912, 3.0502677e-05, 1.00000024, 0, -2.98023224e-08, 0, 1.00000012, 0, -2.98023224e-08, 0, 1.00000012),
CFrame.new(-0.499991387, -2.00022721, -4.65214252e-05, 0.499995053, 9.27539077e-07, 0.866028368, -1.23065342e-06, 1.00000012, -3.60509148e-07, -0.866028428, -8.85520421e-07, 0.499995083),
}, .5, false)
end
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0.000184101125, 5.04431128e-08, -0.000150338426, 0.500005603, 1.22921699e-06, -0.866033554, -0.000292496145, 1.00001001, -0.000167453618, 0.866025388, 0.000337033183, 0.500001013),
CFrame.new(-0.000420940924, 1.50013995, -7.44290446e-06, 0.500005603, -0.000292496145, 0.866025388, 1.22921699e-06, 1.00001001, 0.000337033183, -0.866033554, -0.000167453618, 0.500001013),
CFrame.new(1.07864964, 0.497787654, -0.827312827, 0.812867165, 0.580278814, -0.0502792969, -0.0143589694, -0.0663333088, -0.997701764, -0.582282901, 0.811714172, -0.0455874838),
CFrame.new(0.205326244, -0.00924482942, -0.802453697, -0.432021976, -0.765640318, -0.476609319, -0.0512114279, 0.548448205, -0.834623814, 0.900416195, -0.33616206, -0.276147217),
CFrame.new(0.500085354, -2.00019813, 1.89718667e-05, 1.00000286, -2.50292942e-09, -4.02331352e-06, -2.50292942e-09, 1.00000989, -1.43336365e-09, -4.02331352e-06, -1.43336365e-09, 1.00000751),
CFrame.new(-0.499986112, -2.0001986, -4.31090593e-05, 0.500004113, 9.35033313e-07, 0.866026223, -1.24029475e-06, 1.00000989, -3.6941492e-07, -0.866034448, -8.92294338e-07, 0.499999523),
}, .4, false)
end
Pistol2Part.Transparency = 1
PistolH.Transparency = 0
Humanoid.WalkSpeed = 16
attack = false
weld4.Part0 = PistolH
end

function silentstab()
attack = true
Humanoid.WalkSpeed = 2
local grab = nil
local torsy = nil
for i, v in pairs(FindNearestTorso(Torso.Position, 5)) do
if v:FindFirstChild('Head') and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health > 1 then
torsy = GetDudesTorso(v)
grab = v
end
end
if grab ~= nil and torsy ~= nil then
so(200632136, RootPart, .8, 1)
for i = 0,1,.2 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.0000037, 1.69968928e-10, 0, 1.69968928e-10, 1, -1.57160684e-09, 0, -1.57160684e-09, 1.0000037),
CFrame.new(-3.01809487e-05, 1.48262334, -0.0984517932, 1.00000286, 2.59244189e-07, -2.88084266e-07, -2.05077583e-07, 0.98480767, 0.173648551, 3.28727765e-07, -0.173649058, 0.984810591),
CFrame.new(1.30344474, -0.164363086, 0.272664785, 0.939695418, 0.342020869, 7.09114829e-08, -0.3213934, 0.883021832, 0.342021555, 0.116978429, -0.321396053, 0.939694881),
CFrame.new(-1.16895545, 0.600005031, -0.538890362, 0.642788529, -0.766047359, -1.59056867e-07, 3.28349415e-07, 4.82803443e-07, -1, 0.766047418, 0.642788589, 5.64206857e-07),
CFrame.new(0.500057638, -2.0000205, 1.92150474e-05, 0.984810531, -1.72498687e-07, -0.173649296, 1.44973455e-07, 1, -1.72876753e-07, 0.173649311, 1.42812496e-07, 0.984810591),
CFrame.new(-0.499961913, -2.00001907, 1.8030405e-06, 0.984810591, 2.5749668e-07, 0.173648581, -2.14211468e-07, 1, -2.66620191e-07, -0.173648596, 2.23022653e-07, 0.98481065),
}, .3, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
so(211059653,Knife,1,1)
for i = 0,1,.1 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.00001013, 3.01577785e-09, 1.23691279e-09, 3.01577785e-09, 0.999999762, -1.05661456e-06, 1.23691279e-09, -1.05661456e-06, 0.999995291),
CFrame.new(-3.01768723e-05, 1.48262274, -0.098456949, 1.00001013, 2.61965397e-07, -2.86352588e-07, -2.02173752e-07, 0.984807134, 0.173650354, 3.30022885e-07, -0.173651636, 0.984802246),
CFrame.new(1.5392077, 0.777850926, 0.0131720304, 0.935736716, -0.351706415, -0.0266419984, -0.324943185, -0.888975859, 0.32269752, -0.137177527, -0.293299675, -0.946125269),
CFrame.new(-1.16899812, 0.600008368, -0.538897991, 0.642793238, -0.766052902, -1.61869082e-07, -4.9744267e-07, -2.09358404e-07, -0.999999762, 0.766041577, 0.642783701, 1.59302726e-06),
CFrame.new(0.500073791, -2.00001764, 1.58026814e-05, 0.984817624, -1.67005226e-07, -0.173650563, -3.64234438e-08, 0.999999762, -1.19872857e-06, 0.173647985, -9.07632057e-07, 0.984802961),
CFrame.new(-0.499974608, -2.0000205, 1.321733e-05, 0.984817803, 2.5789538e-07, 0.173649862, -2.46509444e-08, 0.999999762, -1.31168053e-06, -0.173647255, -8.18137778e-07, 0.984803081),
}, .3, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
tr1.Enabled = true
for i = 0,1,.2 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.00000012, 1.52766688e-12, 1.45519152e-11, 1.52766688e-12, 1, 0, 1.45519152e-11, 0, 1.00000012),
CFrame.new(-3.01809741e-05, 1.48262441, -0.0984470844, 1.00000012, 2.59178705e-07, -2.88142473e-07, -2.05221269e-07, 0.984807312, 0.173650622, 3.28800525e-07, -0.173650607, 0.984807432),
CFrame.new(1.11628127, 0.212460458, -1.06663299, -0.114152029, 0.566243351, -0.816295326, -0.993282199, -0.0493562892, 0.104664929, 0.0189765152, 0.822759032, 0.568073511),
CFrame.new(-1.16897488, 0.60000807, -0.538883448, 0.642792463, -0.766040564, -1.62451698e-07, -1.30882836e-06, -8.86182534e-07, -1, 0.766040623, 0.642792284, -1.57224713e-06),
CFrame.new(0.500080049, -2.0000174, 2.25231051e-05, 0.984817743, -1.63965893e-07, -0.173650578, -2.22877134e-07, 0.999999821, -2.23875395e-06, 0.173648, 1.48982508e-07, 0.984803081),
CFrame.new(-0.499980897, -2.00001836, 1.99377537e-05, 0.984817982, 2.60905608e-07, 0.173649877, 1.55865564e-07, 0.999999821, -2.35275365e-06, -0.17364727, 2.38447683e-07, 0.9848032),
}, .4, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
Dmg(grab,math.huge,0,Vector3.new(),false,"Sharp",0)
tr1.Enabled = false
for i=1,30 do
swait()
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
so(444667824,torsy,1,1)
p1mit.Enabled = true
for i = 0,2,.1 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.00001013, 3.01577785e-09, 1.23691279e-09, 3.01577785e-09, 0.999999762, -1.05661456e-06, 1.23691279e-09, -1.05661456e-06, 0.999995291),
CFrame.new(-3.01768723e-05, 1.48262274, -0.098456949, 1.00001013, 2.61965397e-07, -2.86352588e-07, -2.02173752e-07, 0.984807134, 0.173650354, 3.30022885e-07, -0.173651636, 0.984802246),
CFrame.new(1.5392077, 0.777850926, 0.0131720304, 0.935736716, -0.351706415, -0.0266419984, -0.324943185, -0.888975859, 0.32269752, -0.137177527, -0.293299675, -0.946125269),
CFrame.new(-1.16899812, 0.600008368, -0.538897991, 0.642793238, -0.766052902, -1.61869082e-07, -4.9744267e-07, -2.09358404e-07, -0.999999762, 0.766041577, 0.642783701, 1.59302726e-06),
CFrame.new(0.500073791, -2.00001764, 1.58026814e-05, 0.984817624, -1.67005226e-07, -0.173650563, -3.64234438e-08, 0.999999762, -1.19872857e-06, 0.173647985, -9.07632057e-07, 0.984802961),
CFrame.new(-0.499974608, -2.0000205, 1.321733e-05, 0.984817803, 2.5789538e-07, 0.173649862, -2.46509444e-08, 0.999999762, -1.31168053e-06, -0.173647255, -8.18137778e-07, 0.984803081),
}, .3, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
p1mit.Enabled = false
BodyVel(torsy,RootPart.CFrame.rightVector*-30)
for i = 0,2,.1 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.00001895, -1.08813225e-09, -2.15858745e-06, -1.08813225e-09, 1, -5.23868948e-09, -2.15858745e-06, -5.23868948e-09, 1.00001907),
CFrame.new(-2.80096792e-05, 1.48262501, -0.0984562784, 1.00001895, 6.30865543e-07, -2.43255636e-06, -2.06277122e-07, 0.984807432, 0.173650309, -1.83083466e-06, -0.173653573, 0.984826326),
CFrame.new(1.56420577, 0.0696786866, 0.187489942, 0.984821677, -0.173651561, 2.03962554e-06, 0.163176283, 0.925417721, 0.342017293, -0.059396904, -0.336825103, 0.93970716),
CFrame.new(-1.61899722, 0.500005424, 0.240550712, 0.500009537, 0.866036475, -2.03252193e-06, -1.80752249e-06, -1.30520493e-06, -1, -0.866037965, 0.500006795, 9.20670573e-07),
CFrame.new(0.500072181, -2.0000205, 2.01910734e-05, 0.984817028, -1.70239531e-07, -0.173650548, 1.41451892e-07, 1, -1.7194543e-07, 0.173648432, 1.39552867e-07, 0.984817445),
CFrame.new(-0.499981821, -2.00002146, 1.2755394e-05, 0.984826863, 2.54893166e-07, 0.173649251, -2.13003659e-07, 1, -2.71422323e-07, -0.173653603, 2.19704816e-07, 0.984826326),
}, .4, false)
end
end
attack = false
Humanoid.WalkSpeed = 16
end

function silentpist()
attack = true
Humanoid.WalkSpeed = 2
local grab = nil
local torsy = nil
for i, v in pairs(FindNearestTorso(Torso.Position, 5)) do
if v:FindFirstChild('Head') and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health > 1 then
torsy = GetDudesTorso(v)
grab = v
end
end
if grab ~= nil and torsy ~= nil then
so(200632136, RootPart, .8, 1)
for i = 0,1,.2 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.0000037, 1.69968928e-10, 0, 1.69968928e-10, 1, -1.57160684e-09, 0, -1.57160684e-09, 1.0000037),
CFrame.new(-3.01809487e-05, 1.48262334, -0.0984517932, 1.00000286, 2.59244189e-07, -2.88084266e-07, -2.05077583e-07, 0.98480767, 0.173648551, 3.28727765e-07, -0.173649058, 0.984810591),
CFrame.new(1.30344474, -0.164363086, 0.272664785, 0.939695418, 0.342020869, 7.09114829e-08, -0.3213934, 0.883021832, 0.342021555, 0.116978429, -0.321396053, 0.939694881),
CFrame.new(-1.16895545, 0.600005031, -0.538890362, 0.642788529, -0.766047359, -1.59056867e-07, 3.28349415e-07, 4.82803443e-07, -1, 0.766047418, 0.642788589, 5.64206857e-07),
CFrame.new(0.500057638, -2.0000205, 1.92150474e-05, 0.984810531, -1.72498687e-07, -0.173649296, 1.44973455e-07, 1, -1.72876753e-07, 0.173649311, 1.42812496e-07, 0.984810591),
CFrame.new(-0.499961913, -2.00001907, 1.8030405e-06, 0.984810591, 2.5749668e-07, 0.173648581, -2.14211468e-07, 1, -2.66620191e-07, -0.173648596, 2.23022653e-07, 0.98481065),
}, .4, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
for i = 0,1,.1 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.000018, 8.09635026e-10, 0, 8.09635026e-10, 1, -7.88713805e-09, 0, -7.88713805e-09, 1.000018),
CFrame.new(-3.11340882e-05, 1.48262513, -0.0984535366, 1.00001717, 2.59900844e-07, -2.8796785e-07, -2.04408821e-07, 0.98480767, 0.173648566, 3.28756869e-07, -0.173651531, 0.984824657),
CFrame.new(1.79998624, 0.477996171, -0.413522929, 0.342012018, 0.883037329, -0.321389318, -0.163174942, -0.281007737, -0.945731819, -0.925429285, 0.375894368, 0.0479815453),
CFrame.new(-1.1689868, 0.600005031, -0.538915634, 0.642797709, -0.766058326, -1.5969654e-07, 3.23954737e-07, 4.78248694e-07, -1, 0.766058385, 0.642797768, 5.70522388e-07),
CFrame.new(0.500071704, -2.00002003, 1.27032399e-05, 0.984824598, -1.71859028e-07, -0.173651785, 1.44493242e-07, 1, -1.79221388e-07, 0.173651785, 1.36496965e-07, 0.984824657),
CFrame.new(-0.499974728, -2.00001907, 2.80886889e-06, 0.984824657, 2.58136339e-07, 0.173651055, -2.12450686e-07, 1, -2.72644684e-07, -0.173651069, 2.16707122e-07, 0.984824717),
}, .4, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
CamShake(RightArm,3,.2,.3)
for i=1,3 do
Effects.Meshed(PistolF.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),Vector3.new(),Vector3.new(.0025,.0015,.0025),"","rbxassetid://662585058","",0,false,.1)
end
Effects.Block(PistolF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.3,.3,.3),"Neon","Bright yellow",true,false,.1)
Effects.Block(PistolF.CFrame,Vector3.new(.4,.4,.4),Vector3.new(),Vector3.new(.6,.6,.6),"Neon","Bright yellow",true,false,.1)
so(1583819337,PistolPart,math.random(90,110)/100,2)
Dmg(grab,math.huge,0,Vector3.new(),false,"Shot",0)
pshots = pshots - 1
for i = 0,1,.2 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.00000417, 2.18335572e-10, -5.09317033e-10, 2.18335572e-10, 1, 2.32830644e-10, -5.09317033e-10, 2.32830644e-10, 1.00000417),
CFrame.new(-3.01806849e-05, 1.48262227, -0.0984561294, 1.00000417, 2.59502485e-07, -2.88564479e-07, -2.05000106e-07, 0.984807312, 0.173651457, 3.28247552e-07, -0.173652172, 0.984811306),
CFrame.new(1.56238043, 0.668045402, -0.472643495, 0.598204136, -0.325104058, -0.732436657, -0.49942559, -0.866038263, -0.0234913211, -0.626681089, 0.379850179, -0.680432916),
CFrame.new(-1.16897666, 0.600004077, -0.538914442, 0.642789423, -0.766048372, -1.59102683e-07, 3.17784725e-07, 4.73693945e-07, -1, 0.766048431, 0.642789483, 5.47443051e-07),
CFrame.new(0.500065982, -2.00001907, -2.65985727e-06, 0.984811783, -1.69772804e-07, -0.17364952, 1.42616045e-07, 1, -1.71741704e-07, 0.173649535, 1.44791557e-07, 0.984811842),
CFrame.new(-0.49996838, -2.00001955, 1.83209777e-05, 0.984811842, 2.5510019e-07, 0.173648834, -2.11686711e-07, 1, -2.65834387e-07, -0.173648834, 2.25525582e-07, 0.984811902),
}, .5, false)
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
for i=1,5 do
swait()
torsy.CFrame = RootPart.CFrame*CFrame.new(0,0,-1.3)
torsy.Velocity = Vector3.new()
end
BodyVel(torsy,RootPart.CFrame.rightVector*-30)
for i = 0,2,.1 do
swait()
PlayAnimationFromTable({
CFrame.new(0, 0, 0, 1.00001895, -1.08813225e-09, -2.15858745e-06, -1.08813225e-09, 1, -5.23868948e-09, -2.15858745e-06, -5.23868948e-09, 1.00001907),
CFrame.new(-2.80096792e-05, 1.48262501, -0.0984562784, 1.00001895, 6.30865543e-07, -2.43255636e-06, -2.06277122e-07, 0.984807432, 0.173650309, -1.83083466e-06, -0.173653573, 0.984826326),
CFrame.new(1.56420577, 0.0696786866, 0.187489942, 0.984821677, -0.173651561, 2.03962554e-06, 0.163176283, 0.925417721, 0.342017293, -0.059396904, -0.336825103, 0.93970716),
CFrame.new(-1.61899722, 0.500005424, 0.240550712, 0.500009537, 0.866036475, -2.03252193e-06, -1.80752249e-06, -1.30520493e-06, -1, -0.866037965, 0.500006795, 9.20670573e-07),
CFrame.new(0.500072181, -2.0000205, 2.01910734e-05, 0.984817028, -1.70239531e-07, -0.173650548, 1.41451892e-07, 1, -1.7194543e-07, 0.173648432, 1.39552867e-07, 0.984817445),
CFrame.new(-0.499981821, -2.00002146, 1.2755394e-05, 0.984826863, 2.54893166e-07, 0.173649251, -2.13003659e-07, 1, -2.71422323e-07, -0.173653603, 2.19704816e-07, 0.984826326),
}, .4, false)
end
end
attack = false
Humanoid.WalkSpeed = 16
end

function heal()
attack = true
Humanoid.WalkSpeed = 2
local val = Instance.new("BoolValue",chara)
val.Name = "healcool"
debby:AddItem(val,30)
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000131, 5.536549e-11, 0, 5.536549e-11, 1, 5.82076609e-11, 0, 5.82076609e-11, 1.00000131),
CFrame.new(-0.0470143259, 1.46578526, -0.0813575089, 0.866027415, -0.171009213, 0.46984449, 1.88792183e-06, 0.939693928, 0.342016727, -0.499997973, -0.296194941, 0.813800871),
CFrame.new(1.50003648, 0.699995697, 3.59429396e-05, 1.00000131, -2.06271608e-07, -6.67154382e-06, -2.06196262e-07, -1, 2.48575816e-07, -6.67157292e-06, -2.48721335e-07, -1.00000131),
CFrame.new(-1.2535826, -0.14593178, 0.0679161474, 0.941512227, -0.331708014, -0.0593915284, 0.331707656, 0.88120383, 0.336823434, -0.059390977, -0.33682391, 0.939694226),
CFrame.new(0.500059426, -2.00001574, 4.5761466e-05, 0.939693809, -1.38383513e-07, -0.342020601, -2.80560926e-08, 1, -4.82134055e-07, 0.342020571, 4.627218e-07, 0.939694047),
CFrame.new(-0.499963611, -2.0000174, 2.33203173e-05, 0.939694047, -1.69952145e-07, 0.342020452, 2.99973181e-07, 1, -3.27068847e-07, -0.342020482, 4.10043867e-07, 0.939694047),
}, .4, false)
end
local inj = New("Part",chara,"inj",{Size = Vector3.new(2.10000014, 0.299999982, 0.300000012),CFrame = CFrame.new(-37.1041107, 9.26048374, -70.1689682, -0.100794047, 0.957379222, 0.270676494, -0.129940063, 0.257064044, -0.957618713, -0.986385465, -0.131693989, 0.0984913707),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,TopSurface = Enum.SurfaceType.Smooth,})
local iMesh = New("SpecialMesh",inj,"Mesh",{Scale = Vector3.new(0.00200000009, 0.00200000009, 0.00200000009),MeshId = "rbxassetid://504973881",MeshType = Enum.MeshType.FileMesh,})
local iWeld = New("ManualWeld",inj,"Weld",{Part0 = inj,Part1 = LeftArm,C0 = CFrame.new(0, 0, 0, -0.100794047, -0.129940063, -0.986385465, 0.957379222, 0.257064044, -0.131693989, 0.270676494, -0.957618713, 0.0984913707),C1 = CFrame.new(0.250003815, -1.05000305, -0.249992371, -0.270675898, 0.957618654, -0.0984939635, 0.957379043, 0.257062733, -0.131696969, -0.100796357, -0.129943267, -0.986384809),})
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000441, 2.30059527e-10, -1.45519152e-11, 2.30059527e-10, 1, 2.32830644e-10, -1.45519152e-11, 2.32830644e-10, 1.00000441),
CFrame.new(-0.0342181027, 1.48367238, -0.0925136507, 0.939694226, 1.76227331e-07, 0.342022419, -0.0593916923, 0.984807789, 0.163176015, -0.336826295, -0.173648849, 0.925418019),
CFrame.new(1.50004876, 0.69999665, 2.83136833e-05, 1.00000441, -2.06446316e-07, -6.67157292e-06, -2.06021568e-07, -1, 2.48401193e-07, -6.67160202e-06, -2.48895958e-07, -1.00000441),
CFrame.new(-1.32655382, 0.16053623, -0.618192732, 0.82254082, 0.00194577302, 0.568706632, 0.568639874, 0.0127443047, -0.82248795, -0.00884814467, 0.999919116, 0.00937626697),
CFrame.new(0.500066876, -2.00001621, 5.19603491e-05, 0.939696729, -1.38208819e-07, -0.342021674, -2.78232619e-08, 1, -4.81959432e-07, 0.342021644, 4.62896423e-07, 0.939696968),
CFrame.new(-0.499963373, -2.00001645, 2.26646662e-05, 0.939696968, -1.69777451e-07, 0.342021525, 3.00089596e-07, 1, -3.26806912e-07, -0.342021555, 4.1021849e-07, 0.939696968),
}, .4, false)
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000012, -3.48876483e-12, 0, -3.48876483e-12, 1, 0, 0, 0, 1.00000012),
CFrame.new(-2.27339151e-05, 1.46578801, -0.0939310491, 1.00000012, -3.72103386e-07, 1.64323137e-06, -2.12327393e-07, 0.939692557, 0.342020363, -1.67140388e-06, -0.342020422, 0.939692676),
CFrame.new(1.50005758, 0.699994743, 3.59426958e-05, 1.00000012, -2.06212761e-07, -6.67157292e-06, -2.06226048e-07, -1, 2.48663127e-07, -6.67157292e-06, -2.48663127e-07, -1.00000012),
CFrame.new(-0.943567514, 0.0578621849, -0.670854151, 0.270323098, -0.957491815, 0.100672945, 0.957676411, 0.256677359, -0.130279034, 0.0989006162, 0.131629527, 0.986353219),
CFrame.new(0.500069618, -2.00001717, 4.97102737e-05, 0.939692676, -1.38762402e-07, -0.342020184, -2.76195351e-08, 1, -4.81668394e-07, 0.342020184, 4.62023309e-07, 0.939692795),
CFrame.new(-0.499966532, -2.00001884, 2.46018171e-05, 0.939692795, -1.69370765e-07, 0.342019975, 2.99449312e-07, 1, -3.27592716e-07, -0.342020005, 4.10247594e-07, 0.939692795),
}, .5, false)
end
so(566593606,Torso,1,1)
coroutine.wrap(function()
healing = true
for i=1,500 do
swait()
--Humanoid.Health = Humanoid.Health + 1
end
healing = false
end)()
swait(60)
inj:BreakJoints()
inj.CanCollide = true
inj.Velocity = RootPart.CFrame.rightVector*-30
coroutine.wrap(function()
swait(60)
for i=0,1,.1 do
swait()
inj.Transparency = i
end
inj:Destroy()
end)()
for i=0,1,.1 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 1.00000012, -7.41096073e-12, 0, -7.41096073e-12, 1, 2.91038305e-11, 0, 2.91038305e-11, 0.99999994),
CFrame.new(-3.04159403e-05, 1.46578789, -0.0939521194, 1.00000012, -4.05150786e-07, 1.62865035e-06, -1.76347669e-07, 0.939691484, 0.342023492, -1.66901737e-06, -0.342023432, 0.939691424),
CFrame.new(1.50005376, 0.699994802, 3.59716505e-05, 1.00000012, -1.58599477e-07, -6.6684006e-06, -1.58597771e-07, -1, 2.8318027e-07, -6.6684006e-06, -2.83209374e-07, -0.99999994),
CFrame.new(-1.64437401, 0.697701395, 0.19487834, 0.408384711, 0.907241344, 0.100674063, -0.898611128, 0.418956876, -0.130281046, -0.160374403, -0.0372620374, 0.986352742),
CFrame.new(0.500071704, -2.00001526, 2.73138285e-05, 0.939691603, 9.13247675e-07, -0.342023104, -1.21287303e-06, 1, -6.62083039e-07, 0.342023045, 1.03705679e-06, 0.939691603),
CFrame.new(-0.499963105, -2.00001931, 1.77323818e-05, 0.939691305, -1.36975643e-06, 0.342023998, 1.52508437e-06, 1, -1.85216777e-07, -0.342024028, 6.95697963e-07, 0.939691186),
}, .5, false)
end
attack = false
Humanoid.WalkSpeed = 16
end

function doge()
attack = true
Humanoid.WalkSpeed = 0
so(536642316,Torso,1,1)
local bodyvel = Instance.new("BodyVelocity",RootPart)
local pep = 10000000
bodyvel.P = pep
bodyvel.MaxForce = Vector3.new(pep,pep,pep)
bodyvel.Velocity = RootPart.CFrame.lookVector*50
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, -0.413182259, -0.492409885, 1, 0, 0, 0, 0.173647001, 0.984807968, 0, -0.984807968, 0.173647001),
CFrame.new(0, 1.39017391, 0.409808099, 1, 0, 0, 0, 0.499998748, -0.866026163, 0, 0.866026163, 0.499998748),
CFrame.new(0.997828066, 1.40889716, 0.360830426, 0, 0.173647001, 0.984807968, 0.173647001, -0.969846725, 0.171008945, 0.984807968, 0.171008945, -0.030153282),
CFrame.new(-1.00000775, 1.48291457, 0.347779244, 0, -0.173647001, -0.984807968, -0.173647001, -0.969846725, 0.171008945, -0.984807968, 0.171008945, -0.030153282),
CFrame.new(0.5, -2, -2.86102295e-06, 1, 0, 0, 0, 1, 0, 0, 0, 1),
CFrame.new(-0.5, -2, -2.86102295e-06, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}, .4, false)
bodyvel.Velocity = RootPart.CFrame.lookVector*50
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, -1.30470812, -0.622091293, 1, 0, 0, 0, -0.866025984, 0.499998987, 0, -0.499998987, -0.866025984),
CFrame.new(0, 1.47984993, -0.230206192, 1, 0, 0, 0, 0.939693034, 0.34201926, 0, -0.34201926, 0.939693034),
CFrame.new(1.55977595, 0.764639199, 0.053586632, 0.93969202, -0.342021853, -1.61162654e-06, -0.342021883, -0.93969202, 3.57627869e-07, -1.63912773e-06, 2.08616257e-07, -1),
CFrame.new(-1.55977952, 0.764637887, 0.053586632, 0.93969202, 0.342021853, 1.61162654e-06, 0.342021883, -0.93969202, 3.57627869e-07, 1.63912773e-06, 2.08616257e-07, -1),
CFrame.new(0.5, -1.19999313, -0.600002289, 1, 0, 0, 0, 1, 0, 0, 0, 1),
CFrame.new(-0.5, -1.19999313, -0.600002289, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}, .4, false)
bodyvel.Velocity = RootPart.CFrame.lookVector*50
end
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, -2.22375727, 0.305265486, 1, 0, 0, 0, 0.500000238, -0.866025388, 0, 0.866025388, 0.500000238),
CFrame.new(0, 1.35128808, -0.383415997, 1, 0, 0, 0, 0.766043901, 0.642788529, 0, -0.64278847, 0.766043901),
CFrame.new(1.55977547, 0.276377708, 0.0466975421, 0.93969214, -0.342021614, 4.56934458e-07, 0.321395159, 0.88302201, 0.342019856, -0.116978563, -0.321393132, 0.939692855),
CFrame.new(-1.55978227, 0.276371837, 0.0467037484, 0.93969214, 0.342021614, -4.56934458e-07, -0.321395159, 0.88302201, 0.342019856, 0.116978563, -0.321393132, 0.939692855),
CFrame.new(0.5, -1.19999337, -0.599998593, 1, 0, 0, 0, 1.00000024, 0, 0, 0, 1.00000024),
CFrame.new(-0.500003815, -1.35979521, -0.923200667, 1, 0, 0, 0, 0.866025388, -0.500000238, 0, 0.500000238, 0.866025388),
}, .4, false)
bodyvel.Velocity = RootPart.CFrame.lookVector*50
end
bodyvel:Destroy()
Humanoid.WalkSpeed = 16
attack = false
end

function goright()
attack = true
Humanoid.WalkSpeed = 0
so(536642316,Torso,1,1)
BodyVel(RootPart,RootPart.CFrame.rightVector*40)
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 0.866025686, 9.42248391e-07, 0.500011504, -8.48485797e-08, 1, 2.03145464e-06, -0.499997288, 1.801709e-06, 0.866039157),
CFrame.new(0.0133891273, 1.49998093, -0.223221898, 0.999244928, 0.0180275738, 0.0343858302, -0.0296961162, 0.925415933, 0.377787739, -0.0250054598, -0.378526747, 0.92527163),
CFrame.new(0.597281635, 0.899970174, -0.636579931, -0.2961981, 0.81379801, 0.499997288, 0.939692438, 0.34202075, -1.801709e-06, -0.171011984, 0.469857872, -0.866039157),
CFrame.new(-1.5597142, 0.600028992, -0.496432245, 0.556670129, 0.663414598, -0.499997288, -0.766044378, 0.642787695, 1.801709e-06, 0.321399361, 0.38303256, 0.866039157),
CFrame.new(0.0669843927, -1.80000138, -0.249991581, 0.750000238, 0.433012992, -0.499997288, -0.499999464, 0.866025865, 1.801709e-06, 0.433021635, 0.250007659, 0.866039157),
CFrame.new(-1.01960945, -1.79999983, -0.300026655, 0.663413942, 0.556670904, -0.499997288, -0.642787337, 0.766044736, 1.801709e-06, 0.38302961, 0.321402997, 0.866039157),
}, .4, false)
end
Humanoid.WalkSpeed = 16
attack = false
end

function goleft()
attack = true
Humanoid.WalkSpeed = 0
so(536642316,Torso,1,1)
BodyVel(RootPart,RootPart.CFrame.rightVector*-40)
for i=0,1,.2 do
swait()
PlayAnimationFromTable({		
CFrame.new(0, 0, 0, 0.866035402, 9.42248391e-07, -0.499995083, 1.7168677e-06, 1, 1.08920722e-06, 0.500013709, 1.801709e-06, 0.866029859),
CFrame.new(-0.100005262, 1.49997783, -0.173194915, 0.984938622, -0.171012864, -0.0261079669, 0.171011686, 0.939692199, 0.296198815, -0.0261065066, -0.296198487, 0.954771042),
CFrame.new(1.55997992, 0.600023985, -0.496356547, 0.433018357, -0.750008225, 0.500013709, 0.866026461, 0.499998212, 1.801709e-06, -0.249996096, 0.433009237, 0.866029859),
CFrame.new(-0.510781586, 0.89997524, -0.686506629, -0.296202958, -0.813806593, -0.500013709, -0.939693034, 0.342019022, -1.801709e-06, 0.171007261, 0.469842136, -0.866029859),
CFrame.new(0.975441694, -1.79999304, -0.250189304, 0.750009537, -0.433016449, 0.500013709, 0.500001013, 0.866024911, 1.801709e-06, -0.433007956, 0.249998584, 0.866029859),
CFrame.new(-0.282589972, -1.79999781, -0.149757206, 0.813807786, -0.296199739, 0.500013709, 0.34202078, 0.939692438, 1.801709e-06, -0.469841361, 0.171009272, 0.866029859),
}, .4, false)
end
Humanoid.WalkSpeed = 16
attack = false
end

--function aimassist()
--coroutine.wrap(function()
--for i=1,2 do
--so(613361563,Torso,1,.2)
--swait(3)
--end
--end)()
--local val = Instance.new("BoolValue",chara)
--val.Name = "targetcool"
--debby:AddItem(val,10)
--for i,v in pairs(workspace:GetDescendants()) do
--if v:IsA("Model") and v~=chara and v:FindFirstChildOfClass("Humanoid") then
--local crsha = Instance.new("BillboardGui",Camera)
--crsha.Size = UDim2.new(10,0,10,0)
--crsha.AlwaysOnTop = true
--crsha.Adornee = GetDudesTorso(v)
--local imgl = Instance.new("ImageLabel",crsha)
--imgl.Position = UDim2.new(0,0,0,0)
--imgl.Size = UDim2.new(1,0,1,0)
--imgl.Image = "rbxassetid://29066470"
--imgl.BackgroundTransparency = 1
--imgl.ImageTransparency = 1
--coroutine.wrap(function()
--while crsha~=nil do
--swait()
--imgl.Rotation = imgl.Rotation + 1
--if crsha.Adornee == nil then crsha:Destroy() end
--if crsha.Adornee.Parent:FindFirstChildOfClass("Humanoid") and crsha.Adornee.Parent:FindFirstChildOfClass("Humanoid").Health <= 0 then crsha:Destroy() end
--end
--end)()
--coroutine.wrap(function()
--for i=0,1,.05 do
--swait()
--crsha.Size = UDim2.new(50-30*i,0,50-30*i,0)
--imgl.ImageTransparency = 1-i
--end
--crsha.Size = UDim2.new(20,0,20,0)
--imgl.ImageTransparency = 0
--swait(300)
--for i=0,1,.05 do
--swait()
--crsha.Size = UDim2.new(20+30*i,0,20+30*i,0)
--imgl.ImageTransparency = i
--end
--crsha:Destroy()
--end)()
--end
--end
--end

function aimassist()
coroutine.wrap(function()
for i=1,2 do
so(613361563,Torso,1,.2)
swait(3)
end
end)()
local val = Instance.new("BoolValue",chara)
val.Name = "targetcool"
debby:AddItem(val,10)
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("Model") and v~=chara and v:FindFirstChildOfClass("Humanoid") then
for _,b in pairs(v:children'') do
if b:IsA("BasePart") then
local xr = Instance.new("BoxHandleAdornment",Player:FindFirstChildOfClass("PlayerGui"))
xr.Adornee = b
xr.AlwaysOnTop = true
xr.Size = b.Size + Vector3.new(.1,.1,.1)
xr.Color3 = Color3.new(1,0,0)
xr.Transparency = 1
xr.ZIndex = 5
coroutine.wrap(function()
repeat swait()
until v:FindFirstChildOfClass("Humanoid").Health <= 0
xr:Destroy()	
end)()
coroutine.wrap(function()
for tr=0,.5,.1 do
swait()
xr.Transparency = 1-tr
end
xr.Transparency = .5
swait(300)
for tr=0,.5,.1 do
swait()
xr.Transparency = .5+tr
end
xr:Destroy()
end)()
end
end
end
end
end

local mouse = game.Players.LocalPlayer:GetMouse()

local mousedownevent = mouse.Button1Down
local mouseupevent = mouse.Button1Up
local keydownevent = mouse.KeyDown
local keyupevent = mouse.KeyUp

fighting = false

local a =mousedownevent:connect(function()
if attack == false then
if currentwep == "Knife" then
knifestab()
elseif currentwep == "Pistol" then
pistolshoot()
elseif currentwep == "Shotgun" then
shotgunshoot()
elseif currentwep == "Sniper" then
snipershoot()
end
end
end)

local sprintt = 0
local c = keydownevent:connect(function(k)
k = k:lower()
if k=='m' then
if mus.IsPlaying == true then
mus:Stop()
elseif mus.IsPaused == true then
mus:Play()
end
end
if attack == false then
if k == 'z' then
if Anim ~= "Fall" and Anim ~= "Jump" then
doge()
end
elseif k == 'x' then
if currentwep ~= "Knife" then
wepknifestab()
else
silentstab()
end
elseif k == 'f' and chara:FindFirstChild("healcool")==nil then
heal()
elseif k == 'g' and chara:FindFirstChild("targetcool")==nil then
aimassist()
elseif k == 'h' then
so(115959318,Torso,1,1)
if li.Enabled == true then
li.Enabled = false
else
li.Enabled = true
end
elseif k == 'c' then
if currentwep ~= "Pistol" and pshots > 0 then
pistol2shoot()
elseif currentwep == "Pistol" and pshots > 1 then
silentpist()
end
elseif k == 'q' then
goleft()
elseif k == 'e' then
goright()
elseif k == 'r' then
attack = true
Humanoid.WalkSpeed = 1
if currentwep == "Pistol" then
pistolrel()
elseif currentwep == "Shotgun" then
shotgunreload()
elseif currentwep == "Sniper" then
sniperreload()
end
Humanoid.WalkSpeed = 16
attack = false
elseif k == 't' then
switchweps("Pistol")
elseif k == 'y' then
switchweps("Shotgun")
elseif k == 'u' then
switchweps("Sniper")
end
end
end)

--coroutine.wrap(function()
--game:GetService("RunService").RenderStepped:connect(function()
--    for i,v in pairs(chara:GetDescendants()) do
--    if v:IsA("BasePart") and v.Parent.Name ~= "FakeHeadM" and v.Name ~= "Head" and v.Parent:IsA("Accessory") == false then
--    v.LocalTransparencyModifier = 0
--    end
--    end
--end)
--end)()


local b;
coroutine.wrap(function()
b = game:GetService("RunService").Heartbeat:connect(function()
swait()
if doe <= 360 then
doe = doe + 2
else
doe = 0
end
end)
end)()
local thing = Instance.new('BindableEvent')
while true do
    thing.Event:Connect(function()return;end)
    swait()
    while true do
        swait()
        thing.Event:Connect(function()return;end)
        if Head:FindFirstChild("mus")==nil then
            mus = Instance.new("Sound",Head)
            mus.Name = "mus"
            mus.SoundId = "rbxassetid://1205101253"
            mus.Looped = true
            mus.Volume = 1
            mus:Play()
        end
        Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
        velocity = RootPart.Velocity.y
        sine = sine + change
        local hit, pos = rayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, chara)
        if RootPart.Velocity.y > 1 and hit == nil then 
            Anim = "Jump"
        if attack == false then
            PlayAnimationFromTable({
            CFrame.new(0, 0.0382082276, -0.0403150208, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849),
            CFrame.new(0, 1.46579528, 0.0939689279, 1, 0, 0, 0, 0.939692855, -0.342019796, 0, 0.342019796, 0.939692855),
            CFrame.new(1.20945489, -0.213504896, 3.55388607e-07, 0.939692736, 0.342019916, 1.53461215e-07, -0.342019945, 0.939692736, 1.93715096e-07, -8.56816769e-08, -2.23517418e-07, 1.00000012),
            CFrame.new(-1.20945573, -0.213503733, 5.0439985e-07, 0.939692736, -0.342019916, -1.53461215e-07, 0.342019945, 0.939692736, 1.93715096e-07, 8.56816769e-08, -2.23517418e-07, 1.00000012),
            CFrame.new(0.5, -1.99739456, -0.0180913229, 1, 0, 0, 0, 1.00000012, 0, 0, 0, 1.00000012),
            CFrame.new(-0.5, -1.30000103, -0.39999947, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676),
            }, .3, false)
        end
        elseif RootPart.Velocity.y < -1 and hit == nil then 
            Anim = "Fall"
            if attack == false then
                PlayAnimationFromTable({
                CFrame.new(0, -0.0646628663, 0.0399149321, 1, 0, 0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849),
                CFrame.new(0, 1.4913609, -0.128171027, 1, 0, 0, 0, 0.939692855, 0.342019796, 0, -0.342019796, 0.939692855),
                CFrame.new(1.55285025, 0.466259956, -9.26282269e-08, 0.766043842, -0.642788351, -6.46188241e-08, 0.642788291, 0.766043961, -7.4505806e-08, 1.04308128e-07, 1.49011612e-08, 1.00000012),
                CFrame.new(-1.5605253, 0.475036323, -2.10609159e-07, 0.766043842, 0.642788351, 6.46188241e-08, -0.642788291, 0.766043961, -7.4505806e-08, -1.04308128e-07, 1.49011612e-08, 1.00000012),
                CFrame.new(0.500000954, -1.9973948, -0.0180922765, 1, 0, 0, 0, 1.00000012, 0, 0, 0, 1.00000012),
                CFrame.new(-0.499999046, -1.30000043, -0.400000483, 1, 0, 0, 0, 0.939692855, 0.342019796, 0, -0.342019796, 0.939692855),
                }, .3, false)
            end
        elseif Torsovelocity < 1 and hit ~= nil then
            Anim = "Idle"
            if attack == false then
                change = 1
                if currentwep == "Knife" then
                    PlayAnimationFromTable({
                    CFrame.new(0.0746685266, -0.199986786, 0.0124222934, 0.766045094, -9.74504874e-05, 0.642788053, 2.38779321e-05, 1, 0.000123149191, -0.64278698, -7.8932324e-05, 0.766041338) * CFrame.new(0,-.05 * math.cos((sine)/10), 0),
                    CFrame.new(0.0141649693, 1.48263907, -0.132771969, 0.766045034, 0.111642726, -0.633017421, -9.78431926e-05, 0.984821558, 0.173570558, 0.642788112, -0.132900283, 0.754424751),
                    CFrame.new(0.496542722, 0.915112793, -0.579361618, -2.45400588e-06, 0.866030455, 0.499991298, 1, 6.99437805e-06, -7.20722892e-06, -9.73872375e-06, 0.499992907, -0.866027057),
                    CFrame.new(-0.853593588, 0.548475266, -0.539758563, -2.98023224e-06, -0.500000715, -0.866025209, -0.939693391, 0.296197772, -0.171006888, 0.342017472, 0.813794196, -0.469849944),
                    CFrame.new(0.628544927, -1.80001187, -0.15317668, 0.766045034, -1.95977918e-07, -0.642787039, 1.56815432e-07, 1, -1.17666787e-07, 0.642788112, -1.05792424e-08, 0.766041219) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    CFrame.new(-0.766495645, -1.72321808, 0.461590618, 0.86602658, 0.249998271, -0.433011591, 4.77322828e-07, 0.866025925, 0.499999166, 0.49999994, -0.433010906, 0.749998212) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    }, .3, false)
                elseif currentwep == "Pistol" then
                    PlayAnimationFromTable({
                    CFrame.new(0, 0, 0, 0.499999166, -7.89761714e-07, 0.866025329, 1.24944251e-08, 1.00000143, -9.25385962e-07, -0.866025865, -4.76837158e-07, 0.499998331) * CFrame.new(0,-.05 * math.cos((sine)/10), 0),
                    CFrame.new(1.41561031e-06, 1.49998701, 1.01327896e-06, 0.49240312, 0.0868238658, -0.866025865, -0.173648998, 0.984809101, -4.76837158e-07, 0.852868617, 0.150382623, 0.499998331),
                    CFrame.new(1.67497301, 0.733016193, 0.303117812, 0.433011949, -0.866025865, 0.249999687, 0.500000238, -4.76837158e-07, -0.866026938, 0.749999404, 0.499998331, 0.433013648),
                    CFrame.new(-1.49999261, -3.8444914e-06, 7.30986267e-06, 0.939692736, 0.342020005, 1.78813934e-07, -0.342020422, 0.939693928, 1.06019513e-06, 1.1920929e-06, -2.65240669e-06, 0.999999046),
                    CFrame.new(0.499994516, -2.00000048, 1.52587891e-05, 0.766043723, 1.24944251e-08, -0.642788589, -5.80049061e-07, 1.00000143, -7.07089043e-07, 0.642788231, -9.25385962e-07, 0.766042709) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    CFrame.new(-0.499984771, -1.99999857, 9.37584991e-06, 1, 1.24944251e-08, 2.08616257e-07, 1.24944251e-08, 1.00000143, -9.25385962e-07, 2.08616257e-07, -9.25385962e-07, 0.999999046) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    }, .3, false)
                elseif currentwep == "Shotgun" then
                    PlayAnimationFromTable({
                    CFrame.new(-0.0426620394, 2.51418419e-06, -0.0246679522, 0.500000179, 5.2477586e-05, -0.866025448, -3.59067781e-05, 1, 3.98651027e-05, 0.866025448, 1.11636218e-05, 0.500000179) * CFrame.new(0,-.05 * math.cos((sine)/10), 0),
                    CFrame.new(0.0426683947, 1.49997485, -0.0245293416, 0.500000179, -3.59067781e-05, 0.866025448, 5.2477586e-05, 1, 1.11636218e-05, -0.866025448, 3.98651027e-05, 0.500000179),
                    CFrame.new(1.00722325, 0.250857353, -0.795783043, 0.500129044, 0.865951002, 8.28499979e-05, 0.000158182564, 4.31700028e-06, -1, -0.865951002, 0.500129044, -0.000134819289),
                    CFrame.new(-1.26435232, 0.136160329, -1.06736159, 0.0593797639, 0.336818933, 0.939695358, 0.984803379, -0.173673585, 2.03969612e-05, 0.163207144, 0.925413907, -0.342013031),
                    CFrame.new(0.500045896, -2.00000477, 1.52588036e-05, 1.00000024, 3.63797881e-12, 0, 3.63797881e-12, 1, -5.45696821e-12, 0, -5.45696821e-12, 1.00000024) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    CFrame.new(-0.500028968, -2.00000453, -1.60932541e-05, 0.5, -1.55070466e-05, 0.866025567, 3.21887783e-05, 1, -6.78202923e-07, -0.866025567, 2.82153978e-05, 0.5) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    }, .3, false)
                elseif currentwep == "Sniper" then
                    PlayAnimationFromTable({		
                    CFrame.new(3.85120393e-06, -1.10001469, -2.13328894e-06, 0.500000775, -4.97785209e-07, -0.86602819, -6.30748218e-08, 1.00000429, 5.48360163e-07, 0.866023958, 2.05408242e-07, 0.499997199) * CFrame.new(0,-.05 * math.cos((sine)/10), 0),
                    CFrame.new(2.99547736e-07, 1.49999404, 1.32609884e-07, 0.642788053, 1.99700139e-07, 0.766043067, 8.77411566e-08, 1.00000429, 2.01807097e-07, -0.766047895, 8.84073188e-08, 0.642785251),
                    CFrame.new(0.889702976, 0.352095068, -0.842586815, 0.342016101, 0.883022606, 0.321395069, 1.65737663e-06, 0.342022061, -0.939695477, -0.939696133, 0.321387529, 0.116974011),
                    CFrame.new(-1.27161205, -0.221690938, -0.73963666, -0.0593927503, 0.331705749, 0.941510677, 0.939696431, 0.336823493, -0.0593884364, -0.336821496, 0.881204367, -0.331710666),
                    CFrame.new(0.95132339, -1.22446179, 0.145100519, 0.500000775, -0.866023958, 1.99700139e-07, 3.86582464e-08, -2.05408242e-07, 1.00000429, -0.86602819, -0.499997199, 8.84073188e-08) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    CFrame.new(-0.75982666, -0.900000334, -0.150002122, 0.500000775, 1.99700139e-07, 0.866023958, 3.86582464e-08, 1.00000429, 2.05408242e-07, -0.86602819, 8.84073188e-08, 0.499997199) * CFrame.new(0,.05 * math.cos((sine)/10), 0),
                    }, .3, false)
                end
            end
        elseif Torsovelocity > 2 and hit ~= nil then
            Anim = "Walk"
            if attack == false then
                Humanoid.WalkSpeed = 16
                if currentwep == "Knife" then
                    PlayAnimationFromTable({		
                    CFrame.new(0.0746246725, 1.01619426e-05, 0.0124369636, 0.766044021, -9.74504219e-05, 0.642788172, 2.38778302e-05, 1, 0.000123149352, -0.642788112, -7.89324113e-05, 0.766043961) * CFrame.new(0, 0- .08 * math.cos((sine) / 2.5), 0) * CFrame.Angles(0, math.rad(5*math.cos(sine/5)), 0),
                    CFrame.new(0.014163442, 1.48263991, -0.132773906, 0.766043961, 0.111642919, -0.633018553, -9.78431272e-05, 0.984821498, 0.173570558, 0.642788231, -0.13290073, 0.754427373) * CFrame.Angles(0, math.rad(0 - 2.5 * math.cos((sine) / 5)), 0),
                    CFrame.new(0.555779755, 0.727167428, -0.545163274, -0.296201736, 0.813801408, 0.499991775, 0.939690292, 0.342026591, -7.70784391e-06, -0.171016783, 0.469835162, -0.866030097),
                    CFrame.new(-0.730001986, 0.322316647, -0.685232282, -0.321397692, -0.383022875, -0.866023779, -0.52945435, 0.830923796, -0.171008542, 0.785099864, 0.403558135, -0.469850183),
                    CFrame.new(0.435748369, -2.00001574, 0.0766026974, 0.766043961, -1.95868779e-07, -0.642788172, 1.5686895e-07, 1, -1.17754098e-07, 0.642788231, -1.06228981e-08, 0.766043901) * CFrame.new(0, 0, 0+ .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 - 30 * math.cos((sine) / 5)), 0, 0),
                    CFrame.new(-0.499964535, -2.00001693, -2.40653753e-05, 0.86602515, -4.59083822e-07, -0.500000417, 4.77219146e-07, 1, -9.15897544e-08, 0.500000477, -1.59285264e-07, 0.86602515) * CFrame.new(0, 0, 0- .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 + 30 * math.cos((sine) / 5)), 0, 0),
                    }, .3, false)
                elseif currentwep == "Pistol" then
                    PlayAnimationFromTable({		
                    CFrame.new(0, 0, 0, 0.499999762, -3.17524768e-06, 0.866023242, 4.99771886e-08, 1.00000572, -3.70154703e-06, -0.866025567, -1.89737557e-06, 0.499996424) * CFrame.new(0, 0- .08 * math.cos((sine) / 2.5), 0) * CFrame.Angles(0, math.rad(5*math.cos(sine/5)), 0),
                    CFrame.new(-1.40070915e-06, 1.49999928, -8.10623169e-06, 0.492403686, 0.0868240073, -0.866025567, -0.173652098, 0.984812915, -1.89737557e-06, 0.852867067, 0.150379539, 0.499996424) * CFrame.Angles(0, math.rad(0 - 2.5 * math.cos((sine) / 5)), 0),
                    CFrame.new(1.67498815, 0.733019531, 0.303111434, 0.433012426, -0.866025567, 0.24999994, 0.500000298, -1.89737557e-06, -0.866031885, 0.749996185, 0.499996424, 0.433014989),
                    CFrame.new(-1.50000703, 1.25168447e-06, 6.29892929e-06, 0.939692795, 0.342020035, 7.74860382e-07, -0.342021823, 0.939697981, -1.71595684e-06, 2.77161598e-06, -5.02169132e-06, 0.999996245),
                    CFrame.new(0.41340223, -2.00000691, 0.0500117987, 0.500000358, 4.27572111e-08, -0.866025209, -5.98500174e-06, 1.00000286, -3.46378215e-06, 0.866024017, 3.2134858e-06, 0.499998689) * CFrame.new(0, 0, 0+ .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 - 30 * math.cos((sine) / 5)), 0, 0),
                    CFrame.new(-0.549988985, -2.00000405, -0.0865873098, 0.500000358, 4.27572111e-08, -0.866025209, -5.98500174e-06, 1.00000286, -3.46378215e-06, 0.866024017, 3.2134858e-06, 0.499998689) * CFrame.new(0, 0, 0- .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 + 30 * math.cos((sine) / 5)), 0, 0),
                    }, .3, false)
                elseif currentwep == "Shotgun" then
                    PlayAnimationFromTable({		
                    CFrame.new(-0.0426630676, 6.07051561e-07, -0.0246853493, 0.500000179, 5.24788447e-05, -0.866025507, -3.5907171e-05, 1.00000763, 3.98638804e-05, 0.866038442, 1.11629015e-05, 0.500007689) * CFrame.new(0, 0- .08 * math.cos((sine) / 2.5), 0) * CFrame.Angles(0, math.rad(5*math.cos(sine/5)), 0),
                    CFrame.new(0.0426706225, 1.49999774, -0.0245324671, 0.500000179, -3.5907171e-05, 0.866038442, 5.24788447e-05, 1.00000763, 1.11629015e-05, -0.866025507, 3.98638804e-05, 0.500007689) * CFrame.Angles(0, math.rad(0 - 2.5 * math.cos((sine) / 5)), 0),
                    CFrame.new(1.00722933, 0.250861168, -0.795779645, 0.500129044, 0.865963995, 8.28503107e-05, 0.000158184659, 4.31629815e-06, -1.00000763, -0.865951061, 0.500136554, -0.000134818169),
                    CFrame.new(-1.26439309, 0.136162177, -1.06738305, 0.0593814775, 0.336828679, 0.939703763, 0.984810889, -0.173674926, 2.03973486e-05, 0.163208127, 0.925419688, -0.342008293),
                    CFrame.new(0.564297915, -2.00001669, -0.0766125619, 0.642791092, -1.60755535e-05, 0.766049147, 2.44625789e-05, 1.00000381, 4.58258e-07, -0.766042113, 1.8443603e-05, 0.642793655) * CFrame.new(0, 0, 0+ .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 - 30 * math.cos((sine) / 5)), 0, 0),
                    CFrame.new(-0.413438678, -2.00003505, 0.0499768406, 0.5, -1.5507263e-05, 0.866038561, 3.21898951e-05, 1.00000763, -6.78901415e-07, -0.866025627, 2.82142992e-05, 0.50000751) * CFrame.new(0, 0, 0- .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 + 30 * math.cos((sine) / 5)), 0, 0),
                    }, .3, false)
                elseif currentwep == "Sniper" then
                    PlayAnimationFromTable({		
                    CFrame.new(0, 0, 0, 1, 7.21867011e-13, 0, 7.21867011e-13, 1, 0, 0, 0, 1) * CFrame.new(0, 0- .08 * math.cos((sine) / 2.5), 0) * CFrame.Angles(0, math.rad(0 + 10 * math.cos((sine) / 5)), 0),
                    CFrame.new(3.81469818e-06, 1.50000954, 0, 1, 7.21867011e-13, 0, 7.21867011e-13, 1, 0, 0, 0, 1) * CFrame.Angles(0, math.rad(0 - 2.5 * math.cos((sine) / 5)), 0),
                    CFrame.new(0.827048123, -0.0171520263, -0.697202504, 0.342014849, 0.925418496, 0.163176477, -0.321393013, 0.278374583, -0.905104458, -0.883024514, 0.257115424, 0.392631322),
                    CFrame.new(-1.4085362, 0.219689652, -0.208836868, 0.999541581, 0.0292580184, 0.0077994708, -0.0127596147, 0.640579522, -0.767785847, -0.0274600741, 0.767334282, 0.640659094),
                    CFrame.new(0.500015259, -2.00003576, -1.52587891e-05, 1, 7.21867011e-13, 0, 7.21867011e-13, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0+ .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 - 30 * math.cos((sine) / 5)), 0, 0),
                    CFrame.new(-0.499992371, -2.0000248, 0, 1, 7.21867011e-13, 0, 7.21867011e-13, 1, 0, 0, 0, 1) * CFrame.new(0, 0, 0- .5 * math.cos((sine) / 5)) * CFrame.Angles(math.rad(0 + 30 * math.cos((sine) / 5)), 0, 0),
                    }, .3, false)
                end
            end
        end
    end
end
game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    thing:Fire()
    a:Disconnect()
    b:Disconnect()
    e:Disconnect()
end)
