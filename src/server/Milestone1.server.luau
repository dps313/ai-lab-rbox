local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Catalog = require(ReplicatedStorage:WaitForChild("AILabShared"):WaitForChild("Catalog"))
local Hardware = require(script.Parent.Hardware)
local World = require(script.Parent.World)

local map = Instance.new("Folder")
map.Name = "AILabMilestone1"
map.Parent = workspace

local products, storeArrivals
products, storeArrivals = World.store(map, Catalog.Items, function(player, id)
    local success, message = Hardware.purchase(player, id)
    if success then
        products[id](Hardware.getStock(id))
    end
    player:SetAttribute("HardwareMessage", message)
end)

local function updateStockDisplays()
    for id, update in products do
        update(Hardware.getStock(id))
    end
end
updateStockDisplays()

task.spawn(function()
    while task.wait(Catalog.RestockSeconds) do
        Hardware.restock()
        updateStockDisplays()
    end
end)

local garages = {}
local slots = {}

local function placeCharacter(character, root, humanoid, landing)
    local clearance = math.max(5, humanoid.HipHeight + root.Size.Y / 2 + 1)
    local target = landing + Vector3.new(0, clearance, 0)
    character:PivotTo(target * root.CFrame:ToObjectSpace(character:GetPivot()))
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
end

local function storeLanding(player)
    for _, landing in storeArrivals do
        local occupied = false
        for _, visitor in Players:GetPlayers() do
            local root = visitor ~= player and visitor.Character
                and visitor.Character:FindFirstChild("HumanoidRootPart")
            if root and (root.Position - (landing.Position + Vector3.new(0, 3, 0))).Magnitude < 5 then
                occupied = true
                break
            end
        end
        if not occupied then
            return landing
        end
    end
    return nil
end

local travel = Instance.new("RemoteEvent")
travel.Name = "AILabTravel"
travel.OnServerEvent:Connect(function(player, destination, requestId)
    local garage = garages[player]
    if not garage or type(requestId) ~= "number" then
        return
    end
    local now = os.clock()
    if now < garage.nextTravel then
        travel:FireClient(player, requestId, nil, "Please wait a moment.")
        return
    end
    garage.nextTravel = now + 0.6

    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid or humanoid.Health <= 0 or garage.readyCharacter ~= character then
        travel:FireClient(player, requestId, nil, "Travel is available after you spawn.")
        return
    end

    local landing
    if destination == "Garage" then
        landing = garage.landing
    elseif destination == "Store" then
        landing = storeLanding(player)
    else
        return
    end
    if not landing then
        travel:FireClient(player, requestId, nil, "The arrival area is busy. Try again shortly.")
        return
    end

    placeCharacter(character, root, humanoid, landing)
    player:SetAttribute("TravelDestination", destination)
    travel:FireClient(player, requestId, landing)
end)
travel.Parent = ReplicatedStorage

local function addPlayer(player)
    if garages[player] then
        return
    end
    Hardware.addPlayer(player)
    local slot = 1
    while slots[slot] do
        slot += 1
    end
    slots[slot] = true
    local garage, spawn, landing = World.garage(map, player, slot, function(owner)
        local powered, message = Hardware.install(owner)
        owner:SetAttribute("HardwareMessage", message)
        return powered
    end)
    local assignment = { model = garage, slot = slot, landing = landing, nextTravel = 0 }
    garages[player] = assignment
    player.RespawnLocation = spawn
    local function onCharacterAdded(character)
        local root = character:WaitForChild("HumanoidRootPart", 10)
        local humanoid = character:WaitForChild("Humanoid", 10)
        if root and humanoid and humanoid.Health > 0 and character == player.Character and spawn.Parent
            and assignment.readyCharacter ~= character then
            placeCharacter(character, root, humanoid, landing)
            assignment.readyCharacter = character
            player:SetAttribute("TravelDestination", "Garage")
        end
    end
    player.CharacterAdded:Connect(onCharacterAdded)
    if player.Character then
        task.spawn(onCharacterAdded, player.Character)
    end
end

Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(function(player)
    local garage = garages[player]
    if garage then
        garage.model:Destroy()
        slots[garage.slot] = nil
        garages[player] = nil
    end
    Hardware.removePlayer(player)
end)

for _, player in Players:GetPlayers() do
    addPlayer(player)
end
