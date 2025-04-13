-- FULL UPDATED SCRIPT WITH FIXES & TABS

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HairAndFixUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addCorner(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = instance
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 420)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
addCorner(mainFrame, 8)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Text = "🛠️ Utilities"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = mainFrame
addCorner(title, 8)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 20
closeButton.Parent = mainFrame
addCorner(closeButton, 8)

local tabs = { "Manual", "Automatic", "Counter" }
local tabButtons = {}
local tabFrames = {}
local currentTab = nil

for i, tabName in ipairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Size = UDim2.new(0.33, 0, 0, 30)
    tab.Position = UDim2.new((i-1)*0.33, 0, 0, 40)
    tab.Text = tabName
    tab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Font = Enum.Font.Gotham
    tab.TextSize = 14
    tab.Parent = mainFrame
    addCorner(tab, 6)

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, -70)
    frame.Position = UDim2.new(0, 0, 0, 70)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    frame.Parent = mainFrame

    tab.MouseButton1Click:Connect(function()
        if currentTab then currentTab.Visible = false end
        frame.Visible = true
        currentTab = frame
    end)

    table.insert(tabButtons, tab)
    table.insert(tabFrames, frame)
end

-- TAB: MANUAL
local manual = tabFrames[1]

local hairCountLabel = Instance.new("TextLabel")
hairCountLabel.Size = UDim2.new(0.8, 0, 0, 20)
hairCountLabel.Position = UDim2.new(0.1, 0, 0, 0)
hairCountLabel.BackgroundTransparency = 1
hairCountLabel.TextColor3 = Color3.fromRGB(120, 200, 255)
hairCountLabel.Text = "🧴 Checking hairs..."
hairCountLabel.TextSize = 14
hairCountLabel.Font = Enum.Font.Gotham
hairCountLabel.TextWrapped = true
hairCountLabel.Parent = manual

local collectButton = Instance.new("TextButton")
collectButton.Size = UDim2.new(0.8, 0, 0, 40)
collectButton.Position = UDim2.new(0.1, 0, 0, 25)
collectButton.Text = "✨ Collect All Hairs"
collectButton.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
collectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
collectButton.Font = Enum.Font.Gotham
collectButton.TextSize = 14
collectButton.Parent = manual
addCorner(collectButton, 6)

local errorCountLabel = Instance.new("TextLabel")
errorCountLabel.Size = UDim2.new(0.8, 0, 0, 20)
errorCountLabel.Position = UDim2.new(0.1, 0, 0, 75)
errorCountLabel.BackgroundTransparency = 1
errorCountLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
errorCountLabel.Text = "🔍 Checking for errors..."
errorCountLabel.TextSize = 14
errorCountLabel.Font = Enum.Font.Gotham
errorCountLabel.TextWrapped = true
errorCountLabel.Parent = manual

local fixButton = Instance.new("TextButton")
fixButton.Size = UDim2.new(0.8, 0, 0, 40)
fixButton.Position = UDim2.new(0.1, 0, 0, 100)
fixButton.Text = "🧰 Fix All Errors"
fixButton.BackgroundColor3 = Color3.fromRGB(255, 140, 26)
fixButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fixButton.Font = Enum.Font.Gotham
fixButton.TextSize = 14
fixButton.Parent = manual
addCorner(fixButton, 6)

-- TAB: AUTOMATIC
local automatic = tabFrames[2]

local inputDesc = Instance.new("TextLabel")
inputDesc.Size = UDim2.new(0.8, 0, 0, 20)
inputDesc.Position = UDim2.new(0.1, 0, 0, 0)
inputDesc.BackgroundTransparency = 1
inputDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
inputDesc.Text = "Auto collect if hairs >="
inputDesc.TextSize = 13
inputDesc.Font = Enum.Font.Gotham
inputDesc.TextWrapped = true
inputDesc.Parent = automatic

local hairInput = Instance.new("TextBox")
hairInput.Size = UDim2.new(0.8, 0, 0, 30)
hairInput.Position = UDim2.new(0.1, 0, 0, 25)
hairInput.PlaceholderText = "Input number"
hairInput.Text = ""
hairInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
hairInput.TextColor3 = Color3.fromRGB(255, 255, 255)
hairInput.Font = Enum.Font.Gotham
hairInput.TextSize = 14
hairInput.ClearTextOnFocus = false
hairInput.Parent = automatic
addCorner(hairInput, 6)

