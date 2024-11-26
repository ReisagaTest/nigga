local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    Icon = 0,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "Ocean",
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = Whites Hub,
       FileName = "Save Settings"
    },
 
    Discord = {
       Enabled = false,
       Invite = "VCxf8uTN4U",
       RememberJoins = true
    },
 
    KeySystem = true,
    KeySettings = {
       Title = "Whites Hub",
       Subtitle = "Key System",
       Note = "Go to Disocrd to get the key", -- Use this to tell the user how to get a key
       FileName = "Key u have", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Nam Gay"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 --tab
 local Tab = Window:CreateTab("Tab Farm", 4483362458)
 local Tab1 = Window:CreateTab("Tab Settings", 4483362458)
 local Tab2 = Window:CreateTab("Tab Items", 4483362458)
 local Tab3 = Window:CreateTab("Tab Teleport", 4483362458)
 local Tab4 = Window:CreateTab("Tab Race V4", 4483362458)
 local Tab5 = Window:CreateTab("Tab Sea Event", 4483362458)
 local Tab6 = Window:CreateTab("Tab Raid & Fruits", 4483362458)
 local Tab7 = Window:CreateTab("Tab Shoppe", 4483362458)
 local Tab8 = Window:CreateTab("Tab Misc", 4483362458)
 ------place
local id = game.PlaceId
if id == 2753915549 then First_Sea = true; elseif id == 4442272183 then Second_Sea = true; elseif id == 7449423635 then Third_Sea = true; else game.Players.LocalPlayer:Kick("...") end;
--ok(Removed save setings)
local TableNotQuest = {
   "BartiloQuest",
   "Trainees",
   "MarineQuest",
   "CitizenQuest"
}
local Quests = require(game.ReplicatedStorage.Quests)
local GuideModule = require(game.ReplicatedStorage.GuideModule)
function GetQuest()
   local Levels = plr.Data.Level.Value
   local phuongngu = 0
   if Levels >= 700 and CheckSea(1) then
       Mob = "Galley Captain"
       NameQuest = "FountainQuest"
       ID = 2
   elseif Levels >= 1500 and CheckSea(2) then
       Mob = "Water Fighter"
       NameQuest = "ForgottenQuest"
       ID = 2
   else
       for _, v in next, Quests do
           for r, i in next, v do
               local levelreq = i.LevelReq
               for d, b in next, i.Task do
                   if Levels >= levelreq and levelreq >= phuongngu and i.Task[d] > 1 and not table.find(TableNotQuest, tostring(_)) then
                       phuongngu = levelreq
                       Mob = tostring(d)
                       NameQuest = _
                       ID = r
                   end
               end
           end
       end
   end
end

function CFrameNPC()
   for r, v in next, GuideModule["Data"]["NPCList"] do
       if v["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
           return r["CFrame"]
       end
   end
end

function GetDataQuest()
   for r, v in next, GuideModule["Data"] do
       if string.find(r, "QuestData") then
           return true
       end
   end
   return false
end

function MobData()
   local mobcontainer
   if GetDataQuest() then
       for r, v in next, GuideModule["Data"]["QuestData"]["Task"] do
           mobcontainer = r
       end
   end
   return mobcontainer
end

FolderMob = Instance.new("Folder", workspace)
FolderMob.Name = "FolderMob"
repeat wait() until game.Workspace:FindFirstChild("FolderMob")
function CheckMobPart()
   if not game.Workspace:FindFirstChild("FolderMob") then
       FolderMob = Instance.new("Folder", workspace)
       FolderMob.Name = "FolderMob"
   else
       for r, v in next, game.Workspace["_WorldOrigin"].EnemySpawns:GetChildren() do
           if v:IsA("Part") then
               cloner = v:Clone()
               cloner.Parent = game.Workspace.FolderMob
           end
       end
       for r, v in next, game.Workspace.FolderMob:GetChildren() do
           v.Name = RemoveLevelTitle(v.Name)
       end
   end
end
CheckMobPart()
function checkdbq()
   local n = {}
   for _, v in next, Quests do
       for r, i in next, v do
           local levelreq = i.LevelReq
           for d, b in next, i.Task do
               if d == Mob then
                   for ngu, dot in next, v do
                       if dot.LevelReq <= game.Players.LocalPlayer.Data.Level.Value and dot.Name ~= "Town Raid" then
                           for phuong, sike in next, dot.Task do
                               if sike > 4 then
                                   table.insert(n, phuong)
                               end
                           end
                       end
                   end
               end
           end
       end
   end
   return n
end

function checkdoublequest()
   local returner = {}
   GetQuest()
   if getgenv().DoubleQuest and GetDataQuest() and MobData() == Mob  and #checkdbq() >= 2 and plr.Data.Level.Value >= 10 then
       for _, v in next, Quests do
           for r, i in next, v do
               for d, b in next, i.Task do
                   if tostring(d) == Mob then
                       for ngu, dot in next, v do
                           for phuong, sieungu in next, dot.Task do
                               if phuong ~= Mob and sieungu > 1 then
                                   returner["Mob"] = tostring(phuong)
                                   returner["NameQuest"] = _
                                   returner["ID"] = ngu
                                   return returner
                               end
                           end
                       end
                   end
               end
           end
       end
   else
       returner["Mob"] = Mob
       returner["NameQuest"] = NameQuest
       returner["ID"] = ID
   end
   return returner
end

function ClaimQuestLevelFarm()
   if getdistance(CFrameNPC().Position) >= 20 then
       Tween(CFrameNPC())
   else
       FireRemotes(2, "StartQuest", tostring(checkdoublequest()["NameQuest"]), checkdoublequest()["ID"])
   end
end

function CheckMob(mob, checkrep)
    for _, v in next, game:GetService("Workspace").Enemies:GetChildren() do
        if ((typeof(mob) == "table" and table.find(mob, v.Name)) or ((typeof(mob) == "string" and (string.find(v.Name, mob) or v.Name == mob)))) and v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            return v
        end
    end
    if checkrep ~= nil and checkrep ~= false then
        for _, v in next, game:GetService("ReplicatedStorage"):GetChildren() do
            if ((typeof(mob) == "table" and table.find(mob, v.Name)) or ((typeof(mob) == "string" and (string.find(v.Name, mob) or v.Name == mob)))) and v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                return v
            end
        end
    end
end
--others check
function TweenMobSpawn(value, loopstop)
    for r, v in next, game.Workspace.FolderMob:GetChildren() do
        if v:IsA("Part") and ((typeof(value) == "table" and table.find(value, v.Name)) or (typeof(value) == "string" and string.find(v.Name, value))) then
            repeat wait()
                Tween(v.CFrame * CFrame.new(0, 40, 0))
            until CheckMob(value) or not loopstop or getdistance(v.Position).Magnitude <= 10
        end 
    end
end

local TableElite = {
    "Deandre",
    "Urban",
    "Diablo",
}

local TableCakeMobs = {
    "Cookie Crafter",
    "Cake Guard",
    "Baking Staff",
    "Head Baker"
}

local TableHauntedMobs = {
    "Reborn Skeleton",
    "Living Zombie",
    "Demonic Soul",
    "Posessed Mummy"
}

function GetMobCastle()
    for r, v in next, game.ReplicatedStorage:GetChildren() do
        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then 
            if getdistance(Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219), v.HumanoidRootPart.Position) <= 1000 then
                return v
            end 
        end
    end
end

function GetPlayerInventory(wpname)
    for _, v in next, RS.Remotes.CommF_:InvokeServer("getInventory") do
        if string.find(v.Name, wpname) or tostring(v) == wpname then
            return true
        end
    end
    return false
end
--het r
local plr = game.Players.LocalPlayer
local CommF = game.ReplicatedStorage.Remotes["CommF_"]
local Settings = {}
local HttpService = game:GetService("HttpService")
local FolderName = "Whites Hub"
local SaveFileNameGame = "-BloxFruit.json"
local SaveFileName = game.Players.LocalPlayer.Name..SaveFileNameGame
local SettingHopServer = {}
local DefaultSettingHopServer = {}
function SaveSettings(fff,fff2)
    if fff~=nil then
        Settings[fff] = fff2
    end
    HttpService = game:GetService("HttpService")
    if not isfolder(FolderName) then
        makefolder(FolderName)
    end
    writefile(FolderName.."/" .. SaveFileName, HttpService:JSONEncode(Settings))
end

function ReadSetting()
local s,e = pcall(function()
    HttpService = game:GetService("HttpService")
    if not isfolder(FolderName) then
        makefolder(FolderName)
    end
    return HttpService:JSONDecode(readfile(FolderName.."/" .. SaveFileName))
end)
if s then return e
else
    SaveSettings()
    return ReadSetting()
end
end
Settings = ReadSetting()
if not pcall(function() readfile(FolderName.."/" .. "Jobid.json") end) then
    writefile(FolderName.."/" .. "Jobid.json", game:GetService("HttpService"):JSONEncode(DefaultSettingHopServer))
end
--tween
function BypassTP(targetpos)
    wait(1)
    pcall(function()
        repeat task.wait()
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GetBypassCFrame(targetpos)
        until game.Players.LocalPlayer.Character.PrimaryPart.CFrame == GetBypassCFrame(targetpos) or getgenv().BypassTeleport == false
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid", 9):ChangeState(15)
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(GetBypassCFrame(targetpos))
        wait(0.1)
        game.Players.LocalPlayer.Character.Head:Destroy()
        repeat task.wait()
        until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0
        repeat  task.wait()
        until game.Players.LocalPlayer.Character:FindFirstChild("Head")
        wait(1)
    end)
end


function CheckPlayerBackpack(item)
    for r, v in next, plr.Backpack:GetChildren() do
        if tostring(v) == item then
            return v
        end
    end
    for r, v in next, plr.Character:GetChildren() do
        if tostring(v) == item then
            return v
        end
    end
end

function requestEntrance(b)
    args = {"requestEntrance", b}
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position.X, plr.Character.HumanoidRootPart.Position.Y + 80, plr.Character.HumanoidRootPart.Position.Z)
    block.CFrame = CFrame.new(block.Position.X, block.Position.Y + 80, block.Position.Z)
