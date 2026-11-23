local World = {}
local metal = Color3.fromRGB(48, 54, 66)
local wood = Color3.fromRGB(126, 90, 62)
local newColor = Color3.fromRGB(49, 112, 154)
local usedColor = Color3.fromRGB(161, 104, 45)
local floorColor = Color3.fromRGB(103, 115, 131)
local floorHeight = 36

local function part(parent, name, position, size, color, className)
    local object = Instance.new(className or "Part")
    object.Name = name
    object.Anchored = true
    object.Position = position
    object.Size = size
    object.Color = color
    object.Parent = parent
    return object
end

local function room(model, origin, width, depth, backDirection)
    local function piece(name, x, y, z, w, h, d, color)
        return part(model, name, origin + Vector3.new(x, y, z), Vector3.new(w, h, d), color)
    end

    local floor = piece("Floor", 0, -2, 0, width, 4, depth, floorColor)
    floor.Material = Enum.Material.Concrete
    local back = piece("Back Wall", 0, 4, backDirection * (depth - 1) / 2, width, 8, 1, metal)
    piece("Front Wall", 0, 4, -backDirection * (depth - 1) / 2, width, 8, 1, metal)
    piece("Left Wall", -(width - 1) / 2, 4, 0, 1, 8, depth - 2, metal)
    piece("Right Wall", (width - 1) / 2, 4, 0, 1, 8, depth - 2, metal)

    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(225, 237, 255)
    light.Brightness = 1.8
    light.Range = 34
    local fixture = piece("Overhead Light", 0, 9, 0, 3, 0.2, 1.2, light.Color)
    fixture.Material = Enum.Material.Neon
    fixture.CanCollide = false
    fixture.CanTouch = false
    light.Parent = fixture
    return back
end

local function arrival(position, direction)
    return CFrame.lookAt(position, position + Vector3.new(0, 0, direction))
end

local function sign(anchor, words, offset, width)
    local gui = Instance.new("BillboardGui")
    gui.Size = UDim2.fromOffset(width, 44)
    gui.StudsOffsetWorldSpace = Vector3.new(0, offset, 0)
    gui.MaxDistance = 65
    gui.Parent = anchor

    local label = Instance.new("TextLabel")
    label.Size = UDim2.fromScale(1, 1)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextStrokeTransparency = 0.2
    label.Font = Enum.Font.GothamBold
    label.TextSize = 15
    label.Text = words
    label.Parent = gui
    return label
end

local function prompt(anchor, objectText, actionText, callback)
    local interaction = Instance.new("ProximityPrompt")
    interaction.ObjectText = objectText
    interaction.ActionText = actionText
    interaction.MaxActivationDistance = 6
    interaction.RequiresLineOfSight = false
    interaction.Parent = anchor
    interaction.Triggered:Connect(function(player)
        local character = player.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if root and humanoid and humanoid.Health > 0
            and (root.Position - anchor.Position).Magnitude <= interaction.MaxActivationDistance then
            callback(player)
        end
    end)
    return interaction
end

