return function()
	local Global = getgenv and getgenv() or _G
	
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	local Character = Player.Character
	local Mouse = Player:GetMouse()

	local MouseDown = false;
	local FlingEnabled = false
	
	Mouse.Button1Down:Connect(function() MouseDown=true end)
	Mouse.Button1Up:Connect(function() MouseDown=false end)
	
	local SplitTorsoHats = {
		{"19999406",CFrame.Angles(math.rad(90),0,0)},
		{"26400954",CFrame.Angles(math.rad(90),0,0)},
		{"81504106",CFrame.Angles(math.rad(90),0,0)},
		{"20367587",CFrame.Angles(math.rad(90),0,0)},
		{"15730704",CFrame.Angles(math.rad(90),0,0)},
		{"6858317867",CFrame.Angles(math.rad(90),0,0)},
		{"6858318826",CFrame.Angles(math.rad(90),0,0)},
		{"6926051356",CFrame.Angles(math.rad(90),0,0)},
		{"45915003",CFrame.Angles(math.rad(90),0,0)},
		{"44106323",CFrame.Angles(math.rad(90),0,0)},
		{"376188163",CFrame.Angles(math.rad(90),0,0)},
		{"417448095",CFrame.Angles(math.rad(90),0,0)},
		{"47991609",CFrame.Angles(math.rad(90),0,0)},
		{"3210183293",CFrame.Angles(math.rad(90),0,0)},
		{"21778516",CFrame.Angles(math.rad(90),0,0)},
		{"19999406",CFrame.Angles(math.rad(90),0,0)},
		{"19999406",CFrame.Angles(math.rad(90),0,0)},
		{"7287236788",CFrame.Angles(0,0,0)},
		{"31740496",CFrame.Angles(0,0,0)},
		{"3612040655",CFrame.Angles(0,0,0)},
		{"30303412",CFrame.Angles(0,0,0)},
		{"4802604574",CFrame.Angles(0,0,0)},
		{"7250556324",CFrame.Angles(0,0,0)},
		{"7402858015",CFrame.Angles(0,0,0)},
		{"14456185",CFrame.Angles(0,0,0)},
	}
	
	
	local function RainbowSelection(Part)
		local Selection = Instance.new("SelectionBox")
		Selection.Name = "Padero Pride Month Special (real)"
		Selection.Adornee = Part
		Selection.LineThickness = 0.05
		task.spawn(function()
			while Character do
				for i = 0,1,0.004 do
					Selection.Color3 = Color3.fromHSV(i,1,1)
					task.wait()
				end
			end
		end)
		Selection.Parent = Character
	end
	
	do -- Settings
		Global.Fling = Character.Humanoid.RigType == Enum.HumanoidRigType.R15 and 'LowerTorso' or Global.Reanimation == "PermaDeath" and 'HumanoidRootPart' or 'Right Arm'
		Global.ShowReal = true
		Global.GodMode = Global.Reanimation == 'PermaDeath' and true or false
		Global.Velocity = -35
		Global.Collisions = false
		Global.AntiSleep = true
		Global.MovementVelocity = false
		Global.ArtificialHeartBeat = true
		Global.EnableSpin = true
	end
	
	do -- idk what the fuck this code is so im just gonna include it
		if Global.___hooked ~= true then
			local ___old;
			___old=hookmetamethod(game,'__index',newcclosure(function(s,k)
				if checkcaller() and s==game:GetService('Workspace') and k== 'non' then
					return Global.CloneRig
				end 
				return ___old(s,k)
			end))
			Global.___hooked=true 
		end
	end
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua",true))()
	
	local Event = Global.MiliWait
	
	do -- Replace Arm for Non-Perma Reanimate
		if Global.Reanimation == "Simple" and Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then 
			local ReplacementHat
			for i,Hat in ipairs(Global.RealRig:GetChildren()) do
				if Hat:IsA("Accessory") then
					local Texture = Hat.Handle:FindFirstChildOfClass("SpecialMesh")
					if Texture then
						for i,v in ipairs(SplitTorsoHats) do
							if v[1] == string.match(Texture.TextureId,"%d+") then
								table.remove(SplitTorsoHats,i)
								ReplacementHat = {Hat.Handle,v[2]}
							end
						end
					end
				end
			end
			if ReplacementHat then
				ReplacementHat[1].CloneHat.Value.AccessoryWeld.Part1 = Player.Character["Right Arm"]
				ReplacementHat[1].CloneHat.Value.AccessoryWeld.C0=ReplacementHat[2]
				ReplacementHat[1]:FindFirstChildOfClass("SpecialMesh"):Destroy()
			end
		end
	end
	
	do -- Fling
		local FlingPart = Global.RealRig:FindFirstChild(tostring(Global.Fling))
		if FlingPart then
			FlingPart.Transparency=.5;
			RainbowSelection(FlingPart)
			Mouse.TargetFilter = Player.Character

			Event:Connect(function()
				if MouseDown then
					local OtherPlayer = Mouse.Target and Mouse.Target.Parent:FindFirstChild("Humanoid") and Mouse.Target.Parent
					if OtherPlayer then
						FlingEnabled = true
						for i=1,30 do
							FlingPart.CFrame= OtherPlayer.HumanoidRootPart.CFrame * CFrame.new(0,0,8)
							task.wait(.1)
							FlingPart.CFrame= OtherPlayer.HumanoidRootPart.CFrame * CFrame.new(0,0,-8)
							task.wait(.1)
						end
						FlingEnabled = false
					else
						FlingEnabled = false
						if Mouse.Target then
							FlingPart.CFrame = Mouse.Hit
						else
							FlingPart.CFrame= Player.Character.Torso.CFrame - Vector3.new(0,6,0)
						end
					end
				elseif not FlingEnabled then
					FlingPart.CFrame= Player.Character.Torso.CFrame - Vector3.new(0,6,0) 
				end
			end)
		end
	end
end
