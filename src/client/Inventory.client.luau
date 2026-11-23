local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Catalog = require(ReplicatedStorage:WaitForChild("AILabShared"):WaitForChild("Catalog"))
local player = Players.LocalPlayer

local names = {}
for _, item in Catalog.Items do
    names[item.Id] = item.Name
end

local gui = Instance.new("ScreenGui")
gui.Name = "HardwareInventory"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Position = UDim2.fromOffset(12, 12)
panel.Size = UDim2.fromOffset(250, 158)
panel.BackgroundColor3 = Color3.fromRGB(25, 31, 42)
panel.BorderSizePixel = 0
panel.Parent = gui

local function label(y, height, size, color)
    local row = Instance.new("TextLabel")
    row.BackgroundTransparency = 1
    row.Position = UDim2.fromOffset(12, y)
    row.Size = UDim2.new(1, -24, 0, height)
    row.Font = Enum.Font.GothamMedium
    row.TextSize = size
    row.TextColor3 = color
    row.TextXAlignment = Enum.TextXAlignment.Left
    row.TextWrapped = true
    row.Parent = panel
    return row
end

local white = Color3.fromRGB(236, 242, 249)
local cash = label(8, 24, 17, white)
local rows = {}
for index, category in Catalog.Categories do
    rows[category] = label(35 + (index - 1) * 23, 23, 14, white)
end
local message = label(108, 43, 13, Color3.fromRGB(158, 213, 255))

local function render()
    local balance = player:GetAttribute("Cash")
    cash.Text = if balance then ("Inventory   |   $%d"):format(balance) else "Inventory"
    for category, row in rows do
        local id = player:GetAttribute("Owned" .. category)
        local name = names[id] or "Empty"
        local installed = player:GetAttribute("Installed" .. category)
        row.Text = category .. "  " .. name .. (if installed then " (installed)" else "")
    end
    message.Text = player:GetAttribute("HardwareMessage") or "Buy parts at the Computer Store."
end

player.AttributeChanged:Connect(render)
render()
