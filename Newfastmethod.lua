getgenv().FastZure = Value




    DamageAura = true;
	Fast = false;
	NeedAttacking = false;
	if JKLL then
		getHits = function(Size)
			local Hits = {};
			if nearbymon then
				for i=1,#Enem do local v = Enem[i];
					local Human = FindFirstChildOfClass(v, "Humanoid");
					if Human and Human.RootPart and Human.Health > 0 and dist(Human.RootPart.Position) < Size+5 then
						tablein(Hits,Human.RootPart);
					end;
				end;
				for i=1,#Chars do local v = Chars[i];
					if v ~= selff.Character then
						local Human = FindFirstChildOfClass(v, "Humanoid");
						if Human and Human.RootPart and Human.Health > 0 and dist(Human.RootPart.Position) < Size+5 then
							tablein(Hits,Human.RootPart);
						end;
					end;
				end;
			end;
			return Hits;
		end;
		local CurrentAllMob = {};
		local canHits = {};
		require(R.Util.CameraShaker):Stop();
		PC = print(require(game:GetService("ReplicatedStorage").ClientComponents.WeaponToolClient).Particle);
		RL = print(require(game:GetService("ReplicatedStorage").ClientComponents.WeaponToolClient).RigLib);
		DMG = print(require(game:GetService("ReplicatedStorage").ClientComponents.WeaponToolClient).Particle.Damage);
		RigC = print(require(game:GetService("ReplicatedStorage").ClientComponents.WeaponToolClient.RigController),2);
		Combat =  print(require(game:GetService("ReplicatedStorage").ClientComponents.WeaponToolClient),2);
		task.spawn(function()
			local stacking = 0;
			local printCooldown = 0;
			while twait(.075) do
				nearbymon = false;
				tablecl(CurrentAllMob);
				tablecl(canHits);
				local mobs = CollectionService:GetTagged("ActiveRig");
				for i=1,#mobs do local v = mobs[i];
					Human = FindFirstChildOfClass(v, "Humanoid");
					if Human and Human.Health > 0 and Human.RootPart and v ~= Char then
						local IsPlayer = P:GetPlayerFromCharacter(v);
						local IsAlly = IsPlayer and CollectionService:HasTag(IsPlayer,"Ally"..selff.Name);
						if not IsAlly then
							CurrentAllMob[#CurrentAllMob + 1] = v;
							if not nearbymon and (FindFirstChild(selff.Character, "HumanoidRootPart") and (v.HumanoidRootPart.Position - selff.Character.HumanoidRootPart.Position).Magnitude <= 65) then
								nearbymon = true;
							end;
						end;
					end;
				end;
				if nearbymon then
					local Players = P:GetPlayers()
					for i=1,#Enem do local v = Enem[i]
						local Human = FindFirstChildOfClass(v, "Humanoid");
						if Human and Human.RootPart and Human.Health > 0 and (FindFirstChild(selff.Character, "HumanoidRootPart") and (v.HumanoidRootPart.Position - selff.Character.HumanoidRootPart.Position).Magnitude <= 65) then
							canHits[#canHits+1] = Human.RootPart;
						end;
					end;
					for i=1,#Players do local v = Players[i].Character;
						if not GetAttribute(Players[i], "PvpDisabled") and v and v ~= selff.Character then
							local Human = FindFirstChildOfClass(v, "Humanoid");
							if Human and Human.RootPart and Human.Health > 0 and (FindFirstChild(selff.Character, "HumanoidRootPart") and (v.HumanoidRootPart.Position - selff.Character.HumanoidRootPart.Position).Magnitude <= 65) then
								canHits[#canHits+1] = Human.RootPart;
							end;
						end;
					end;
				end;
			end;
		end);
		local shared = getgenv();
		local Data = Combat;
		local Blank = function() end;
		local RigEvent = R.RigControllerEvent;
		local Validator = R.Remotes.Validator;
		local Animation = Instancen("Animation");
		local RecentlyFired = 0;
		local AttackCD = 0;
		local Controller;
		local lastFireValid = 0;
		local MaxLag = 350;
		fucker = 0.07;
		TryLag = 0;
		local resetCD = function()
			local WeaponName = Controller.currentWeaponModel.Name;
			local Cooldown = {
				combat = 0.07
			};
			AttackCD = tick() + (fucker and Cooldown[WeaponName:lower()] or fucker or 0.285) + ((TryLag/MaxLag)*0.3);
			RigEvent.FireServer(RigEvent,"weaponChange",WeaponName);
			TryLag = TryLag + 1;
			task.delay((fucker or 0.285) + (TryLag+0.5/MaxLag)*0.3,function()
				TryLag = TryLag - 1;
			end);
		end;
		if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end;
		if not shared.cpc then shared.cpc = PC.play end;
		if not shared.dnew then shared.dnew = DMG.new end;
		if not shared.attack then shared.attack = RigC.attack end;
		RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
			if not getgenv().FastZure then
				PC.play = shared.cpc;
				return shared.orl(a,b,c,65,func);
			end;
			local Radius = (getgenv().FastZure and getgenv().FastZureRadius) or 65;
			if canHits and #canHits > 0 then
				PC.play = function() end;
				a:Play(0.01,0.01,0.01);
				func(canHits);
				twait(a.length * 0.5);
				a:Stop();
			end;
		end;
		task.spawn(function()
			local Data = Combat;
			local Blank = function() end;
			local RigEvent = R.RigControllerEvent;
			local Animation = Instancen("Animation");
			local RecentlyFired = 0;
			local AttackCD = 0;
			local Controller;
			local lastFireValid = 0;
			local MaxLag = 350;
			fucker = 0.07;
			TryLag = 0;
			local resetCD = function()
				local WeaponName = Controller.currentWeaponModel.Name;
				local Cooldown = {
					combat = 0.07;
				}
				AttackCD = tick() + (fucker and Cooldown[WeaponName:lower()] or fucker or 0.285) + ((TryLag/MaxLag)*0.3);
				RigEvent.FireServer(RigEvent,"weaponChange",WeaponName);
				TryLag = TryLag + 1;
				tdelay((fucker or 0.285) + (TryLag+0.5/MaxLag)*0.3,function()
					TryLag = TryLag - 1;
				end);
			end;
			if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end;
			if not shared.cpc then shared.cpc = PC.play end;
			if not shared.dnew then shared.dnew = DMG.new end;
			if not shared.attack then shared.attack = RigC.attack end;
			RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
				if not NeedAttacking then
					PC.play = shared.cpc;
					return shared.orl(a,b,c,65,func);
				end;
				local Radius = (DamageAura and DamageAuraRadius) or 65;
				if canHits and #canHits > 0 then
					PC.play = function() end;
					a:Play(0.00075,0.01,0.01);
					func(canHits);
					twait(a.length * 0.5);
					a:Stop();
				end;
			end;
			while H.Stepped:Wait() do
				if #canHits > 0 then
					Controller = Data.activeController;
					if NormalClick then
						pcal(tspawn, Controller.attack,Controller);
					end;
					if Controller and Controller.equipped and Controller.currentWeaponModel then
						if (NeedAttacking and DamageAura) then
							if Fast and tick() > AttackCD and not DisableFastAttack then
								resetCD();
							end
							if tick() - lastFireValid > 0.5 or not Fast then
								Controller.timeToNextAttack = 0;
								Controller.hitboxMagnitude = 65;
								pcal(tspawn, Controller.attack,Controller);
								lastFireValid = tick();
							end;
							local AID3 = Controller.anims.basic[3];
							local AID2 = Controller.anims.basic[2];
							local ID = AID3 or AID2;
							Animation.AnimationId = ID;
							local Playing = Controller.humanoid:LoadAnimation(Animation);
							Playing:Play(0.00075,0.01,0.01);
							RigEvent.FireServer(RigEvent,"hit",canHits,AID3 and 3 or 2,"");
							-- AttackSignal:Fire();
							delay(.5,function()
								Playing:Stop();
							end);
						end;
					end;
				end;
			end;
		end);
	end;