function World.store(parent, items, buy)
    local store = Instance.new("Model")
    store.Name = "Computer Store"
    store.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
    local origin = Vector3.new(-1024, floorHeight, 0)
    local wall = room(store, origin, 64, 42, -1)
    sign(wall, "COMPUTER STORE", 5, 220)
    local sections = {
        { name = "New Hardware", x = -15, color = newColor, items = {} },
        { name = "Used Hardware", x = 15, color = usedColor, items = {} },
    }
    for _, item in items do
        local section = sections[if item.Stock == nil then 1 else 2]
        table.insert(section.items, item)
    end
    local products = {}
    for _, section in sections do
        local center = origin + Vector3.new(section.x, 0, -9)
        local counter = part(store, section.name, center + Vector3.new(0, 1.25, 0),
            Vector3.new(24, 2.5, 3.5), section.color)
        sign(counter, section.name, 4.8, 180)
        for index, item in section.items do
            local x = (index - (#section.items + 1) / 2) * 8
            local display = part(store, item.Id, center + Vector3.new(x, 3, 0),
                Vector3.new(2, 1, 1.5), section.color:Lerp(Color3.new(1, 1, 1), 0.3))
            local label = sign(display, "", 1.8, 140)
            local price = ("$%d"):format(item.Price)
            local interaction = prompt(display, item.Name, "Buy " .. price, function(player)
                buy(player, item.Id)
            end)
            products[item.Id] = function(stock)
                local availability = if stock == nil then "Unlimited" else ("%d left"):format(stock)
                label.Text = item.Name .. "\n" .. price .. "  |  " .. availability
                interaction.ActionText = if stock == 0 then "Sold out" else "Buy " .. price
                display:SetAttribute("Stock", stock)
            end
        end
    end
    local arrivals = {}
    for _, x in { 0, -6, 6, -12, 12, -18, 18 } do
        table.insert(arrivals, arrival(origin + Vector3.new(x, 0, 7), -1))
    end
    store.Parent = parent
    return products, arrivals
end

function World.garage(parent, player, slot, install)
    local garage = Instance.new("Model")
    garage.Name = "Garage_" .. player.UserId
    garage.ModelStreamingMode = Enum.ModelStreamingMode.PersistentPerPlayer
    local origin = Vector3.new(1024 + ((slot - 1) % 4) * 62, floorHeight, math.floor((slot - 1) / 4) * 62)
    local function fixture(name, x, y, z, width, height, depth, color)
        return part(garage, name, origin + Vector3.new(x, y, z), Vector3.new(width, height, depth), color)
    end
    local wall = room(garage, origin, 28, 32, 1)
    sign(wall, player.DisplayName .. "'s Garage", 5, 200)
    fixture("Desk", 0, 1.5, 4, 7, 3, 3, wood)
    local case = fixture("Computer Case", 2.7, 4, 4, 1.2, 2, 1.6, metal)
    fixture("Monitor", -0.7, 4.15, 4.8, 3.2, 2.3, 0.35, metal)
    local screen = fixture("Screen", -0.7, 4.15, 4.6, 2.85, 1.95, 0.08, Color3.fromRGB(15, 20, 25))
    local screenGui = Instance.new("SurfaceGui")
    screenGui.Face = Enum.NormalId.Front
    screenGui.Parent = screen
    local status = Instance.new("TextLabel")
    status.Size = UDim2.fromScale(1, 1)
    status.BackgroundTransparency = 1
    status.TextColor3 = metal
    status.TextScaled = true
    status.Font = Enum.Font.GothamBold
    status.Text = "OFF"
    status.Parent = screenGui
    fixture("Keyboard", -0.7, 3.08, 3.25, 2.4, 0.16, 0.65, metal)
    fixture("Mouse", 1, 3.1, 3.25, 0.45, 0.2, 0.65, metal)

    local landing = arrival(origin + Vector3.new(0, 0, -3), 1)
    local spawn = part(garage, "Garage Spawn", landing.Position + Vector3.new(0, 0.15, 0),
        Vector3.new(4, 0.2, 4), metal, "SpawnLocation")
    spawn.CFrame = landing + Vector3.new(0, 0.15, 0)
    spawn.Transparency = 1
    spawn.CanCollide = false
    spawn.CanTouch = false
    spawn.CanQuery = false
    spawn.Duration = 0

    local interaction
    interaction = prompt(case, "Garage PC", "Install owned parts", function(visitor)
        if visitor == player and install(player) then
            screen.Color = Color3.fromRGB(39, 213, 142)
            screen.Material = Enum.Material.Neon
            status.Text = "PC ONLINE"
            interaction.Enabled = false
        end
    end)
    garage.Parent = parent
    garage:AddPersistentPlayer(player)
    return garage, spawn, landing
end

return World