end

function Tween(targetcframe)
    pcall(function()
        local Distance = (targetcframe.Position - plr.Character.HumanoidRootPart.Position).Magnitude
        local PortalPos = GetPortal(targetcframe)
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position.X, targetcframe.Y, plr.Character.HumanoidRootPart.Position.Z)
        block.CFrame = CFrame.new(block.Position.X, targetcframe.Y, block.Position.Z)
        if block and block.Parent == workspace then
            local tweenInfo = TweenInfo.new(Distance / 325, Enum.EasingStyle.Linear)
            tween = game:GetService("TweenService"):Create(block, tweenInfo, {CFrame = targetcframe})
            if Distance <= 250 then
                tween:Cancel()
                NoClip = true
                plr.Character.HumanoidRootPart.CFrame = targetcframe
                block.CFrame = targetcframe
            end
            if PortalPos and Distance >= 2500 and (targetcframe.Position - PortalPos).Magnitude <= 1000 then
                requestEntrance(PortalPos)
            end
            if Distance >= 4000 and (targetcframe.Position - GetBypassCFrame(targetcframe).Position).Magnitude < 1000 and not CheckPlayerBackpack("God's Chalice") and not CheckPlayerBackpack("Sweet Chalice") and not CheckPlayerBackpack("Fist Of Darkness") then
                BypassTP(targetcframe)
            end
            if plr.Character.Humanoid.Sit == true then
                plr.Character.Humanoid.Sit = false
            end
            tween:Play()
        end
    end)
