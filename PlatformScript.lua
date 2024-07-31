local model = script.Parent
local platform = model.Anchor
local start = model.Start
local finish = model.Finish

local distance = finish.Position - start.Position
local travelTime = 360
local IncrementX = distance.X/travelTime
local IncrementY = distance.Y/travelTime
local IncrementZ = distance.Z/travelTime
local progress = 0
local forward = true

start.Transparency = 1
finish.Transparency = 1

function move ()
	progress = progress + 1
	
	if forward then
	platform.Position = platform.Position + Vector3.new(IncrementX, IncrementY, IncrementZ)
	else
		platform.Position = platform.Position - Vector3.new(IncrementX, IncrementY, IncrementZ)
	end	
	
	if progress >= travelTime then
		progress = 0
		if forward == true then
			forward = false
			if platform.Position ~= finish.Position then
				platform.Position = finish.Position
			end
		else
			forward = true
			if platform.Position ~= start.Position then
				platform.Position = start.Position
			end
		end	
	end	
	
end
game:GetService("RunService").Heartbeat:Connect(move)