local autoCollectButton = Instance.new("TextButton")
autoCollectButton.Size = UDim2.new(0.8, 0, 0, 40)
autoCollectButton.Position = UDim2.new(0.1, 0, 0, 65)
autoCollectButton.Text = "🔄 Auto Collect: OFF"
autoCollectButton.BackgroundColor3 = Color3.fromRGB(85, 85, 255)
autoCollectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoCollectButton.Font = Enum.Font.Gotham
autoCollectButton.TextSize = 14
autoCollectButton.Parent = automatic
addCorner(autoCollectButton, 6)

-- TAB: COUNTER
local counter = tabFrames[3]

local hairCounterCheckbox = Instance.new("TextButton")
hairCounterCheckbox.Size = UDim2.new(0.8, 0, 0, 30)
hairCounterCheckbox.Position = UDim2.new(0.1, 0, 0, 0)
hairCounterCheckbox.Text = "🧴 Hair Counter"
hairCounterCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
hairCounterCheckbox.TextColor3 = Color3.fromRGB(255, 255, 255)
hairCounterCheckbox.Font = Enum.Font.Gotham
hairCounterCheckbox.TextSize = 14
hairCounterCheckbox.Parent = counter
addCorner(hairCounterCheckbox, 6)

local hairCounterEnabled = false

hairCounterCheckbox.MouseButton1Click:Connect(function()
    hairCounterEnabled = not hairCounterEnabled
    hairCounterCheckbox.Text = hairCounterEnabled and "🧴 Hair Counter ✅" or "🧴 Hair Counter"
end)

local errorCounterCheckbox = Instance.new("TextButton")
errorCounterCheckbox.Size = UDim2.new(0.8, 0, 0, 30)
errorCounterCheckbox.Position = UDim2.new(0.1, 0, 0, 40)
errorCounterCheckbox.Text = "🔧 Error Counter"
errorCounterCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
errorCounterCheckbox.TextColor3 = Color3.fromRGB(255, 255, 255)
errorCounterCheckbox.Font = Enum.Font.Gotham
errorCounterCheckbox.TextSize = 14
errorCounterCheckbox.Parent = counter
addCorner(errorCounterCheckbox, 6)

local errorCounterEnabled = false
local errorWarningLabel = Instance.new("TextLabel")
errorWarningLabel.Size = UDim2.new(0.8, 0, 0, 20)
errorWarningLabel.Position = UDim2.new(0.1, 0, 0, 75)
errorWarningLabel.BackgroundTransparency = 1
errorWarningLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
errorWarningLabel.Text = "⚠️ Enabling Counter may cause lag."
errorWarningLabel.TextSize = 12
errorWarningLabel.Font = Enum.Font.Gotham
errorWarningLabel.TextWrapped = true
errorWarningLabel.Parent = counter

local lastUpdateTime = 0
local updateInterval = 2 -- Update every 2 seconds

errorCounterCheckbox.MouseButton1Click:Connect(function()
    errorCounterEnabled = not errorCounterEnabled
    errorCounterCheckbox.Text = errorCounterEnabled and "🔧 Error Counter ✅" or "🔧 Error Counter"
end)

-- Function Logic
local function countActiveErrors()
    local count = 0
    local tycoonSystem = workspace:FindFirstChild("TycoonSystem")
    if not tycoonSystem then return count end

    local tycoons = tycoonSystem:FindFirstChild("Tycoons")
    if not tycoons then return count end

    for i = 1, 20 do
        local tycoonModel = tycoons:FindFirstChild(tostring(i))
        if tycoonModel then
            local purchaseables = tycoonModel:FindFirstChild("Purchaseables")
            if purchaseables then
                for j = 1, 50 do
                    local dropper = purchaseables:FindFirstChild("Dropper_" .. j)
                    if dropper then
                        local addItem = dropper:FindFirstChild("AddItem")
                        if addItem then
                            local screenHolder = addItem:FindFirstChild("UpgradeScreenHolder")
                            if screenHolder and screenHolder:IsA("BasePart") then
                                local errorGui = screenHolder:FindFirstChild("ErrorGui")
                                if errorGui and errorGui:IsA("SurfaceGui") and errorGui.Enabled then
                                    count += 1
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return count
end

task.spawn(function()
    while true do
        -- Only update error count when enabled and enough time has passed
        if errorCounterEnabled and tick() - lastUpdateTime > updateInterval then
            local errorCount = countActiveErrors()
            errorCountLabel.Text = "🔧 Active Errors: " .. errorCount
            lastUpdateTime = tick() -- Update the last update time
        end
        wait(1) -- Check every second if the error counter is enabled
    end
end)