end
---
local plr = game.Players.LocalPlayer
local block = Instance.new("Part", workspace)
block.Size = Vector3.new(1, 1, 1)
block.Name = "player platform ............."
block.Anchored = true
block.CanCollide = false
block.CanTouch = false
block.Transparency = 1
local blockfind = workspace:FindFirstChild(block.Name)
if blockfind and blockfind ~= block then
	blockfind:Destroy()
end

task.spawn(function()
	repeat task.wait()
	until plr.Character and plr.Character.PrimaryPart
	block.CFrame = plr.Character.PrimaryPart.CFrame
	while task.wait() do
		pcall(function()
			if NoClip then
				if block and block.Parent == workspace then
					if plr.Character.HumanoidRootPart and (plr.Character.HumanoidRootPart.Position - block.Position).Magnitude <= 200 then
						plr.Character.HumanoidRootPart.CFrame = block.CFrame
					else
						block.CFrame = plr.Character.HumanoidRootPart.CFrame
					end
				end
				local plrChar = plr.Character
				if plrChar then
					for _, part in pairs(plrChar:GetChildren()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
					if plrChar:FindFirstChild("Stun") and plrChar.Stun.Value ~= 0 then
						plrChar.Stun.Value = 0
					end
					if plrChar:FindFirstChild("Busy") and plrChar.Busy.Value then
						plrChar.Busy.Value = false
					end
				end
			else
				local plrChar = plr.Character
				if plrChar then
					for _, part in pairs(plrChar:GetChildren()) do
						if part:IsA("BasePart") then
							part.CanCollide = true
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
    while wait() do
        if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
            NoClip = true
        elseif tween then
            NoClip = false
        end
    end
end)

spawn(function()
    while wait() do
        if NoClip == true then
            if not game.Players.LocalPlayer.Character:WaitForChild("Head"):FindFirstChild("cac") then
                local buu = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.Head)
                buu.Velocity = Vector3.new(0, 0, 0)
                buu.P = 1500
                buu.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                buu.Name = "cac"
            end
        else
            if game.Players.LocalPlayer.Character:WaitForChild("Head"):FindFirstChild("cac") then
                game.Players.LocalPlayer.Character:WaitForChild("Head").cac:Destroy()
            end
        end
    end
end)
---idk
function GetCurrentTool(toolvalue)
    for _, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == toolvalue then
            return v.Name
        end
    end
    for _, v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == toolvalue then
            return v.Name
        end
    end
end

function EquipTool(toolname)
    for _, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and tostring(v) == toolname or v.ToolTip == toolname then
            game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
end

function EquipWeapon()
    pcall(function()
        if Settings["Select Tool"] == nil or Settings["Select Tool"] == "" then
            Settings["Select Tool"] = "Melee"
        end
        local wp = GetCurrentTool(Settings["Select Tool"])
        local v1 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(wp)
        if v1 then
            game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v1)
        end
    end)
