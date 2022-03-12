--// Change the amount of damage you do with your blades.

local mt = getrawmetatable(game)
local nc = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "FireServer" then    
        local args = {...}
        
        if args[2] == 750 or args[2] == 600 then
            args[2] = 10000
            self:FireServer(args[1], args[2])
        end
    end
    
    return nc(self, ...)
end)

setreadonly(mt, true)

--// Change the amount of damage you do with your titan.

local mt = getrawmetatable(game)
local nc = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "FireServer" then    
        local args = {...}
        
        if args[2] == 750 or args[2] == 600 or args[2] == 500 or args[2] == 400 or args[2] == 330 or args[2] == 300 or args[2] == 220 then
            args[2] = 550
            self:FireServer(args[1], args[2], args[3], args[4])
        end
    end
    
    return nc(self, ...)
end)

setreadonly(mt, true)

--// Shift into a titan.

local chosenTitan = "Colossal Titan"

local plr = game.Players.LocalPlayer
local shiftpath = plr.Backpack.Shift.ShiftEvents
local plrchar = plr.Character
local nigga = "heckoff"
local change = plr.PlayerGui.Titan.Customize
local changeshop = plr.PlayerGui.Shop.Customize

local titansShift = {
    ["Warhammer Titan"] =  shiftpath.MakeWarhammerShift,
    ["Armored Titan"] =  shiftpath.MakeArmoredShift,
    ["Half Armored Titan"] = shiftpath.MakeArmoredShift,
    ["Attack Titan"] =  shiftpath.MakeAttackShift,
    ["Beast Titan"] =  shiftpath.MakeBeastShift,
    ["Colossal Titan"] =  shiftpath.MakeColossalShift,
    ["Half Colossal Titan"] = shiftpath.MakeHColossalShift,
    ["Cart Titan"] =  shiftpath.MakeCartShift,
    ["Armored Cart Titan"] = shiftpath.MakeACartShift,
    ["Female Titan"] =  shiftpath.MakeFemaleShift,
    ["Jaw Titan"] =  shiftpath.MakeJawShift,
    ["Founding Titan"] =  shiftpath.MakeFoundingShift,
    ["Ymir Titan"] = shiftpath.MakeYmirShift,
    ["Custom Titan"] = shiftpath.MakeCustomShift,
    ["Custom Titan 2"] = shiftpath.MakeCustomShift2,
}

local titansMake = {
    ["Warhammer Titan"] =  shiftpath.MakeWarhammerTitan,
    ["Armored Titan"] =  shiftpath.MakeArmoredTitan,
    ["Half Armored Titan"] = shiftpath.MakeHArmoredTitan,
    ["Attack Titan"] =  shiftpath.MakeAttackTitan,
    ["Beast Titan"] =  shiftpath.MakeBeastTitan,
    ["Colossal Titan"] =  shiftpath.MakeColossalTitan,
    ["Half Colossal Titan"] = shiftpath.MakeHColossalTitan,
    ["Cart Titan"] =  shiftpath.MakeCartTitan,
    ["Armored Cart Titan"] = shiftpath.MakeACartTitan,
    ["Female Titan"] =  shiftpath.MakeFemaleTitan,
    ["Jaw Titan"] =  shiftpath.MakeJawTitan,
    ["Founding Titan"] =  shiftpath.MakeFoundingTitan,
    ["Ymir Titan"] = shiftpath.MakeYmirShift,
    ["Custom Titan"] = shiftpath.MakeCustomTitan,
    ["Custom Titan 2"] = shiftpath.MakeCustomTitan2,
}

local changeTitans = {
    ["Warhammer Titan"] =  change.Ti7,
    ["Armored Titan"] =  change.Ti3,
    ["Half Armored Titan"] = change.Ti3,
    ["Attack Titan"] =  change.Ti1,
    ["Beast Titan"] =  change.Ti4,
    ["Colossal Titan"] =  change.Ti5,
    ["Half Colossal Titan"] = change.Ti5,
    ["Cart Titan"] =  change.Ti9,
    ["Armored Cart Titan"] = change.Ti9,
    ["Female Titan"] =  change.Ti2,
    ["Jaw Titan"] =  change.Ti6,
    ["Founding Titan"] =  change.Ti8,
    ["Custom Titan"] = changeshop.Ti10
}

local shiftremote = titansShift[chosenTitan]
local maketitanremote = titansMake[chosenTitan]

changeTitans[chosenTitan]:FireServer()
shiftremote:FireServer(plr, plrchar, nigga)
maketitanremote:FireServer(plr, plrchar, nigga)

--// Blind all titans.

local remote = game.workspace.RemoteServer.EyeCut
local uis = game:GetService("UserInputService")

local titans = {"Attack Titan", "Armored Titan", "Warhammer Titan", "Beast Titan", "Founding Titan", "Female Titan", "Cart Titan", "Jaw Titan", "Colossal Titan", "Mindless", "Half Titan", "Armored Cart"}

for i, v in pairs(game.workspace:GetChildren()) do
    if table.find(titans, v.Name) then
        remote:FireServer(v.Humanoid)
    end
end

--// Kill all titans.

local damage = 1200
local damagetitanremote = game:GetService("Workspace").Events.TitanDamage
local titans = {"Attack Titan", "Half Armored", "Armored Titan", "Warhammer Titan", "Beast Titan", "Founding Titan", "Female Titan", "Cart Titan", "Jaw Titan", "Colossal Titan", "Mindless", "Half Titan", "Armored Cart"}

for i, v in pairs(game.workspace:GetChildren()) do
    if table.find(titans, v.Name) then
        damagetitanremote:FireServer(v.Humanoid, damage)
    end
end

--// Kill all humans.

local damage = 99999
local damagehumanremote = game:GetService("Workspace").Events.HumanDamage
local plr = game.Players.LocalPlayer

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= plr then
        damagehumanremote:FireServer(v.Character.Humanoid, damage)
    end
end

--// Kill a specific player.

local damage = 99999
local damagehumanremote = game:GetService("Workspace").Events.HumanDamage
local plr = game.Players["playername"]

damagehumanremote:FireServer(plr.Character.Humanoid, damage)

--// Crystalize yourself.

local plr = game.Players.LocalPlayer
local plrchar = plr.Character
local nigga = "heckoff"
local crystalizeremote = plr.Backpack.Shift.ShiftEvents.Crystalize

crystalizeremote:FireServer(plr, plrchar, nigga)

--// Activate super heal.

local plrchar = game.Players.LocalPlayer.Character
local superhealremote = game.workspace.RemoteServer.ActivateSuperHeal

superhealremote:FireServer(plrchar)
