-- Speed Decrease Part
local button = script.Parent
local clickDetector = button:WaitForChild("ClickDetector")
local counterPart = button.Parent
local surfaceGui = counterPart:WaitForChild("SurfaceGui")
local Count = surfaceGui:WaitForChild("Count")
local CounterData = require(
	button.Parent:WaitForChild("CounterData")
)
local SpeedGlobal = require(
	button.Parent:WaitForChild("SpeedGlobal")
)
clickDetector.MouseClick:Connect(function(player)
	if (CounterData.count > 0) then
		CounterData.count = CounterData.count - 1
		Count.Text = tostring(CounterData.count)
		local character = player.Character
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.WalkSpeed = humanoid.WalkSpeed - SpeedGlobal.speedCurrent
	end
end)