end

function RemoveLevelTitle(Value)
    return tostring(tostring(Value):gsub(" %pLv. %d+%p", ""):gsub(" %pRaid Boss%p", ""):gsub(" %pBoss%p", ""))
end

function FireRemotes(type, ...)
    arg = ({"Redeem", "CommF_"})[type]
    return game:GetService("ReplicatedStorage").Remotes[arg]:InvokeServer(unpack({...}))
end

function EBuso()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        FireRemotes(2, "Buso")
    end
end

function getdistance(i, ii)
    if ii == nil then
        ii = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    end
    if typeof(i) == "CFrame" then
        return (i.Position - ii).Magnitude
    elseif typeof(i) == "Vector3" then
        return (i - ii).Magnitude
    end
end

for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do 
	v:Disable()
end

function SendKey(nah, ilose)
    if ilose == nil then ilose = 0.1 end
    set_thread_identity(8) 
    game:service("VirtualInputManager"):SendKeyEvent(true, nah, false, game)
    task.wait(ilose)
    game:service("VirtualInputManager"):SendKeyEvent(false, nah, false, game)
end

function toAroundTarget(CF)
	if TeleportType == 1 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF * CFrame.new(0, 30, 1)
	elseif TeleportType == 2 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF * CFrame.new(0, 1, 30)
	elseif TeleportType == 3 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF * CFrame.new(1, 1, -30)
	elseif TeleportType == 4 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF * CFrame.new(30, 1, 0)
	elseif TeleportType == 5 then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF * CFrame.new(-30, 1, 0)
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CF * CFrame.new(0, 30, 1)
	end
