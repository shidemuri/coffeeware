return function()
	local function ra(part)
		local epic = Instance.new('SelectionBox', game.Players.LocalPlayer.Character)
        epic.Name = 'okayu uwu'
        epic.Adornee = part
        epic.LineThickness = 0.05
        local speed = 4
        coroutine.wrap(function()
		while epic do
            for i = 0,1,0.001*speed do
                epic.Color3 = Color3.fromHSV(i,1,1)
                task.wait()
            end
        end
		end)()
	end
	--getgenv().Fling = "HumanoidRootPart"
	if game.Players.LocalPlayer.Character.Humanoid.RigType==Enum.HumanoidRigType.R15 then 
		--getgenv().ExtremeNetless=true;
		getgenv().Velocity=-90
	else 
		getgenv().AntiSleep=true;
		--getgenv().ExtremeNetless=false;
	end;
	getgenv().Fling = 'HumanoidRootPart'
	getgenv().ShowReal = true
	getgenv().PartGUI = false
	getgenv().FakeGod = false
	getgenv().GodMode = getgenv().Reanimation == 'PermaDeath' and true or false
	getgenv().Velocity = -25.05  --goofy velocity
	getgenv().Collisions = false
	getgenv().Claim2 = false
	getgenv().Notification = true
	getgenv().AutoAnimate = true
	getgenv().Network = true
	getgenv().AntiSleep = true
	getgenv().MovementVelocity = true
	getgenv().ArtificialHeartBeat = true
	getgenv().R6 = game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and true or false
	getgenv().AutoReclaim = false
	getgenv().HatCollision = false
	getgenv().EnableSpin = true
	if getgenv().___hooked ~= true then
	local ___old; ___old=hookmetamethod(game,'__index',newcclosure(function(s,k)if checkcaller()and s==game:GetService('Workspace')and k== 'non'then return getgenv().CloneRig end return ___old(s,k)end)) getgenv().___hooked=true end
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CenteredSniper/Kenzen/master/newnetlessreanimate.lua",true))()
	if getgenv().Reanimation=="PermaDeath"or getgenv().Reanimation==nil then 
		--getgenv().ShowReal=true;
		--loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/NetlessReanimV2(ThanksProductionTakeOne%20%233330%20for%20help).lua"))()
		--[[for _,v in next, game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Name]:GetDescendants() do
			if v:IsA('BodyVelocity') then
				v.P = Vector3.new(20,0,0) --jitteryless netless (i hope)
			end
		end]]
		--task.wait(game.Players.RespawnTime+cloneref(game:GetService('Stats')).Network.ServerStatsItem['Data Ping']:GetValue()/750)
		if getgenv().Fling or getgenv().TorsoFling then
		local p=getgenv().RealRig:FindFirstChild("LowerTorso")or getgenv().RealRig.HumanoidRootPart;
		p.Transparency=.5;
		--p.BodyAngularVelocity.AngularVelocity=Vector3.new(999999999999999999999999999999999999,999999999999999999999999999999999999,999999999999999999999999999999999999)
		ra(p)
		local q=game.Players.LocalPlayer:GetMouse()
		local r=false;
		q.Button1Down:Connect(function()r=true end)
		q.Button1Up:Connect(function()r=false end)
		local s=false;
		game["Run Service"].Heartbeat:Connect(function(t)
			if r then 
				if s==false then 
					if (q.Target.Parent:FindFirstChildOfClass("Humanoid")or q.Target.Parent.Parent:FindFirstChildOfClass("Humanoid")) and q.Target.Parent ~= game.Players.LocalPlayer.Character then 
						s=true;
						print("Began flinging")
						local u=p;
						local v=q.Target.Parent:FindFirstChild("Torso")or q.Target.Parent.Parent:FindFirstChild("Torso")or q.Target.Parent.Parent:FindFirstChild("LowerTorso")or q.Target.Parent:FindFirstChild("LowerTorso")
						local weld=Instance.new("Weld",v)
						local w=Instance.new("Weld",v)
						local x=Instance.new("Part",v)
						x.Transparency=1;
						x.CanCollide=false;
						local y=Instance.new("Part",v)
						y.Transparency=1;
						y.CanCollide=false;
						weld.Part0=x;
						weld.Part1=v;
						weld.C0=CFrame.new(0,0,8)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
						w.Part0=y;
						w.Part1=v;
						w.C0=CFrame.new(0,0,-8)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
						for _=0,65 do
						u.CFrame=x.CFrame:Lerp(x.CFrame,1)
						wait(.02)
						u.CFrame=v.CFrame:Lerp(y.CFrame,1)
						wait(.02)
						end
						print("Stopped flinging!")
						s=false 
					else p.CFrame = q.Hit
					end 
				end 
				else if s==true then 
				else p.CFrame=game.Players.LocalPlayer.Character.Torso.CFrame end 
			end 
		end)
	end
	elseif Reanimation=="Simple"then 
			--task.wait()
			if getgenv().Fling or getgenv().TorsoFling then
			local z=game.Players.LocalPlayer;
			local A=z.Character;
			local B=getgenv().RealRig["Hat1"].Handle;
			B:BreakJoints()
			local Weld=Instance.new("Weld",getgenv().CloneRig)
			Weld.Part1=B;
			Weld.Part0=game.Players.LocalPlayer.Character["Right Arm"]
			Weld.C0=CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(0),0)
			print("Ran with no errors")
			local p=getgenv().RealRig["Right Arm"]
			ra(p)
			local C=getgenv().RealRig["Hat1"].Handle.Mesh;
			C:Destroy()
			p.Transparency=.5;
			--p.BodyAngularVelocity.AngularVelocity=Vector3.new(9999999999999999999999999999999,99999999999999999999999999999999,99999999999999999999999999999999)
			local q=game.Players.LocalPlayer:GetMouse()
			local r=false;q.Button1Down:Connect(function()r=true end)
			q.Button1Up:Connect(function()r=false end)
			local s=false;
			game["Run Service"].Heartbeat:Connect(function(t)
				--print(r, s, q.Target, q.Target.Parent)
				if r then 
					if s==false then 
						if (q.Target.Parent:FindFirstChildOfClass("Humanoid")or q.Target.Parent.Parent:FindFirstChildOfClass("Humanoid")) and q.Target.Parent ~= game.Players.LocalPlayer.Character then 
							s=true;
							print("Began flinging")
							local u=p;
							local v=q.Target.Parent:FindFirstChild("Torso")or q.Target.Parent.Parent:FindFirstChild("Torso")or q.Target.Parent.Parent:FindFirstChild("LowerTorso")or q.Target.Parent:FindFirstChild("LowerTorso")
							local weld=Instance.new("Weld",v)
							local w=Instance.new("Weld",v)
							local x=Instance.new("Part",v)
							x.Transparency=1;
							x.CanCollide=false;
							local y=Instance.new("Part",v)
							y.Transparency=1;
							y.CanCollide=false;
							weld.Part0=x;
							weld.Part1=v;
							weld.C0=CFrame.new(0,0,8)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
							w.Part0=y;
							w.Part1=v;
							w.C0=CFrame.new(0,0,-8)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
							for _=0,65 do
							u.CFrame=x.CFrame:Lerp(x.CFrame,1)wait(.02)u.CFrame=v.CFrame:Lerp(y.CFrame,1)wait(.02)
							end
							print("Stopped flinging!")
							s=false;
						else p.CFrame = q.Hit end
					end else 
						if s==true then 
					else p.CFrame=game.Players.LocalPlayer.Character.Torso.CFrame 
					end 
				end 
			end)
		end
	end
end
