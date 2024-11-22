local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Whites Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion Library"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Items",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab4 = Window:MakeTab({
	Name = "Race V4",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab5 = Window:MakeTab({
	Name = "Sea Event",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab6 = Window:MakeTab({
	Name = "Raid And Fruit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab7 = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab8 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
--polayxiide
if PlaceId == 2753915549 then
    Old_World = true
elseif PlaceId == 4442272183 then
    New_World = true
elseif PlaceId == 7449423635 then
    Third_World = true
else
    game:GetService("Players").LocalPlayer:Kick("not gAypport")
end
----Leoveosave
function LoadSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfolder("Whites Hub") then
            makefolder("Whites Hub")
        end
        if not isfolder("Whites Hub/Blox Fruits/") then
            makefolder("Whites Hub/Blox Fruits/")
        end
        if not isfile("Whites Hub/Blox Fruits/" .. plr.Name .. ".json") then
            writefile(
                "Whites Hub/Blox Fruits/" .. plr.Name .. ".json",
                game:GetService("HttpService"):JSONEncode(SaveDick)
            )
        else
            local x =
                game:GetService("HttpService"):JSONDecode(
                readfile("Whites Hub/Blox Fruits/" .. plr.Name .. ".json")
            )
            for y, z in pairs(x) do
                SaveDick[y] = z
            end
        end
    else
        return
    end
end
function SaveSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfile("Whites Hub/Blox Fruits/" .. plr.Name .. ".json") then
            LoadSettings()
        else
            local x =
                game:GetService("HttpService"):JSONDecode(
                readfile("Whites Hub/Blox Fruits/" .. plr.Name .. ".json")
            )
            local A = {}
            for y, z in pairs(SaveDick) do
                A[y] = z
            end
            writefile(
                "Whites Hub/Blox Fruits/" .. plr.Name .. ".json",
                game:GetService("HttpService"):JSONEncode(A)
            )
        end
    else
        return
    end
end
LoadSettings()
----Leovel
function DetectMob(MobName)
for i, v in pairs(WS.Enemies:GetChildren()) do
	local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
	if ((typeof(MobName) == "table" and (table.find(MobName, v.Name) or table.find(MobName, stringgsub))) or (v.Name == MobName or MobName == stringgsub and v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade"))) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
		return v
	end
end
end

function DetectMob2(MobName2)
for i, v in pairs(WS.Enemies:GetChildren()) do
	local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
	if ((typeof(MobName2) == "table" and (table.find(MobName2, v.Name) or table.find(MobName2, stringgsub))) or (v.Name == MobName2 or MobName2 == stringgsub and v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade"))) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
		return v
	end
end
for i, v in pairs(Rc:GetChildren()) do
	local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
	if ((typeof(MobName2) == "table" and (table.find(MobName2, v.Name) or table.find(MobName2, stringgsub))) or (v.Name == MobName2 or MobName2 == stringgsub and v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade"))) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
		return v
	end
end
end

local QuestKhac = {"BartiloQuest", "CitizenQuest"}
local function S()
    local Lvl = plr.Data.Level.Value
    local T = Lvl
    local min = 0
    if Lvl >= 1 and Lvl <= 9 then
        if tostring(plr.Team) == "Marines" then
            Mob1 = "Trainee"
            Mob2 = "MarineQuest"
            Mob3 = 1
        elseif tostring(plr.Team) == "Pirates" then
            Mob1 = "Bandit"
            Mob2 = "BanditQuest1"
            Mob3 = 1
        end
    end
    local GuideModule = require(Rc.GuideModule)
    local Quests = require(Rc.Quests)
    for i, v in pairs(GuideModule["Data"]["NPCList"]) do
        for i1, v1 in pairs(v["Levels"]) do
            if Lvl >= v1 then
                if not levelreq then
                    levelreq = 0
                end
                if v1 > levelreq then
                    npcpos = i["CFrame"]
                    Mob3 = i1
                    levelreq = v1
                end
                if #v["Levels"] == 3 and Mob3 == 3 then
                    npcpos = i["CFrame"]
                    Mob3 = 2
                    levelreq = v["Levels"][2]
                end
            end
        end
    end
    for i, v in pairs(Quests) do
        for i1, v1 in pairs(v) do
            for O, P in pairs(v1.Task) do
                if v1["LevelReq"] == levelreq and v1.Task[O] > 1 and not table.find(QuestKhac, tostring(i)) then
                    Mob2 = i
                    for i2, v2 in pairs(v1["Task"]) do
                        Mob1 = i2
                    end
                end
            end
        end
    end
    if Mob2 == "MarineQuest2" then
        Mob2 = "MarineQuest2"
        Mob3 = 1
        Mob1 = "Chief Petty Officer"
        levelreq = 120
    elseif Mob2 == "ImpeMob3" then
        Mob2 = "PrisonerQuest"
        Mob3 = 2
        Mob1 = "Dangerous Prisoner"
        levelreq = 210
    elseif Mob2 == "SkyExp1Quest" then
        if Mob3 == 1 then
        elseif Mob3 == 2 then
        end
    elseif Mob2 == "Area2Quest" and Mob3 == 2 then
        Mob2 = "Area2Quest"
        Mob3 = 1
        Mob1 = "Swan Pirate"
        levelreq = 775
    end
end

local Q = require(Rc.Quests)
local a3 = require(Rc:WaitForChild("GuideModule"))
function CheckDataQuest()
    for r, v in next, a3.Data do
        if r == "QuestData" then
            return true
        end
    end
    return false
end
function CheckNameMobDoubleQuest()
    local a
    if CheckDataQuest() then
        for r, v in next, a3.Data.QuestData.Task do
            a = r
        end
    end
    return a
end
function KillAura()
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name ~= "FishBoat" and not string.find(v.Name, "Brigade") then
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                repeat wait()
                    v.Humanoid.Health = 0
                    sethiddenproperty(plr, "SimulationRadius", math.huge)
                until not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent 
            end
        end
    end
end
function CheckDoubleQuestSkidcuaYMF()
    S()
    local a5 = {}
    if
        plr.Data.Level.Value >= 10 and Bulon["Double Quest"] and CheckDataQuest() and
            CheckNameMobDoubleQuest() == Mob1 and
            #CheckNameMobDoubleQuest() > 2
     then
        for r, v in pairs(Q) do
            for M, N in pairs(v) do
                for O, P in pairs(N.Task) do
                    if tostring(O) == Mob1 then
                        for a6, a7 in next, v do
                            for a8, a9 in next, a7.Task do
                                if a8 ~= Mob1 and a9 > 1 then
                                    if a7.LevelReq <= plr.Data.Level.Value then
                                        a5["Name"] = tostring(a8)
                                        a5["Mob2"] = r
                                        a5["ID"] = a6
                                    else
                                        a5["Name"] = Mob1
                                        a5["Mob2"] = Mob2
                                        a5["ID"] = Mob3
                                    end
                                    return a5
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        a5["Name"] = Mob1
        a5["Mob2"] = Mob2
        a5["ID"] = Mob3
        return a5
    end
    a5["Name"] = Mob1
    a5["Mob2"] = Mob2
    a5["ID"] = Mob3
    return a5
end
function MobLevel1OrMobLevel2()
    local aa = {}
    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if
            not table.find(aa, v.Name) and v:IsA("Model") and v.Name ~= "PirateBasic" and
                v.Name ~= "FishBoat" and
                not string.find(v.Name, "Brigade") and
                v:FindFirstChild("Humanoid") and
                v.Humanoid.Health > 0 and
                v:FindFirstChild("HumanoidRootPart")
         then
            table.insert(aa, v.Name)
        end
    end
    for r, v in pairs(aa) do
        local ab = v
        v = tostring(v:gsub(" %pLv. %d+%p", ""))
        if tostring(v) == CheckNameMobDoubleQuest() then
            return tostring(ab)
        end
    end
    return false
end

local GuideModule = require(Rc.GuideModule)
function NpcPos()
    for i,v in pairs(GuideModule["Data"]["NPCList"]) do
        if v["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
            return i["CFrame"]
        end
    end
end

Mob = ""
Mob1 = ""
if game.Workspace:FindFirstChild("MobSpawns") then
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "MobSpawns" then
            v:Destroy()
        end
    end
end
local CreateFoldermmb = Instance.new("Folder")
CreateFoldermmb.Parent = game.Workspace
CreateFoldermmb.Name = "MobSpawns"

function RemoveLevelTitle(v)
    return tostring(tostring(v):gsub(" %pLv. %d+%p", ""):gsub(" %pRaid Boss%p", ""):gsub(" %pBoss%p", ""))
end 
spawn(
    function()
        while wait() do 
            for i,v in pairs(game.workspace.MobSpawns:GetChildren()) do  
                v.Name = RemoveLevelTitle(v.Name)
            end
        end
    end
)
function MobDepTrai()
    MobDepTraiTable = {}
    for i, v in pairs(WS["_WorldOrigin"].EnemySpawns:GetChildren()) do
        table.insert(MobDepTraiTable, v)
    end
    local tablefoldermmb = {}
    for i, v in next, require(Rc.Quests) do
        for i1, v1 in next, v do
            for i2, v2 in next, v1.Task do
                if v2 > 1 then
                    table.insert(tablefoldermmb, i2)
                end
            end
        end
    end
    for i, v in pairs(getnilinstances()) do
        if table.find(tablefoldermmb, RemoveLevelTitle(v.Name)) then
            table.insert(MobDepTraiTable, v)
        end
    end
    return MobDepTraiTable
end
local MobSpawnList = MobDepTrai()
function ReloadFolderMob()
    for i, v in next, game.Workspace.MobSpawns:GetChildren() do
        v:Destroy()
    end
    for i, v in pairs(MobSpawnList) do
        if v then
            if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                MobNew = Instance.new("Part")
                MobNew.CFrame = v.HumanoidRootPart.CFrame
                MobNew.Name = v.Name
                MobNew.Anchored = true
                MobNew.Transparency = 1
                MobNew.CanCollide = false
                MobNew.Parent = game.Workspace.MobSpawns
            elseif v:IsA("Part") then
                MobNew = v:Clone()
                MobNew.Parent = game.Workspace.MobSpawns
            end
        end
    end
end
ReloadFolderMob()
function GetMobSpawnList(a)
    a = RemoveLevelTitle(a)
    k = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if v.Name == a then
            table.insert(k, v)
        end
    end
    return k
end
function EquipTool(c)
    local tool = plr.Backpack:FindFirstChild(c)
    if tool then
        wait(0.5)
        plr.Character.Humanoid:EquipTool(tool)
    end
end
function GetMob()
    local tablegetmob = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if not table.find(tablegetmob, v.Name) then
            table.insert(tablegetmob, v.Name)
        end
    end
    if string.find(WS["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(tablegetmob) do
            local b = v
            v = tostring(v:gsub(" %pLv. %d+%p", ""))
            if v == CheckNameMobDoubleQuest() then
                return b
            end
        end
    else
        return CheckNameMobDoubleQuest()
    end
end
function DetectFruit()
    for i,v in pairs(WS:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            return v
        end
    end
end
function GetMobName(Name)
    local tablegetmob = {}
    for i, v in pairs(game.Workspace.MobSpawns:GetChildren()) do
        if not table.find(tablegetmob, v.Name) then
            table.insert(tablegetmob, v.Name)
        end
    end
    if string.find(WS["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(tablegetmob) do
            local b = v
            v = tostring(v:gsub(" %pLv. %d+%p", ""))
            if v == Name then
                return b
            end
        end
    else
        return Name
    end
end

function GetDistance(a)
    if typeof(a) == "CFrame" then
        return (a.Position - plr.Character.HumanoidRootPart.Position).Magnitude
    elseif typeof(a) == "Vector3" then
        return (a - plr.Character.HumanoidRootPart.Position).Magnitude
    end
end

function GetQuest()
    if (NpcPos().Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then
        Rc.Remotes["CommF_"]:InvokeServer("StartQuest", tostring(CheckDoubleQuestSkidcuaYMF().Mob2), CheckDoubleQuestSkidcuaYMF().ID)
    else
        ToBypass(NpcPos())
    end
end

function DetectQuestComplete()
    for a, a in pairs(
        game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()
    ) do
        if a.Name == "NotificationTemplate" then
            if string.lower(a.Text):find("quest completed") then
                return true
            end
        end
    end
    return false
end
---Detctskipfarm(howthefdoesthiswork)
CountClaimQuest = 0
function SkipLevel()
    if plr.Data.Level.Value >= 1 and plr.Data.Level.Value <= 29 then
        if DetectMob("Sky Bandit") then
            repeat wait()
                KillMob("Sky Bandit", function() return SaveDick["Level Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 30 end)
            until SaveDick["Level Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 30 or not DetectMob("Sky Bandit")
        else
            for i, v in pairs(GetMobSpawnList(GetMobName("Sky Bandit"))) do
                repeat wait()
                    Tween(v.CFrame * CFrame.new(0, 15, 0))
                until DetectMob("Sky Bandit") or SaveDick["LevelFarm"] == false or IsStackFarm or plr.Data.Level.Value >= 30 or GetDistance(v.Position) <= 30
                NoClip = false
            end
        end
    elseif plr.Data.Level.Value >= 30 and plr.Data.Level.Value <= 49 then
        if DetectMob("Shanda") then
            repeat wait()
                KillMob("Shanda", function() return SaveDick["LevelFarm"] == false or IsStackFarm or plr.Data.Level.Value >= 50 end)
            until SaveDick["LevelFarm"] == false or IsStackFarm or plr.Data.Level.Value >= 50 or not DetectMob("Shanda")
        else
            for i, v in pairs(GetMobSpawnList(GetMobName("Shanda"))) do
                repeat wait()
                    Tween(v.CFrame * CFrame.new(0, 15, 0))
                until DetectMob("Shanda") or SaveDick["LevelFarm"] == false or IsStackFarm or plr.Data.Level.Value >= 50 or GetDistance(v.Position) <= 30
            end
        end
    elseif plr.Data.Level.Value >= 50 and plr.Data.Level.Value <= 299 then
        if not DetectQuestComplete() then
            if plr.PlayerGui.Main.Quest.Visible == false then
                Rc.Remotes["CommF_"]:InvokeServer("PlayerHunter")
                CountClaimQuest = CountClaimQuest + 1
            elseif plr.PlayerGui.Main.Quest.Visible == true then
                local djtmenokhovailon = string.gsub(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat ", "")
                djtmenokhovailon = string.gsub(djtmenokhovailon, " %p(0/1)%p", "")
                if not WS.Characters:FindFirstChild(djtmenokhovailon) and plr.PlayerGui.Main.Quest.Visible == true then
                    Rc.Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game.Players[djtmenokhovailon].Data.Level.Value < 20 or game.Players[djtmenokhovailon].Data.Level.Value >= 150 then
                    Rc.Remotes.CommF_:InvokeServer("AbandonQuest")
                    print(game.Players[djtmenokhovailon].Data.Level.Value)
                end
                if CountClaimQuest >= 15 then
                    HopServer()
                end
                if game.Players[djtmenokhovailon].Data.Level.Value >= 20 and game.Players[djtmenokhovailon].Data.Level.Value < 150 then
                    for i, v in pairs(WS.Characters:GetChildren()) do
                        if v:IsA("Model") then
                            if v.Name == djtmenokhovailon then
                                if v:FindFirstChild("Humanoid").Health > 0 and v.Parent and v:FindFirstChild("HumanoidRootPart") then
                                    if plr.PlayerGui.Main.PvpDisabled.Visible == false then
                                        repeat wait()
                                            v.HumanoidRootPart.Size = Vector3.new(30, 30, 30)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(math.random(0, 2), math.random(0, 2), math.random(0, 2)))
                                            EquipWeapon()
                                            NoClip = true
                                            Buso()
                                            if GetDistance(v.HumanoidRootPart.Position) <= 10 then
                                                SendKey("X")
                                                Click()
                                                SendKey("Z")
                                            end
                                        until v:FindFirstChild("Humanoid").Health <= 0 or not v.Parent or not v:FindFirstChild("HumanoidRootPart") or plr.PlayerGui.Main.PvpDisabled.Visible == true
                                    elseif plr.PlayerGui.Main.PvpDisabled.Visible == true then
                                        Rc.Remotes.CommF_:InvokeServer("EnablePvp")
                                        NoClip = false
                                    end
                                end
                            end
                        end
                    end
                end
            end
        elseif DetectQuestComplete() then
            killshanda = true
        end
    elseif plr.Data.Level.Value >= 300 then
        killshanda = false
    end
end
--motpahncualeveo
local killshanda = false
spawn(function()
    while wait() do
        if killshanda then
            if DetectMob("Shanda") then
                repeat wait()
                    KillMob("Shanda", function() return SaveDick["Level Farm"] == false or IsStackFarm or plr.Data.Level.Value >= 300 or killshanda == false end)
                until  SaveDick["Level Farm"]  or IsStackFarm or killshanda == false or plr.Data.Level.Value >= 300 or not DetectMob("Shanda")
            else
                for i, v in pairs(GetMobSpawnList(GetMobName("Shanda"))) do
                    repeat wait()
                        Tween(v.CFrame * CFrame.new(0, 15, 0))
                    until DetectMob("Shanda") or SaveDick["Level Farm"] == false or IsStackFarm or killshanda == false or plr.Data.Level.Value >= 300 or GetDistance(v.Position) <= 30
                end
            end
        end
    end
end)
--chjeck
local TableMobBones = {
    "Reborn Skeleton",
    "Posessed Mummy",
    "Living Zombie",
    "Demonic Soul",
}

local TableMobCakes = {
    "Baking Staff",
    "Cookie Crafter",
    "Cake Guard",
    "Head Baker"
}

local TableCakePrince = {
    "Dough King",
    "Cake Prince"
}

function CheckGlassCake()
    if WS.Map.CakeLoaf.BigMirror.Other.Transparency == 1 then
        return true
    end
    return false
end

function DetectCastleRaiding()
    for i, v in pairs(Rc:GetChildren()) do
        if v.Name ~= 'FishBoat' and not string.find(v.Name, "Brigade") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - CFrame.new(-5496.17432, 313.768921, -2841.53027).Position).Magnitude <= 1500 and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i, v in pairs(WS.Enemies:GetChildren()) do
        if v.Name ~= 'FishBoat' and not string.find(v.Name, "Brigade") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - CFrame.new(-5496.17432, 313.768921, -2841.53027).Position).Magnitude <= 1500 and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end

function GetInventory(uwu)
    for k, v in pairs(Rc.Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == uwu then
            return v
        end
    end
end

function CheckSaberDoor()
    for r, v in next, WS.Map.Jungle.Final:GetChildren() do
        if v:IsA("Part") and not v.CanCollide then
            return true
        end
    end
end

function CheckButtonJungle()
    for r, v in pairs(WS.Map.Jungle.QuestPlates:GetChildren()) do
        if v:IsA("Model") then
            if v.Button:FindFirstChild("TouchInterest") then
                return v
            end
        end
    end
end

function CanGoNewWorld()
    if plr.Data.Level.Value >= 700 and Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
        return true
    end
    if plr.Data.Level.Value < 700 or Rc.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 then
        return false
    end
    return false
end
local TableDauBuoiAcMin = {
    "rip_indra",
    "rip_indra True Form"
}
local BartiloProgess = Rc.Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo")
function CanGoThirdSea()
    if BartiloProgess == 3 then
        if plr.Data.Level.Value >= 1500 then
            if Rc.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
                return false
            elseif not Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")  then
                if DetectMob2("Don Swan") then
                    return true
                end
            elseif Rc.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                return true
            end
        end
    end
end
function IsIslandRaid(nu)
    if WS["_WorldOrigin"].Locations:FindFirstChild("Island " .. nu) then
        min = 4500
        for i, v in pairs(WS["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. nu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min
             then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for i, v in pairs(WS["_WorldOrigin"].Locations:GetChildren()) do
            if
                v.Name == "Island " .. nu and
                    (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min
             then
                return v
            end
        end
    end
end
function getNextIsland()
    TableIslandsRaid = {5,4,3,2,1}
    for i, v in next, TableIslandsRaid do
        if
            IsIslandRaid(v) and
                (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                    4500
         then
            return IsIslandRaid(v)
        end
    end
end

function GetNotification(ccacc)
    for a, a in pairs(
        game:GetService("Players")["LocalPlayer"].PlayerGui:FindFirstChild("Notifications"):GetChildren()
    ) do
        if a.Name == "NotificationTemplate" then
            if string.lower(a.Text):find(ccacc) then
                return true
            end
        end
    end
    return false
end

function Click()
    local bc = game:GetService("VirtualUser")
    bc:CaptureController()
    bc:ClickButton1(Vector2.new(851, 158), WS.Camera.CFrame)
end
--tipibipass
function DetectTeleporter(vcs)
    vcspos = vcs.Position
    min = math.huge
    min2 = math.huge
    local y = game.PlaceId
    if y == 2753915549 then
        OldWorld = true
    elseif y == 4442272183 then
        NewWorld = true
    elseif y == 7449423635 then
        ThreeWorld = true
    end
    if ThreeWorld then
        TableLocations = {
            ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["Great Tree"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["Ngu1"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["ngu2"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif NewWorld then
        TableLocations = {
            ["Mansion"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["Flamingo"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["122"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["3032"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif OldWorld then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - vcspos).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    min3 = (vcspos - plr.Character.HumanoidRootPart.Position).Magnitude
    if min2 + 32 <= min3 and GetDistance(vcspos) > 5000 then
        return choose
    end
end

function requestEntrance(ac)
    args = {
        "requestEntrance",
        ac
    }
    Rc.Remotes.CommF_:InvokeServer(unpack(args))
    oldcframe = plr.Character.HumanoidRootPart.CFrame
    char = plr.Character.HumanoidRootPart
    char.CFrame = CFrame.new(oldcframe.X, oldcframe.Y + 50, oldcframe.Z)
    if plr.Character:FindFirstChild("PartTele") then
        plr.Character:FindFirstChild("PartTele").CFrame = plr.Character.HumanoidRootPart.CFrame
    end
end
function WaitHRP(q0) 
    if not q0 then return end
    return q0.Character:WaitForChild("HumanoidRootPart", 9) 
end 
function GetBackback(Item)
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if ((typeof(Item) == "table" and table.find(Item, v.Name)) or (typeof(Item) == "string" and v.Name == Item)) then
            return v
        end
    end
    for i, v in pairs(plr.Character:GetChildren()) do
        if ((typeof(Item) == "table" and table.find(Item, v.Name)) or (typeof(Item) == "string" and v.Name == Item)) then
            return v
        end
    end
end
function Tween(Pos)
    pcall(function()
        if plr.Character:FindFirstChild("Humanoid").Health > 0 and plr.Character:FindFirstChild("HumanoidRootPart") then
            Distance = (Pos.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            plr.Character:WaitForChild("HumanoidRootPart", 9)
            plr.Character:WaitForChild("Head", 9)
            if not Pos then return end
            if not plr.Character:FindFirstChild("PartTele") then
                local PartTele = Instance.new("Part", plr.Character) -- Create part
                PartTele.Size = Vector3.new(10,1,10)
                PartTele.Name = "PartTele"
                PartTele.Anchored = true
                PartTele.Transparency = 1
                PartTele.CanCollide = false
                PartTele.CFrame = WaitHRP(plr).CFrame 
                PartTele:GetPropertyChangedSignal("CFrame"):Connect(function()
                    task.wait(0.01)
                    WaitHRP(plr).CFrame = PartTele.CFrame
                end)
            end
            tween = game:GetService("TweenService"):Create(plr.Character.PartTele, TweenInfo.new(Distance / SaveDick["Tween Speed"], Enum.EasingStyle.Linear) , {CFrame = Pos})
            local NearestEntraceFunction = DetectTeleporter(Pos)
            if NearestEntraceFunction then
                try = 0
                repeat wait()
                    pcall(function()
                        tween:Cancel()
                    end)
                    requestEntrance(NearestEntraceFunction)
                    try = try + 1
                until not DetectTeleporter(Pos) or try >= 10
                if try >= 10 then
                    if not GetBackback("God's Chalice") and not GetBackback("Fist Of Darkness") then
                        plr.Character.Humanoid.Health = 0
                    end
                end
            end
            if Distance <= 250 then
                tween:Cancel()
                plr.Character.PartTele.CFrame = Pos
            end
            if plr.Character.Humanoid.Sit == true then
                plr.Character.Humanoid.Sit = false
                plr.Character.PartTele.CFrame = CFrame.new(plr.Character.PartTele.CFrame.X, plr.Character.PartTele.CFrame.Y + 30, plr.Character.PartTele.CFrame.Z)
            end
            tween:Play()
        end
    end)
end

function GetPosBypass(c)
    for i, v in pairs(WS["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren()) do
        if v:IsA("Model") then
            if (v.Part.Position - c.Position).Magnitude < 1500 then
                return v
            end
        end
    end
end
function DetectFruitBackback()
    for i, v in pairs(plr.Backpack:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            if not v:FindFirstChild("Level") then
                return true
            end
        end
    end
    for i, v in pairs(plr.Character:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            if not v:FindFirstChild("Level") then
                return true
            end
        end
    end
    return false
end
function BypassTo(TeruIsNigga)
    pcall(function()
        if not DetectFruitBackback() then
            local Nigga = DetectTeleporter(TeruIsNigga)
            if Nigga then
                requestEntrance(Nigga)
            end
            if GetDistance(TeruIsNigga.Position) > 4500 then
                repeat wait()
                    if plr.Character:FindFirstChild("PartTele") then
                        plr.Character:FindFirstChild("PartTele").CFrame = GetPosBypass(TeruIsNigga).Part.CFrame
                    end
                    plr.Character:FindFirstChild("Head"):Destroy()
                    plr.Character.HumanoidRootPart.CFrame = GetPosBypass(TeruIsNigga).Part.CFrame
                    plr.Character:WaitForChild("Humanoid"):ChangeState(15)
                    wait(2)
                    plr.Character.PrimaryPart.CFrame = GetPosBypass(TeruIsNigga).Part.CFrame
                    wait(3)
                until GetDistance(TeruIsNigga.Position) <= 4500 or not plr.Character:FindFirstChild("Humanoid") or plr.Character:FindFirstChild("Humanoid").Health <= 0
            end
        elseif DetectFruitBackback() then
            Tween(TeruIsNigga)
        end
    end)
end

function ToBypass(gay)
    if GetDistance(gay.Position) > 4500 then
        repeat wait()
            BypassTo(gay)
        until GetDistance(gay.Position) <= 4500 or not plr.Character:FindFirstChild("Humanoid") or plr.Character:FindFirstChild("Humanoid").Health <= 0
    elseif GetDistance(gay.Position) < 4500 then
        Tween(gay)
    end
end

spawn(function()
    while task.wait() do
        if plr.Character:FindFirstChild("Humanoid").Health <= 0 or not plr.Character:FindFirstChild("HumanoidRootPart") then
            if plr.Character:FindFirstChild("PartTele") then
                plr.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
    end
end)
spawn(function()
    while task.wait() do
        if plr.Character:FindFirstChild("PartTele") then
            if (plr.Character.HumanoidRootPart.Position - plr.Character:FindFirstChild("PartTele").Position).Magnitude >= 100 then
                plr.Character:FindFirstChild("PartTele"):Destroy()
            end
        end
    end
end)

function CancelTween()
    if plr.Character.Head:FindFirstChild("BodyVelocity") then
        plr.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
    end
    if plr.Character:FindFirstChild("PartTele") then
        plr.Character:FindFirstChild("PartTele"):Destroy()
    end
    NoClip = false
    return Tween(plr.Character.HumanoidRootPart.CFrame)
end

spawn(function()
    while wait() do
        pcall(function()
            if NoClip == true then
                if not plr.Character.Head:FindFirstChild("Nigga") then
                    local Bucaccho = Instance.new("BodyVelocity", plr.Character.Head)
                    Bucaccho.P = 1500
                    Bucaccho.Name = "Nigga"
                    Bucaccho.MaxForce = Vector3.new(0, 100000, 0)
                    Bucaccho.Velocity = Vector3.new(0, 0, 0)
                end
                for i, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                if plr.Character.Head:FindFirstChild("Nigga") then
                    plr.Character.Head:FindFirstChild("Nigga"):Destroy()
                end
            end
        end)
    end
end)

function DisableTween(nigga)
    if not nigga then
        NoClip = false
        if plr.Character.Head:FindFirstChild("BodyVelocity") then
            plr.Character.Head:FindFirstChild("BodyVelocity"):Destroy()
        end
        if plr.Character:FindFirstChild("PartTele") then
            plr.Character:FindFirstChild("PartTele"):Destroy()
        end
        NoClip = false
        return Tween(plr.Character.HumanoidRootPart.CFrame)
    end
end
---ohters
function KillMob(V1, StopFunction)
    pcall(function()
        thismob = DetectMob2(V1)
        if thismob:FindFirstChild("HumanoidRootPart") and thismob.Parent and thismob:FindFirstChild("Humanoid") and thismob.Humanoid.Health > 0 then
            repeat task.wait()
                Buso()
                EquipWeapon()
                Tween(thismob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
                BringPos = thismob.HumanoidRootPart.CFrame
                BringMob(V1)
                NoClip = true
            until not thismob.Parent or not thismob:FindFirstChild("Humanoid") or thismob:FindFirstChild("Humanoid").Health <= 0 or not thismob:FindFirstChild("HumanoidRootPart") or StopFunction()
            NoClip = false
            CancelTween()
        end
    end)
end

local player = game.Players.LocalPlayer
local playerhrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

function GetDistance(position1, position2)
    return (position1 - position2).Magnitude
end

function InMyNetwork(object)
    if isnetworkowner then
        return isnetworkowner(object)
    else
        return playerhrp and GetDistance(object.Position, playerhrp.Position) <= getgenv().BringDistance
    end
end

function IsAlive(npc)
    local humanoid = npc:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health > 0.11 or false
end

function GetMidBring(MobName, b2)
    local total, count = Vector3.new(), 0
    for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
        if enemy.Name == MobName then
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            local humanoid = enemy:FindFirstChildOfClass("Humanoid")
            if hrp and humanoid and humanoid.Health > 0 and GetDistance(hrp.Position, b2.Position) <= SaveDick["Bring Distance"] then
                total = hrp.Position
                count = 1
            end
        end
    end
    return count > 0 and total / count or nil
end

function ErrorHandler(error)
    print("\x1b[41m\x1b[30m[+ Error]\x1b[0m\x1b[31m : " .. tostring(error))
end

function BringMob(enable)
    xpcall(function()
        if not enable or not playerhrp then 
            return 
        end
        local mob = game.Workspace.Enemies:GetChildren()
        for _, enemy in pairs(mob) do
            local humanoid = enemy:FindFirstChild("Humanoid")
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if not humanoid or humanoid.Health <= 0 or not hrp then end
            if not string.find(enemy.Name, "Boss") and humanoid.MaxHealth < 130000 then
                local mid = GetMidBring(enemy.Name, hrp)
                local lockCFrame = mid and CFrame.new(mid) or hrp.CFrame
                if InMyNetwork(hrp) and IsAlive(enemy) then
                    if enemy:GetPrimaryPartCFrame() ~= lockCFrame then
                        enemy:SetPrimaryPartCFrame(lockCFrame)
                    end
                    hrp.CanCollide = false
                    enemy.Head.CanCollide = false
                    humanoid.WalkSpeed = 0
                    humanoid.JumpPower = 0
                    humanoid.AutoRotate = true
                    humanoid:ChangeState(14)
                    sethiddenproperty(player, "SimulationRadius", 3150)
                end
            end
        end
    end, ErrorHandler)
end

function EquipWeapon(Giet)
    if SaveDick["Select WP"] == "" or 	SaveDick["Select WP"] == nil then
        Bulon["Select WP"] = "Melee"
    end
    Giet = GetWP(SaveDick["Select WP"])
    local bucac = plr.Backpack:FindFirstChild(Giet)
    if bucac then
        plr.Character.Humanoid:EquipTool(bucac)
    end
end

function UnEquipWeapon(Giet)
    if SaveDick["Select WP"] == "" or SaveDick["Select WP"] == nil then
        SaveDick["Select WP"] = "Melee"
    end
    Giet = GetWP(SaveDick["Select WP"])
    if plr.Character:FindFirstChild(Giet) then
        plr.Character:FindFirstChild(Giet).Parent = plr.Backpack
    end
end

function NameMelee()
    for r, v in next, plr.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
    for r, v in next, plr.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Melee" then
            return v.Name
        end
    end
end

function NameSword()
    for r, v in next, plr.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
    for r, v in next, plr.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == "Sword" then
            return v.Name
        end
    end
end

function Buso()
    if not plr.Character:FindFirstChild("HasBuso") then
        local args = {[1] = "Buso"}
        Rc.Remotes.CommF_:InvokeServer(unpack(args))
    end
end

function Ken()
    if plr:FindFirstChild("PlayerGui") and plr.PlayerGui:FindFirstChild("ScreenGui") and plr.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        return
    else
        wait(1)
        game:service("VirtualUser"):CaptureController()
        game:service("VirtualUser"):SetKeyDown("0x65")
        wait(2)
        game:service("VirtualUser"):SetKeyUp("0x65")
    end
end

function SendKey(Name, Hold)
    if Hold == nil then
        Hold = 0
    end
    game:service("VirtualInputManager"):SendKeyEvent(true, Name, false, game)
    wait(Hold)
    game:service("VirtualInputManager"):SendKeyEvent(false, Name, false, game)
end

function MoonTextureId()
    if Old_World then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif New_World then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif Third_World then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end

function TweenTemple()
    if GetDistance(CFrame.new(28734.3945, 14888.2324, -109.071777)) > 1500 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
    if GetDistance(CFrame.new(28734.3945, 14888.2324, -109.071777)) > 1500 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    end
end

function PullLever()
    local bo = CFrame.new(28576.4688, 14935.9512, 75.469101)
    local bp = 0.2
    if
        WS.Map["Temple of Time"].Lever.Lever.CFrame.Z > bo.Z + bp or
            WS.Map["Temple of Time"].Lever.Lever.CFrame.Z < bo.Z - bp
     then
        TweenTemple()
        Tween(WS.Map["Temple of Time"].Lever.Part.CFrame)
        for r, v in pairs(WS.Map["Temple of Time"].Lever:GetDescendants()) do
            if v.Name == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
    end
end

spawn(function()
    while task.wait() do
        hookfunction(require(Rc.Effect.Container:FindFirstChild("Death")), function() return nil end)
        hookfunction(require(Rc.Effect.Container:FindFirstChild("Respawn")), function() return nil end)
        Rc.Assets.GUI.DamageCounter.Enabled = false
    end
end)
---aimgaysex
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall =
    newcclosure(
    function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if AimSkill then
                        args[2] = AimPos
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end
)
--ok tabs
Tab:AddDropdown({
	Name = "Select Weapon",
	Default = SaveDick["Select Weapon"],
	Options = {"Melee", "Sword"},
	Callback = function(Value)
		SaveDick["Select Weapon"] = Value
	end    
})

Tab1:AddToggle({
	Name = "Auto Buso",
	Default = true,
	Callback = function(Value)
		SaveDick["Auto Buso"] = Value
	end    
})

Tab1:AddToggle({
	Name = "Auto Observation",
	Default = true,
	Callback = function(Value)
		SaveDick["Auto Observation"] = Value
	end    
})

Tab1:AddToggle({
	Name = "Auto Awakening Race",
	Default = true,
	Callback = function(Value)
		SaveDick["Auto Awakening Race"] = Value
	end    
})

spawn(function()
    while wait() do
        if SaveDick["Auto Buso"] then
            Buso()
        end
        if SaveDick['Auto Observation'] then
            Ken()
        end
        if SaveDick["Auto Awakening Race"] then
            if plr.Character:FindFirstChild("RaceEnergy") and plr.Character.RaceEnergy.Value >= 1 and not plr.Character.RaceTransformed.Value then
                SendKey("Y")
            end
        end
    end
end)

Tab:AddToggle({
	Name = "Auto Farm Level",
	Default = SaveDick["Auto Level"],
	Callback = function(Value)
		SaveDick["Auto Level"] = Value
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Bone",
	Default = SaveDick["Auto Bones"],
	Callback = function(Value)
		SaveDick["Auto Bones"] = Value
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Katakuri",
	Default = SaveDick["Auto Kata"],
	Callback = function(Value)
		SaveDick["Auto Kata"] = Value
	end    
})

Tab:AddToggle({
	Name = "Accept Quest",
	Default = SaveDick["Accept Quest"],
	Callback = function(Value)
		SaveDick["Accept Quest"] = Value
	end    
})

Tab:AddToggle({
	Name = "Double Quest",
	Default = SaveDick["Double Quest"],
	Callback = function(Value)
		SaveDick["Double Quest"] = Value
	end    
})

function LevelFarm()
    if SaveDick["Auto Level"] then
        if plr.Data.Level.Value < 300 then
            SkipLevel()
        elseif plr.Data.Level.Value >= 300 then
            killshanda = false
            if plr.PlayerGui.Main:FindFirstChild("Quest").Visible and not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "(0/1)") then
                if MobLevel1OrMobLevel2() then
                    for r, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == MobLevel1OrMobLevel2() then
                            if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    KillMob(v.Name, function() 
                                        return SaveDick["Level Farm"] == false or IsStackFarm or 
                                        not plr.PlayerGui.Main:FindFirstChild("Quest").Visible 
                                    end)                                    
                                until SaveDick["Auto Level"] == false or IsStackFarm or not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                            end
                        end
                    end
                elseif not MobLevel1OrMobLevel2() then
                    for i, v in pairs(GetMobSpawnList(GetMob())) do
                        repeat wait()
                            NoClip = true
                            ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                        until MobLevel1OrMobLevel2() or SaveDick["Auto Level"] == false or IsStackFarm or not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or GetDistance(v.Position) <= 30 or IsStackFarm
                        NoClip = false
                    end
                end
            elseif not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "(0/1)") then
                GetQuest()
            end
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Level"] then
            LevelFarm()
        end
    end
end)

function BonesFarm()
    if SaveDick["Auto Bones"]  then
        if DetectMob(TableMobBones) then
            for i, v in pairs(WS.Enemies:GetChildren()) do
                if table.find(TableMobBones, v.Name) then
                    if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat wait()
                            KillMob(v.Name, function() return SaveDick["Auto Bones"]  == false end)
                        until SaveDick["Auto Bones"]  == false or IsStackFarm or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                    end
                end
            end
        else
            for i, v in pairs(WS.MobSpawns:GetChildren()) do
                if table.find(TableMobBones, v.Name) then
                    repeat wait()
                        NoClip = true
                        ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                    until DetectMob(TableMobBones) or SaveDick["Auto Bones"] == false or IsStackFarm or GetDistance(v.Position) <= 30
                    NoClip = false
                end
            end
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Bones"] then
            BonesFarm()
        end
    end
end)

function CakeFarm()
    if SaveDick["Auto Kata"] then
        local v = DetectMob2(TableCakePrince)
        if not CheckGlassCake() and v then
            repeat wait()
                KillMob(v.Name, SaveDick["Auto Kata"]  == false)
            until CheckGlassCake() or not DetectMob2(TableCakePrince) or SaveDick["Auto Kata"]  == false or IsStackFarm or IsStackFarm
        elseif CheckGlassCake() and not DetectMob2(TableCakePrince) then
            if DetectMob(TableMobCakes) then
                for i, v in pairs(WS.Enemies:GetChildren()) do
                    if table.find(TableMobCakes, v.Name) then
                        if v:FindFirstChild("HumanoidRootPart") and v.Parent and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat wait()
                                KillMob(v.Name, function() return SaveDick["Auto Kata"] == false end)
                            until SaveDick["Auto Kata"]  == false or IsStackFarm or not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or not v:FindFirstChild("HumanoidRootPart") or IsStackFarm
                        end
                    end
                end
            else
                for i, v in pairs(WS.MobSpawns:GetChildren()) do
                    if table.find(TableMobCakes, v.Name) then
                        repeat wait()
                            NoClip = true
                            ToBypass(v.CFrame * CFrame.new(0, 15, 0))
                        until DetectMob(TableMobCakes) or SaveDick["Auto Kata"]  == false or IsStackFarm or GetDistance(v.Position) <= 30
                        NoClip = false
                    end
                end
            end
        end
    end
end

spawn(function()
    while task.wait() do
        if Bulon["Auto Kata"] then
            CakeFarm()
        end
    end
end)

Tab1:AddToggle({
	Name = "Fast Attack",
	Default = SaveDick["Fast Attack"],
	Callback = function(Value)
		SaveDick["Fast Attack"] = Value
	end    
})

Tab1:AddDropdown({
	Name = "Select Delay Fast",
	Default = SaveDick["Select Delay"],
	Options = {"0", "0.1", "1"},
	Callback = function(Value)
		SaveDick["Select Delay"] = Value
	end    
})

Tab1:AddToggle({
	Name = "Bring Mob",
	Default = SaveDick["Bring Distance"],
	Callback = function(Value)
		SaveDick["Bring Distance"] = Value
	end    
})

Tab1:AddSlider({
	Name = "Select Bring Distance",
	Min = 100,
	Max = 500,
	Default = 250,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Mobs",
	Callback = function(Value)
		SaveDick["Bring Distance"] = Value
	end    
})

Tab1:AddDropdown({
	Name = "Select Tween",
	Default = SaveDick["Tween Speed"],
	Options = {"100", "150", "200", "250", "300", "350"},
	Callback = function(Value)
		SaveDick["Tween Speed"] = Value
	end    
})
----fast (Bo m thich nem o duoi day day thi sao?)
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
	a:Play(1,0,1000)
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
local FireCooldown = 3
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_JIT_MAX(function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FireCooldown or 0.688) + ((FireL/MaxFire)*0.3)
		RigEven.FireServer(RigEven,"weaponChange",ac.currentWeaponModel.Name)
		FireL = FireL + 1
		fask.delay((FireCooldown or 0.288) + ((FireL+0.4/MaxFire)*0.3),function()
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
			pcall(fask.spawn,ac.attack,ac)
			if tick() > AttackCoolDown then
				CancelCoolDown()
			end
			if tick() - cooldowntickFire > 0.2 then
				ac.timeToNextAttack = 0
				ac.hitboxMagnitude = 60
				pcall(fask.spawn,ac.attack,ac)
				cooldowntickFire = tick()
			end
			local AMI3 = ac.anims.basic[7]
			local AMI2 = ac.anims.basic[9]
			local REALID = AMI3 or AMI2
			AttackAnim.AnimationId = REALID
			local StartP = ac.humanoid:LoadAnimation(AttackAnim)
			StartP:Play(1000,0.1,0)
			RigEven.FireServer(RigEven,"hit",bladehit,AMI3 and 4 or 5,"")
			fask.delay(0.4,function()
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
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,8)
					end)
				elseif DamageAura then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,7)
					end)
				elseif UsefastattackPlayers and Fast_Attack then
					fask.spawn(function()
						pcall(fask.spawn,AttackFunction,4)
					end)
				elseif NeedAttacking and Fast_Attack == false then
					if ac.hitboxMagnitude ~= 55 then
						ac.hitboxMagnitude = 55
					end
					pcall(fask.spawn,ac.attack,ac)
				end
			end
		end
	end)
end)()

local kkii = require(game.ReplicatedStorage.Util.CameraShaker)
kkii:Stop()