local function countDropItems()
    local total = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "DropItem" then
            total += 1
        end
    end
    return total
end

fixButton.MouseButton1Click:Connect(function()
    local function interactWithPrompt(proximityPrompt)
        if proximityPrompt.Enabled then
            proximityPrompt:InputHoldBegin()
            wait(0.1)
            proximityPrompt:InputHoldEnd()
        end
    end

    local function checkProximityPrompts()
        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("ProximityPrompt") then
                local objectPosition
                if object.Parent:IsA("BasePart") then
                    objectPosition = object.Parent.Position
                elseif object.Parent:IsA("Model") and object.Parent.PrimaryPart then
                    objectPosition = object.Parent.PrimaryPart.Position
                end

                if objectPosition then
                    local distance = (character.HumanoidRootPart.Position - objectPosition).Magnitude
                    if distance <= object.MaxActivationDistance then
                        interactWithPrompt(object)
                    end
                end
            end
        end
    end

    local tycoonSystem = workspace:FindFirstChild("TycoonSystem")
    if not tycoonSystem then warn("TycoonSystem not found") return end

    local tycoons = tycoonSystem:FindFirstChild("Tycoons")
    if not tycoons then warn("Tycoons folder not found") return end

    for i = 1, 20 do
        local tycoonModel = tycoons:FindFirstChild(tostring(i))
        if tycoonModel then
            local purchaseables = tycoonModel:FindFirstChild("Purchaseables")
            if purchaseables then
                for j = 1, 50 do
                    local dropper = purchaseables:FindFirstChild("Dropper_" .. j)
                    if dropper then
                        local addItem = dropper:FindFirstChild("AddItem")
                        if addItem then
                            local upgradePrompt = addItem:FindFirstChild("UpgradePrompt")
                            if upgradePrompt then
                                local proximityPrompt = upgradePrompt:FindFirstChildOfClass("ProximityPrompt")
                                local screenHolder = addItem:FindFirstChild("UpgradeScreenHolder")
                                if proximityPrompt and screenHolder and screenHolder:IsA("BasePart") then
                                    local errorGui = screenHolder:FindFirstChild("ErrorGui")
                                    if errorGui and errorGui:IsA("SurfaceGui") and errorGui.Enabled then
                                        character:SetPrimaryPartCFrame(screenHolder.CFrame)
                                        task.wait(0.5)
                                        checkProximityPrompts()
                                        return
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    print("No enabled ErrorGui found.")
end)


collectButton.MouseButton1Click:Connect(function()
    local offset = Vector3.new(0, 5, 0)
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") and object.Name == "DropItem" then
            object.CFrame = character.HumanoidRootPart.CFrame + offset
        end
    end
end)

local hairThreshold = 0
hairInput.FocusLost:Connect(function()
    local input = tonumber(hairInput.Text)
    hairThreshold = input or 0
end)

local autoCollectEnabled = false
autoCollectButton.MouseButton1Click:Connect(function()
    autoCollectEnabled = not autoCollectEnabled
    autoCollectButton.Text = autoCollectEnabled and "🔄 Auto Collect: ON" or "🔄 Auto Collect: OFF"
    autoCollectButton.BackgroundColor3 = autoCollectEnabled and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(85, 85, 255)
end)

task.spawn(function()
    while true do
        if autoCollectEnabled and hairThreshold > 0 and countDropItems() >= hairThreshold then
            collectButton:Activate()
            wait(0.5)
        end
        wait(1)
    end
end)

task.spawn(function()
    while true do
        if hairCounterEnabled then
            hairCountLabel.Text = "🧴 Spawned Hairs: " .. countDropItems()
        end
        if errorCounterEnabled then
            errorCountLabel.Text = "🔧 Active Errors: " .. countActiveErrors()
        end
        task.wait(1)
    end
end)





closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local createdByLabel = Instance.new("TextLabel")
createdByLabel.Size = UDim2.new(0, 150, 0, 30)
createdByLabel.Position = UDim2.new(1, -160, 1, -40)  -- Adjusted to be at the bottom right corner
createdByLabel.BackgroundTransparency = 1
createdByLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
createdByLabel.Text = "Created By WCDevs"
createdByLabel.TextSize = 14
createdByLabel.Font = Enum.Font.Gotham
createdByLabel.TextXAlignment = Enum.TextXAlignment.Right
createdByLabel.TextYAlignment = Enum.TextYAlignment.Center
createdByLabel.Parent = mainFrame

-- Default to Manual Tab
tabButtons[1]:Activate()