end
--fat
NoAttackAnimation = true
local DmgAttack = game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter")
local PC = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
local oldRL = RL.wrapAttackAnimationAsync
RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
	if not NoAttackAnimation then
		return oldRL(a,b,c,60,func)
	end

	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < 65 then
			table.insert(Hits,Human.RootPart)
		end
	end
	a:Play(0.01,0.01,0.01)
	pcall(func,Hits)
end

getAllBladeHits = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()
	for i,v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

getAllBladeHitsPlayers = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = game.Players.LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()
	for i,v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	return Hits
end)

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigEven = game:GetService("ReplicatedStorage").RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCooldown = 0.07
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_JIT_MAX(function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FireCooldown or 0.288) + ((FireL/MaxFire)*0.3)
		RigEven.FireServer(RigEven,"weaponChange",ac.currentWeaponModel.Name)
		FireL = FireL + 1
		task.delay((FireCooldown or 0.288) + ((FireL+0.4/MaxFire)*0.3),function()
			FireL = FireL - 1
		end)
	end
end)

AttackFunction = LPH_JIT_MAX(function(typef)
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		local bladehit = {}
		if typef == 1 then
			bladehit = getAllBladeHits(60)
		elseif typef == 2 then
			bladehit = getAllBladeHitsPlayers(65)
		else
			for i2,v2 in pairs(getAllBladeHits(55)) do
				table.insert(bladehit,v2)
			end
			for i3,v3 in pairs(getAllBladeHitsPlayers(55)) do
				table.insert(bladehit,v3)
			end
		end
		if #bladehit > 0 then
			pcall(task.spawn,ac.attack,ac)
			if tick() > AttackCoolDown then
				CancelCoolDown()
			end
			if tick() - cooldowntickFire > 0.5 then
				ac.timeToNextAttack = 0
				ac.hitboxMagnitude = 60
				pcall(task.spawn,ac.attack,ac)
				cooldowntickFire = tick()
			end
			local AMI3 = ac.anims.basic[3]
			local AMI2 = ac.anims.basic[2]
			local REALID = AMI3 or AMI2
			AttackAnim.AnimationId = REALID
			local StartP = ac.humanoid:LoadAnimation(AttackAnim)
			StartP:Play(0.01,0.01,0.01)
			RigEven.FireServer(RigEven,"hit",bladehit,AMI3 and 3 or 2,"")
			task.delay(0.5,function()
				StartP:Stop()
			end)
		end
	end
end)

function CheckStun()
	if game:GetService('Players').LocalPlayer.Character:FindFirstChild("Stun") then
		return game:GetService('Players').LocalPlayer.Character.Stun.Value ~= 0
	end
	return false
end

LPH_JIT_MAX(function()
	spawn(function()
		while game:GetService("RunService").Stepped:Wait() do
			local ac = CombatFrameworkR.activeController
			if ac and ac.equipped and not CheckStun() then
				if NeedAttacking and Fast_Attack then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,1)
					end)
				elseif DamageAura then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,3)
					end)
				elseif UsefastattackPlayers and Settings["Fast Attack"] then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,2)
					end)
				elseif NeedAttacking and Settings["Fast Attack"] == false then
					if ac.hitboxMagnitude ~= 55 then
						ac.hitboxMagnitude = 55
					end
					pcall(task.spawn,ac.attack,ac)
				end
			end
		end
	end)
end)()

local kkii = require(game.ReplicatedStorage.Util.CameraShaker)
kkii:Stop()
--end
function EnableV4()
    if game:GetService('Players').LocalPlayer.Character and game:GetService('Players').LocalPlayer.Character:FindFirstChild("RaceTransformed") and game:GetService('Players').LocalPlayer.Character:FindFirstChild("RaceEnergy") and game:GetService('Players').LocalPlayer.Character.RaceEnergy.Value >= 1 and not game:GetService('Players').LocalPlayer.Character.RaceTransformed.Value then
        SendKey("Y", 0)
    end
end

local Toggle = Tab1:CreateToggle({
    Name = "Auto Observation",
    CurrentValue = Settings["Auto Observation"],
    Flag = "Auto Observation",
    Callback = function(Value)
        SaveSettings("Auto Observation",Value)
    end,
 })
Toggle:Set(false)

