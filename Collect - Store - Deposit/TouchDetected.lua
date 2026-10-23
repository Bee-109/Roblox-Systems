local part = script.Parent


local CanCollectCount = part.PlateForCollect.Gui1:WaitForChild("CanCollectCount")


part.Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		print("Player touched the plate!")
		
		CanCollectCount.Text = tostring(0)
		
		part.Size = Vector3.new(9.7, 0.5, 10.8)
		
	end
end)