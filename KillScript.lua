function destroyPlayer(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health = 0
	end
end
script.Parent.Touched:connect(destroyPlayer)
