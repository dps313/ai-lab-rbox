local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local terminal = ReplicatedStorage:WaitForChild("AILabTerminal")

local gui = Instance.new("ScreenGui")
gui.Name = "AILabTerminal"
gui.DisplayOrder = 6
gui.ResetOnSpawn = false
gui.Enabled = false

local panel = Instance.new("Frame")
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Position = UDim2.fromScale(0.5, 0.5)
panel.Size = UDim2.new(0.9, 0, 0, 174)
panel.BackgroundColor3 = Color3.fromRGB(20, 29, 39)
panel.BorderSizePixel = 0
panel.Parent = gui

local limit = Instance.new("UISizeConstraint")
limit.MaxSize = Vector2.new(380, 174)
limit.Parent = panel

local function textControl(className, caption, position, size)
    local control = Instance.new(className)
    control.Text = caption
    control.Position = position
    control.Size = size
    control.Font = Enum.Font.GothamMedium
    control.TextSize = 16
    control.TextColor3 = Color3.fromRGB(239, 245, 250)
    control.BackgroundTransparency = 1
    control.Parent = panel
    return control
end

local title = textControl("TextLabel", "Garage PC", UDim2.fromOffset(16, 10), UDim2.new(1, -112, 0, 44))
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextSize = 20

local close = textControl("TextButton", "Close", UDim2.new(1, -88, 0, 10), UDim2.fromOffset(72, 44))
close.Activated:Connect(function()
    gui.Enabled = false
end)

local status = textControl("TextLabel", "", UDim2.fromOffset(16, 56), UDim2.new(1, -32, 0, 48))
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextWrapped = true

local training = textControl("TextButton", "Training", UDim2.fromOffset(16, 112), UDim2.fromOffset(132, 44))
training.BackgroundTransparency = 0
training.BackgroundColor3 = Color3.fromRGB(32, 96, 77)
training.BorderSizePixel = 0
training.Activated:Connect(function()
    title.Text = "Training"
    status.Text = "Training recipes are unavailable."
    training.Visible = false
end)

terminal.OnClientEvent:Connect(function(open, missing)
    if not open and not gui.Enabled then
        return
    end
    local powered = #missing == 0
    title.Text = "Garage PC"
    status.Text = if powered then "PC online" else "PC off\nMissing parts: " .. table.concat(missing, ", ")
    training.Visible = powered
    gui.Enabled = true
end)

player.CharacterRemoving:Connect(function()
    gui.Enabled = false
end)

gui.Parent = player:WaitForChild("PlayerGui")