local Toggle = Tab1:CreateToggle({
    Name = "Auto Busoi",
    CurrentValue = Settings["Auto Buso"],
    Flag = "Auto Buso",
    Callback = function(Value)
        SaveSettings("Auto Buso",Value)
    end,
 })
Toggle:Set(true)

local Toggle = Tab:CreateToggle({
    Name = "Auto Active V4",
    CurrentValue = Settings["Auto Awekening"],
    Flag = "Auto V4",
    Callback = function(Value)
        SaveSettings("Auto Awekening",Value)
    end,
 })
Toggle:Set(false)

spawn(function()
    while task.wait() do
         if Settingsi["Auto Awakening"] == true then
             EnableV4()
         end
     end
end)

local Toggle = Tab:CreateToggle({
    Name = "Auto Level",
    CurrentValue = Settings["Auto [Level]"],
    Flag = "Auto Farm Level",
    Callback = function(Value)
        SaveSettings("Auto [Level]",Value)
    end,
 })
Toggle:Set(false)

local Toggle = Tab:CreateToggle({
    Name = "Auto Katakuri",
    CurrentValue = Settings["Auto Kata"],
    Flag = "Auto Farm Katakuri",
    Callback = function(Value)
        SaveSettings("Auto Kata",Value)
    end,
 })
Toggle:Set(false)

local Toggle = Tab:CreateToggle({
    Name = "Auto Bones",
    CurrentValue = Settings["Auto Bone"],
    Flag = "Auto Farm Bone",
    Callback = function(Value)
        SaveSettings("Auto Bone",Value)
    end,
 })
Toggle:Set(false)

local Toggle = Tab:CreateToggle({
    Name = "Double Quest",
    CurrentValue = Settings["Double Quest"],
    Flag = " Double Quest for Auto Farm Level",
    Callback = function(Value)
        SaveSettings("Double Quest",Value)
    end,
 })
Toggle:Set(false)

---ckeck for animate (sob)
function CheckAnimation(humanoid)
    local exceptSet = {}
    for _, id in ipairs({10129760884, 9400509141, 10375950022, 9400516463, 9897746533, 8708225668,8708222938, 15087184962, 8708176378, 913389285, 8708224329, 8708225020, 15041522318,14977822399,15088352061,8994252874,10129768335,9897436286,9811880619,9897433386,9884584522,9799137678,9886242181,9811521002,9799138662,9884586404,9800654017,9799139408,9884587348,507766388,507766951,507766666,507785072,507784897,9799140065,9799140958,9802959564,9799136714,9841350003,9841333648,9841361789,3467766626,9811914002,9841324959,3406511948,9841340380,10432912847,8982044407,10375985353,8994244101,10432951137,10432969960}) do
        exceptSet[id] = true
    end
    if humanoid then
        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            local animationIdString = tostring(track.Animation.AnimationId)
            local trackId = formattedNumber(animationIdString)
            if not exceptSet[trackId] then
                if trackId == 8708176378 or trackId == 8708221792 or trackId == 8708222556 then
                    track.KeyframeReached:Connect(function(keyframeName)
                        if keyframeName == "End" then
                            return true
                        end
                    end)
                else
                    return true
                end
            end
        end
    end
    return false
end
--ok
function AutoFarm()
    if plr.PlayerGui.Main.Quest.Visible == true then
        local MobLevelFarm = MobData() or ""
        if CheckMob(MobLevelFarm) then
            for r, v in next, game.Workspace.Enemies:GetChildren() do
                if v.Name == MobLevelFarm then
                    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then 
                        repeat wait()
                            EquipWeapon()
                            EBuso()
                            MobLock = v.HumanoidRootPart.CFrame
                            NoClip = true
                            BringMob(true)
                            if CheckAnimation(v.Humanoid) then
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                            else
                                Tween(v.HumanoidRootPart.CFrame * PosFarm)
                            end
                        until not v or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").health <= 0 or not getgenv().AutoFarmLevel or plr.PlayerGui.Main.Quest.Visible == false or not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, checkdoublequest()["Mob"])
                        BringMob(false)
                    end
                end
            end
        else
            TweenMobSpawn(MobLevelFarm, (not Settings["Auto [Level]"]))
        end
    else
        ClaimQuestLevelFarm()
    end
