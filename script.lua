local _0x75DC = game:GetService("Players")
local _0x0962 = game:GetService("UserInputService")
local _0x95D9 = game:GetService("CoreGui")
local _0xFB91 = game:GetService("RunService")
local _0xFEFF = game:GetService("Lighting")
local _0xB08C = workspace.CurrentCamera
local _0x9BDD = _0x75DC.LocalPlayer
local _0xE8C4 = _0x9BDD:GetMouse()
local _0x3699 = game:GetService("HttpService")
local _0x809C = game:GetService("TweenService")
local _0x4BBC = game:GetService("TeleportService")
local _0x4145 = pcall(function() return _0x95D9 end) and _0x95D9 or _0x9BDD:WaitForChild("PlayerGui")
local _0xFE09 ="DaveStopTimerClone"if _0x4145:FindFirstChild(_0xFE09) then _0x4145[_0xFE09]:Destroy() end
local _0x5058 = Instance.new("ScreenGui")
_0x5058.Name = _0xFE09
_0x5058.ResetOnSpawn = false
_0x5058.Parent = _0x4145local _0x8DEE = {
Speed = false, SpeedVal = 16,
Jump = false, JumpVal = 50,
Spinbot = false, SpinSpeed = 100,
Noclip = false, Bunnyhop = false,
InfJump = false, Fly = false, FlySpeed = 50, ClickTP = false,
CamFOV = 70, FOVChanger = false,Chams = false, LineESP = false, DistanceESP = false, BoxESP = false, SkeletonESP = false,
ChamsColor = Color3.fromRGB(255, 255, 255),
BoxColor = Color3.fromRGB(255, 255, 255),
SkeletonColor = Color3.fromRGB(255, 255, 255),
DistanceColor = Color3.fromRGB(255, 255, 255),
RainbowESP = false,
ESPTeamCheck = true,Aimbot = false, WallCheck = true, AimbotTeamCheck = true, DrawFOV = false,
TargetPart ="Head", FOVRadius = 150, Smoothness = 5,
AimKey = Enum.UserInputType.MouseButton2, IsAimKeyDown = false,SakuraTexture = false, MinecraftTexture = false,
Fullbright = false, RemoveFog = false, TimeOfDay = 12,CarBoost = false,
CarBoostSpeed = 100,
CarBoostKey = Enum.KeyCode.LeftShift,
CarBoostKeyDown = false,CustomMeshID ="sukuna_ryomen_r15_ara.obj",
CustomTextureID ="",
CustomModelScale = 1,
CustomOffsetY = 0,
IsMorphActive = false,AntiFling = false,
AutoFarm = false,
FPSUnlocker = true,
Invisibility = false,MenuToggleKey = Enum.KeyCode.RightControl,
AccentColor = Color3.fromRGB(140, 82, 255),
ConfigName ="MyLegitConfig",
}
local _0x6BD3 = nil
local _0x3799 = false
local _0x2512 = nil
local _0xB8CC = 0
local _0x3251 = -20
local _0xCF9B = false
local _0xC959 = nil
local _0x02BC = nil
local _0x773D = {
Ambient = _0xFEFF.Ambient,
OutdoorAmbient = _0xFEFF.OutdoorAmbient,
Brightness = _0xFEFF.Brightness,
ClockTime = _0xFEFF.ClockTime,
FogEnd = _0xFEFF.FogEnd,
FogStart = _0xFEFF.FogStart,
GlobalShadows = _0xFEFF.GlobalShadows,
}local _0x8C5F = nil
local function _0xCF9D()
if _0x8C5F then
_0x8C5F:Stop()
_0x8C5F:Destroy()
_0x8C5F = nil
print("[Animation] Animasyon durduruldu.")
end
end
local function _0x1264(animIdRaw: string)
_0xCF9D()
if not animIdRaw or animIdRaw ==""then return end
local _0xAD01 = tostring(animIdRaw):gsub("%D","")
if _0xAD01 ==""then return end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x4D48 = _0x07FD:FindFirstChildOfClass("Humanoid")
if not _0x4D48 then return end
local _0x4771 = _0x4D48:FindFirstChildOfClass("Animator") or Instance.new("Animator", _0x4D48)
local _0x821C = Instance.new("Animation")
_0x821C.AnimationId ="rbxassetid://".. _0xAD01
local _0x02E3, _0xC0D2 = pcall(function()
return _0x4771:LoadAnimation(_0x821C)
end)
if _0x02E3 and _0xC0D2 then
_0xC0D2.Priority = Enum.AnimationPriority.Action
_0xC0D2.Looped = true
_0xC0D2:Play()
_0x8C5F = _0xC0D2
print("[Animation] Animasyon başarıyla başlatıldı! ID: ".. _0xAD01)
else
print("[Animation] Hata: Animasyon yüklenemedi!")
end
endlocal _0x0A15 = nil
local _0xD117 = nil
local _0x3B99 = nil
local function _0xDD35()
if _0x0A15 then
_0x0A15:Destroy()
_0x0A15 = nil
_0xD117 = nil
_0x3B99 = nil
end
local _0x07FD = _0x9BDD.Character
if _0x07FD then
for _, part in ipairs(_0x07FD:GetDescendants()) do
if (part:IsA("BasePart") or part:IsA("Decal")) and part.Name ~="HumanoidRootPart"then
part.Transparency = 0
end
end
end
_0x8DEE.IsMorphActive = false
print("[Morph] Karakter orijinal haline döndürüldü.")
endlocal function _0x7C7D(inputStr: string)
if not inputStr or inputStr ==""then return""end
local _0x6DD1 = string.gsub(inputStr,"^%s*(.-)%s*$","%1")
if isfile and getcustomasset then
local _0xF49E = {
_0x6DD1,"workspace/".. _0x6DD1,"workspace\\".. _0x6DD1,
_0x6DD1 ..".obj",
_0x6DD1 ..".OBJ","workspace/".. _0x6DD1 ..".obj","workspace/".. _0x6DD1 ..".OBJ","workspace\\".. _0x6DD1 ..".obj","workspace\\".. _0x6DD1 ..".OBJ"}
for _, path in ipairs(_0xF49E) do
local _0x02E3, _0x2F4D = pcall(function() return isfile(path) end)
if _0x02E3 and _0x2F4D then
local _0x1DF9, _0x32D5 = pcall(function() return getcustomasset(path) end)
if _0x1DF9 and _0x32D5 then
print("[Morph] YEREL DOSYA BAŞARIYLA BULUNDU: ".. path)
return _0x32D5
end
end
end
end
local _0xAD01 = _0x6DD1:gsub("%D","")
if _0xAD01 ~=""then
print("[Morph] Roblox Asset ID kullanılıyor: ".. _0xAD01)
return"rbxassetid://".. _0xAD01
end
print("[Morph] UYARI: '".. _0x6DD1 .."' dosyası executor workspace klasöründe bulunamadı!")
return""end
local function _0x6AD8(meshInputRaw: string, textureInputRaw: string, scale: number, offsetY: number)
local _0xC850 = _0x7C7D(meshInputRaw)
local _0x4AEE = _0x7C7D(textureInputRaw)
if _0xC850 ==""then
print("[Morph] HATA: 3D Mesh dosyası bulunamadı! Lütfen dosyanın executor 'workspace' klasöründe olduğundan emin olun.")
_0xDD35()return
end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x845C then return end
_0xDD35()for _, part in ipairs(_0x07FD:GetDescendants()) do
if (part:IsA("BasePart") or part:IsA("Decal")) and part.Name ~="HumanoidRootPart"then
part.Transparency = 1
end
endlocal _0xD9A7 = Instance.new("Part")
_0xD9A7.Name ="CustomBlenderMorph"_0xD9A7.Size = Vector3.new(2, 2, 2)
_0xD9A7.CanCollide = false
_0xD9A7.Anchored = false
_0xD9A7.Massless = true
_0xD9A7.Color = Color3.fromRGB(220, 220, 220)
_0xD9A7.Material = Enum.Material.SmoothPlastic
_0xD9A7.CFrame = _0x845C.CFrame * CFrame.new(0, offsetY or 0, 0)
local _0x230C = Instance.new("SpecialMesh")
_0x230C.MeshType = Enum.MeshType.FileMesh
_0x230C.MeshId = _0xC850
if _0x4AEE ~=""then
_0x230C.TextureId = _0x4AEE
end
_0x230C.Scale = Vector3.new(1, 1, 1) * (scale or 1)
_0x230C.Offset = Vector3.new(0, offsetY or 0, 0)
_0x230C.Parent = _0xD9A7
_0xD9A7.Parent = _0x07FDlocal _0x5BD1 = Instance.new("WeldConstraint")
_0x5BD1.Name ="MorphWeld"_0x5BD1.Part0 = _0x845C
_0x5BD1.Part1 = _0xD9A7
_0x5BD1.Parent = _0xD9A7
_0x0A15 = _0xD9A7
_0xD117 = _0x230C
_0x3B99 = _0x5BD1
_0x8DEE.IsMorphActive = true
_0x8DEE.CustomMeshID = meshInputRaw
_0x8DEE.CustomTextureID = textureInputRaw
print("[Morph] Özel 3D Model Bağlandı! 🎉 Scale: ".. tostring(scale) .." | Y-Offset: ".. tostring(offsetY))
end
local function _0xD00D(scale: number, offsetY: number)
_0x8DEE.CustomModelScale = scale
_0x8DEE.CustomOffsetY = offsetY
if _0xD117 then
_0xD117.Scale = Vector3.new(1, 1, 1) * scale
_0xD117.Offset = Vector3.new(0, offsetY, 0)
end
end
_0x9BDD.CharacterAdded:Connect(function(newChar)
_0x0A15 = nil
if _0x8DEE.IsMorphActive and _0x8DEE.CustomMeshID ~=""then
task.wait(1)
_0x6AD8(_0x8DEE.CustomMeshID, _0x8DEE.CustomTextureID, _0x8DEE.CustomModelScale, _0x8DEE.CustomOffsetY)
end
end)local function _0x7E40()
if _0xCF9B then return end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x845C then return end
_0xCF9B = true
_0xC959 = Instance.new("BodyVelocity")
_0xC959.MaxForce = Vector3.new(1, 1, 1) * 100000
_0xC959.Parent = _0x845C
_0x02BC = Instance.new("BodyGyro")
_0x02BC.MaxTorque = Vector3.new(1, 1, 1) * 100000
_0x02BC.Parent = _0x845C
end
local function _0x132D()
_0xCF9B = false
if _0xC959 then _0xC959:Destroy() end
if _0x02BC then _0x02BC:Destroy() end
end
local function _0x17B6()
if not _0xCF9B then return end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x845C or not _0xC959 then return end
local _0xB106 = Vector3.new(
(_0x0962:IsKeyDown(Enum.KeyCode.D) and 1 or (_0x0962:IsKeyDown(Enum.KeyCode.A) and -1 or 0)),
(_0x0962:IsKeyDown(Enum.KeyCode.Space) and 1 or (_0x0962:IsKeyDown(Enum.KeyCode.LeftControl) and -1 or 0)),
(_0x0962:IsKeyDown(Enum.KeyCode.S) and -1 or (_0x0962:IsKeyDown(Enum.KeyCode.W) and 1 or 0))
)
_0xC959.Velocity = (_0xB08C.CFrame.RightVector * _0xB106.X + _0xB08C.CFrame.UpVector * _0xB106.Y + _0xB08C.CFrame.LookVector * _0xB106.Z) * _0x8DEE.FlySpeed
_0x02BC.CFrame = CFrame.new(_0x845C.Position, _0x845C.Position + _0xB08C.CFrame.LookVector)
end
_0xFB91.Heartbeat:Connect(_0x17B6)
local function _0x9C95()
if not _0x8DEE.Jump then return end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0xA073 = _0x07FD:FindFirstChild("Humanoid")
if _0xA073 then _0xA073.JumpPower = _0x8DEE.JumpVal end
end
local function _0xAC1E()
if not _0x8DEE.Noclip then return end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
for _, part in pairs(_0x07FD:GetDescendants()) do
if part:IsA("BasePart") then part.CanCollide = false end
end
end
_0x0962.JumpRequest:Connect(function()
if _0x8DEE.InfJump and _0x9BDD.Character and _0x9BDD.Character:FindFirstChild("Humanoid") then
_0x9BDD.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
end)
_0xFB91.RenderStepped:Connect(function()
if _0x8DEE.Bunnyhop and _0x9BDD.Character then
local _0xA073 = _0x9BDD.Character:FindFirstChild("Humanoid")
if _0xA073 and _0x0962:IsKeyDown(Enum.KeyCode.Space) and _0xA073.FloorMaterial ~= Enum.Material.Air then
_0xA073.Jump = true
end
end
end)
_0xFB91.Stepped:Connect(function()
if _0x8DEE.Spinbot then
local _0x07FD = _0x9BDD.Character
if _0x07FD then
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if _0x845C then
_0x845C.CFrame = _0x845C.CFrame * CFrame.Angles(0, math.rad(_0x8DEE.SpinSpeed), 0)
end
end
end
end)
_0xFB91.RenderStepped:Connect(function()
if _0x8DEE.FOVChanger then
_0xB08C.FieldOfView = _0x8DEE.CamFOV
else
_0xB08C.FieldOfView = 70
end
end)local function _0x89F0()
if not _0x8DEE.CarBoost or not _0x8DEE.CarBoostKeyDown then return end
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x4D48 = _0x07FD:FindFirstChildOfClass("Humanoid")
if not _0x4D48 or not _0x4D48.SeatPart then return end
local _0x8BFA = _0x4D48.SeatPart
if _0x8BFA:IsA("VehicleSeat") or _0x8BFA:IsA("Seat") then
local _0xCCE2 = _0x8BFA.CFrame.LookVector
_0x8BFA.AssemblyLinearVelocity = _0xCCE2 * (_0x8DEE.CarBoostSpeed * 1.5)
end
end
_0xFB91.Heartbeat:Connect(_0x89F0)_0xFB91.Stepped:Connect(function()
if not _0x8DEE.AntiFling then return end
for _, plr in ipairs(_0x75DC:GetPlayers()) do
if plr ~= _0x9BDD and plr.Character then
for _, part in ipairs(plr.Character:GetChildren()) do
if part:IsA("BasePart") then
part.CanCollide = false
part.AssemblyAngularVelocity = Vector3.zero
part.AssemblyLinearVelocity = Vector3.zero
end
end
end
end
end)task.spawn(function()
while true do
task.wait(0.5)
if _0x8DEE.AutoFarm then
pcall(function()
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x845C then return end
for _, obj in ipairs(workspace:GetDescendants()) do
if not _0x8DEE.AutoFarm then break end
if obj:IsA("TouchTransmitter") and obj.Parent and obj.Parent:IsA("BasePart") then
if firetouchinterest then
firetouchinterest(_0x845C, obj.Parent, 0)
task.wait()
firetouchinterest(_0x845C, obj.Parent, 1)
else
_0x845C.CFrame = obj.Parent.CFrame
task.wait(0.1)
end
end
end
end)
end
end
end)local _0xA646 = nil
local function _0x902A(_0x062D)
local _0x07FD = _0x9BDD.Character
if not _0x07FD then return end
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x845C then return end
local _0x4244 = _0x845C:FindFirstChild("RootJoint") or _0x845C:FindFirstChildOfClass("Motor6D")
if not _0x4244 and _0x07FD:FindFirstChild("LowerTorso") then
_0x4244 = _0x07FD.LowerTorso:FindFirstChild("Root") or _0x07FD.LowerTorso:FindFirstChildOfClass("Motor6D")
end
if _0x062D then
if _0x4244 then
if not _0xA646 then
_0xA646 = _0x4244.C0
end
_0x4244.C0 = CFrame.new(0, -10000, 0)
end
for _, part in ipairs(_0x07FD:GetDescendants()) do
if part:IsA("BasePart") or part:IsA("Decal") then
if part.Name ~="HumanoidRootPart"then
part.Transparency = 0.5
end
end
end
else
if _0x4244 and _0xA646 then
_0x4244.C0 = _0xA646
_0xA646 = nil
end
for _, part in ipairs(_0x07FD:GetDescendants()) do
if part:IsA("BasePart") or part:IsA("Decal") then
if part.Name ~="HumanoidRootPart"then
part.Transparency = 0
end
end
end
end
endlocal function _0xF9B2()
if #_0x75DC:GetPlayers() <= 1 then
_0x9BDD:Kick("\nSunucuya yeniden bağlanılıyor...")
task.wait(0.5)
_0x4BBC:Teleport(game.PlaceId, _0x9BDD)
else
_0x4BBC:TeleportToPlaceInstance(game.PlaceId, game.JobId, _0x9BDD)
end
end
local function _0x1207()
local _0x27FB ="https://games.roblox.com/v1/games/".. game.PlaceId .."/servers/Public?sortOrder=Asc&limit=100"local _0x299D, _0x3762 = pcall(function()
return _0x3699:JSONDecode(game:HttpGet(_0x27FB))
end)
if _0x299D and _0x3762 and _0x3762.data then
for _, server in ipairs(_0x3762.data) do
if server.id ~= game.JobId and server.playing < server.maxPlayers then
_0x4BBC:TeleportToPlaceInstance(game.PlaceId, server.id, _0x9BDD)
return
end
end
end
print("Uygun yeni sunucu bulunamadı.")
endlocal function _0xAC54(name)
local _0xE36B = {}
for k, v in pairs(_0x8DEE) do
if typeof(v) =="Color3"then
_0xE36B[k] = {_0xB50C = v.R, _0xEF3C = v.G, _0xD6C9 = v.B, __type ="Color3"}
elseif typeof(v) =="EnumItem"then
_0xE36B[k] = {name = v.Name, enumType = tostring(v.EnumType), __type ="Enum"}
else
_0xE36B[k] = v
end
end
local _0xC2F5 = _0x3699:JSONEncode(_0xE36B)
if writefile then
if makefolder and not isfolder("MacroCheatConfigs") then makefolder("MacroCheatConfigs") end
writefile("MacroCheatConfigs/".. name ..".json", _0xC2F5)
print("Config kaydedildi: ".. name)
else
print("writefile desteklenmiyor. Config JSON:\n".. _0xC2F5)
end
end
local function _0xFB73(name)
if isfile and isfile("MacroCheatConfigs/".. name ..".json") then
local _0xC2F5 = readfile("MacroCheatConfigs/".. name ..".json")
local _0x299D, _0x6533 = pcall(function() return _0x3699:JSONDecode(_0xC2F5) end)
if _0x299D and _0x6533 then
for k, v in pairs(_0x6533) do
if type(v) =="table"and v.__type =="Color3"then
_0x8DEE[k] = Color3.new(v.r, v.g, v.b)
elseif type(v) =="table"and v.__type =="Enum"then
if Enum.KeyCode[v.name] then
_0x8DEE[k] = Enum.KeyCode[v.name]
elseif Enum.UserInputType[v.name] then
_0x8DEE[k] = Enum.UserInputType[v.name]
end
else
_0x8DEE[k] = v
end
end
print("Config yüklendi: ".. name)
end
end
endlocal _0xE29A = {
Minecraft = {
bk ="rbxassetid://8735166756",
dn ="rbxassetid://8735166707",
ft ="rbxassetid://8735231668",
lf ="rbxassetid://8735166755",
rt ="rbxassetid://8735166751",
up ="rbxassetid://8735166729"},
Sakura = {
bk ="rbxassetid://15983968922",
dn ="rbxassetid://15983966825",
ft ="rbxassetid://15983965025",
lf ="rbxassetid://15983967420",
rt ="rbxassetid://15983966246",
up ="rbxassetid://15983964246"}
}
local function _0xFB6A(preset)
local _0x0CCA = _0xFEFF:FindFirstChild("DaveSky")
if not _0x0CCA then
_0x0CCA = Instance.new("Sky", _0xFEFF)
_0x0CCA.Name ="DaveSky"end
if preset =="Minecraft"then
local _0xBB29 = _0xE29A.Minecraft
_0x0CCA.SkyboxBk = _0xBB29.bk; _0x0CCA.SkyboxDn = _0xBB29.dn; _0x0CCA.SkyboxFt = _0xBB29.ft
_0x0CCA.SkyboxLf = _0xBB29.lf; _0x0CCA.SkyboxRt = _0xBB29.rt; _0x0CCA.SkyboxUp = _0xBB29.up
elseif preset =="Sakura"then
local _0xBB29 = _0xE29A.Sakura
_0x0CCA.SkyboxBk = _0xBB29.bk; _0x0CCA.SkyboxDn = _0xBB29.dn; _0x0CCA.SkyboxFt = _0xBB29.ft
_0x0CCA.SkyboxLf = _0xBB29.lf; _0x0CCA.SkyboxRt = _0xBB29.rt; _0x0CCA.SkyboxUp = _0xBB29.up
_0xFEFF.Ambient = Color3.fromRGB(255, 200, 230)
_0xFEFF.OutdoorAmbient = Color3.fromRGB(255, 180, 210)
_0xFEFF.Brightness = 1.5
else
_0x0CCA:Destroy()
end
end
local function _0xFDA6()
if _0x8DEE.Fullbright then
_0xFEFF.Brightness = 10
_0xFEFF.Ambient = Color3.fromRGB(255, 255, 255)
_0xFEFF.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
_0xFEFF.GlobalShadows = false
else
_0xFEFF.Brightness = _0x773D.Brightness
_0xFEFF.Ambient = _0x773D.Ambient
_0xFEFF.OutdoorAmbient = _0x773D.OutdoorAmbient
_0xFEFF.GlobalShadows = _0x773D.GlobalShadows
end
_0xFEFF.ClockTime = _0x8DEE.TimeOfDay
if _0x8DEE.RemoveFog then
_0xFEFF.FogEnd = 9000000000
_0xFEFF.FogStart = 9000000000
else
_0xFEFF.FogEnd = _0x773D.FogEnd
_0xFEFF.FogStart = _0x773D.FogStart
end
if _0x8DEE.MinecraftTexture then
_0xFB6A("Minecraft")
elseif _0x8DEE.SakuraTexture then
_0xFB6A("Sakura")
else
local _0x0CCA = _0xFEFF:FindFirstChild("DaveSky")
if _0x0CCA then _0x0CCA:Destroy() end
end
end
local _0x4D93 = nil
local function _0xDAF1(on)
if on then
if not _0x4D93 then
local _0x149F = Instance.new("Part")
_0x149F.Name ="SakuraParticles"_0x149F.Size = Vector3.new(1, 1, 1)
_0x149F.Transparency = 1
_0x149F.Anchored = true
_0x149F.CanCollide = false
_0x149F.Parent = workspace
local _0xA0F1 = Instance.new("ParticleEmitter", _0x149F)
_0xA0F1.Texture ="rbxassetid://241396659"_0xA0F1.Color = ColorSequence.new(Color3.fromRGB(255, 180, 210), Color3.fromRGB(255, 220, 240))
_0xA0F1.Size = NumberSequence.new(0.3, 0.8)
_0xA0F1.Transparency = NumberSequence.new(0.2, 1)
_0xA0F1.Lifetime = NumberRange.new(4, 8)
_0xA0F1.Speed = NumberRange.new(1, 3)
_0xA0F1.Rate = 50
_0xA0F1.SpreadAngle = Vector2.new(360, 360)
_0xA0F1.Rotation = NumberRange.new(0, 360)
_0xA0F1.RotSpeed = NumberRange.new(-20, 20)
_0xA0F1.Acceleration = Vector3.new(0, -2, 0)
_0x4D93 = _0x149F
end
_0x4D93.Parent = workspace.CurrentCamera
else
if _0x4D93 then _0x4D93:Destroy(); _0x4D93 = nil end
end
endlocal function _0xF7C4(parentCol, title, height)
local _0xC806 = Instance.new("Frame")
_0xC806.Size = UDim2.new(1, 0, 0, height)
_0xC806.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
_0xC806.BorderSizePixel = 1
_0xC806.BorderColor3 = Color3.fromRGB(45, 45, 45)
_0xC806.Parent = parentCol
Instance.new("UICorner", _0xC806).CornerRadius = UDim.new(0, 4)
local _0xA84F = Instance.new("TextLabel")
_0xA84F.Size = UDim2.new(1, -20, 0, 35)
_0xA84F.Position = UDim2.new(0, 10, 0, 0)
_0xA84F.BackgroundTransparency = 1
_0xA84F.Text = title
_0xA84F.TextColor3 = Color3.fromRGB(240, 240, 240)
_0xA84F.Font = Enum.Font.RobotoMono
_0xA84F.TextSize = 14
_0xA84F.TextXAlignment = Enum.TextXAlignment.Left
_0xA84F.Parent = _0xC806
local _0xE162 = Instance.new("Frame")
_0xE162.Size = UDim2.new(1, 0, 0, 1)
_0xE162.Position = UDim2.new(0, 0, 0, 35)
_0xE162.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_0xE162.BorderSizePixel = 0
_0xE162.Parent = _0xC806
local _0xD717 = Instance.new("ScrollingFrame")
_0xD717.Size = UDim2.new(1, -10, 1, -45)
_0xD717.Position = UDim2.new(0, 5, 0, 45)
_0xD717.BackgroundTransparency = 1
_0xD717.ScrollBarThickness = 2
_0xD717.CanvasSize = UDim2.new(0, 0, 0, 0)
_0xD717.AutomaticCanvasSize = Enum.AutomaticSize.Y
_0xD717.Parent = _0xC806
local _0xD512 = Instance.new("UIListLayout")
_0xD512.Padding = UDim.new(0, 10)
_0xD512.Parent = _0xD717
return _0xD717
end
local function _0x591B(parentCol, title)
local _0xC806 = Instance.new("Frame")
_0xC806.Size = UDim2.new(1, 0, 0, 0)
_0xC806.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
_0xC806.BorderSizePixel = 1
_0xC806.BorderColor3 = Color3.fromRGB(45, 45, 45)
_0xC806.Parent = parentCol
Instance.new("UICorner", _0xC806).CornerRadius = UDim.new(0, 4)
local _0xA84F = Instance.new("TextLabel")
_0xA84F.Size = UDim2.new(1, -20, 0, 35)
_0xA84F.Position = UDim2.new(0, 10, 0, 0)
_0xA84F.BackgroundTransparency = 1
_0xA84F.Text = title
_0xA84F.TextColor3 = Color3.fromRGB(240, 240, 240)
_0xA84F.Font = Enum.Font.RobotoMono
_0xA84F.TextSize = 14
_0xA84F.TextXAlignment = Enum.TextXAlignment.Left
_0xA84F.Parent = _0xC806
local _0xE162 = Instance.new("Frame")
_0xE162.Size = UDim2.new(1, 0, 0, 1)
_0xE162.Position = UDim2.new(0, 0, 0, 35)
_0xE162.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_0xE162.BorderSizePixel = 0
_0xE162.Parent = _0xC806
local _0xD717 = Instance.new("Frame")
_0xD717.Size = UDim2.new(1, -10, 0, 0)
_0xD717.Position = UDim2.new(0, 5, 0, 45)
_0xD717.BackgroundTransparency = 1
_0xD717.Parent = _0xC806
local _0xD512 = Instance.new("UIListLayout")
_0xD512.Padding = UDim.new(0, 10)
_0xD512.Parent = _0xD717
_0xD512.FillDirection = Enum.FillDirection.Vertical
_0xD512.SortOrder = Enum.SortOrder.LayoutOrder
local function _0x261D()
local _0xAB56 = 45
for _, child in ipairs(_0xD717:GetChildren()) do
if child:IsA("Frame") then
_0xAB56 = _0xAB56 + child.Size.Y.Offset + 10
end
end
_0xC806.Size = UDim2.new(1, 0, 0, _0xAB56 + 10)
end
local _0x29AF = false
local function _0x983A()
if _0x29AF then return end
_0x29AF = true
task.wait(0.05)
_0x261D()
_0x29AF = false
end
_0xD512:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_0x983A)
_0xD717.ChildAdded:Connect(_0x983A)
_0xD717.ChildRemoved:Connect(_0x983A)
return _0xD717
end
local function _0x64FA(parent, text, default, callback)
local _0xDA0E = Instance.new("Frame")
_0xDA0E.Size = UDim2.new(1, 0, 0, 25)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.Parent = parent
local _0x9855 = Instance.new("TextLabel")
_0x9855.Size = UDim2.new(0.8, 0, 1, 0)
_0x9855.BackgroundTransparency = 1
_0x9855.Text = text
_0x9855.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x9855.Font = Enum.Font.RobotoMono
_0x9855.TextSize = 13
_0x9855.TextXAlignment = Enum.TextXAlignment.Left
_0x9855.Parent = _0xDA0E
local _0xE791 = Instance.new("TextButton")
_0xE791.Size = UDim2.new(0, 36, 0, 18)
_0xE791.Position = UDim2.new(1, -36, 0.5, -9)
_0xE791.BackgroundColor3 = default and _0x8DEE.AccentColor or Color3.fromRGB(40, 40, 40)
_0xE791.Text =""_0xE791.Parent = _0xDA0E
Instance.new("UICorner", _0xE791).CornerRadius = UDim.new(1, 0)
local _0xA36A = Instance.new("Frame")
_0xA36A.Size = UDim2.new(0, 14, 0, 14)
_0xA36A.Position = default and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
_0xA36A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0xA36A.Parent = _0xE791
Instance.new("UICorner", _0xA36A).CornerRadius = UDim.new(1, 0)
local _0x062D = default
_0xE791.MouseButton1Click:Connect(function()
_0x062D = not _0x062D
_0xE791.BackgroundColor3 = _0x062D and _0x8DEE.AccentColor or Color3.fromRGB(40, 40, 40)
_0xA36A.Position = _0x062D and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
pcall(callback, _0x062D)
end)
return _0xDA0E
end
local function _0xD6B1(parent, text, min, max, default, symbol, callback)
local _0xDA0E = Instance.new("Frame")
_0xDA0E.Size = UDim2.new(1, 0, 0, 35)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.Parent = parent
local _0x9855 = Instance.new("TextLabel")
_0x9855.Size = UDim2.new(1, 0, 0, 15)
_0x9855.BackgroundTransparency = 1
_0x9855.Text = text
_0x9855.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x9855.Font = Enum.Font.RobotoMono
_0x9855.TextSize = 13
_0x9855.TextXAlignment = Enum.TextXAlignment.Left
_0x9855.Parent = _0xDA0E
local _0xBA86 = Instance.new("TextButton")
_0xBA86.Size = UDim2.new(1, -10, 0, 14)
_0xBA86.Position = UDim2.new(0, 0, 0, 20)
_0xBA86.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_0xBA86.BorderSizePixel = 1
_0xBA86.BorderColor3 = Color3.fromRGB(50, 50, 50)
_0xBA86.Text =""_0xBA86.Parent = _0xDA0E
local _0x7777 = Instance.new("Frame")
local _0xFCC9 = (default - min) / (max - min)
_0x7777.Size = UDim2.new(_0xFCC9, 0, 1, 0)
_0x7777.BackgroundColor3 = _0x8DEE.AccentColor
_0x7777.BorderSizePixel = 0
_0x7777.Parent = _0xBA86
local _0xB66F = Instance.new("TextLabel")
_0xB66F.Size = UDim2.new(1, 0, 1, 0)
_0xB66F.BackgroundTransparency = 1
_0xB66F.Text = tostring(default) .. symbol
_0xB66F.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xB66F.Font = Enum.Font.RobotoMono
_0xB66F.TextSize = 12
_0xB66F.ZIndex = 2
_0xB66F.Parent = _0xBA86
local _0xACAB = false
local function _0x0CBA(input)
local _0x1E87 = math.clamp((input.Position.X - _0xBA86.AbsolutePosition.X) / _0xBA86.AbsoluteSize.X, 0, 1)
_0x7777.Size = UDim2.new(_0x1E87, 0, 1, 0)
local _0x2947 = math.floor(min + ((max - min) * _0x1E87))
_0xB66F.Text = tostring(_0x2947) .. symbol
pcall(callback, _0x2947)
end
_0xBA86.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then _0xACAB = true; _0x0CBA(input) end
end)
_0x0962.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then _0xACAB = false end
end)
_0x0962.InputChanged:Connect(function(input)
if _0xACAB and input.UserInputType == Enum.UserInputType.MouseMovement then _0x0CBA(input) end
end)
return _0xDA0E
end
local function _0xDFB4(parent, text, default, callback)
local _0xDA0E = Instance.new("Frame")
_0xDA0E.Size = UDim2.new(1, 0, 0, 45)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.Parent = parent
local _0x9855 = Instance.new("TextLabel")
_0x9855.Size = UDim2.new(1, 0, 0, 15)
_0x9855.BackgroundTransparency = 1
_0x9855.Text = text
_0x9855.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x9855.Font = Enum.Font.RobotoMono
_0x9855.TextSize = 13
_0x9855.TextXAlignment = Enum.TextXAlignment.Left
_0x9855.Parent = _0xDA0E
local _0xCD0C = Instance.new("TextBox")
_0xCD0C.Size = UDim2.new(1, -10, 0, 22)
_0xCD0C.Position = UDim2.new(0, 0, 0, 20)
_0xCD0C.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_0xCD0C.BorderSizePixel = 1
_0xCD0C.BorderColor3 = Color3.fromRGB(50, 50, 50)
_0xCD0C.Text = tostring(default)
_0xCD0C.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xCD0C.Font = Enum.Font.RobotoMono
_0xCD0C.TextSize = 13
_0xCD0C.TextXAlignment = Enum.TextXAlignment.Left
_0xCD0C.ClearTextOnFocus = false
_0xCD0C.Parent = _0xDA0E
if callback then
_0xCD0C.FocusLost:Connect(function(enterPressed)
pcall(callback, _0xCD0C.Text, enterPressed)
end)
end
return _0xDA0E, _0xCD0C
end
local function _0x072A(parent, text, callback)
local _0xE791 = Instance.new("TextButton")
_0xE791.Size = UDim2.new(1, -10, 0, 25)
_0xE791.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_0xE791.BorderSizePixel = 1
_0xE791.BorderColor3 = Color3.fromRGB(50, 50, 50)
_0xE791.Text = text
_0xE791.TextColor3 = Color3.fromRGB(180, 180, 180)
_0xE791.Font = Enum.Font.RobotoMono
_0xE791.TextSize = 13
_0xE791.Parent = parent
_0xE791.MouseButton1Click:Connect(callback)
return _0xE791
end
local function _0x2ABF(parent, text, defaultVal, callback)
local _0xDA0E = Instance.new("Frame")
_0xDA0E.Size = UDim2.new(1, 0, 0, 30)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.Parent = parent
local _0x9855 = Instance.new("TextLabel")
_0x9855.Size = UDim2.new(0.6, 0, 1, 0)
_0x9855.BackgroundTransparency = 1
_0x9855.Text = text
_0x9855.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x9855.Font = Enum.Font.RobotoMono
_0x9855.TextSize = 13
_0x9855.TextXAlignment = Enum.TextXAlignment.Left
_0x9855.Parent = _0xDA0E
local _0xF893 = Instance.new("TextButton")
_0xF893.Size = UDim2.new(0.4, -10, 0, 20)
_0xF893.Position = UDim2.new(0.6, 0, 0.5, -10)
_0xF893.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_0xF893.BorderSizePixel = 1
_0xF893.BorderColor3 = Color3.fromRGB(60, 60, 60)
local function _0x40CE(key)
if key.UserInputType == Enum.UserInputType.Keyboard then return key.KeyCode.Name
else return key.UserInputType.Name end
end
local _0x3A49 = defaultVal
_0xF893.Text = _0x3A49.Name
_0xF893.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xF893.Font = Enum.Font.RobotoMono
_0xF893.TextSize = 12
_0xF893.Parent = _0xDA0E
local _0x6C61 = false
local _0xCAAE
_0xF893.MouseButton1Click:Connect(function()
if _0x6C61 then return end
_0x6C61 = true
_0xF893.Text ="Tuşa bas..."_0xF893.TextColor3 = _0x8DEE.AccentColor
_0xCAAE = _0x0962.InputBegan:Connect(function(input, gpe)
if gpe and input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.MouseButton2 then return end
if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType.Name:find("MouseButton") then
_0x3A49 = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType
_0xF893.Text = _0x40CE(input)
_0xF893.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x6C61 = false
_0xCAAE:Disconnect()
pcall(callback, _0x3A49)
end
end)
end)
return _0xDA0E
end
local function _0x3EBD(parent, text, options, callback)
local _0xDA0E = Instance.new("Frame")
_0xDA0E.Size = UDim2.new(1, 0, 0, 50)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.Parent = parent
local _0x9855 = Instance.new("TextLabel")
_0x9855.Size = UDim2.new(1, 0, 0, 15)
_0x9855.BackgroundTransparency = 1
_0x9855.Text = text
_0x9855.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x9855.Font = Enum.Font.RobotoMono
_0x9855.TextSize = 13
_0x9855.TextXAlignment = Enum.TextXAlignment.Left
_0x9855.Parent = _0xDA0E
local _0x95A5 = Instance.new("TextButton")
_0x95A5.Size = UDim2.new(1, -10, 0, 25)
_0x95A5.Position = UDim2.new(0, 0, 0, 20)
_0x95A5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_0x95A5.BorderSizePixel = 1
_0x95A5.BorderColor3 = Color3.fromRGB(50, 50, 50)
_0x95A5.Text ="  ".. options[1] .." ▼"_0x95A5.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x95A5.Font = Enum.Font.RobotoMono
_0x95A5.TextSize = 13
_0x95A5.TextXAlignment = Enum.TextXAlignment.Left
_0x95A5.Parent = _0xDA0E
local _0x4BBE = Instance.new("Frame")
_0x4BBE.Size = UDim2.new(1, 0, 0, #options * 25)
_0x4BBE.Position = UDim2.new(0, 0, 0, 25)
_0x4BBE.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_0x4BBE.BorderSizePixel = 1
_0x4BBE.BorderColor3 = Color3.fromRGB(60, 60, 60)
_0x4BBE.Visible = false
_0x4BBE.ZIndex = 10
_0x4BBE.Parent = _0x95A5
local _0x16AC = Instance.new("UIListLayout")
_0x16AC.Parent = _0x4BBE
local _0xF2E7 = false
_0x95A5.MouseButton1Click:Connect(function()
_0xF2E7 = not _0xF2E7
_0x4BBE.Visible = _0xF2E7
_0xDA0E.Size = _0xF2E7 and UDim2.new(1, 0, 0, 50 + (#options * 25)) or UDim2.new(1, 0, 0, 50)
end)
for _, opt in ipairs(options) do
local _0xE9A5 = Instance.new("TextButton")
_0xE9A5.Size = UDim2.new(1, 0, 0, 25)
_0xE9A5.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0xE9A5.BorderSizePixel = 0
_0xE9A5.Text ="  ".. opt
_0xE9A5.TextColor3 = Color3.fromRGB(200, 200, 200)
_0xE9A5.Font = Enum.Font.RobotoMono
_0xE9A5.TextSize = 13
_0xE9A5.TextXAlignment = Enum.TextXAlignment.Left
_0xE9A5.ZIndex = 11
_0xE9A5.Parent = _0x4BBE
_0xE9A5.MouseButton1Click:Connect(function()
_0x95A5.Text ="  ".. opt .." ▼"_0xF2E7 = false
_0x4BBE.Visible = false
_0xDA0E.Size = UDim2.new(1, 0, 0, 50)
pcall(callback, opt)
end)
end
return _0xDA0E
end
local function _0x13BC(parent, text, callback)
local _0xDA0E = Instance.new("Frame")
_0xDA0E.Size = UDim2.new(1, 0, 0, 35)
_0xDA0E.BackgroundTransparency = 1
_0xDA0E.Parent = parent
local _0x9855 = Instance.new("TextLabel")
_0x9855.Size = UDim2.new(1, 0, 0, 15)
_0x9855.BackgroundTransparency = 1
_0x9855.Text = text
_0x9855.TextColor3 = Color3.fromRGB(220, 220, 220)
_0x9855.Font = Enum.Font.RobotoMono
_0x9855.TextSize = 13
_0x9855.TextXAlignment = Enum.TextXAlignment.Left
_0x9855.Parent = _0xDA0E
local _0xD90E = Instance.new("TextButton")
_0xD90E.Size = UDim2.new(1, -10, 0, 15)
_0xD90E.Position = UDim2.new(0, 0, 0, 20)
_0xD90E.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0xD90E.BorderSizePixel = 1
_0xD90E.BorderColor3 = Color3.fromRGB(50, 50, 50)
_0xD90E.Text ="Renk Seç"_0xD90E.TextColor3 = Color3.fromRGB(0, 0, 0)
_0xD90E.Font = Enum.Font.RobotoMono
_0xD90E.TextSize = 11
_0xD90E.Parent = _0xDA0E
local _0xC48F = Instance.new("Frame")
_0xC48F.Size = UDim2.new(1, 0, 0, 105)
_0xC48F.Position = UDim2.new(0, 0, 0, 40)
_0xC48F.BackgroundTransparency = 1
_0xC48F.Visible = false
_0xC48F.Parent = _0xDA0E
local _0xB50C, _0xEF3C, _0xD6C9 = 255, 255, 255
local function _0xD200()
_0xD90E.BackgroundColor3 = Color3.fromRGB(_0xB50C, _0xEF3C, _0xD6C9)
pcall(callback, Color3.fromRGB(_0xB50C, _0xEF3C, _0xD6C9))
end
local function _0x63DD(yPos, colorName, barColor, updateVarCallback)
local _0x96F1 = Instance.new("Frame", _0xC48F)
_0x96F1.Size = UDim2.new(1, 0, 0, 30)
_0x96F1.Position = UDim2.new(0, 0, 0, yPos)
_0x96F1.BackgroundTransparency = 1
local _0x6861 = Instance.new("TextLabel", _0x96F1)
_0x6861.Size = UDim2.new(0, 15, 1, 0)
_0x6861.BackgroundTransparency = 1
_0x6861.Text = colorName
_0x6861.TextColor3 = Color3.fromRGB(180, 180, 180)
_0x6861.Font = Enum.Font.RobotoMono
_0x6861.TextSize = 12
local _0xBA86 = Instance.new("TextButton", _0x96F1)
_0xBA86.Size = UDim2.new(1, -35, 0, 10)
_0xBA86.Position = UDim2.new(0, 25, 0.5, -5)
_0xBA86.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_0xBA86.Text =""local _0x7777 = Instance.new("Frame", _0xBA86)
_0x7777.Size = UDim2.new(1, 0, 1, 0)
_0x7777.BackgroundColor3 = barColor
_0x7777.BorderSizePixel = 0
local _0xACAB = false
_0xBA86.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then _0xACAB = true end end)
_0x0962.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then _0xACAB = false end end)
_0x0962.InputChanged:Connect(function(input)
if _0xACAB and input.UserInputType == Enum.UserInputType.MouseMovement then
local _0x1E87 = math.clamp((input.Position.X - _0xBA86.AbsolutePosition.X) / _0xBA86.AbsoluteSize.X, 0, 1)
_0x7777.Size = UDim2.new(_0x1E87, 0, 1, 0)
updateVarCallback(math.floor(_0x1E87 * 255))
end
end)
end
_0x63DD(0,"R", Color3.fromRGB(255, 50, 50), function(_0x2947) _0xB50C = _0x2947; _0xD200() end)
_0x63DD(35,"G", Color3.fromRGB(50, 255, 50), function(_0x2947) _0xEF3C = _0x2947; _0xD200() end)
_0x63DD(70,"B", Color3.fromRGB(50, 50, 255), function(_0x2947) _0xD6C9 = _0x2947; _0xD200() end)
local _0xF2E7 = false
_0xD90E.MouseButton1Click:Connect(function()
_0xF2E7 = not _0xF2E7
_0xC48F.Visible = _0xF2E7
_0xDA0E.Size = _0xF2E7 and UDim2.new(1, 0, 0, 150) or UDim2.new(1, 0, 0, 35)
end)
return _0xDA0E
end
local function _0xE9A0(parent)
local _0xDA0E = Instance.new("Frame", parent)
_0xDA0E.Size = UDim2.new(1, -10, 0, 100)
_0xDA0E.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_0xDA0E.BorderSizePixel = 1
_0xDA0E.BorderColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", _0xDA0E).CornerRadius = UDim.new(0, 6)
local _0x00D3 = Instance.new("ImageLabel", _0xDA0E)
_0x00D3.Size = UDim2.new(0, 80, 0, 80)
_0x00D3.Position = UDim2.new(0, 10, 0, 10)
_0x00D3.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_0x00D3.Image ="rbxasset://textures/ui/GuiImagePlaceholder.png"Instance.new("UICorner", _0x00D3).CornerRadius = UDim.new(0, 8)
local _0xC31D = Instance.new("Frame", _0xDA0E)
_0xC31D.Size = UDim2.new(1, -100, 1, -20)
_0xC31D.Position = UDim2.new(0, 100, 0, 10)
_0xC31D.BackgroundTransparency = 1
local _0x16AC = Instance.new("UIListLayout", _0xC31D)
_0x16AC.Padding = UDim.new(0, 5)
local _0xD7DE = Instance.new("TextLabel", _0xC31D)
_0xD7DE.Size = UDim2.new(1, 0, 0, 15)
_0xD7DE.BackgroundTransparency = 1
_0xD7DE.Text ="Hedef: Yok"_0xD7DE.TextColor3 = Color3.new(1,1,1)
_0xD7DE.Font = Enum.Font.RobotoMono
_0xD7DE.TextSize = 13
_0xD7DE.TextXAlignment = Enum.TextXAlignment.Left
local _0xE040 = Instance.new("TextLabel", _0xC31D)
_0xE040.Size = UDim2.new(1, 0, 0, 15)
_0xE040.BackgroundTransparency = 1
_0xE040.Text ="ID: -"_0xE040.TextColor3 = Color3.fromRGB(180,180,180)
_0xE040.Font = Enum.Font.RobotoMono
_0xE040.TextSize = 12
_0xE040.TextXAlignment = Enum.TextXAlignment.Left
return _0xDA0E, _0xD7DE, _0x00D3, _0xE040
endlocal _0x393B = Instance.new("Frame")
_0x393B.Size = UDim2.new(0, 800, 0, 600)
_0x393B.Position = UDim2.new(0.5, -400, 0.5, -300)
_0x393B.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
_0x393B.BorderSizePixel = 1
_0x393B.BorderColor3 = Color3.fromRGB(35, 35, 35)
_0x393B.Active = true
_0x393B.Parent = _0x5058
_0x393B.Visible = true
Instance.new("UICorner", _0x393B).CornerRadius = UDim.new(0, 6)
local _0x278A = Instance.new("Frame")
_0x278A.Size = UDim2.new(0, 220, 1, -25)
_0x278A.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_0x278A.BorderSizePixel = 0
_0x278A.Parent = _0x393B
Instance.new("UICorner", _0x278A).CornerRadius = UDim.new(0, 6)
local _0x7D99 = Instance.new("Frame")
_0x7D99.Size = UDim2.new(1, -221, 0, 60)
_0x7D99.Position = UDim2.new(0, 221, 0, 0)
_0x7D99.BackgroundTransparency = 1
_0x7D99.Parent = _0x393B_0x0962.InputBegan:Connect(function(input, processed)
if not processed then
if input.KeyCode == _0x8DEE.MenuToggleKey or input.UserInputType == _0x8DEE.MenuToggleKey then
_0x393B.Visible = not _0x393B.Visible
end
end
end)local _0x2F3C, _0x1A6A, _0x3E4A, _0x6860
local function _0x160D(dragFrame)
dragFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_0x2F3C = true; _0x3E4A = input.Position; _0x6860 = _0x393B.Position
input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then _0x2F3C = false end end)
end
end)
dragFrame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement then _0x1A6A = input end
end)
end
_0x160D(_0x7D99)
_0x160D(_0x278A)
_0x0962.InputChanged:Connect(function(input)
if input == _0x1A6A and _0x2F3C then
local _0xC327 = input.Position - _0x3E4A
_0x393B.Position = UDim2.new(_0x6860.X.Scale, _0x6860.X.Offset + _0xC327.X, _0x6860.Y.Scale, _0x6860.Y.Offset + _0xC327.Y)
end
end)
local _0xF7E2 = Instance.new("Frame")
_0xF7E2.Size = UDim2.new(0, 1, 1, 0)
_0xF7E2.Position = UDim2.new(1, 0, 0, 0)
_0xF7E2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0xF7E2.BorderSizePixel = 0
_0xF7E2.Parent = _0x278A
local _0xA8AD = Instance.new("TextLabel")
_0xA8AD.Size = UDim2.new(1, 0, 0, 60)
_0xA8AD.BackgroundTransparency = 1
_0xA8AD.Text ="Macro Cheat"_0xA8AD.TextColor3 = Color3.fromRGB(240, 240, 240)
_0xA8AD.Font = Enum.Font.RobotoMono
_0xA8AD.TextSize = 20
_0xA8AD.Parent = _0x278A
local _0xDB03 = Instance.new("Frame")
_0xDB03.Size = UDim2.new(1, 0, 0, 1)
_0xDB03.Position = UDim2.new(0, 0, 0, 1)
_0xDB03.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0xDB03.BorderSizePixel = 0
_0xDB03.Parent = _0xA8AD
local _0xAFC4 = Instance.new("Frame")
_0xAFC4.Size = UDim2.new(1, 0, 0, 1)
_0xAFC4.Position = UDim2.new(0, 0, 1, 0)
_0xAFC4.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0xAFC4.BorderSizePixel = 0
_0xAFC4.Parent = _0x7D99
local _0xD6FA = Instance.new("TextBox")
_0xD6FA.Size = UDim2.new(1, -60, 0, 30)
_0xD6FA.Position = UDim2.new(0, 20, 0.5, -15)
_0xD6FA.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_0xD6FA.BorderSizePixel = 1
_0xD6FA.BorderColor3 = Color3.fromRGB(40, 40, 40)
_0xD6FA.Text ="  Arama yap..."_0xD6FA.TextColor3 = Color3.fromRGB(120, 120, 120)
_0xD6FA.Font = Enum.Font.Gotham
_0xD6FA.TextSize = 13
_0xD6FA.TextXAlignment = Enum.TextXAlignment.Left
_0xD6FA.ClearTextOnFocus = false
_0xD6FA.Parent = _0x7D99
Instance.new("UICorner", _0xD6FA).CornerRadius = UDim.new(0, 4)
local _0x3713 = Instance.new("Frame")
_0x3713.Size = UDim2.new(1, 0, 0, 25)
_0x3713.Position = UDim2.new(0, 0, 1, -25)
_0x3713.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
_0x3713.BorderSizePixel = 0
_0x3713.Parent = _0x393B
Instance.new("UICorner", _0x3713).CornerRadius = UDim.new(0, 6)
local _0x5F1B = Instance.new("Frame")
_0x5F1B.Size = UDim2.new(1, 0, 0, 1)
_0x5F1B.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0x5F1B.BorderSizePixel = 0
_0x5F1B.Parent = _0x3713
local _0x8F88 = Instance.new("TextLabel")
_0x8F88.Size = UDim2.new(1, 0, 1, 0)
_0x8F88.BackgroundTransparency = 1
_0x8F88.Text ="Best keyless undetected cheat <3"_0x8F88.TextColor3 = Color3.fromRGB(120, 120, 120)
_0x8F88.Font = Enum.Font.RobotoMono
_0x8F88.TextSize = 12
_0x8F88.Parent = _0x3713
local _0x6AF3 = Instance.new("Frame")
_0x6AF3.Size = UDim2.new(1, -221, 1, -86)
_0x6AF3.Position = UDim2.new(0, 221, 0, 61)
_0x6AF3.BackgroundTransparency = 1
_0x6AF3.Parent = _0x393Blocal _0xB27C = {}
local function _0x3FB8(name)
local _0x02A2 = Instance.new("Frame")
_0x02A2.Size = UDim2.new(1, 0, 1, 0)
_0x02A2.BackgroundTransparency = 1
_0x02A2.Visible = false
_0x02A2.Parent = _0x6AF3
_0xB27C[name] = _0x02A2
local _0x750B = Instance.new("Frame")
_0x750B.Size = UDim2.new(0.5, -20, 1, -20)
_0x750B.Position = UDim2.new(0, 15, 0, 15)
_0x750B.BackgroundTransparency = 1
_0x750B.Parent = _0x02A2
Instance.new("UIListLayout", _0x750B).Padding = UDim.new(0, 15)
local _0xA108 = Instance.new("Frame")
_0xA108.Size = UDim2.new(0.5, -20, 1, -20)
_0xA108.Position = UDim2.new(0.5, 5, 0, 15)
_0xA108.BackgroundTransparency = 1
_0xA108.Parent = _0x02A2
Instance.new("UIListLayout", _0xA108).Padding = UDim.new(0, 15)
return _0x750B, _0xA108
end
local function _0xE03C(name, yPos)
local _0xACF1 = Instance.new("TextButton")
_0xACF1.Size = UDim2.new(1, 0, 0, 35)
_0xACF1.Position = UDim2.new(0, 0, 0, yPos)
_0xACF1.BackgroundTransparency = 1
_0xACF1.Text ="    ".. name
_0xACF1.TextColor3 = Color3.fromRGB(150, 150, 150)
_0xACF1.Font = Enum.Font.GothamMedium
_0xACF1.TextSize = 13
_0xACF1.TextXAlignment = Enum.TextXAlignment.Left
_0xACF1.Parent = _0x278A
_0xACF1.MouseButton1Click:Connect(function()
for pageName, pageFrame in pairs(_0xB27C) do
pageFrame.Visible = false
end
_0xB27C[name].Visible = true
for _, btn in pairs(_0x278A:GetChildren()) do
if btn:IsA("TextButton") then
btn.TextColor3 = Color3.fromRGB(150, 150, 150)
end
end
_0xACF1.TextColor3 = Color3.fromRGB(255, 255, 255)
end)
endlocal _0x90B9, _0x2607 = _0x3FB8("Player")
_0xE03C("Player", 65)
_0xB27C["Player"].Visible = true
local _0xE81F = _0x591B(_0x90B9,"Player Features")
_0x64FA(_0xE81F,"Speed", false, function(v) _0x8DEE.Speed = v end)
_0x64FA(_0xE81F,"Jump Power", false, function(v) _0x8DEE.Jump = v; _0x9C95() end)
_0x64FA(_0xE81F,"Spinbot", false, function(v) _0x8DEE.Spinbot = v end)
_0x64FA(_0xE81F,"Noclip", false, function(v) _0x8DEE.Noclip = v; _0xAC1E() end)
_0x64FA(_0xE81F,"Bunnyhop", false, function(v) _0x8DEE.Bunnyhop = v end)
_0x64FA(_0xE81F,"Infinite Jump", false, function(v) _0x8DEE.InfJump = v end)
_0x64FA(_0xE81F,"Fly", false, function(v) _0x8DEE.Fly = v; if v then _0x7E40() else _0x132D() end end)
_0x64FA(_0xE81F,"Click TP (Ctrl + Click)", false, function(v) _0x8DEE.ClickTP = v end)
_0x64FA(_0xE81F,"FOV Changer", false, function(v) _0x8DEE.FOVChanger = v end)
local _0x78FC = _0x591B(_0x2607,"Adjustments")
_0xD6B1(_0x78FC,"Speed Value", 16, 500, 16," spd", function(v) _0x8DEE.SpeedVal = v end)
_0xD6B1(_0x78FC,"Jump Height", 50, 500, 50," jmp", function(v) _0x8DEE.JumpVal = v; _0x9C95() end)
_0xD6B1(_0x78FC,"Spin Speed", 0, 100, 10," deg", function(v) _0x8DEE.SpinSpeed = v end)
_0xD6B1(_0x78FC,"Fly Speed", 1, 150, 50," spd", function(v) _0x8DEE.FlySpeed = v end)
_0xD6B1(_0x78FC,"Camera FOV", 10, 120, 70," deg", function(v) _0x8DEE.CamFOV = v end)
_0x072A(_0x78FC,"Reset All Settings", function()
_0x8DEE.Speed = false; _0x8DEE.SpeedVal = 16
_0x8DEE.Jump = false; _0x8DEE.JumpVal = 50
_0x8DEE.Spinbot = false; _0x8DEE.SpinSpeed = 100
_0x8DEE.Noclip = false; _0x8DEE.Fly = false
_0x132D()
_0xDD35()
print("Tüm ayarlar sıfırlandı.")
end)local _0x5BB4, _0x6428 = _0x3FB8("Visuals")
_0xE03C("Visuals", 100)
local _0xDEE6 = _0xF7C4(_0x5BB4,"ESP Settings", 280)
_0x64FA(_0xDEE6,"Chams", false, function(v) _0x8DEE.Chams = v end)
_0x64FA(_0xDEE6,"Line ESP", false, function(v) _0x8DEE.LineESP = v end)
_0x64FA(_0xDEE6,"Distance", false, function(v) _0x8DEE.DistanceESP = v end)
_0x64FA(_0xDEE6,"Box ESP", false, function(v) _0x8DEE.BoxESP = v end)
_0x64FA(_0xDEE6,"Skeleton", false, function(v) _0x8DEE.SkeletonESP = v end)
_0x64FA(_0xDEE6,"Team Check (ESP)", _0x8DEE.ESPTeamCheck, function(v) _0x8DEE.ESPTeamCheck = v end)
local _0x8459 = _0xF7C4(_0x6428,"Visuals Colors", 480)
_0x13BC(_0x8459,"Chams Color", function(color) _0x8DEE.ChamsColor = color end)
_0x13BC(_0x8459,"Box Color", function(color) _0x8DEE.BoxColor = color end)
_0x13BC(_0x8459,"Skeleton Color", function(color) _0x8DEE.SkeletonColor = color end)
_0x13BC(_0x8459,"Distance Color", function(color) _0x8DEE.DistanceColor = color end)
_0x64FA(_0x8459,"Rainbow ESP", false, function(v) _0x8DEE.RainbowESP = v end)local _0xDA62, _0xAF26 = _0x3FB8("Aimbot")
_0xE03C("Aimbot", 135)
local _0x856C = _0xF7C4(_0xDA62,"Combat Features", 250)
_0x64FA(_0x856C,"Aimbot", false, function(v) _0x8DEE.Aimbot = v end)
_0x64FA(_0x856C,"Wall Check", true, function(v) _0x8DEE.WallCheck = v end)
_0x64FA(_0x856C,"Team Check (Aimbot)", _0x8DEE.AimbotTeamCheck, function(v) _0x8DEE.AimbotTeamCheck = v end)
_0x64FA(_0x856C,"Draw FOV", false, function(v) _0x8DEE.DrawFOV = v end)
local _0x19FC = _0xF7C4(_0xAF26,"Aimbot Settings", 350)
_0x3EBD(_0x19FC,"Target Part", {"Head","Torso","HumanoidRootPart"}, function(opt) _0x8DEE.TargetPart = opt end)
_0xD6B1(_0x19FC,"FOV Radius", 0, 1000, 150," px", function(v) _0x8DEE.FOVRadius = v end)
_0xD6B1(_0x19FC,"Smoothness", 1, 50, 5," spd", function(v) _0x8DEE.Smoothness = v end)
_0x2ABF(_0x19FC,"Aim Key", Enum.UserInputType.MouseButton2, function(key) _0x8DEE.AimKey = key end)local _0x8043, _0xA096 = _0x3FB8("Target")
_0xE03C("Target", 170)
local _0x42B3 = _0xF7C4(_0x8043,"Target Info", 200)
local _0xA2F0, _0x7AC4, _0x4FE9, _0x55B0 = _0xE9A0(_0x42B3)
local _0xE672 = _0xF7C4(_0xA096,"Target Actions", 350)
local _0xB165, _0x6B4B = _0xDFB4(_0xE672,"Search Target (kısmi isim yeterli)","")
local function _0xE216(searchText)
if searchText == nil or searchText ==""then return nil end
local _0x23C3 = string.lower(searchText)
local _0x3DC5 = nil
local _0xB84F = 0
for _, plr in pairs(_0x75DC:GetPlayers()) do
if plr ~= _0x9BDD then
local _0xC897 = string.lower(plr.Name)
local _0x68EF = string.lower(plr.DisplayName)
if _0xC897 == _0x23C3 or _0x68EF == _0x23C3 then return plr end
if string.find(_0xC897, _0x23C3, 1, true) then
local _0xD885 = string.len(_0x23C3) / string.len(_0xC897)
if _0xD885 > _0xB84F then _0xB84F = _0xD885; _0x3DC5 = plr end
elseif string.find(_0x68EF, _0x23C3, 1, true) then
local _0xD885 = string.len(_0x23C3) / string.len(_0x68EF)
if _0xD885 > _0xB84F then _0xB84F = _0xD885; _0x3DC5 = plr end
end
end
end
return _0x3DC5
end
local function _0xFE3D(player)
if player then
_0x7AC4.Text ="Target: ".. player.DisplayName .." (@".. player.Name ..")"_0x55B0.Text ="ID: ".. player.UserId
_0x4FE9.Image ="https://www.roblox.com/headshot-thumbnail/image?userId=".. player.UserId .."&width=420&height=420&format=png"else
_0x7AC4.Text ="Target: None"_0x55B0.Text ="ID: -"_0x4FE9.Image ="rbxasset://textures/ui/GuiImagePlaceholder.png"end
end
_0x6B4B.FocusLost:Connect(function(enterPressed)
if enterPressed and _0x6B4B.Text ~=""then
local _0xD645 = _0xE216(_0x6B4B.Text)
if _0xD645 then
_0x6BD3 = _0xD645
_0xFE3D(_0x6BD3)
else
_0x6BD3 = nil
_0xFE3D(nil)
_0x7AC4.Text ="Target: Bulunamadı!"end
end
end)
local function _0x3ADA(targetPlayer)
if not targetPlayer then return end
local _0xA7F3 = targetPlayer.Character
if not _0xA7F3 then return end
local _0xE6ED = _0xA7F3:FindFirstChild("HumanoidRootPart")
if not _0xE6ED then return end
local _0x9D8C = _0x9BDD.Character
if not _0x9D8C then return end
local _0x8580 = _0x9D8C:FindFirstChild("HumanoidRootPart")
if not _0x8580 then return end
_0x8580.CFrame = _0xE6ED.CFrame * CFrame.new(0, 2, 2)
end
local function _0xA5D4(targetPlayer)
if not targetPlayer then return end
if _0x3799 then _0x8CF0() end
_0x6BD3 = targetPlayer
_0x3799 = true
_0xB08C.CameraType = Enum.CameraType.Scriptable
_0xB8CC = 0
_0x3251 = -20
local _0x18B6 = _0x0962.InputChanged:Connect(function(input, gameProcessed)
if not _0x3799 then if _0x18B6 then _0x18B6:Disconnect() end return end
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.MouseMovement then
local _0xC327 = input.Delta
_0xB8CC = _0xB8CC - _0xC327.X * 0.005
_0x3251 = math.clamp(_0x3251 - _0xC327.Y * 0.005, -1.4, 1.4)
end
end)
local _0x1A43 = _0xFB91.RenderStepped:Connect(function()
if not _0x3799 or not _0x6BD3 then
if _0x1A43 then _0x1A43:Disconnect() end
return
end
local _0x07FD = _0x6BD3.Character
if not _0x07FD then return end
local _0x845C = _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x845C then return end
local _0x3977 = _0x845C.Position + Vector3.new(0, 1.5, 0)
local _0xB4E7 = math.rad(_0xB8CC)
local _0xFE70 = math.rad(_0x3251)
local _0xDF57 = Vector3.new(math.cos(_0xB4E7) * math.cos(_0xFE70), math.sin(_0xFE70), math.sin(_0xB4E7) * math.cos(_0xFE70))
local _0x40A3 = 6
local _0x42A2 = _0x3977 - _0xDF57 * _0x40A3
_0xB08C.CFrame = CFrame.new(_0x42A2, _0x3977)
end)
local _0x8E5B = _0x6BD3.CharacterAdded:Connect(function(newChar) task.wait(0.5) end)
_0x2512 = {
mouse = _0x18B6,
render = _0x1A43,
charAdded = _0x8E5B
}
end
local function _0x8CF0()
if not _0x3799 then return end
_0x3799 = false
if _0x2512 then
if _0x2512.mouse then _0x2512.mouse:Disconnect() end
if _0x2512.render then _0x2512.render:Disconnect() end
if _0x2512.charAdded then _0x2512.charAdded:Disconnect() end
_0x2512 = nil
end
_0xB08C.CameraType = Enum.CameraType.Custom
if _0x9BDD.Character and _0x9BDD.Character:FindFirstChild("Humanoid") then
_0xB08C.CameraSubject = _0x9BDD.Character.Humanoid
end
end
local _0x3530 = _0x072A(_0xE672,"Spectate Target", function()
if _0x6BD3 then
if _0x3799 then
_0x8CF0()
_0x3530.Text ="Spectate Target"else
_0xA5D4(_0x6BD3)
_0x3530.Text ="Stop Spectate"end
end
end)
_0x072A(_0xE672,"Teleport to Target", function()
if _0x6BD3 then _0x3ADA(_0x6BD3) end
end)local _0xE104, _0x246A = _0x3FB8("World")
_0xE03C("World", 205)
local _0x4E8E = _0xF7C4(_0xE104,"World Textures", 250)
_0x64FA(_0x4E8E,"Sakura Texture", false, function(v)
_0x8DEE.SakuraTexture = v
if v then _0x8DEE.MinecraftTexture = false end
_0xDAF1(v)
_0xFDA6()
end)
_0x64FA(_0x4E8E,"Minecraft Texture", false, function(v)
_0x8DEE.MinecraftTexture = v
if v then _0x8DEE.SakuraTexture = false end
_0xDAF1(false)
_0xFDA6()
end)
local _0xE03F = _0xF7C4(_0x246A,"Lighting & Ambience", 300)
_0x64FA(_0xE03F,"Fullbright", false, function(v) _0x8DEE.Fullbright = v; _0xFDA6() end)
_0x64FA(_0xE03F,"Remove Fog", false, function(v) _0x8DEE.RemoveFog = v; _0xFDA6() end)
_0xD6B1(_0xE03F,"Time of Day", 0, 24, 12," hrs", function(v) _0x8DEE.TimeOfDay = v; _0xFDA6() end)local _0x0634, _0x6D49 = _0x3FB8("Morph")
_0xE03C("Morph", 240)
local _0x8ED9 = _0xF7C4(_0x0634,"Custom Blender Model Setup", 420)
local _0xCB58, _0xA68B = _0xDFB4(_0x8ED9,"Blender Mesh File / ID (Örn: sukuna_ryomen_r15_ara.obj)","sukuna_ryomen_r15_ara.obj", function(txt)
_0x8DEE.CustomMeshID = txt
end)
local _0xC49E, _0x3F86 = _0xDFB4(_0x8ED9,"Texture File / ID (İsteğe Bağlı)", _0x8DEE.CustomTextureID, function(txt)
_0x8DEE.CustomTextureID = txt
end)
_0xD6B1(_0x8ED9,"Model Boyutu (Scale)", 1, 20, 5,"x", function(v)
_0xD00D(v, _0x8DEE.CustomOffsetY)
end)
_0xD6B1(_0x8ED9,"Model Yükseklik Offset (Y)", -10, 10, 0," studs", function(v)
_0xD00D(_0x8DEE.CustomModelScale, v)
end)
_0x072A(_0x8ED9,"Modeli Karaktere Uygula (Morph)", function()
local _0x71E9 = _0xA68B.Text
local _0x92B5 = _0x3F86.Text
_0x6AD8(_0x71E9, _0x92B5, _0x8DEE.CustomModelScale, _0x8DEE.CustomOffsetY)
end)
_0x072A(_0x8ED9,"Varsayılan Karaktere Dön", function()
_0xDD35()
end)local _0xB866, _0x8FD2 = _0x3FB8("Misc")
_0xE03C("Misc", 275)
local _0x634D = _0xF7C4(_0xB866,"Miscellaneous", 280)
_0x64FA(_0x634D,"Anti-Fling", false, function(v) _0x8DEE.AntiFling = v end)
_0x64FA(_0x634D,"Auto Farm", false, function(v) _0x8DEE.AutoFarm = v end)
_0x64FA(_0x634D,"FPS Unlocker", true, function(v)
_0x8DEE.FPSUnlocker = v
if setfpscap then setfpscap(v and 240 or 60) end
end)
_0x64FA(_0x634D,"Invisibility (FE Server)", false, function(v)
_0x8DEE.Invisibility = v
_0x902A(v)
end)
local _0x996E = _0xF7C4(_0x8FD2,"Extra Utilities", 220)
_0x072A(_0x996E,"Rejoin Server", function() _0xF9B2() end)
_0x072A(_0x996E,"Server Hop", function() _0x1207() end)local _0xF422, _0xB177 = _0x3FB8("CARR")
_0xE03C("CARR", 310)
local _0x67D4 = _0xF7C4(_0xF422,"Vehicle Boost Settings", 320)
local _0x4EF9 = Instance.new("Frame")
_0x4EF9.Size = UDim2.new(1, 0, 0, 180)
_0x4EF9.BackgroundTransparency = 1
_0x4EF9.Visible = false
_0x64FA(_0x67D4,"Car Boost Active", false, function(v)
_0x8DEE.CarBoost = v
_0x4EF9.Visible = v
end)
_0x4EF9.Parent = _0x67D4
local _0x6756 = Instance.new("UIListLayout", _0x4EF9)
_0x6756.Padding = UDim.new(0, 10)
_0x2ABF(_0x4EF9,"Boost Key", Enum.KeyCode.LeftShift, function(key)
_0x8DEE.CarBoostKey = key
end)
_0xD6B1(_0x4EF9,"Boost Speed (km/h)", 10, 500, 100," kmh", function(v)
_0x8DEE.CarBoostSpeed = v
end)
local _0x464F = _0xF7C4(_0xB177,"Vehicle Status & Info", 280)
local _0x1A3F = Instance.new("TextLabel", _0x464F)
_0x1A3F.Size = UDim2.new(1, 0, 0, 25)
_0x1A3F.BackgroundTransparency = 1
_0x1A3F.Text ="Status: Not in Vehicle"_0x1A3F.TextColor3 = Color3.fromRGB(200, 200, 200)
_0x1A3F.Font = Enum.Font.RobotoMono
_0x1A3F.TextSize = 13
_0x1A3F.TextXAlignment = Enum.TextXAlignment.Left
local _0xF285 = Instance.new("TextLabel", _0x464F)
_0xF285.Size = UDim2.new(1, 0, 0, 25)
_0xF285.BackgroundTransparency = 1
_0xF285.Text ="Speed: 0 km/h"_0xF285.TextColor3 = Color3.fromRGB(200, 200, 200)
_0xF285.Font = Enum.Font.RobotoMono
_0xF285.TextSize = 13
_0xF285.TextXAlignment = Enum.TextXAlignment.Left
_0xFB91.Heartbeat:Connect(function()
local _0x07FD = _0x9BDD.Character
if _0x07FD then
local _0x4D48 = _0x07FD:FindFirstChildOfClass("Humanoid")
if _0x4D48 and _0x4D48.SeatPart then
local _0x8BFA = _0x4D48.SeatPart
_0x1A3F.Text ="Status: Driving (".. _0x8BFA.Name ..")"_0x1A3F.TextColor3 = _0x8DEE.AccentColor
local _0xA316 = _0x8BFA.AssemblyLinearVelocity.Magnitude
_0xF285.Text ="Speed: ".. math.floor(_0xA316 * 0.28) .." km/h (".. math.floor(_0xA316) .." studs/s)"else
_0x1A3F.Text ="Status: Not in Vehicle"_0x1A3F.TextColor3 = Color3.fromRGB(200, 200, 200)
_0xF285.Text ="Speed: 0 km/h"end
end
end)local _0x9AD3, _0x102D = _0x3FB8("Animations")
_0xE03C("Animations", 345)
local _0xD7E7 = _0xF7C4(_0x9AD3,"Roblox Character Animations", 220)
local _0x7B01 = false
local _0xC738 = _0x072A(_0xD7E7,"Zombie Animation Başlat", function()
_0x7B01 = not _0x7B01
if _0x7B01 then
_0x1264("616158094")
else
_0xCF9D()
end
end)
_0x072A(_0xD7E7,"Animasyonu Durdur (Stop)", function()
_0x7B01 = false
_0xCF9D()
end)local _0xA922, _0x2499 = _0x3FB8("Settings")
_0xE03C("Settings", 380)
local _0x72A6 = _0xF7C4(_0xA922,"Menu Settings", 320)
_0x3EBD(_0x72A6,"Menu Toggle Key", {"RightControl","Insert","RightShift"}, function(opt)
if opt =="RightControl"then _0x8DEE.MenuToggleKey = Enum.KeyCode.RightControl
elseif opt =="Insert"then _0x8DEE.MenuToggleKey = Enum.KeyCode.Insert
elseif opt =="RightShift"then _0x8DEE.MenuToggleKey = Enum.KeyCode.RightShift end
end)
_0x13BC(_0x72A6,"Menu Accent Color", function(color)
_0x8DEE.AccentColor = color
end)
_0x072A(_0x72A6,"Unload GUI", function()
_0x132D()
_0xDD35()
_0xCF9D()
_0x5058:Destroy()
end)
local _0x4B4C = _0xF7C4(_0x2499,"Configuration System", 320)
local _0xF657, _0x0965 = _0xDFB4(_0x4B4C,"Config Name", _0x8DEE.ConfigName, function(txt)
_0x8DEE.ConfigName = txt
end)
_0x072A(_0x4B4C,"Save Config", function()
_0xAC54(_0x0965.Text)
end)
_0x3EBD(_0x4B4C,"Saved Configs", {"MyLegitConfig","RageConfig"}, function(opt)
_0x0965.Text = opt
end)
_0x072A(_0x4B4C,"Load Config", function()
_0xFB73(_0x0965.Text)
end)local _0xC888 = Drawing.new("Circle")
_0xC888.Color = Color3.fromRGB(255, 255, 255)
_0xC888.Thickness = 1
_0xC888.Filled = false
_0xC888.Transparency = 1
local _0xF17A = {}
local function _0xFB28(plr)
local _0x1973 = {
_0xC806 = Drawing.new("Square"),
_0xE162 = Drawing.new("Line"),
Distance = Drawing.new("Text"),
SkeletonLines = {}
}
_0x1973.Box.Thickness = 1; _0x1973.Box.Filled = false
_0x1973.Line.Thickness = 1
_0x1973.Distance.Size = 18; _0x1973.Distance.Center = true
_0xF17A[plr] = _0x1973
end
local function _0xE3EB(plr)
if _0xF17A[plr] then
for k, drawing in pairs(_0xF17A[plr]) do
if k =="SkeletonLines"and type(drawing) =="table"then
for _, _0x5B30 in pairs(drawing) do
if _0x5B30 and typeof(_0x5B30) =="Drawing"and _0x5B30.Remove then _0x5B30:Remove() end
end
elseif typeof(drawing) =="Drawing"and drawing.Remove then
drawing:Remove()
end
end
_0xF17A[plr] = nil
end
end
for _, plr in pairs(_0x75DC:GetPlayers()) do
if plr ~= _0x9BDD then _0xFB28(plr) end
end
_0x75DC.PlayerAdded:Connect(_0xFB28)
_0x75DC.PlayerRemoving:Connect(_0xE3EB)
local function _0x3A06(character, boneName)
if not character then return nil end
for _, part in pairs(character:GetDescendants()) do
if part.Name == boneName and part:IsA("BasePart") then return part.Position end
end
return nil
end
local function _0x9848(plr, _0x1973)
local _0x07FD = plr.Character
if not _0x07FD then return end
local _0x4D48 = _0x07FD:FindFirstChild("Humanoid")
if not _0x4D48 or _0x4D48.Health <= 0 then return end
local _0x7027 = _0x3A06(_0x07FD,"Head")
local _0x9455 = _0x3A06(_0x07FD,"UpperTorso") or _0x3A06(_0x07FD,"HumanoidRootPart")
local _0xCC08 = _0x3A06(_0x07FD,"LeftUpperArm") or _0x3A06(_0x07FD,"LeftHand")
local _0xDA92 = _0x3A06(_0x07FD,"RightUpperArm") or _0x3A06(_0x07FD,"RightHand")
local _0x12C3 = _0x3A06(_0x07FD,"LeftUpperLeg") or _0x3A06(_0x07FD,"LeftFoot")
local _0xB3F8 = _0x3A06(_0x07FD,"RightUpperLeg") or _0x3A06(_0x07FD,"RightFoot")
local _0x3ABF = {_0x7027, _0x9455, _0xCC08, _0xDA92, _0x12C3, _0xB3F8}
for i = 1, #_0x3ABF do
if not _0x1973.SkeletonLines[i] then _0x1973.SkeletonLines[i] = Drawing.new("Line") end
local _0x5B30 = _0x1973.SkeletonLines[i]
if _0x3ABF[i] then
local _0x3091, _0xC765 = _0xB08C:WorldToViewportPoint(_0x3ABF[i])
if _0xC765 then
_0x5B30.Visible = true
_0x5B30.From = Vector2.new(_0x3091.X, _0x3091.Y)
if i == 2 and _0x3ABF[1] then
local _0x912C = _0xB08C:WorldToViewportPoint(_0x3ABF[1])
_0x5B30.To = Vector2.new(_0x912C.X, _0x912C.Y)
elseif i == 3 and _0x3ABF[2] then _0x5B30.To = Vector2.new(_0xB08C:WorldToViewportPoint(_0x3ABF[2]).X, _0xB08C:WorldToViewportPoint(_0x3ABF[2]).Y)
elseif i == 4 and _0x3ABF[2] then _0x5B30.To = Vector2.new(_0xB08C:WorldToViewportPoint(_0x3ABF[2]).X, _0xB08C:WorldToViewportPoint(_0x3ABF[2]).Y)
elseif i == 5 and _0x3ABF[2] then _0x5B30.To = Vector2.new(_0xB08C:WorldToViewportPoint(_0x3ABF[2]).X, _0xB08C:WorldToViewportPoint(_0x3ABF[2]).Y)
elseif i == 6 and _0x3ABF[2] then _0x5B30.To = Vector2.new(_0xB08C:WorldToViewportPoint(_0x3ABF[2]).X, _0xB08C:WorldToViewportPoint(_0x3ABF[2]).Y)
else _0x5B30.Visible = false end
_0x5B30.Color = _0x8DEE.SkeletonColor
_0x5B30.Thickness = 1
else _0x5B30.Visible = false end
else if _0x1973.SkeletonLines[i] then _0x1973.SkeletonLines[i].Visible = false end end
end
end
local function _0x88FC()
local _0x031E = nil
local _0x40F6 = _0x8DEE.FOVRadius
for _, plr in pairs(_0x75DC:GetPlayers()) do
if plr == _0x9BDD then continue end
local _0x07FD = plr.Character
if not _0x07FD then continue end
if _0x8DEE.AimbotTeamCheck and plr.Team == _0x9BDD.Team then continue end
local _0x75D9 = _0x07FD:FindFirstChild(_0x8DEE.TargetPart) or _0x07FD:FindFirstChild("HumanoidRootPart")
if not _0x75D9 then continue end
local _0x4D48 = _0x07FD:FindFirstChild("Humanoid")
if not _0x4D48 or _0x4D48.Health <= 0 then continue end
if _0x8DEE.WallCheck then
local _0x264D = RaycastParams.new()
_0x264D.FilterDescendantsInstances = {_0x9BDD.Character}
_0x264D.FilterType = Enum.RaycastFilterType.Exclude
local _0x1406 = workspace:Raycast(_0xB08C.CFrame.Position, (_0x75D9.Position - _0xB08C.CFrame.Position).Unit * 1000, _0x264D)
if _0x1406 and not _0x1406.Instance:IsDescendantOf(_0x07FD) then continue end
end
local _0x3977, _0xC765 = _0xB08C:WorldToViewportPoint(_0x75D9.Position)
if not _0xC765 then continue end
local _0x4422 = (Vector2.new(_0xE8C4.X, _0xE8C4.Y) - Vector2.new(_0x3977.X, _0x3977.Y)).Magnitude
if _0x4422 < _0x40F6 then _0x031E = plr; _0x40F6 = _0x4422 end
end
return _0x031E
end
_0xFB91.RenderStepped:Connect(function()if _0x8DEE.RainbowESP then
local _0x3517 = tick() % 5 / 5
local _0x7EB3 = Color3.fromHSV(_0x3517, 1, 1)
_0x8DEE.ChamsColor = _0x7EB3
_0x8DEE.BoxColor = _0x7EB3
_0x8DEE.SkeletonColor = _0x7EB3
_0x8DEE.DistanceColor = _0x7EB3
endif _0x8DEE.DrawFOV then
_0xC888.Visible = true
_0xC888.Radius = _0x8DEE.FOVRadius
_0xC888.Position = Vector2.new(_0xE8C4.X, _0xE8C4.Y + 36)
else
_0xC888.Visible = false
endif _0x8DEE.Aimbot and _0x8DEE.IsAimKeyDown then
local _0x1221 = _0x88FC()
if _0x1221 then
local _0x07FD = _0x1221.Character
if _0x07FD then
local _0x75D9 = _0x07FD:FindFirstChild(_0x8DEE.TargetPart) or _0x07FD:FindFirstChild("HumanoidRootPart")
if _0x75D9 then
local _0x3977 = _0x75D9.Position
local _0xEFF7 = CFrame.new(_0xB08C.CFrame.Position, _0x3977)
_0xB08C.CFrame = _0xB08C.CFrame:Lerp(_0xEFF7, _0x8DEE.Smoothness / 50)
end
end
end
endif _0x9BDD.Character then
local _0xA073 = _0x9BDD.Character:FindFirstChild("Humanoid")
if _0xA073 then
if _0x8DEE.Speed then _0xA073.WalkSpeed = _0x8DEE.SpeedVal else _0xA073.WalkSpeed = 16 end
if _0x8DEE.Jump then _0xA073.JumpPower = _0x8DEE.JumpVal else _0xA073.JumpPower = 50 end
end
end
_0xAC1E()
_0x9C95()for plr, _0x1973 in pairs(_0xF17A) do
local _0x07FD = plr.Character
if _0x07FD and _0x07FD:FindFirstChild("HumanoidRootPart") and _0x07FD:FindFirstChild("Humanoid") then
local _0x4D48 = _0x07FD:FindFirstChild("Humanoid")
if _0x4D48 and _0x4D48.Health > 0 then
if _0x8DEE.ESPTeamCheck and plr.Team == _0x9BDD.Team then
_0x1973.Box.Visible = false; _0x1973.Line.Visible = false; _0x1973.Distance.Visible = false
for _, _0x5B30 in pairs(_0x1973.SkeletonLines) do if _0x5B30 then _0x5B30.Visible = false end end
else
local _0xB179 = _0x07FD.HumanoidRootPart
local _0x7438, _0xC765 = _0xB08C:WorldToViewportPoint(_0xB179.Position)
if _0xC765 then
local _0xAF72 = (_0xB08C.CFrame.Position - _0xB179.Position).Magnitude
if _0x8DEE.BoxESP then
_0x1973.Box.Visible = true
_0x1973.Box.Color = _0x8DEE.BoxColor
_0x1973.Box.Size = Vector2.new(2000 / _0xAF72, 3000 / _0xAF72)
_0x1973.Box.Position = Vector2.new(_0x7438.X - _0x1973.Box.Size.X / 2, _0x7438.Y - _0x1973.Box.Size.Y / 2)
else _0x1973.Box.Visible = false end
if _0x8DEE.LineESP then
_0x1973.Line.Visible = true
_0x1973.Line.Color = _0x8DEE.BoxColor
_0x1973.Line.From = Vector2.new(_0xB08C.ViewportSize.X / 2, _0xB08C.ViewportSize.Y)
_0x1973.Line.To = Vector2.new(_0x7438.X, _0x7438.Y)
else _0x1973.Line.Visible = false end
if _0x8DEE.DistanceESP then
_0x1973.Distance.Visible = true
_0x1973.Distance.Color = _0x8DEE.DistanceColor
_0x1973.Distance.Text ="[".. math.floor(_0xAF72) .."m]"_0x1973.Distance.Position = Vector2.new(_0x7438.X, _0x7438.Y + (1500 / _0xAF72))
else _0x1973.Distance.Visible = false end
if _0x8DEE.SkeletonESP then _0x9848(plr, _0x1973)
else for _, _0x5B30 in pairs(_0x1973.SkeletonLines) do if _0x5B30 then _0x5B30.Visible = false end end end
else
_0x1973.Box.Visible = false; _0x1973.Line.Visible = false; _0x1973.Distance.Visible = false
for _, _0x5B30 in pairs(_0x1973.SkeletonLines) do if _0x5B30 then _0x5B30.Visible = false end end
end
end
else
_0x1973.Box.Visible = false; _0x1973.Line.Visible = false; _0x1973.Distance.Visible = false
for _, _0x5B30 in pairs(_0x1973.SkeletonLines) do if _0x5B30 then _0x5B30.Visible = false end end
end
else
_0x1973.Box.Visible = false; _0x1973.Line.Visible = false; _0x1973.Distance.Visible = false
for _, _0x5B30 in pairs(_0x1973.SkeletonLines) do if _0x5B30 then _0x5B30.Visible = false end end
end
endfor _, plr in pairs(_0x75DC:GetPlayers()) do
if plr ~= _0x9BDD and plr.Character then
local _0xE783 = plr.Character:FindFirstChild("DaveChams")
if _0x8DEE.ESPTeamCheck and plr.Team == _0x9BDD.Team then
if _0xE783 then _0xE783:Destroy() end
else
if _0x8DEE.Chams then
if not _0xE783 then
_0xE783 = Instance.new("Highlight")
_0xE783.Name ="DaveChams"_0xE783.Parent = plr.Character
_0xE783.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end
_0xE783.FillColor = _0x8DEE.ChamsColor
_0xE783.OutlineColor = _0x8DEE.ChamsColor
else
if _0xE783 then _0xE783:Destroy() end
end
end
end
end
end)_0x0962.InputBegan:Connect(function(input, gpe)
if not gpe then
if _0x8DEE.ClickTP and input.UserInputType == Enum.UserInputType.MouseButton1 and _0x0962:IsKeyDown(Enum.KeyCode.LeftControl) then
local _0x07FD = _0x9BDD.Character
if _0x07FD and _0x07FD:FindFirstChild("HumanoidRootPart") and _0xE8C4 and _0xE8C4.Hit then
_0x07FD.HumanoidRootPart.CFrame = CFrame.new(_0xE8C4.Hit.Position + Vector3.new(0, 3, 0))
print("[Teleport] Fare pozisyonuna ışınlanıldı! 📍")
end
end
if input.UserInputType == _0x8DEE.AimKey or input.KeyCode == _0x8DEE.AimKey then
_0x8DEE.IsAimKeyDown = true
end
if input.KeyCode == _0x8DEE.CarBoostKey or input.UserInputType == _0x8DEE.CarBoostKey then
_0x8DEE.CarBoostKeyDown = true
end
end
end)
_0x0962.InputEnded:Connect(function(input, gpe)
if input.UserInputType == _0x8DEE.AimKey or input.KeyCode == _0x8DEE.AimKey then
_0x8DEE.IsAimKeyDown = false
end
if input.KeyCode == _0x8DEE.CarBoostKey or input.UserInputType == _0x8DEE.CarBoostKey then
_0x8DEE.CarBoostKeyDown = false
end
end)
print("Macro Cheat v3.6 (Multi-Scale & Offset Adjuster Added) Başarıyla Yüklendi! 🚀")
