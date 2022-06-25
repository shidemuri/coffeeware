local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shidemuri/scripts/main/newuilib.lua"))()

local hub = Library:New("Coffeeware v1.0.1")
local SettingsTab = hub:NewTab("Settings")
local CreditsTab = hub:NewTab("Credits")
local ScriptsTab = hub:NewTab("Scripts")
getgenv().Reanimation = getgenv().Reanimation and getgenv().Reanimation or 'PermaDeath'
getgenv().Velocity = getgenv().Velocity and getgenv().Velocity or -35
SettingsTab:NewLabel('Note: reanimate comes with noclip')
local reanimtype = SettingsTab:NewLabel('Reanimation Type: ' .. getgenv().Reanimation)
SettingsTab:NewButton("Toggle Perma Death", "PermaDeath / Simple", function()
	if getgenv().Reanimation == "PermaDeath" then
		getgenv().Reanimation = "Simple"
		if getgenv().Flinging then getgenv().Fling = 'Right Arm' end
		reanimtype.Text = 'Reanimation Type: Simple'
	elseif getgenv().Reanimation == "Simple" then
		getgenv().Reanimation = "PermaDeath"
		if getgenv().Flinging then getgenv().Fling = 'HumanoidRootPart' end
		reanimtype.Text = 'Reanimation Type: PermaDeath'
	end
end, true)

local __char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
getgenv().Flinging = true

local R6 = false;
local R15 = false;
if __char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
	print('R6')
	R6 = true
	R15 = false
	if getgenv().Reanimation == 'PermaDeath' or getgenv().Reanimation == nil then
		getgenv().Fling = 'HumanoidRootPart'
	elseif getgenv().Reanimation == 'Simple' then
		getgenv().Fling = 'Right Arm'
	end
	getgenv().TorsoFling = false
	print(getgenv().Fling)
else 
	print('R15')
	R6 = false
	R15 = true
	getgenv().Fling = false
	getgenv().TorsoFling = true
end

SettingsTab:NewLabel('NOTE: Simple requires Brown Hair')

getgenv()._reanimate = loadstring(game:HttpGet("https://raw.githubusercontent.com/shidemuri/coffeeware/main/reanim.lua"))()

CreditsTab:NewLabel('Reanimation script by ProductionTakeOne#3330')
CreditsTab:NewLabel('UI lib and most convertions: me - padero#0001')
CreditsTab:NewLabel('Special thanks to: Tescalus (he was the original owner)')
CreditsTab:NewLabel('Special thanks to: Dalk (this script wouldnt be possible without him)')
CreditsTab:NewLabel('I dont claim full ownership of the assets used in this project')
CreditsTab:NewLabel('Unless the script is stated as \"original\", then')
CreditsTab:NewLabel('All credits go to their respective owners')
CreditsTab:NewLabel('also although i converted the funny script')
CreditsTab:NewLabel('Tescalus did the hat alignment for it')

ScriptsTab:NewButton('funny script!!!!!!!! **', 'everyone got the script for this', function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/secks.lua'))() 
end)

ScriptsTab:NewButton('Neko V4 *', 'yes it has clientsided appearance', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/nekov4.lua'))()
end)

ScriptsTab:NewButton('Road Rogue **', 'vroom vroom', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/Driveby_Simplifier.lua'))()
end)

ScriptsTab:NewButton('Katanarist **', 'he gonna slice yo pp', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/katanarist.lua'))()
end)

ScriptsTab:NewButton('Assassin **', 'hes got a whole ass inventory on wtf', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/assassin.lua'))()
end)

ScriptsTab:NewButton('Strato Glitcher **', 'its just spinning swords yet its cool',function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/strato_glitcher.lua'))()
end)

ScriptsTab:NewButton('Stando Power (REJOIN TO REEXEC)**', (function() local str=''for _=0,200 do str = str .. 'ora ' end return str end)(), function() 
	loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/Standopower.lua'))()
end)

ScriptsTab:NewButton("Studio Dummy V3", '"i should make antideath by making a fake char" 🤓', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/shidemuri/coffeeware/main/sdv3.lua'))()
end)


ScriptsTab:NewSearchBar()
local g=Instance.new("BlurEffect",game:service'Lighting')
g.Size=1;
spawn(function() 
	repeat task.wait() g.Size=g.Size+0.5 until g.Size==40
	wait(2)
	repeat task.wait() g.Size=g.Size-1 until g.Size==0
end)
spawn(function()
	local h=70;
	local i={FieldOfView=h-15}
	local j=TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
	local k=game:GetService("TweenService"):Create(game.Workspace.CurrentCamera,j,i)
	k:Play()
	wait(3.5)
	game:GetService("TweenService"):Create(game.Workspace.CurrentCamera,j,{FieldOfView=h}):Play()
end)

hub:SetMainTab(CreditsTab)