end

spawn(function()
    while task.wait() do
        if Settings["Auto [Level]"] == true then
            AutoFarm()
        end
    end
end)

function AutoCakePrince()
    if CheckMob("Cake Prince", true) then
        if CheckMob("Cake Prince") then
            for _, v in next, game:GetService("Workspace").Enemies:GetChildren() do
                if v.Name == "Cake Prince" then
                    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                        if getdistance(v.HumanoidRootPart.Position) < 750 then
                            repeat wait()
                                EquipWeapon()
                                EBuso()
                                MobLock = v.HumanoidRootPart.CFrame
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                BringMob(true)
                                if CheckAnimation(v.Humanoid) or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Ring") or game:GetService("Workspace")["_WorldOrigin"]:FindFirstChild("Fist") then
                                    Tween(v.Humanoid * cframe.new(0, 150, 0))
                                else
                                    Tween(v.HumanoidRootPart.CFrame * PosFarm)
                                end
                            until not v or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").health <= 0 or not Scibidi["Auto Cake Prince"]
                        else
                           firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.Map.CakeLoaf.BigMirror.Main, 0)
                                wait(0.1)
                           firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.Map.CakeLoaf.BigMirror.Main, 1)
                        end
                    end
                end
            end
        else
            Tween(CFrame.new(-2154.10547, 69.9830551, -12398.8682, 0.989576638, -3.42137234e-08, 0.144007251, 4.69896726e-08, 1, -8.53162518e-08, -0.144007251, 9.11938187e-08, 0.989576638))
        end
    else
        if CheckMob(TableCakeMobs) then
            for _, v in next, game:GetService("Workspace").Enemies:GetChildren() do
                if table.find(TableCakeMobs, v.Name) then
                    if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                        repeat wait()
                            EquipWeapon()
                            EBuso()
                            MobLock = v.HumanoidRootPart.CFrame
                            BringMob(true)
                            if CheckAnimation(v.Humanoid) then
                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                            else
                                Tween(v.HumanoidRootPart.CFrame * PosFarm)
                            end
                        until not v or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").health <= 0 or not Settings["Auto Kata"]
                        BringMob(false)
                    end
                end
            end
        else
            TweenMobSpawn(TableCakeMobs, not Settings["Auto Kata"])
        end
    end
end

spawn(function()
    while task.wait() do
        if string.match(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true) then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
        end
        if Settings["Auto Kata"] == true then
            AutoCakePrince()
        end
    end
end)

function Autobones()
    if CheckMob(TableHauntedMobs) then
        for _, v in next, game:GetService("Workspace").Enemies:GetChildren() do
            if table.find(TableHauntedMobs, v.Name) then
                if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                    repeat wait()
                        EquipWeapon()
                        EBuso()
                        MobLock = v.HumanoidRootPart.CFrame
                        BringMob(true)
                        if CheckAnimation(v.Humanoid) then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0))
                        else
                            Tween(v.HumanoidRootPart.CFrame * PosFarm)
                        end
                    until not v or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").health <= 0 or not Settings["Auto Bone"]
                end
            end
        end
    else
        TweenMobSpawn(TableHauntedMobs, not Settings["Auto Bone"])
    end
end

spawn(function()
    while task.wait() do
        if Settings["Auto Bone"] == true then
            Autobones()
        end
        if Settings["Auto Random Sup"] then
            FireRemotes(2, "Bones", "Buy", 1, 1)
        end
    end
end)

local Toggle = Tab:CreateToggle({
    Name = "Fast Attack",
    CurrentValue = Settings["Fast Attack"],
    Flag = "Fast Attack",
    Callback = function(Value)
        SaveSettings("Fast Attack",Value)
    end,
 })
Toggle:Set(true)

local Toggle = Tab:CreateToggle({
    Name = "Bring Mob",
    CurrentValue = Settings["Bring Distance"],
    Flag = "Bring Mob",
    Callback = function(Value)
        SaveSettings("Bring Distance",Value)
    end,
 })
Toggle:Set(true)