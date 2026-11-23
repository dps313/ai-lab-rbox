local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local travel = ReplicatedStorage:WaitForChild("AILabTravel")
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "Travel"
gui.ResetOnSpawn = false
gui.DisplayOrder = 5
gui.Parent = playerGui

local panel = Instance.new("Frame")
panel.Name = "Destinations"
panel.AnchorPoint = Vector2.new(0.5, 1)
panel.Size = UDim2.new(1, -24, 0, 86)
panel.BackgroundColor3 = Color3.fromRGB(25, 31, 42)
panel.Parent = gui

local size = Instance.new("UISizeConstraint")
size.Parent = panel

local function layout()
    local touch = UserInputService.TouchEnabled
    local landscape = gui.AbsoluteSize.X > gui.AbsoluteSize.Y
    local bottom = if touch and not landscape then 94 else 14
    panel.Position = UDim2.new(0.5, 0, 1, -bottom)
    size.MaxSize = Vector2.new(if touch and landscape then 280 else 340, 86)
end
gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(layout)
UserInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(layout)
layout()

local function round(object)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = object
end
round(panel)

local status = Instance.new("TextLabel")
status.Name = "Status"
status.Position = UDim2.fromOffset(10, 4)
status.Size = UDim2.new(1, -20, 0, 24)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(215, 229, 245)
status.Font = Enum.Font.GothamMedium
status.TextSize = 13
status.TextTruncate = Enum.TextTruncate.AtEnd
status.Text = "Travel"
status.Parent = panel

local overlayGui = Instance.new("ScreenGui")
overlayGui.Name = "TravelFade"
overlayGui.ResetOnSpawn = false
overlayGui.DisplayOrder = 10
overlayGui.ScreenInsets = Enum.ScreenInsets.None
overlayGui.Parent = playerGui

local overlay = Instance.new("Frame")
overlay.Name = "Fade"
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(9, 13, 21)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.Visible = false
overlay.Parent = overlayGui

local buttons = {}
local requestId = 0
local pending

local function fadeTo(transparency)
    local tween = TweenService:Create(overlay, TweenInfo.new(0.18), {
        BackgroundTransparency = transparency,
    })
    tween:Play()
    tween.Completed:Wait()
end

local function finish(request, landing, message)
    if pending ~= request or request.finishing then
        return
    end
    request.finishing = true

    if landing then
        local deadline = os.clock() + 1.5
        while os.clock() < deadline and player.Character == request.character do
            local root = request.character and request.character:FindFirstChild("HumanoidRootPart")
            if root and (root.Position - landing.Position).Magnitude < 12 then
                local camera = workspace.CurrentCamera
                if camera and camera.CameraType == Enum.CameraType.Custom
                    and (camera.CFrame.Position - camera.Focus.Position).Magnitude > 1 then
                    local focus = root.Position + Vector3.new(0, 2, 0)
                    local offset = math.min((camera.CFrame.Position - camera.Focus.Position).Magnitude, 12)
                    camera.CFrame = CFrame.lookAt(focus - landing.LookVector * offset + Vector3.new(0, 3, 0), focus)
                end
                break
            end
            RunService.RenderStepped:Wait()
        end
    end

    status.Text = message or "Travel"
    fadeTo(1)
    overlay.Visible = false
    pending = nil
end

local function requestTravel(destination)
    if pending then
        return
    end
    requestId += 1
    local request = { id = requestId, character = player.Character }
    pending = request
    status.Text = "Traveling..."
    overlay.Visible = true
    fadeTo(0)
    travel:FireServer(destination, request.id)
    task.delay(3, function()
        finish(request, nil, "Travel unavailable. Try again.")
    end)
end

for index, destination in { { "Garage", "My Garage" }, { "Store", "Computer Store" } } do
    local button = Instance.new("TextButton")
    button.Name = destination[1]
    button.Text = destination[2]
    button.Position = UDim2.new((index - 1) * 0.5, if index == 1 then 10 else 4, 0, 30)
    button.Size = UDim2.new(0.5, -14, 0, 46)
    button.TextColor3 = Color3.fromRGB(245, 249, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = panel
    round(button)
    buttons[destination[1]] = button
    button.Activated:Connect(function()
        requestTravel(destination[1])
    end)
end

local function updateDestination()
    local current = player:GetAttribute("TravelDestination")
    for destination, button in buttons do
        button.BackgroundColor3 = if destination == current
            then Color3.fromRGB(36, 93, 130)
            else Color3.fromRGB(51, 63, 80)
    end
end

travel.OnClientEvent:Connect(function(id, landing, message)
    local request = pending
    if request and id == request.id then
        finish(request, landing, message)
    end
end)
player:GetAttributeChangedSignal("TravelDestination"):Connect(updateDestination)
updateDestination()
