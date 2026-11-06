local Players = game:GetService(string.char(80,108,97,121,101,114,115))
local UserInputService = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local CoreGui = game:GetService(string.char(67,111,114,101,71,117,105))
local RunService = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local Lighting = game:GetService(string.char(76,105,103,104,116,105,110,103))
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local TweenService = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
local TeleportService = game:GetService(string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101))
local guiParent = pcall(function() return CoreGui end) and CoreGui or LocalPlayer:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
local guiName =string.char(68,97,118,101,83,116,111,112,84,105,109,101,114,67,108,111,110,101)if guiParent:FindFirstChild(guiName) then guiParent[guiName]:Destroy() end
local ScreenGui = Instance.new(string.char(83,99,114,101,101,110,71,117,105))
ScreenGui.Name = guiName
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParentlocal Config = {
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
TargetPart =string.char(72,101,97,100), FOVRadius = 150, Smoothness = 5,
AimKey = Enum.UserInputType.MouseButton2, IsAimKeyDown = false,SakuraTexture = false, MinecraftTexture = false,
Fullbright = false, RemoveFog = false, TimeOfDay = 12,CarBoost = false,
CarBoostSpeed = 100,
CarBoostKey = Enum.KeyCode.LeftShift,
CarBoostKeyDown = false,CustomMeshID =string.char(115,117,107,117,110,97,95,114,121,111,109,101,110,95,114,49,53,95,97,114,97,46,111,98,106),
CustomTextureID ="",
CustomModelScale = 1,
CustomOffsetY = 0,
IsMorphActive = false,AntiFling = false,
AutoFarm = false,
FPSUnlocker = true,
Invisibility = false,MenuToggleKey = Enum.KeyCode.RightControl,
AccentColor = Color3.fromRGB(140, 82, 255),
ConfigName =string.char(77,121,76,101,103,105,116,67,111,110,102,105,103),
}
local currentTarget = nil
local isSpectating = false
local spectateConnection = nil
local spectateYaw = 0
local spectatePitch = -20
local flying = false
local bodyVelocity = nil
local bodyGyro = nil
local originalLighting = {
Ambient = Lighting.Ambient,
OutdoorAmbient = Lighting.OutdoorAmbient,
Brightness = Lighting.Brightness,
ClockTime = Lighting.ClockTime,
FogEnd = Lighting.FogEnd,
FogStart = Lighting.FogStart,
GlobalShadows = Lighting.GlobalShadows,
}local currentAnimTrack = nil
local function stopCurrentAnimation()
if currentAnimTrack then
currentAnimTrack:Stop()
currentAnimTrack:Destroy()
currentAnimTrack = nil
print(string.char(91,65,110,105,109,97,116,105,111,110,93,32,65,110,105,109,97,115,121,111,110,32,100,117,114,100,117,114,117,108,100,117,46))
end
end
local function playCustomAnimation(animIdRaw: string)
stopCurrentAnimation()
if not animIdRaw or animIdRaw ==""then return end
local cleanId = tostring(animIdRaw):gsub(string.char(37,68),"")
if cleanId ==""then return end
local char = LocalPlayer.Character
if not char then return end
local humanoid = char:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if not humanoid then return end
local animator = humanoid:FindFirstChildOfClass(string.char(65,110,105,109,97,116,111,114)) or Instance.new(string.char(65,110,105,109,97,116,111,114), humanoid)
local anim = Instance.new(string.char(65,110,105,109,97,116,105,111,110))
anim.AnimationId =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47).. cleanId
local ok, track = pcall(function()
return animator:LoadAnimation(anim)
end)
if ok and track then
track.Priority = Enum.AnimationPriority.Action
track.Looped = true
track:Play()
currentAnimTrack = track
print(string.char(91,65,110,105,109,97,116,105,111,110,93,32,65,110,105,109,97,115,121,111,110,32,98,97,197,159,97,114,196,177,121,108,97,32,98,97,197,159,108,97,116,196,177,108,100,196,177,33,32,73,68,58,32).. cleanId)
else
print(string.char(91,65,110,105,109,97,116,105,111,110,93,32,72,97,116,97,58,32,65,110,105,109,97,115,121,111,110,32,121,195,188,107,108,101,110,101,109,101,100,105,33))
end
endlocal currentMorphPart = nil
local currentSpecialMesh = nil
local currentWeld = nil
local function removeCustomMorph()
if currentMorphPart then
currentMorphPart:Destroy()
currentMorphPart = nil
currentSpecialMesh = nil
currentWeld = nil
end
local char = LocalPlayer.Character
if char then
for _, part in ipairs(char:GetDescendants()) do
if (part:IsA(string.char(66,97,115,101,80,97,114,116)) or part:IsA(string.char(68,101,99,97,108))) and part.Name ~=string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)then
part.Transparency = 0
end
end
end
Config.IsMorphActive = false
print(string.char(91,77,111,114,112,104,93,32,75,97,114,97,107,116,101,114,32,111,114,105,106,105,110,97,108,32,104,97,108,105,110,101,32,100,195,182,110,100,195,188,114,195,188,108,100,195,188,46))
endlocal function resolveAssetUri(inputStr: string)
if not inputStr or inputStr ==""then return""end
local cleanInput = string.gsub(inputStr,string.char(94,37,115,42,40,46,45,41,37,115,42,36),string.char(37,49))
if isfile and getcustomasset then
local possiblePaths = {
cleanInput,string.char(119,111,114,107,115,112,97,99,101,47).. cleanInput,string.char(119,111,114,107,115,112,97,99,101,92).. cleanInput,
cleanInput ..string.char(46,111,98,106),
cleanInput ..string.char(46,79,66,74),string.char(119,111,114,107,115,112,97,99,101,47).. cleanInput ..string.char(46,111,98,106),string.char(119,111,114,107,115,112,97,99,101,47).. cleanInput ..string.char(46,79,66,74),string.char(119,111,114,107,115,112,97,99,101,92).. cleanInput ..string.char(46,111,98,106),string.char(119,111,114,107,115,112,97,99,101,92).. cleanInput ..string.char(46,79,66,74)}
for _, path in ipairs(possiblePaths) do
local ok, exists = pcall(function() return isfile(path) end)
if ok and exists then
local uriOk, assetUri = pcall(function() return getcustomasset(path) end)
if uriOk and assetUri then
print(string.char(91,77,111,114,112,104,93,32,89,69,82,69,76,32,68,79,83,89,65,32,66,65,197,158,65,82,73,89,76,65,32,66,85,76,85,78,68,85,58,32).. path)
return assetUri
end
end
end
end
local cleanId = cleanInput:gsub(string.char(37,68),"")
if cleanId ~=""then
print(string.char(91,77,111,114,112,104,93,32,82,111,98,108,111,120,32,65,115,115,101,116,32,73,68,32,107,117,108,108,97,110,196,177,108,196,177,121,111,114,58,32).. cleanId)
returnstring.char(114,98,120,97,115,115,101,116,105,100,58,47,47).. cleanId
end
print(string.char(91,77,111,114,112,104,93,32,85,89,65,82,73,58,32,39).. cleanInput ..string.char(39,32,100,111,115,121,97,115,196,177,32,101,120,101,99,117,116,111,114,32,119,111,114,107,115,112,97,99,101,32,107,108,97,115,195,182,114,195,188,110,100,101,32,98,117,108,117,110,97,109,97,100,196,177,33))
return""end
local function applyCustomMorph(meshInputRaw: string, textureInputRaw: string, scale: number, offsetY: number)
local meshAssetUri = resolveAssetUri(meshInputRaw)
local textureAssetUri = resolveAssetUri(textureInputRaw)
if meshAssetUri ==""then
print(string.char(91,77,111,114,112,104,93,32,72,65,84,65,58,32,51,68,32,77,101,115,104,32,100,111,115,121,97,115,196,177,32,98,117,108,117,110,97,109,97,100,196,177,33,32,76,195,188,116,102,101,110,32,100,111,115,121,97,110,196,177,110,32,101,120,101,99,117,116,111,114,32,39,119,111,114,107,115,112,97,99,101,39,32,107,108,97,115,195,182,114,195,188,110,100,101,32,111,108,100,117,196,159,117,110,100,97,110,32,101,109,105,110,32,111,108,117,110,46))
removeCustomMorph()return
end
local char = LocalPlayer.Character
if not char then return end
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not root then return end
removeCustomMorph()for _, part in ipairs(char:GetDescendants()) do
if (part:IsA(string.char(66,97,115,101,80,97,114,116)) or part:IsA(string.char(68,101,99,97,108))) and part.Name ~=string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)then
part.Transparency = 1
end
endlocal morphPart = Instance.new(string.char(80,97,114,116))
morphPart.Name =string.char(67,117,115,116,111,109,66,108,101,110,100,101,114,77,111,114,112,104)morphPart.Size = Vector3.new(2, 2, 2)
morphPart.CanCollide = false
morphPart.Anchored = false
morphPart.Massless = true
morphPart.Color = Color3.fromRGB(220, 220, 220)
morphPart.Material = Enum.Material.SmoothPlastic
morphPart.CFrame = root.CFrame * CFrame.new(0, offsetY or 0, 0)
local specialMesh = Instance.new(string.char(83,112,101,99,105,97,108,77,101,115,104))
specialMesh.MeshType = Enum.MeshType.FileMesh
specialMesh.MeshId = meshAssetUri
if textureAssetUri ~=""then
specialMesh.TextureId = textureAssetUri
end
specialMesh.Scale = Vector3.new(1, 1, 1) * (scale or 1)
specialMesh.Offset = Vector3.new(0, offsetY or 0, 0)
specialMesh.Parent = morphPart
morphPart.Parent = charlocal weld = Instance.new(string.char(87,101,108,100,67,111,110,115,116,114,97,105,110,116))
weld.Name =string.char(77,111,114,112,104,87,101,108,100)weld.Part0 = root
weld.Part1 = morphPart
weld.Parent = morphPart
currentMorphPart = morphPart
currentSpecialMesh = specialMesh
currentWeld = weld
Config.IsMorphActive = true
Config.CustomMeshID = meshInputRaw
Config.CustomTextureID = textureInputRaw
print(string.char(91,77,111,114,112,104,93,32,195,150,122,101,108,32,51,68,32,77,111,100,101,108,32,66,97,196,159,108,97,110,100,196,177,33,32,239,191,189,239,191,189,32,83,99,97,108,101,58,32).. tostring(scale) ..string.char(32,124,32,89,45,79,102,102,115,101,116,58,32).. tostring(offsetY))
end
local function updateMorphScaleAndOffset(scale: number, offsetY: number)
Config.CustomModelScale = scale
Config.CustomOffsetY = offsetY
if currentSpecialMesh then
currentSpecialMesh.Scale = Vector3.new(1, 1, 1) * scale
currentSpecialMesh.Offset = Vector3.new(0, offsetY, 0)
end
end
LocalPlayer.CharacterAdded:Connect(function(newChar)
currentMorphPart = nil
if Config.IsMorphActive and Config.CustomMeshID ~=""then
task.wait(1)
applyCustomMorph(Config.CustomMeshID, Config.CustomTextureID, Config.CustomModelScale, Config.CustomOffsetY)
end
end)local function startFly()
if flying then return end
local char = LocalPlayer.Character
if not char then return end
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not root then return end
flying = true
bodyVelocity = Instance.new(string.char(66,111,100,121,86,101,108,111,99,105,116,121))
bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 100000
bodyVelocity.Parent = root
bodyGyro = Instance.new(string.char(66,111,100,121,71,121,114,111))
bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * 100000
bodyGyro.Parent = root
end
local function stopFly()
flying = false
if bodyVelocity then bodyVelocity:Destroy() end
if bodyGyro then bodyGyro:Destroy() end
end
local function handleFly()
if not flying then return end
local char = LocalPlayer.Character
if not char then return end
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not root or not bodyVelocity then return end
local moveDirection = Vector3.new(
(UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -1 or 0)),
(UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and -1 or 0)),
(UserInputService:IsKeyDown(Enum.KeyCode.S) and -1 or (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0))
)
bodyVelocity.Velocity = (Camera.CFrame.RightVector * moveDirection.X + Camera.CFrame.UpVector * moveDirection.Y + Camera.CFrame.LookVector * moveDirection.Z) * Config.FlySpeed
bodyGyro.CFrame = CFrame.new(root.Position, root.Position + Camera.CFrame.LookVector)
end
RunService.Heartbeat:Connect(handleFly)
local function applyJumpPower()
if not Config.Jump then return end
local char = LocalPlayer.Character
if not char then return end
local hum = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
if hum then hum.JumpPower = Config.JumpVal end
end
local function updateNoclip()
if not Config.Noclip then return end
local char = LocalPlayer.Character
if not char then return end
for _, part in pairs(char:GetDescendants()) do
if part:IsA(string.char(66,97,115,101,80,97,114,116)) then part.CanCollide = false end
end
end
UserInputService.JumpRequest:Connect(function()
if Config.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100)) then
LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end
end)
RunService.RenderStepped:Connect(function()
if Config.Bunnyhop and LocalPlayer.Character then
local hum = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
if hum and UserInputService:IsKeyDown(Enum.KeyCode.Space) and hum.FloorMaterial ~= Enum.Material.Air then
hum.Jump = true
end
end
end)
RunService.Stepped:Connect(function()
if Config.Spinbot then
local char = LocalPlayer.Character
if char then
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if root then
root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(Config.SpinSpeed), 0)
end
end
end
end)
RunService.RenderStepped:Connect(function()
if Config.FOVChanger then
Camera.FieldOfView = Config.CamFOV
else
Camera.FieldOfView = 70
end
end)local function handleCarBoost()
if not Config.CarBoost or not Config.CarBoostKeyDown then return end
local char = LocalPlayer.Character
if not char then return end
local humanoid = char:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if not humanoid or not humanoid.SeatPart then return end
local seat = humanoid.SeatPart
if seat:IsA(string.char(86,101,104,105,99,108,101,83,101,97,116)) or seat:IsA(string.char(83,101,97,116)) then
local moveDir = seat.CFrame.LookVector
seat.AssemblyLinearVelocity = moveDir * (Config.CarBoostSpeed * 1.5)
end
end
RunService.Heartbeat:Connect(handleCarBoost)RunService.Stepped:Connect(function()
if not Config.AntiFling then return end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
for _, part in ipairs(plr.Character:GetChildren()) do
if part:IsA(string.char(66,97,115,101,80,97,114,116)) then
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
if Config.AutoFarm then
pcall(function()
local char = LocalPlayer.Character
if not char then return end
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not root then return end
for _, obj in ipairs(workspace:GetDescendants()) do
if not Config.AutoFarm then break end
if obj:IsA(string.char(84,111,117,99,104,84,114,97,110,115,109,105,116,116,101,114)) and obj.Parent and obj.Parent:IsA(string.char(66,97,115,101,80,97,114,116)) then
if firetouchinterest then
firetouchinterest(root, obj.Parent, 0)
task.wait()
firetouchinterest(root, obj.Parent, 1)
else
root.CFrame = obj.Parent.CFrame
task.wait(0.1)
end
end
end
end)
end
end
end)local savedRootC0 = nil
local function toggleInvisibility(state)
local char = LocalPlayer.Character
if not char then return end
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not root then return end
local rootJoint = root:FindFirstChild(string.char(82,111,111,116,74,111,105,110,116)) or root:FindFirstChildOfClass(string.char(77,111,116,111,114,54,68))
if not rootJoint and char:FindFirstChild(string.char(76,111,119,101,114,84,111,114,115,111)) then
rootJoint = char.LowerTorso:FindFirstChild(string.char(82,111,111,116)) or char.LowerTorso:FindFirstChildOfClass(string.char(77,111,116,111,114,54,68))
end
if state then
if rootJoint then
if not savedRootC0 then
savedRootC0 = rootJoint.C0
end
rootJoint.C0 = CFrame.new(0, -10000, 0)
end
for _, part in ipairs(char:GetDescendants()) do
if part:IsA(string.char(66,97,115,101,80,97,114,116)) or part:IsA(string.char(68,101,99,97,108)) then
if part.Name ~=string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)then
part.Transparency = 0.5
end
end
end
else
if rootJoint and savedRootC0 then
rootJoint.C0 = savedRootC0
savedRootC0 = nil
end
for _, part in ipairs(char:GetDescendants()) do
if part:IsA(string.char(66,97,115,101,80,97,114,116)) or part:IsA(string.char(68,101,99,97,108)) then
if part.Name ~=string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)then
part.Transparency = 0
end
end
end
end
endlocal function RejoinServer()
if #Players:GetPlayers() <= 1 then
LocalPlayer:Kick(string.char(10,83,117,110,117,99,117,121,97,32,121,101,110,105,100,101,110,32,98,97,196,159,108,97,110,196,177,108,196,177,121,111,114,46,46,46))
task.wait(0.5)
TeleportService:Teleport(game.PlaceId, LocalPlayer)
else
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end
end
local function ServerHop()
local sfUrl =string.char(104,116,116,112,115,58,47,47,103,97,109,101,115,46,114,111,98,108,111,120,46,99,111,109,47,118,49,47,103,97,109,101,115,47).. game.PlaceId ..string.char(47,115,101,114,118,101,114,115,47,80,117,98,108,105,99,63,115,111,114,116,79,114,100,101,114,61,65,115,99,38,108,105,109,105,116,61,49,48,48)local success, result = pcall(function()
return HttpService:JSONDecode(game:HttpGet(sfUrl))
end)
if success and result and result.data then
for _, server in ipairs(result.data) do
if server.id ~= game.JobId and server.playing < server.maxPlayers then
TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
return
end
end
end
print(string.char(85,121,103,117,110,32,121,101,110,105,32,115,117,110,117,99,117,32,98,117,108,117,110,97,109,97,100,196,177,46))
endlocal function SaveConfigToFile(name)
local serializableConfig = {}
for k, v in pairs(Config) do
if typeof(v) ==string.char(67,111,108,111,114,51)then
serializableConfig[k] = {r = v.R, g = v.G, b = v.B, __type =string.char(67,111,108,111,114,51)}
elseif typeof(v) ==string.char(69,110,117,109,73,116,101,109)then
serializableConfig[k] = {name = v.Name, enumType = tostring(v.EnumType), __type =string.char(69,110,117,109)}
else
serializableConfig[k] = v
end
end
local jsonStr = HttpService:JSONEncode(serializableConfig)
if writefile then
if makefolder and not isfolder(string.char(77,97,99,114,111,67,104,101,97,116,67,111,110,102,105,103,115)) then makefolder(string.char(77,97,99,114,111,67,104,101,97,116,67,111,110,102,105,103,115)) end
writefile(string.char(77,97,99,114,111,67,104,101,97,116,67,111,110,102,105,103,115,47).. name ..string.char(46,106,115,111,110), jsonStr)
print(string.char(67,111,110,102,105,103,32,107,97,121,100,101,100,105,108,100,105,58,32).. name)
else
print(string.char(119,114,105,116,101,102,105,108,101,32,100,101,115,116,101,107,108,101,110,109,105,121,111,114,46,32,67,111,110,102,105,103,32,74,83,79,78,58,10).. jsonStr)
end
end
local function LoadConfigFromFile(name)
if isfile and isfile(string.char(77,97,99,114,111,67,104,101,97,116,67,111,110,102,105,103,115,47).. name ..string.char(46,106,115,111,110)) then
local jsonStr = readfile(string.char(77,97,99,114,111,67,104,101,97,116,67,111,110,102,105,103,115,47).. name ..string.char(46,106,115,111,110))
local success, data = pcall(function() return HttpService:JSONDecode(jsonStr) end)
if success and data then
for k, v in pairs(data) do
if type(v) ==string.char(116,97,98,108,101)and v.__type ==string.char(67,111,108,111,114,51)then
Config[k] = Color3.new(v.r, v.g, v.b)
elseif type(v) ==string.char(116,97,98,108,101)and v.__type ==string.char(69,110,117,109)then
if Enum.KeyCode[v.name] then
Config[k] = Enum.KeyCode[v.name]
elseif Enum.UserInputType[v.name] then
Config[k] = Enum.UserInputType[v.name]
end
else
Config[k] = v
end
end
print(string.char(67,111,110,102,105,103,32,121,195,188,107,108,101,110,100,105,58,32).. name)
end
end
endlocal skyboxIds = {
Minecraft = {
bk =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,55,51,53,49,54,54,55,53,54),
dn =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,55,51,53,49,54,54,55,48,55),
ft =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,55,51,53,50,51,49,54,54,56),
lf =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,55,51,53,49,54,54,55,53,53),
rt =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,55,51,53,49,54,54,55,53,49),
up =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,56,55,51,53,49,54,54,55,50,57)},
Sakura = {
bk =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,53,57,56,51,57,54,56,57,50,50),
dn =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,53,57,56,51,57,54,54,56,50,53),
ft =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,53,57,56,51,57,54,53,48,50,53),
lf =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,53,57,56,51,57,54,55,52,50,48),
rt =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,53,57,56,51,57,54,54,50,52,54),
up =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,53,57,56,51,57,54,52,50,52,54)}
}
local function setSkybox(preset)
local sky = Lighting:FindFirstChild(string.char(68,97,118,101,83,107,121))
if not sky then
sky = Instance.new(string.char(83,107,121), Lighting)
sky.Name =string.char(68,97,118,101,83,107,121)end
if preset ==string.char(77,105,110,101,99,114,97,102,116)then
local ids = skyboxIds.Minecraft
sky.SkyboxBk = ids.bk; sky.SkyboxDn = ids.dn; sky.SkyboxFt = ids.ft
sky.SkyboxLf = ids.lf; sky.SkyboxRt = ids.rt; sky.SkyboxUp = ids.up
elseif preset ==string.char(83,97,107,117,114,97)then
local ids = skyboxIds.Sakura
sky.SkyboxBk = ids.bk; sky.SkyboxDn = ids.dn; sky.SkyboxFt = ids.ft
sky.SkyboxLf = ids.lf; sky.SkyboxRt = ids.rt; sky.SkyboxUp = ids.up
Lighting.Ambient = Color3.fromRGB(255, 200, 230)
Lighting.OutdoorAmbient = Color3.fromRGB(255, 180, 210)
Lighting.Brightness = 1.5
else
sky:Destroy()
end
end
local function updateWorld()
if Config.Fullbright then
Lighting.Brightness = 10
Lighting.Ambient = Color3.fromRGB(255, 255, 255)
Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
Lighting.GlobalShadows = false
else
Lighting.Brightness = originalLighting.Brightness
Lighting.Ambient = originalLighting.Ambient
Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
Lighting.GlobalShadows = originalLighting.GlobalShadows
end
Lighting.ClockTime = Config.TimeOfDay
if Config.RemoveFog then
Lighting.FogEnd = 9000000000
Lighting.FogStart = 9000000000
else
Lighting.FogEnd = originalLighting.FogEnd
Lighting.FogStart = originalLighting.FogStart
end
if Config.MinecraftTexture then
setSkybox(string.char(77,105,110,101,99,114,97,102,116))
elseif Config.SakuraTexture then
setSkybox(string.char(83,97,107,117,114,97))
else
local sky = Lighting:FindFirstChild(string.char(68,97,118,101,83,107,121))
if sky then sky:Destroy() end
end
end
local sakuraParticles = nil
local function toggleSakuraParticles(on)
if on then
if not sakuraParticles then
local p = Instance.new(string.char(80,97,114,116))
p.Name =string.char(83,97,107,117,114,97,80,97,114,116,105,99,108,101,115)p.Size = Vector3.new(1, 1, 1)
p.Transparency = 1
p.Anchored = true
p.CanCollide = false
p.Parent = workspace
local emitter = Instance.new(string.char(80,97,114,116,105,99,108,101,69,109,105,116,116,101,114), p)
emitter.Texture =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,50,52,49,51,57,54,54,53,57)emitter.Color = ColorSequence.new(Color3.fromRGB(255, 180, 210), Color3.fromRGB(255, 220, 240))
emitter.Size = NumberSequence.new(0.3, 0.8)
emitter.Transparency = NumberSequence.new(0.2, 1)
emitter.Lifetime = NumberRange.new(4, 8)
emitter.Speed = NumberRange.new(1, 3)
emitter.Rate = 50
emitter.SpreadAngle = Vector2.new(360, 360)
emitter.Rotation = NumberRange.new(0, 360)
emitter.RotSpeed = NumberRange.new(-20, 20)
emitter.Acceleration = Vector3.new(0, -2, 0)
sakuraParticles = p
end
sakuraParticles.Parent = workspace.CurrentCamera
else
if sakuraParticles then sakuraParticles:Destroy(); sakuraParticles = nil end
end
endlocal function CreateBox(parentCol, title, height)
local Box = Instance.new(string.char(70,114,97,109,101))
Box.Size = UDim2.new(1, 0, 0, height)
Box.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Box.BorderSizePixel = 1
Box.BorderColor3 = Color3.fromRGB(45, 45, 45)
Box.Parent = parentCol
Instance.new(string.char(85,73,67,111,114,110,101,114), Box).CornerRadius = UDim.new(0, 4)
local TitleLabel = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
TitleLabel.Size = UDim2.new(1, -20, 0, 35)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = title
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.Font = Enum.Font.RobotoMono
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Box
local Line = Instance.new(string.char(70,114,97,109,101))
Line.Size = UDim2.new(1, 0, 0, 1)
Line.Position = UDim2.new(0, 0, 0, 35)
Line.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line.BorderSizePixel = 0
Line.Parent = Box
local Container = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101))
Container.Size = UDim2.new(1, -10, 1, -45)
Container.Position = UDim2.new(0, 5, 0, 45)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 2
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
Container.Parent = Box
local Layout = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
Layout.Padding = UDim.new(0, 10)
Layout.Parent = Container
return Container
end
local function CreateNoScrollBox(parentCol, title)
local Box = Instance.new(string.char(70,114,97,109,101))
Box.Size = UDim2.new(1, 0, 0, 0)
Box.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Box.BorderSizePixel = 1
Box.BorderColor3 = Color3.fromRGB(45, 45, 45)
Box.Parent = parentCol
Instance.new(string.char(85,73,67,111,114,110,101,114), Box).CornerRadius = UDim.new(0, 4)
local TitleLabel = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
TitleLabel.Size = UDim2.new(1, -20, 0, 35)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = title
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLabel.Font = Enum.Font.RobotoMono
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = Box
local Line = Instance.new(string.char(70,114,97,109,101))
Line.Size = UDim2.new(1, 0, 0, 1)
Line.Position = UDim2.new(0, 0, 0, 35)
Line.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line.BorderSizePixel = 0
Line.Parent = Box
local Container = Instance.new(string.char(70,114,97,109,101))
Container.Size = UDim2.new(1, -10, 0, 0)
Container.Position = UDim2.new(0, 5, 0, 45)
Container.BackgroundTransparency = 1
Container.Parent = Box
local Layout = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
Layout.Padding = UDim.new(0, 10)
Layout.Parent = Container
Layout.FillDirection = Enum.FillDirection.Vertical
Layout.SortOrder = Enum.SortOrder.LayoutOrder
local function updateHeight()
local totalHeight = 45
for _, child in ipairs(Container:GetChildren()) do
if child:IsA(string.char(70,114,97,109,101)) then
totalHeight = totalHeight + child.Size.Y.Offset + 10
end
end
Box.Size = UDim2.new(1, 0, 0, totalHeight + 10)
end
local debounce = false
local function delayedUpdate()
if debounce then return end
debounce = true
task.wait(0.05)
updateHeight()
debounce = false
end
Layout:GetPropertyChangedSignal(string.char(65,98,115,111,108,117,116,101,67,111,110,116,101,110,116,83,105,122,101)):Connect(delayedUpdate)
Container.ChildAdded:Connect(delayedUpdate)
Container.ChildRemoved:Connect(delayedUpdate)
return Container
end
local function CreateToggle(parent, text, default, callback)
local Frame = Instance.new(string.char(70,114,97,109,101))
Frame.Size = UDim2.new(1, 0, 0, 25)
Frame.BackgroundTransparency = 1
Frame.Parent = parent
local Label = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Label.Size = UDim2.new(0.8, 0, 1, 0)
Label.BackgroundTransparency = 1
Label.Text = text
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.Font = Enum.Font.RobotoMono
Label.TextSize = 13
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.Parent = Frame
local Btn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
Btn.Size = UDim2.new(0, 36, 0, 18)
Btn.Position = UDim2.new(1, -36, 0.5, -9)
Btn.BackgroundColor3 = default and Config.AccentColor or Color3.fromRGB(40, 40, 40)
Btn.Text =""Btn.Parent = Frame
Instance.new(string.char(85,73,67,111,114,110,101,114), Btn).CornerRadius = UDim.new(1, 0)
local Circle = Instance.new(string.char(70,114,97,109,101))
Circle.Size = UDim2.new(0, 14, 0, 14)
Circle.Position = default and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.Parent = Btn
Instance.new(string.char(85,73,67,111,114,110,101,114), Circle).CornerRadius = UDim.new(1, 0)
local state = default
Btn.MouseButton1Click:Connect(function()
state = not state
Btn.BackgroundColor3 = state and Config.AccentColor or Color3.fromRGB(40, 40, 40)
Circle.Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
pcall(callback, state)
end)
return Frame
end
local function CreateSlider(parent, text, min, max, default, symbol, callback)
local Frame = Instance.new(string.char(70,114,97,109,101))
Frame.Size = UDim2.new(1, 0, 0, 35)
Frame.BackgroundTransparency = 1
Frame.Parent = parent
local Label = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Label.Size = UDim2.new(1, 0, 0, 15)
Label.BackgroundTransparency = 1
Label.Text = text
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.Font = Enum.Font.RobotoMono
Label.TextSize = 13
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.Parent = Frame
local BG = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
BG.Size = UDim2.new(1, -10, 0, 14)
BG.Position = UDim2.new(0, 0, 0, 20)
BG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BG.BorderSizePixel = 1
BG.BorderColor3 = Color3.fromRGB(50, 50, 50)
BG.Text =""BG.Parent = Frame
local Fill = Instance.new(string.char(70,114,97,109,101))
local percent = (default - min) / (max - min)
Fill.Size = UDim2.new(percent, 0, 1, 0)
Fill.BackgroundColor3 = Config.AccentColor
Fill.BorderSizePixel = 0
Fill.Parent = BG
local ValLabel = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
ValLabel.Size = UDim2.new(1, 0, 1, 0)
ValLabel.BackgroundTransparency = 1
ValLabel.Text = tostring(default) .. symbol
ValLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ValLabel.Font = Enum.Font.RobotoMono
ValLabel.TextSize = 12
ValLabel.ZIndex = 2
ValLabel.Parent = BG
local sliding = false
local function update(input)
local rel = math.clamp((input.Position.X - BG.AbsolutePosition.X) / BG.AbsoluteSize.X, 0, 1)
Fill.Size = UDim2.new(rel, 0, 1, 0)
local val = math.floor(min + ((max - min) * rel))
ValLabel.Text = tostring(val) .. symbol
pcall(callback, val)
end
BG.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = true; update(input) end
end)
UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end
end)
UserInputService.InputChanged:Connect(function(input)
if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then update(input) end
end)
return Frame
end
local function CreateInput(parent, text, default, callback)
local Frame = Instance.new(string.char(70,114,97,109,101))
Frame.Size = UDim2.new(1, 0, 0, 45)
Frame.BackgroundTransparency = 1
Frame.Parent = parent
local Label = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Label.Size = UDim2.new(1, 0, 0, 15)
Label.BackgroundTransparency = 1
Label.Text = text
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.Font = Enum.Font.RobotoMono
Label.TextSize = 13
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.Parent = Frame
local TextBox = Instance.new(string.char(84,101,120,116,66,111,120))
TextBox.Size = UDim2.new(1, -10, 0, 22)
TextBox.Position = UDim2.new(0, 0, 0, 20)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.BorderSizePixel = 1
TextBox.BorderColor3 = Color3.fromRGB(50, 50, 50)
TextBox.Text = tostring(default)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.RobotoMono
TextBox.TextSize = 13
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame
if callback then
TextBox.FocusLost:Connect(function(enterPressed)
pcall(callback, TextBox.Text, enterPressed)
end)
end
return Frame, TextBox
end
local function CreateButton(parent, text, callback)
local Btn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
Btn.Size = UDim2.new(1, -10, 0, 25)
Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Btn.BorderSizePixel = 1
Btn.BorderColor3 = Color3.fromRGB(50, 50, 50)
Btn.Text = text
Btn.TextColor3 = Color3.fromRGB(180, 180, 180)
Btn.Font = Enum.Font.RobotoMono
Btn.TextSize = 13
Btn.Parent = parent
Btn.MouseButton1Click:Connect(callback)
return Btn
end
local function CreateKeybind(parent, text, defaultVal, callback)
local Frame = Instance.new(string.char(70,114,97,109,101))
Frame.Size = UDim2.new(1, 0, 0, 30)
Frame.BackgroundTransparency = 1
Frame.Parent = parent
local Label = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Label.Size = UDim2.new(0.6, 0, 1, 0)
Label.BackgroundTransparency = 1
Label.Text = text
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.Font = Enum.Font.RobotoMono
Label.TextSize = 13
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.Parent = Frame
local KeyBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
KeyBtn.Size = UDim2.new(0.4, -10, 0, 20)
KeyBtn.Position = UDim2.new(0.6, 0, 0.5, -10)
KeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBtn.BorderSizePixel = 1
KeyBtn.BorderColor3 = Color3.fromRGB(60, 60, 60)
local function GetKeyName(key)
if key.UserInputType == Enum.UserInputType.Keyboard then return key.KeyCode.Name
else return key.UserInputType.Name end
end
local currentKey = defaultVal
KeyBtn.Text = currentKey.Name
KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBtn.Font = Enum.Font.RobotoMono
KeyBtn.TextSize = 12
KeyBtn.Parent = Frame
local IsListening = false
local Connection
KeyBtn.MouseButton1Click:Connect(function()
if IsListening then return end
IsListening = true
KeyBtn.Text =string.char(84,117,197,159,97,32,98,97,115,46,46,46)KeyBtn.TextColor3 = Config.AccentColor
Connection = UserInputService.InputBegan:Connect(function(input, gpe)
if gpe and input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.MouseButton2 then return end
if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType.Name:find(string.char(77,111,117,115,101,66,117,116,116,111,110)) then
currentKey = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType
KeyBtn.Text = GetKeyName(input)
KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
IsListening = false
Connection:Disconnect()
pcall(callback, currentKey)
end
end)
end)
return Frame
end
local function CreateDropdown(parent, text, options, callback)
local Frame = Instance.new(string.char(70,114,97,109,101))
Frame.Size = UDim2.new(1, 0, 0, 50)
Frame.BackgroundTransparency = 1
Frame.Parent = parent
local Label = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Label.Size = UDim2.new(1, 0, 0, 15)
Label.BackgroundTransparency = 1
Label.Text = text
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.Font = Enum.Font.RobotoMono
Label.TextSize = 13
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.Parent = Frame
local MainBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
MainBtn.Size = UDim2.new(1, -10, 0, 25)
MainBtn.Position = UDim2.new(0, 0, 0, 20)
MainBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainBtn.BorderSizePixel = 1
MainBtn.BorderColor3 = Color3.fromRGB(50, 50, 50)
MainBtn.Text =string.char(32,32).. options[1] ..string.char(32,226,150,188)MainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainBtn.Font = Enum.Font.RobotoMono
MainBtn.TextSize = 13
MainBtn.TextXAlignment = Enum.TextXAlignment.Left
MainBtn.Parent = Frame
local DropFrame = Instance.new(string.char(70,114,97,109,101))
DropFrame.Size = UDim2.new(1, 0, 0, #options * 25)
DropFrame.Position = UDim2.new(0, 0, 0, 25)
DropFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DropFrame.BorderSizePixel = 1
DropFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
DropFrame.Visible = false
DropFrame.ZIndex = 10
DropFrame.Parent = MainBtn
local UIList = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
UIList.Parent = DropFrame
local isOpen = false
MainBtn.MouseButton1Click:Connect(function()
isOpen = not isOpen
DropFrame.Visible = isOpen
Frame.Size = isOpen and UDim2.new(1, 0, 0, 50 + (#options * 25)) or UDim2.new(1, 0, 0, 50)
end)
for _, opt in ipairs(options) do
local OptBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
OptBtn.Size = UDim2.new(1, 0, 0, 25)
OptBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
OptBtn.BorderSizePixel = 0
OptBtn.Text =string.char(32,32).. opt
OptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
OptBtn.Font = Enum.Font.RobotoMono
OptBtn.TextSize = 13
OptBtn.TextXAlignment = Enum.TextXAlignment.Left
OptBtn.ZIndex = 11
OptBtn.Parent = DropFrame
OptBtn.MouseButton1Click:Connect(function()
MainBtn.Text =string.char(32,32).. opt ..string.char(32,226,150,188)isOpen = false
DropFrame.Visible = false
Frame.Size = UDim2.new(1, 0, 0, 50)
pcall(callback, opt)
end)
end
return Frame
end
local function CreateColorPicker(parent, text, callback)
local Frame = Instance.new(string.char(70,114,97,109,101))
Frame.Size = UDim2.new(1, 0, 0, 35)
Frame.BackgroundTransparency = 1
Frame.Parent = parent
local Label = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Label.Size = UDim2.new(1, 0, 0, 15)
Label.BackgroundTransparency = 1
Label.Text = text
Label.TextColor3 = Color3.fromRGB(220, 220, 220)
Label.Font = Enum.Font.RobotoMono
Label.TextSize = 13
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.Parent = Frame
local PreviewBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
PreviewBtn.Size = UDim2.new(1, -10, 0, 15)
PreviewBtn.Position = UDim2.new(0, 0, 0, 20)
PreviewBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PreviewBtn.BorderSizePixel = 1
PreviewBtn.BorderColor3 = Color3.fromRGB(50, 50, 50)
PreviewBtn.Text =string.char(82,101,110,107,32,83,101,195,167)PreviewBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
PreviewBtn.Font = Enum.Font.RobotoMono
PreviewBtn.TextSize = 11
PreviewBtn.Parent = Frame
local SlidersBox = Instance.new(string.char(70,114,97,109,101))
SlidersBox.Size = UDim2.new(1, 0, 0, 105)
SlidersBox.Position = UDim2.new(0, 0, 0, 40)
SlidersBox.BackgroundTransparency = 1
SlidersBox.Visible = false
SlidersBox.Parent = Frame
local r, g, b = 255, 255, 255
local function UpdateColor()
PreviewBtn.BackgroundColor3 = Color3.fromRGB(r, g, b)
pcall(callback, Color3.fromRGB(r, g, b))
end
local function MiniSlider(yPos, colorName, barColor, updateVarCallback)
local SFrame = Instance.new(string.char(70,114,97,109,101), SlidersBox)
SFrame.Size = UDim2.new(1, 0, 0, 30)
SFrame.Position = UDim2.new(0, 0, 0, yPos)
SFrame.BackgroundTransparency = 1
local SLabel = Instance.new(string.char(84,101,120,116,76,97,98,101,108), SFrame)
SLabel.Size = UDim2.new(0, 15, 1, 0)
SLabel.BackgroundTransparency = 1
SLabel.Text = colorName
SLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SLabel.Font = Enum.Font.RobotoMono
SLabel.TextSize = 12
local BG = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), SFrame)
BG.Size = UDim2.new(1, -35, 0, 10)
BG.Position = UDim2.new(0, 25, 0.5, -5)
BG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BG.Text =""local Fill = Instance.new(string.char(70,114,97,109,101), BG)
Fill.Size = UDim2.new(1, 0, 1, 0)
Fill.BackgroundColor3 = barColor
Fill.BorderSizePixel = 0
local sliding = false
BG.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = true end end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end end)
UserInputService.InputChanged:Connect(function(input)
if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then
local rel = math.clamp((input.Position.X - BG.AbsolutePosition.X) / BG.AbsoluteSize.X, 0, 1)
Fill.Size = UDim2.new(rel, 0, 1, 0)
updateVarCallback(math.floor(rel * 255))
end
end)
end
MiniSlider(0,string.char(82), Color3.fromRGB(255, 50, 50), function(val) r = val; UpdateColor() end)
MiniSlider(35,string.char(71), Color3.fromRGB(50, 255, 50), function(val) g = val; UpdateColor() end)
MiniSlider(70,string.char(66), Color3.fromRGB(50, 50, 255), function(val) b = val; UpdateColor() end)
local isOpen = false
PreviewBtn.MouseButton1Click:Connect(function()
isOpen = not isOpen
SlidersBox.Visible = isOpen
Frame.Size = isOpen and UDim2.new(1, 0, 0, 150) or UDim2.new(1, 0, 0, 35)
end)
return Frame
end
local function CreateTargetCard(parent)
local Frame = Instance.new(string.char(70,114,97,109,101), parent)
Frame.Size = UDim2.new(1, -10, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 1
Frame.BorderColor3 = Color3.fromRGB(50, 50, 50)
Instance.new(string.char(85,73,67,111,114,110,101,114), Frame).CornerRadius = UDim.new(0, 6)
local Avatar = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108), Frame)
Avatar.Size = UDim2.new(0, 80, 0, 80)
Avatar.Position = UDim2.new(0, 10, 0, 10)
Avatar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Avatar.Image =string.char(114,98,120,97,115,115,101,116,58,47,47,116,101,120,116,117,114,101,115,47,117,105,47,71,117,105,73,109,97,103,101,80,108,97,99,101,104,111,108,100,101,114,46,112,110,103)Instance.new(string.char(85,73,67,111,114,110,101,114), Avatar).CornerRadius = UDim.new(0, 8)
local InfoFrame = Instance.new(string.char(70,114,97,109,101), Frame)
InfoFrame.Size = UDim2.new(1, -100, 1, -20)
InfoFrame.Position = UDim2.new(0, 100, 0, 10)
InfoFrame.BackgroundTransparency = 1
local UIList = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116), InfoFrame)
UIList.Padding = UDim.new(0, 5)
local NameLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108), InfoFrame)
NameLbl.Size = UDim2.new(1, 0, 0, 15)
NameLbl.BackgroundTransparency = 1
NameLbl.Text =string.char(72,101,100,101,102,58,32,89,111,107)NameLbl.TextColor3 = Color3.new(1,1,1)
NameLbl.Font = Enum.Font.RobotoMono
NameLbl.TextSize = 13
NameLbl.TextXAlignment = Enum.TextXAlignment.Left
local IDLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108), InfoFrame)
IDLbl.Size = UDim2.new(1, 0, 0, 15)
IDLbl.BackgroundTransparency = 1
IDLbl.Text =string.char(73,68,58,32,45)IDLbl.TextColor3 = Color3.fromRGB(180,180,180)
IDLbl.Font = Enum.Font.RobotoMono
IDLbl.TextSize = 12
IDLbl.TextXAlignment = Enum.TextXAlignment.Left
return Frame, NameLbl, Avatar, IDLbl
endlocal MainFrame = Instance.new(string.char(70,114,97,109,101))
MainFrame.Size = UDim2.new(0, 800, 0, 600)
MainFrame.Position = UDim2.new(0.5, -400, 0.5, -300)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Active = true
MainFrame.Parent = ScreenGui
MainFrame.Visible = true
Instance.new(string.char(85,73,67,111,114,110,101,114), MainFrame).CornerRadius = UDim.new(0, 6)
local SideBar = Instance.new(string.char(70,114,97,109,101))
SideBar.Size = UDim2.new(0, 220, 1, -25)
SideBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame
Instance.new(string.char(85,73,67,111,114,110,101,114), SideBar).CornerRadius = UDim.new(0, 6)
local TopBar = Instance.new(string.char(70,114,97,109,101))
TopBar.Size = UDim2.new(1, -221, 0, 60)
TopBar.Position = UDim2.new(0, 221, 0, 0)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrameUserInputService.InputBegan:Connect(function(input, processed)
if not processed then
if input.KeyCode == Config.MenuToggleKey or input.UserInputType == Config.MenuToggleKey then
MainFrame.Visible = not MainFrame.Visible
end
end
end)local dragging, dragInput, dragStart, startPos
local function enableDragOnFrame(dragFrame)
dragFrame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true; dragStart = input.Position; startPos = MainFrame.Position
input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
end
end)
dragFrame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
end
enableDragOnFrame(TopBar)
enableDragOnFrame(SideBar)
UserInputService.InputChanged:Connect(function(input)
if input == dragInput and dragging then
local delta = input.Position - dragStart
MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
end)
local SideLine = Instance.new(string.char(70,114,97,109,101))
SideLine.Size = UDim2.new(0, 1, 1, 0)
SideLine.Position = UDim2.new(1, 0, 0, 0)
SideLine.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SideLine.BorderSizePixel = 0
SideLine.Parent = SideBar
local Title = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundTransparency = 1
Title.Text =string.char(77,97,99,114,111,32,67,104,101,97,116)Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.RobotoMono
Title.TextSize = 20
Title.Parent = SideBar
local TitleLine = Instance.new(string.char(70,114,97,109,101))
TitleLine.Size = UDim2.new(1, 0, 0, 1)
TitleLine.Position = UDim2.new(0, 0, 0, 1)
TitleLine.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleLine.BorderSizePixel = 0
TitleLine.Parent = Title
local TopLine = Instance.new(string.char(70,114,97,109,101))
TopLine.Size = UDim2.new(1, 0, 0, 1)
TopLine.Position = UDim2.new(0, 0, 1, 0)
TopLine.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TopLine.BorderSizePixel = 0
TopLine.Parent = TopBar
local SearchBox = Instance.new(string.char(84,101,120,116,66,111,120))
SearchBox.Size = UDim2.new(1, -60, 0, 30)
SearchBox.Position = UDim2.new(0, 20, 0.5, -15)
SearchBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
SearchBox.BorderSizePixel = 1
SearchBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
SearchBox.Text =string.char(32,32,65,114,97,109,97,32,121,97,112,46,46,46)SearchBox.TextColor3 = Color3.fromRGB(120, 120, 120)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 13
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = TopBar
Instance.new(string.char(85,73,67,111,114,110,101,114), SearchBox).CornerRadius = UDim.new(0, 4)
local BottomBar = Instance.new(string.char(70,114,97,109,101))
BottomBar.Size = UDim2.new(1, 0, 0, 25)
BottomBar.Position = UDim2.new(0, 0, 1, -25)
BottomBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BottomBar.BorderSizePixel = 0
BottomBar.Parent = MainFrame
Instance.new(string.char(85,73,67,111,114,110,101,114), BottomBar).CornerRadius = UDim.new(0, 6)
local BottomLine = Instance.new(string.char(70,114,97,109,101))
BottomLine.Size = UDim2.new(1, 0, 0, 1)
BottomLine.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BottomLine.BorderSizePixel = 0
BottomLine.Parent = BottomBar
local BottomText = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
BottomText.Size = UDim2.new(1, 0, 1, 0)
BottomText.BackgroundTransparency = 1
BottomText.Text =string.char(66,101,115,116,32,107,101,121,108,101,115,115,32,117,110,100,101,116,101,99,116,101,100,32,99,104,101,97,116,32,60,51)BottomText.TextColor3 = Color3.fromRGB(120, 120, 120)
BottomText.Font = Enum.Font.RobotoMono
BottomText.TextSize = 12
BottomText.Parent = BottomBar
local ContentArea = Instance.new(string.char(70,114,97,109,101))
ContentArea.Size = UDim2.new(1, -221, 1, -86)
ContentArea.Position = UDim2.new(0, 221, 0, 61)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFramelocal Pages = {}
local function BuildPage(name)
local PageFrame = Instance.new(string.char(70,114,97,109,101))
PageFrame.Size = UDim2.new(1, 0, 1, 0)
PageFrame.BackgroundTransparency = 1
PageFrame.Visible = false
PageFrame.Parent = ContentArea
Pages[name] = PageFrame
local LCol = Instance.new(string.char(70,114,97,109,101))
LCol.Size = UDim2.new(0.5, -20, 1, -20)
LCol.Position = UDim2.new(0, 15, 0, 15)
LCol.BackgroundTransparency = 1
LCol.Parent = PageFrame
Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116), LCol).Padding = UDim.new(0, 15)
local RCol = Instance.new(string.char(70,114,97,109,101))
RCol.Size = UDim2.new(0.5, -20, 1, -20)
RCol.Position = UDim2.new(0.5, 5, 0, 15)
RCol.BackgroundTransparency = 1
RCol.Parent = PageFrame
Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116), RCol).Padding = UDim.new(0, 15)
return LCol, RCol
end
local function RegisterTab(name, yPos)
local TabBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
TabBtn.Size = UDim2.new(1, 0, 0, 35)
TabBtn.Position = UDim2.new(0, 0, 0, yPos)
TabBtn.BackgroundTransparency = 1
TabBtn.Text =string.char(32,32,32,32).. name
TabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
TabBtn.Font = Enum.Font.GothamMedium
TabBtn.TextSize = 13
TabBtn.TextXAlignment = Enum.TextXAlignment.Left
TabBtn.Parent = SideBar
TabBtn.MouseButton1Click:Connect(function()
for pageName, pageFrame in pairs(Pages) do
pageFrame.Visible = false
end
Pages[name].Visible = true
for _, btn in pairs(SideBar:GetChildren()) do
if btn:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) then
btn.TextColor3 = Color3.fromRGB(150, 150, 150)
end
end
TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)
endlocal PLeft, PRight = BuildPage(string.char(80,108,97,121,101,114))
RegisterTab(string.char(80,108,97,121,101,114), 65)
Pages[string.char(80,108,97,121,101,114)].Visible = true
local PFeaturesContainer = CreateNoScrollBox(PLeft,string.char(80,108,97,121,101,114,32,70,101,97,116,117,114,101,115))
CreateToggle(PFeaturesContainer,string.char(83,112,101,101,100), false, function(v) Config.Speed = v end)
CreateToggle(PFeaturesContainer,string.char(74,117,109,112,32,80,111,119,101,114), false, function(v) Config.Jump = v; applyJumpPower() end)
CreateToggle(PFeaturesContainer,string.char(83,112,105,110,98,111,116), false, function(v) Config.Spinbot = v end)
CreateToggle(PFeaturesContainer,string.char(78,111,99,108,105,112), false, function(v) Config.Noclip = v; updateNoclip() end)
CreateToggle(PFeaturesContainer,string.char(66,117,110,110,121,104,111,112), false, function(v) Config.Bunnyhop = v end)
CreateToggle(PFeaturesContainer,string.char(73,110,102,105,110,105,116,101,32,74,117,109,112), false, function(v) Config.InfJump = v end)
CreateToggle(PFeaturesContainer,string.char(70,108,121), false, function(v) Config.Fly = v; if v then startFly() else stopFly() end end)
CreateToggle(PFeaturesContainer,string.char(67,108,105,99,107,32,84,80,32,40,67,116,114,108,32,43,32,67,108,105,99,107,41), false, function(v) Config.ClickTP = v end)
CreateToggle(PFeaturesContainer,string.char(70,79,86,32,67,104,97,110,103,101,114), false, function(v) Config.FOVChanger = v end)
local PAdjustContainer = CreateNoScrollBox(PRight,string.char(65,100,106,117,115,116,109,101,110,116,115))
CreateSlider(PAdjustContainer,string.char(83,112,101,101,100,32,86,97,108,117,101), 16, 500, 16,string.char(32,115,112,100), function(v) Config.SpeedVal = v end)
CreateSlider(PAdjustContainer,string.char(74,117,109,112,32,72,101,105,103,104,116), 50, 500, 50,string.char(32,106,109,112), function(v) Config.JumpVal = v; applyJumpPower() end)
CreateSlider(PAdjustContainer,string.char(83,112,105,110,32,83,112,101,101,100), 0, 100, 10,string.char(32,100,101,103), function(v) Config.SpinSpeed = v end)
CreateSlider(PAdjustContainer,string.char(70,108,121,32,83,112,101,101,100), 1, 150, 50,string.char(32,115,112,100), function(v) Config.FlySpeed = v end)
CreateSlider(PAdjustContainer,string.char(67,97,109,101,114,97,32,70,79,86), 10, 120, 70,string.char(32,100,101,103), function(v) Config.CamFOV = v end)
CreateButton(PAdjustContainer,string.char(82,101,115,101,116,32,65,108,108,32,83,101,116,116,105,110,103,115), function()
Config.Speed = false; Config.SpeedVal = 16
Config.Jump = false; Config.JumpVal = 50
Config.Spinbot = false; Config.SpinSpeed = 100
Config.Noclip = false; Config.Fly = false
stopFly()
removeCustomMorph()
print(string.char(84,195,188,109,32,97,121,97,114,108,97,114,32,115,196,177,102,196,177,114,108,97,110,100,196,177,46))
end)local VLeft, VRight = BuildPage(string.char(86,105,115,117,97,108,115))
RegisterTab(string.char(86,105,115,117,97,108,115), 100)
local VFeatures = CreateBox(VLeft,string.char(69,83,80,32,83,101,116,116,105,110,103,115), 280)
CreateToggle(VFeatures,string.char(67,104,97,109,115), false, function(v) Config.Chams = v end)
CreateToggle(VFeatures,string.char(76,105,110,101,32,69,83,80), false, function(v) Config.LineESP = v end)
CreateToggle(VFeatures,string.char(68,105,115,116,97,110,99,101), false, function(v) Config.DistanceESP = v end)
CreateToggle(VFeatures,string.char(66,111,120,32,69,83,80), false, function(v) Config.BoxESP = v end)
CreateToggle(VFeatures,string.char(83,107,101,108,101,116,111,110), false, function(v) Config.SkeletonESP = v end)
CreateToggle(VFeatures,string.char(84,101,97,109,32,67,104,101,99,107,32,40,69,83,80,41), Config.ESPTeamCheck, function(v) Config.ESPTeamCheck = v end)
local VColors = CreateBox(VRight,string.char(86,105,115,117,97,108,115,32,67,111,108,111,114,115), 480)
CreateColorPicker(VColors,string.char(67,104,97,109,115,32,67,111,108,111,114), function(color) Config.ChamsColor = color end)
CreateColorPicker(VColors,string.char(66,111,120,32,67,111,108,111,114), function(color) Config.BoxColor = color end)
CreateColorPicker(VColors,string.char(83,107,101,108,101,116,111,110,32,67,111,108,111,114), function(color) Config.SkeletonColor = color end)
CreateColorPicker(VColors,string.char(68,105,115,116,97,110,99,101,32,67,111,108,111,114), function(color) Config.DistanceColor = color end)
CreateToggle(VColors,string.char(82,97,105,110,98,111,119,32,69,83,80), false, function(v) Config.RainbowESP = v end)local ALeft, ARight = BuildPage(string.char(65,105,109,98,111,116))
RegisterTab(string.char(65,105,109,98,111,116), 135)
local AFeatures = CreateBox(ALeft,string.char(67,111,109,98,97,116,32,70,101,97,116,117,114,101,115), 250)
CreateToggle(AFeatures,string.char(65,105,109,98,111,116), false, function(v) Config.Aimbot = v end)
CreateToggle(AFeatures,string.char(87,97,108,108,32,67,104,101,99,107), true, function(v) Config.WallCheck = v end)
CreateToggle(AFeatures,string.char(84,101,97,109,32,67,104,101,99,107,32,40,65,105,109,98,111,116,41), Config.AimbotTeamCheck, function(v) Config.AimbotTeamCheck = v end)
CreateToggle(AFeatures,string.char(68,114,97,119,32,70,79,86), false, function(v) Config.DrawFOV = v end)
local ASettings = CreateBox(ARight,string.char(65,105,109,98,111,116,32,83,101,116,116,105,110,103,115), 350)
CreateDropdown(ASettings,string.char(84,97,114,103,101,116,32,80,97,114,116), {string.char(72,101,97,100),string.char(84,111,114,115,111),string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)}, function(opt) Config.TargetPart = opt end)
CreateSlider(ASettings,string.char(70,79,86,32,82,97,100,105,117,115), 0, 1000, 150,string.char(32,112,120), function(v) Config.FOVRadius = v end)
CreateSlider(ASettings,string.char(83,109,111,111,116,104,110,101,115,115), 1, 50, 5,string.char(32,115,112,100), function(v) Config.Smoothness = v end)
CreateKeybind(ASettings,string.char(65,105,109,32,75,101,121), Enum.UserInputType.MouseButton2, function(key) Config.AimKey = key end)local TLeft, TRight = BuildPage(string.char(84,97,114,103,101,116))
RegisterTab(string.char(84,97,114,103,101,116), 170)
local TProfile = CreateBox(TLeft,string.char(84,97,114,103,101,116,32,73,110,102,111), 200)
local TargetCardFrame, TNameLbl, TAvatar, TIDLbl = CreateTargetCard(TProfile)
local TActions = CreateBox(TRight,string.char(84,97,114,103,101,116,32,65,99,116,105,111,110,115), 350)
local SearchFrame, SearchInputBox = CreateInput(TActions,string.char(83,101,97,114,99,104,32,84,97,114,103,101,116,32,40,107,196,177,115,109,105,32,105,115,105,109,32,121,101,116,101,114,108,105,41),"")
local function SearchPlayerByName(searchText)
if searchText == nil or searchText ==""then return nil end
local lowerSearch = string.lower(searchText)
local bestMatch = nil
local bestScore = 0
for _, plr in pairs(Players:GetPlayers()) do
if plr ~= LocalPlayer then
local lowerName = string.lower(plr.Name)
local lowerDisplay = string.lower(plr.DisplayName)
if lowerName == lowerSearch or lowerDisplay == lowerSearch then return plr end
if string.find(lowerName, lowerSearch, 1, true) then
local score = string.len(lowerSearch) / string.len(lowerName)
if score > bestScore then bestScore = score; bestMatch = plr end
elseif string.find(lowerDisplay, lowerSearch, 1, true) then
local score = string.len(lowerSearch) / string.len(lowerDisplay)
if score > bestScore then bestScore = score; bestMatch = plr end
end
end
end
return bestMatch
end
local function UpdateTargetCard(player)
if player then
TNameLbl.Text =string.char(84,97,114,103,101,116,58,32).. player.DisplayName ..string.char(32,40,64).. player.Name ..string.char(41)TIDLbl.Text =string.char(73,68,58,32).. player.UserId
TAvatar.Image =string.char(104,116,116,112,115,58,47,47,119,119,119,46,114,111,98,108,111,120,46,99,111,109,47,104,101,97,100,115,104,111,116,45,116,104,117,109,98,110,97,105,108,47,105,109,97,103,101,63,117,115,101,114,73,100,61).. player.UserId ..string.char(38,119,105,100,116,104,61,52,50,48,38,104,101,105,103,104,116,61,52,50,48,38,102,111,114,109,97,116,61,112,110,103)else
TNameLbl.Text =string.char(84,97,114,103,101,116,58,32,78,111,110,101)TIDLbl.Text =string.char(73,68,58,32,45)TAvatar.Image =string.char(114,98,120,97,115,115,101,116,58,47,47,116,101,120,116,117,114,101,115,47,117,105,47,71,117,105,73,109,97,103,101,80,108,97,99,101,104,111,108,100,101,114,46,112,110,103)end
end
SearchInputBox.FocusLost:Connect(function(enterPressed)
if enterPressed and SearchInputBox.Text ~=""then
local foundPlayer = SearchPlayerByName(SearchInputBox.Text)
if foundPlayer then
currentTarget = foundPlayer
UpdateTargetCard(currentTarget)
else
currentTarget = nil
UpdateTargetCard(nil)
TNameLbl.Text =string.char(84,97,114,103,101,116,58,32,66,117,108,117,110,97,109,97,100,196,177,33)end
end
end)
local function TeleportToTarget(targetPlayer)
if not targetPlayer then return end
local targetChar = targetPlayer.Character
if not targetChar then return end
local targetRoot = targetChar:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not targetRoot then return end
local localChar = LocalPlayer.Character
if not localChar then return end
local localRoot = localChar:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not localRoot then return end
localRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 2, 2)
end
local function StartSpectate(targetPlayer)
if not targetPlayer then return end
if isSpectating then StopSpectate() end
currentTarget = targetPlayer
isSpectating = true
Camera.CameraType = Enum.CameraType.Scriptable
spectateYaw = 0
spectatePitch = -20
local mouseConnection = UserInputService.InputChanged:Connect(function(input, gameProcessed)
if not isSpectating then if mouseConnection then mouseConnection:Disconnect() end return end
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.MouseMovement then
local delta = input.Delta
spectateYaw = spectateYaw - delta.X * 0.005
spectatePitch = math.clamp(spectatePitch - delta.Y * 0.005, -1.4, 1.4)
end
end)
local renderConnection = RunService.RenderStepped:Connect(function()
if not isSpectating or not currentTarget then
if renderConnection then renderConnection:Disconnect() end
return
end
local char = currentTarget.Character
if not char then return end
local root = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not root then return end
local targetPos = root.Position + Vector3.new(0, 1.5, 0)
local yawRad = math.rad(spectateYaw)
local pitchRad = math.rad(spectatePitch)
local direction = Vector3.new(math.cos(yawRad) * math.cos(pitchRad), math.sin(pitchRad), math.sin(yawRad) * math.cos(pitchRad))
local distance = 6
local camPos = targetPos - direction * distance
Camera.CFrame = CFrame.new(camPos, targetPos)
end)
local charAddedConnection = currentTarget.CharacterAdded:Connect(function(newChar) task.wait(0.5) end)
spectateConnection = {
mouse = mouseConnection,
render = renderConnection,
charAdded = charAddedConnection
}
end
local function StopSpectate()
if not isSpectating then return end
isSpectating = false
if spectateConnection then
if spectateConnection.mouse then spectateConnection.mouse:Disconnect() end
if spectateConnection.render then spectateConnection.render:Disconnect() end
if spectateConnection.charAdded then spectateConnection.charAdded:Disconnect() end
spectateConnection = nil
end
Camera.CameraType = Enum.CameraType.Custom
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100)) then
Camera.CameraSubject = LocalPlayer.Character.Humanoid
end
end
local SpectateBtn = CreateButton(TActions,string.char(83,112,101,99,116,97,116,101,32,84,97,114,103,101,116), function()
if currentTarget then
if isSpectating then
StopSpectate()
SpectateBtn.Text =string.char(83,112,101,99,116,97,116,101,32,84,97,114,103,101,116)else
StartSpectate(currentTarget)
SpectateBtn.Text =string.char(83,116,111,112,32,83,112,101,99,116,97,116,101)end
end
end)
CreateButton(TActions,string.char(84,101,108,101,112,111,114,116,32,116,111,32,84,97,114,103,101,116), function()
if currentTarget then TeleportToTarget(currentTarget) end
end)local WLeft, WRight = BuildPage(string.char(87,111,114,108,100))
RegisterTab(string.char(87,111,114,108,100), 205)
local WFeatures = CreateBox(WLeft,string.char(87,111,114,108,100,32,84,101,120,116,117,114,101,115), 250)
CreateToggle(WFeatures,string.char(83,97,107,117,114,97,32,84,101,120,116,117,114,101), false, function(v)
Config.SakuraTexture = v
if v then Config.MinecraftTexture = false end
toggleSakuraParticles(v)
updateWorld()
end)
CreateToggle(WFeatures,string.char(77,105,110,101,99,114,97,102,116,32,84,101,120,116,117,114,101), false, function(v)
Config.MinecraftTexture = v
if v then Config.SakuraTexture = false end
toggleSakuraParticles(false)
updateWorld()
end)
local WLighting = CreateBox(WRight,string.char(76,105,103,104,116,105,110,103,32,38,32,65,109,98,105,101,110,99,101), 300)
CreateToggle(WLighting,string.char(70,117,108,108,98,114,105,103,104,116), false, function(v) Config.Fullbright = v; updateWorld() end)
CreateToggle(WLighting,string.char(82,101,109,111,118,101,32,70,111,103), false, function(v) Config.RemoveFog = v; updateWorld() end)
CreateSlider(WLighting,string.char(84,105,109,101,32,111,102,32,68,97,121), 0, 24, 12,string.char(32,104,114,115), function(v) Config.TimeOfDay = v; updateWorld() end)local MorphLeft, MorphRight = BuildPage(string.char(77,111,114,112,104))
RegisterTab(string.char(77,111,114,112,104), 240)
local MorphInputs = CreateBox(MorphLeft,string.char(67,117,115,116,111,109,32,66,108,101,110,100,101,114,32,77,111,100,101,108,32,83,101,116,117,112), 420)
local MeshFrame, MeshInputBox = CreateInput(MorphInputs,string.char(66,108,101,110,100,101,114,32,77,101,115,104,32,70,105,108,101,32,47,32,73,68,32,40,195,150,114,110,58,32,115,117,107,117,110,97,95,114,121,111,109,101,110,95,114,49,53,95,97,114,97,46,111,98,106,41),string.char(115,117,107,117,110,97,95,114,121,111,109,101,110,95,114,49,53,95,97,114,97,46,111,98,106), function(txt)
Config.CustomMeshID = txt
end)
local TextureFrame, TextureInputBox = CreateInput(MorphInputs,string.char(84,101,120,116,117,114,101,32,70,105,108,101,32,47,32,73,68,32,40,196,176,115,116,101,196,159,101,32,66,97,196,159,108,196,177,41), Config.CustomTextureID, function(txt)
Config.CustomTextureID = txt
end)
CreateSlider(MorphInputs,string.char(77,111,100,101,108,32,66,111,121,117,116,117,32,40,83,99,97,108,101,41), 1, 20, 5,string.char(120), function(v)
updateMorphScaleAndOffset(v, Config.CustomOffsetY)
end)
CreateSlider(MorphInputs,string.char(77,111,100,101,108,32,89,195,188,107,115,101,107,108,105,107,32,79,102,102,115,101,116,32,40,89,41), -10, 10, 0,string.char(32,115,116,117,100,115), function(v)
updateMorphScaleAndOffset(Config.CustomModelScale, v)
end)
CreateButton(MorphInputs,string.char(77,111,100,101,108,105,32,75,97,114,97,107,116,101,114,101,32,85,121,103,117,108,97,32,40,77,111,114,112,104,41), function()
local meshText = MeshInputBox.Text
local textureText = TextureInputBox.Text
applyCustomMorph(meshText, textureText, Config.CustomModelScale, Config.CustomOffsetY)
end)
CreateButton(MorphInputs,string.char(86,97,114,115,97,121,196,177,108,97,110,32,75,97,114,97,107,116,101,114,101,32,68,195,182,110), function()
removeCustomMorph()
end)local MLeft, MRight = BuildPage(string.char(77,105,115,99))
RegisterTab(string.char(77,105,115,99), 275)
local MFeatures = CreateBox(MLeft,string.char(77,105,115,99,101,108,108,97,110,101,111,117,115), 280)
CreateToggle(MFeatures,string.char(65,110,116,105,45,70,108,105,110,103), false, function(v) Config.AntiFling = v end)
CreateToggle(MFeatures,string.char(65,117,116,111,32,70,97,114,109), false, function(v) Config.AutoFarm = v end)
CreateToggle(MFeatures,string.char(70,80,83,32,85,110,108,111,99,107,101,114), true, function(v)
Config.FPSUnlocker = v
if setfpscap then setfpscap(v and 240 or 60) end
end)
CreateToggle(MFeatures,string.char(73,110,118,105,115,105,98,105,108,105,116,121,32,40,70,69,32,83,101,114,118,101,114,41), false, function(v)
Config.Invisibility = v
toggleInvisibility(v)
end)
local MExtra = CreateBox(MRight,string.char(69,120,116,114,97,32,85,116,105,108,105,116,105,101,115), 220)
CreateButton(MExtra,string.char(82,101,106,111,105,110,32,83,101,114,118,101,114), function() RejoinServer() end)
CreateButton(MExtra,string.char(83,101,114,118,101,114,32,72,111,112), function() ServerHop() end)local CLeft, CRight = BuildPage(string.char(67,65,82,82))
RegisterTab(string.char(67,65,82,82), 310)
local CFeatures = CreateBox(CLeft,string.char(86,101,104,105,99,108,101,32,66,111,111,115,116,32,83,101,116,116,105,110,103,115), 320)
local CarBoostSubBox = Instance.new(string.char(70,114,97,109,101))
CarBoostSubBox.Size = UDim2.new(1, 0, 0, 180)
CarBoostSubBox.BackgroundTransparency = 1
CarBoostSubBox.Visible = false
CreateToggle(CFeatures,string.char(67,97,114,32,66,111,111,115,116,32,65,99,116,105,118,101), false, function(v)
Config.CarBoost = v
CarBoostSubBox.Visible = v
end)
CarBoostSubBox.Parent = CFeatures
local SubLayout = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116), CarBoostSubBox)
SubLayout.Padding = UDim.new(0, 10)
CreateKeybind(CarBoostSubBox,string.char(66,111,111,115,116,32,75,101,121), Enum.KeyCode.LeftShift, function(key)
Config.CarBoostKey = key
end)
CreateSlider(CarBoostSubBox,string.char(66,111,111,115,116,32,83,112,101,101,100,32,40,107,109,47,104,41), 10, 500, 100,string.char(32,107,109,104), function(v)
Config.CarBoostSpeed = v
end)
local CStatus = CreateBox(CRight,string.char(86,101,104,105,99,108,101,32,83,116,97,116,117,115,32,38,32,73,110,102,111), 280)
local SeatStatusLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108), CStatus)
SeatStatusLbl.Size = UDim2.new(1, 0, 0, 25)
SeatStatusLbl.BackgroundTransparency = 1
SeatStatusLbl.Text =string.char(83,116,97,116,117,115,58,32,78,111,116,32,105,110,32,86,101,104,105,99,108,101)SeatStatusLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
SeatStatusLbl.Font = Enum.Font.RobotoMono
SeatStatusLbl.TextSize = 13
SeatStatusLbl.TextXAlignment = Enum.TextXAlignment.Left
local SpeedLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108), CStatus)
SpeedLbl.Size = UDim2.new(1, 0, 0, 25)
SpeedLbl.BackgroundTransparency = 1
SpeedLbl.Text =string.char(83,112,101,101,100,58,32,48,32,107,109,47,104)SpeedLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLbl.Font = Enum.Font.RobotoMono
SpeedLbl.TextSize = 13
SpeedLbl.TextXAlignment = Enum.TextXAlignment.Left
RunService.Heartbeat:Connect(function()
local char = LocalPlayer.Character
if char then
local humanoid = char:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if humanoid and humanoid.SeatPart then
local seat = humanoid.SeatPart
SeatStatusLbl.Text =string.char(83,116,97,116,117,115,58,32,68,114,105,118,105,110,103,32,40).. seat.Name ..string.char(41)SeatStatusLbl.TextColor3 = Config.AccentColor
local velocity = seat.AssemblyLinearVelocity.Magnitude
SpeedLbl.Text =string.char(83,112,101,101,100,58,32).. math.floor(velocity * 0.28) ..string.char(32,107,109,47,104,32,40).. math.floor(velocity) ..string.char(32,115,116,117,100,115,47,115,41)else
SeatStatusLbl.Text =string.char(83,116,97,116,117,115,58,32,78,111,116,32,105,110,32,86,101,104,105,99,108,101)SeatStatusLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLbl.Text =string.char(83,112,101,101,100,58,32,48,32,107,109,47,104)end
end
end)local AnimLeft, AnimRight = BuildPage(string.char(65,110,105,109,97,116,105,111,110,115))
RegisterTab(string.char(65,110,105,109,97,116,105,111,110,115), 345)
local AnimBox = CreateBox(AnimLeft,string.char(82,111,98,108,111,120,32,67,104,97,114,97,99,116,101,114,32,65,110,105,109,97,116,105,111,110,115), 220)
local isZombieAnimActive = false
local ZombieBtn = CreateButton(AnimBox,string.char(90,111,109,98,105,101,32,65,110,105,109,97,116,105,111,110,32,66,97,197,159,108,97,116), function()
isZombieAnimActive = not isZombieAnimActive
if isZombieAnimActive then
playCustomAnimation(string.char(54,49,54,49,53,56,48,57,52))
else
stopCurrentAnimation()
end
end)
CreateButton(AnimBox,string.char(65,110,105,109,97,115,121,111,110,117,32,68,117,114,100,117,114,32,40,83,116,111,112,41), function()
isZombieAnimActive = false
stopCurrentAnimation()
end)local SLeft, SRight = BuildPage(string.char(83,101,116,116,105,110,103,115))
RegisterTab(string.char(83,101,116,116,105,110,103,115), 380)
local SUI = CreateBox(SLeft,string.char(77,101,110,117,32,83,101,116,116,105,110,103,115), 320)
CreateDropdown(SUI,string.char(77,101,110,117,32,84,111,103,103,108,101,32,75,101,121), {string.char(82,105,103,104,116,67,111,110,116,114,111,108),string.char(73,110,115,101,114,116),string.char(82,105,103,104,116,83,104,105,102,116)}, function(opt)
if opt ==string.char(82,105,103,104,116,67,111,110,116,114,111,108)then Config.MenuToggleKey = Enum.KeyCode.RightControl
elseif opt ==string.char(73,110,115,101,114,116)then Config.MenuToggleKey = Enum.KeyCode.Insert
elseif opt ==string.char(82,105,103,104,116,83,104,105,102,116)then Config.MenuToggleKey = Enum.KeyCode.RightShift end
end)
CreateColorPicker(SUI,string.char(77,101,110,117,32,65,99,99,101,110,116,32,67,111,108,111,114), function(color)
Config.AccentColor = color
end)
CreateButton(SUI,string.char(85,110,108,111,97,100,32,71,85,73), function()
stopFly()
removeCustomMorph()
stopCurrentAnimation()
ScreenGui:Destroy()
end)
local SConfigs = CreateBox(SRight,string.char(67,111,110,102,105,103,117,114,97,116,105,111,110,32,83,121,115,116,101,109), 320)
local ConfigFrame, ConfigInputBox = CreateInput(SConfigs,string.char(67,111,110,102,105,103,32,78,97,109,101), Config.ConfigName, function(txt)
Config.ConfigName = txt
end)
CreateButton(SConfigs,string.char(83,97,118,101,32,67,111,110,102,105,103), function()
SaveConfigToFile(ConfigInputBox.Text)
end)
CreateDropdown(SConfigs,string.char(83,97,118,101,100,32,67,111,110,102,105,103,115), {string.char(77,121,76,101,103,105,116,67,111,110,102,105,103),string.char(82,97,103,101,67,111,110,102,105,103)}, function(opt)
ConfigInputBox.Text = opt
end)
CreateButton(SConfigs,string.char(76,111,97,100,32,67,111,110,102,105,103), function()
LoadConfigFromFile(ConfigInputBox.Text)
end)local FOVCircle = Drawing.new(string.char(67,105,114,99,108,101))
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Thickness = 1
FOVCircle.Filled = false
FOVCircle.Transparency = 1
local ESP_Drawings = {}
local function CreateESP(plr)
local esp = {
Box = Drawing.new(string.char(83,113,117,97,114,101)),
Line = Drawing.new(string.char(76,105,110,101)),
Distance = Drawing.new(string.char(84,101,120,116)),
SkeletonLines = {}
}
esp.Box.Thickness = 1; esp.Box.Filled = false
esp.Line.Thickness = 1
esp.Distance.Size = 18; esp.Distance.Center = true
ESP_Drawings[plr] = esp
end
local function RemoveESP(plr)
if ESP_Drawings[plr] then
for k, drawing in pairs(ESP_Drawings[plr]) do
if k ==string.char(83,107,101,108,101,116,111,110,76,105,110,101,115)and type(drawing) ==string.char(116,97,98,108,101)then
for _, line in pairs(drawing) do
if line and typeof(line) ==string.char(68,114,97,119,105,110,103)and line.Remove then line:Remove() end
end
elseif typeof(drawing) ==string.char(68,114,97,119,105,110,103)and drawing.Remove then
drawing:Remove()
end
end
ESP_Drawings[plr] = nil
end
end
for _, plr in pairs(Players:GetPlayers()) do
if plr ~= LocalPlayer then CreateESP(plr) end
end
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)
local function GetBonePos(character, boneName)
if not character then return nil end
for _, part in pairs(character:GetDescendants()) do
if part.Name == boneName and part:IsA(string.char(66,97,115,101,80,97,114,116)) then return part.Position end
end
return nil
end
local function UpdateSkeletonESP(plr, esp)
local char = plr.Character
if not char then return end
local humanoid = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
if not humanoid or humanoid.Health <= 0 then return end
local headPos = GetBonePos(char,string.char(72,101,97,100))
local torsoPos = GetBonePos(char,string.char(85,112,112,101,114,84,111,114,115,111)) or GetBonePos(char,string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
local leftArmPos = GetBonePos(char,string.char(76,101,102,116,85,112,112,101,114,65,114,109)) or GetBonePos(char,string.char(76,101,102,116,72,97,110,100))
local rightArmPos = GetBonePos(char,string.char(82,105,103,104,116,85,112,112,101,114,65,114,109)) or GetBonePos(char,string.char(82,105,103,104,116,72,97,110,100))
local leftLegPos = GetBonePos(char,string.char(76,101,102,116,85,112,112,101,114,76,101,103)) or GetBonePos(char,string.char(76,101,102,116,70,111,111,116))
local rightLegPos = GetBonePos(char,string.char(82,105,103,104,116,85,112,112,101,114,76,101,103)) or GetBonePos(char,string.char(82,105,103,104,116,70,111,111,116))
local bones = {headPos, torsoPos, leftArmPos, rightArmPos, leftLegPos, rightLegPos}
for i = 1, #bones do
if not esp.SkeletonLines[i] then esp.SkeletonLines[i] = Drawing.new(string.char(76,105,110,101)) end
local line = esp.SkeletonLines[i]
if bones[i] then
local screenPos, onScreen = Camera:WorldToViewportPoint(bones[i])
if onScreen then
line.Visible = true
line.From = Vector2.new(screenPos.X, screenPos.Y)
if i == 2 and bones[1] then
local headScreen = Camera:WorldToViewportPoint(bones[1])
line.To = Vector2.new(headScreen.X, headScreen.Y)
elseif i == 3 and bones[2] then line.To = Vector2.new(Camera:WorldToViewportPoint(bones[2]).X, Camera:WorldToViewportPoint(bones[2]).Y)
elseif i == 4 and bones[2] then line.To = Vector2.new(Camera:WorldToViewportPoint(bones[2]).X, Camera:WorldToViewportPoint(bones[2]).Y)
elseif i == 5 and bones[2] then line.To = Vector2.new(Camera:WorldToViewportPoint(bones[2]).X, Camera:WorldToViewportPoint(bones[2]).Y)
elseif i == 6 and bones[2] then line.To = Vector2.new(Camera:WorldToViewportPoint(bones[2]).X, Camera:WorldToViewportPoint(bones[2]).Y)
else line.Visible = false end
line.Color = Config.SkeletonColor
line.Thickness = 1
else line.Visible = false end
else if esp.SkeletonLines[i] then esp.SkeletonLines[i].Visible = false end end
end
end
local function GetClosestPlayer()
local closestPlr = nil
local shortestDist = Config.FOVRadius
for _, plr in pairs(Players:GetPlayers()) do
if plr == LocalPlayer then continue end
local char = plr.Character
if not char then continue end
if Config.AimbotTeamCheck and plr.Team == LocalPlayer.Team then continue end
local targetPart = char:FindFirstChild(Config.TargetPart) or char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not targetPart then continue end
local humanoid = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
if not humanoid or humanoid.Health <= 0 then continue end
if Config.WallCheck then
local rayParams = RaycastParams.new()
rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
rayParams.FilterType = Enum.RaycastFilterType.Exclude
local rayResult = workspace:Raycast(Camera.CFrame.Position, (targetPart.Position - Camera.CFrame.Position).Unit * 1000, rayParams)
if rayResult and not rayResult.Instance:IsDescendantOf(char) then continue end
end
local targetPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
if not onScreen then continue end
local mag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(targetPos.X, targetPos.Y)).Magnitude
if mag < shortestDist then closestPlr = plr; shortestDist = mag end
end
return closestPlr
end
RunService.RenderStepped:Connect(function()if Config.RainbowESP then
local hue = tick() % 5 / 5
local rgb = Color3.fromHSV(hue, 1, 1)
Config.ChamsColor = rgb
Config.BoxColor = rgb
Config.SkeletonColor = rgb
Config.DistanceColor = rgb
endif Config.DrawFOV then
FOVCircle.Visible = true
FOVCircle.Radius = Config.FOVRadius
FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
else
FOVCircle.Visible = false
endif Config.Aimbot and Config.IsAimKeyDown then
local target = GetClosestPlayer()
if target then
local char = target.Character
if char then
local targetPart = char:FindFirstChild(Config.TargetPart) or char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if targetPart then
local targetPos = targetPart.Position
local newCFrame = CFrame.new(Camera.CFrame.Position, targetPos)
Camera.CFrame = Camera.CFrame:Lerp(newCFrame, Config.Smoothness / 50)
end
end
end
endif LocalPlayer.Character then
local hum = LocalPlayer.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
if hum then
if Config.Speed then hum.WalkSpeed = Config.SpeedVal else hum.WalkSpeed = 16 end
if Config.Jump then hum.JumpPower = Config.JumpVal else hum.JumpPower = 50 end
end
end
updateNoclip()
applyJumpPower()for plr, esp in pairs(ESP_Drawings) do
local char = plr.Character
if char and char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) and char:FindFirstChild(string.char(72,117,109,97,110,111,105,100)) then
local humanoid = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100))
if humanoid and humanoid.Health > 0 then
if Config.ESPTeamCheck and plr.Team == LocalPlayer.Team then
esp.Box.Visible = false; esp.Line.Visible = false; esp.Distance.Visible = false
for _, line in pairs(esp.SkeletonLines) do if line then line.Visible = false end end
else
local rootPart = char.HumanoidRootPart
local pos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
if onScreen then
local dist = (Camera.CFrame.Position - rootPart.Position).Magnitude
if Config.BoxESP then
esp.Box.Visible = true
esp.Box.Color = Config.BoxColor
esp.Box.Size = Vector2.new(2000 / dist, 3000 / dist)
esp.Box.Position = Vector2.new(pos.X - esp.Box.Size.X / 2, pos.Y - esp.Box.Size.Y / 2)
else esp.Box.Visible = false end
if Config.LineESP then
esp.Line.Visible = true
esp.Line.Color = Config.BoxColor
esp.Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
esp.Line.To = Vector2.new(pos.X, pos.Y)
else esp.Line.Visible = false end
if Config.DistanceESP then
esp.Distance.Visible = true
esp.Distance.Color = Config.DistanceColor
esp.Distance.Text =string.char(91).. math.floor(dist) ..string.char(109,93)esp.Distance.Position = Vector2.new(pos.X, pos.Y + (1500 / dist))
else esp.Distance.Visible = false end
if Config.SkeletonESP then UpdateSkeletonESP(plr, esp)
else for _, line in pairs(esp.SkeletonLines) do if line then line.Visible = false end end end
else
esp.Box.Visible = false; esp.Line.Visible = false; esp.Distance.Visible = false
for _, line in pairs(esp.SkeletonLines) do if line then line.Visible = false end end
end
end
else
esp.Box.Visible = false; esp.Line.Visible = false; esp.Distance.Visible = false
for _, line in pairs(esp.SkeletonLines) do if line then line.Visible = false end end
end
else
esp.Box.Visible = false; esp.Line.Visible = false; esp.Distance.Visible = false
for _, line in pairs(esp.SkeletonLines) do if line then line.Visible = false end end
end
endfor _, plr in pairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local highlight = plr.Character:FindFirstChild(string.char(68,97,118,101,67,104,97,109,115))
if Config.ESPTeamCheck and plr.Team == LocalPlayer.Team then
if highlight then highlight:Destroy() end
else
if Config.Chams then
if not highlight then
highlight = Instance.new(string.char(72,105,103,104,108,105,103,104,116))
highlight.Name =string.char(68,97,118,101,67,104,97,109,115)highlight.Parent = plr.Character
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end
highlight.FillColor = Config.ChamsColor
highlight.OutlineColor = Config.ChamsColor
else
if highlight then highlight:Destroy() end
end
end
end
end
end)UserInputService.InputBegan:Connect(function(input, gpe)
if not gpe then
if Config.ClickTP and input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
local char = LocalPlayer.Character
if char and char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) and Mouse and Mouse.Hit then
char.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 3, 0))
print(string.char(91,84,101,108,101,112,111,114,116,93,32,70,97,114,101,32,112,111,122,105,115,121,111,110,117,110,97,32,196,177,197,159,196,177,110,108,97,110,196,177,108,100,196,177,33,32,239,191,189,239,191,189))
end
end
if input.UserInputType == Config.AimKey or input.KeyCode == Config.AimKey then
Config.IsAimKeyDown = true
end
if input.KeyCode == Config.CarBoostKey or input.UserInputType == Config.CarBoostKey then
Config.CarBoostKeyDown = true
end
end
end)
UserInputService.InputEnded:Connect(function(input, gpe)
if input.UserInputType == Config.AimKey or input.KeyCode == Config.AimKey then
Config.IsAimKeyDown = false
end
if input.KeyCode == Config.CarBoostKey or input.UserInputType == Config.CarBoostKey then
Config.CarBoostKeyDown = false
end
end)
print(string.char(77,97,99,114,111,32,67,104,101,97,116,32,118,51,46,54,32,40,77,117,108,116,105,45,83,99,97,108,101,32,38,32,79,102,102,115,101,116,32,65,100,106,117,115,116,101,114,32,65,100,100,101,100,41,32,66,97,197,159,97,114,196,177,121,108,97,32,89,195,188,107,108,101,110,100,105,33,32,239,191,189,239,191,189))
