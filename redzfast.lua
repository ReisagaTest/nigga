_ENV.rz_FastAttack = value




local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
Module.AttackCooldown = tick()

local sethiddenproperty = sethiddenproperty or (function(...) return ... end)
local setupvalue = setupvalue or (debug and debug.setupvalue)
local getupvalue = getupvalue or (debug and debug.getupvalue)

Modules.FastAttack = (function()
    if _ENV.rz_FastAttack then
      return _ENV.rz_FastAttack
    end
    
    local module = {
      NextAttack = 0,
      Distance = 55,
      attackMobs = true,
      attackPlayers = true
    }
    
    local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
    local RegisterHit = Net:WaitForChild("RE/RegisterHit")
    
    function module:AttackEnemy(Enemy)
      local PrimaryPart = Enemy.PrimaryPart
      
      if PrimaryPart and Player:DistanceFromCharacter(PrimaryPart.Position) < self.Distance then
        if Module.IsAlive(Enemy) and Enemy ~= Player.Character and Enemy:FindFirstChild("Head") then
          if not self.FirstAttack then
            RegisterAttack:FireServer(Settings.ClickDelay or 0.125)
            self.FirstAttack = true
          end
          for i = 1, Settings.DamageMulti or 4 do
            RegisterHit:FireServer(Enemy.Head)
          end
        end
      end
    end
    
    function module:AttackNearest()
      if self.attackMobs then
        for _, Enemy in Enemies:GetChildren() do
          self:AttackEnemy(Enemy)
        end
      end
      if self.attackPlayers then
        for _, Enemy in Characters:GetChildren() do
          self:AttackEnemy(Enemy)
        end
      end
      
      if not self.FirstAttack then
        task.wait(0.5)
      end
    end
    
    function module:BladeHits()
      self:AttackNearest()
      self.FirstAttack = false
    end
    
    task.spawn(function()
      while task.wait(Settings.ClickDelay or 0.125) do
        if (tick() - Module.AttackCooldown) < 1 then continue end
        if not Settings.AutoClick then continue end
        if not Module.IsAlive(Player.Character) then continue end
        if not Player.Character:FindFirstChildOfClass("Tool") then continue end
        
        module:BladeHits()
      end
    end)
    
    _ENV.rz_FastAttack = module
    return module
  end)()