local code
local ac = true
local plr = game.Players.LocalPlayer
local titans = game.workspace.Titans
local remote = game.workspace.Settings.Input
local cooltitans = {"EREN", "FemaleTitan"}
local lag = {"Script", "Smoke", "BloodTexture"}
local lagParticles = plr.Character:GetDescendants()

for i, v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "Code") then
        code = v.Code
    end
end

for x, y in pairs(getgc(true)) do
    if type(y) =="table" and rawget(y, "MaybeHacker") then
        y.MaybeHacker = -math.huge
        ac = false
    end
end

if ac then
    plr:Kick("Bypass was ni gedisabled ah nigger zeg da tegen mij")
end

for i = 1, #lagParticles do
    local particle = lagParticles[i]
        
    if table.find(lag, particle.Name) then
        particle:Destroy()
    end
end

for a, b in pairs(titans:GetChildren()) do
    if b.Main.Died.Value and not table.find(cooltitans, b.Name) then return end
    
    repeat wait() until plr.Character
        
    plr.Character.HumanoidRootPart.Position = b.Nape.Position + Vector3.new(0, 100, 0)
    wait(0.2)
    remote:FireServer(code, b.Nape)
end
