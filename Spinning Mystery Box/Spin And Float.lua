local model = script.Parent
local RunService = game:GetService("RunService")

local startPivot = model:GetPivot()
local angle = 0

local rotationSpeed = math.rad(90) -- Spin speed
local floatHeight = 2 -- Float 2 studs up and down
local floatSpeed = 2 -- Floating speed

RunService.Heartbeat:Connect(function(dt)
    angle += rotationSpeed * dt

    local floatOffset = math.sin(os.clock() * floatSpeed) * floatHeight

    local position = startPivot.Position + Vector3.new(0, floatOffset, 0)
    local rotation = startPivot - startPivot.Position

    model:PivotTo(
        CFrame.new(position)
        * CFrame.Angles(0, angle, 0)
        * rotation
    )
end)


Do you understand this code?