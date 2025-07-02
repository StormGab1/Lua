local player = game.Players.LocalPlayer
local Character = player.Character or  player.CharacterAdded:Wait()
local Mouse = player:GetMouse()

local Events = {}

local function GetRandomPlayer()
	local Player = game.Players:GetChildren()[math.random(1, #game.Players:GetChildren())]
	if Player.Name == game.Players.LocalPlayer then
		return GetRandomPlayer()
	else
		return Player
	end
end

local function GetRandomName()
	if math.random(1,2) == 1 then
		return GetRandomPlayer().Name
	else
		if math.random(1,2) == 1 then
			local Part = workspace:GetChildren()[math.random(1, #workspace:GetChildren())]
			return Part.Name
		else
			local Part = game.ReplicatedStorage:GetDescendants()[math.random(1, #game.ReplicatedStorage:GetDescendants())]
			return Part.Name
		end
	end
end

local function GetRandomModel()
	local Model = workspace:GetChildren()[math.random(1, #workspace:GetChildren())]
	return Model
end

local function GetRandomInstance()
	local gam = game:GetChildren()[math.random(1, #game:GetChildren())]
	if #gam:GetChildren() > 0 then
		local instance = gam:GetChildren()[math.random(1, #gam:GetChildren())]
		if instance.Name == game.Players.LocalPlayer.Name then
			return GetRandomInstance()
		else
			return instance
		end
	else
		return GetRandomInstance()
	end
end

local function GetPosition()
	local RandomNum = math.random(1,6)
	if RandomNum == 1 then
		return Vector3.new(math.random(0, 500), math.random(0, 500), math.random(0,500))
	elseif RandomNum == 2 then
		return Mouse
	elseif RandomNum == 3 then
		return Mouse.Target
	elseif RandomNum == 4 then
		return Mouse.Target.Position
	elseif RandomNum == 5 then
		return Mouse.Hit
	elseif RandomNum == 6 then
		if Character and Character:FindFirstChild("HumanoidRootPart") then
			return Character.HumanoidRootPart.Position
		else
			return GetPosition()
		end
	end
end

local argumentos = {GetRandomPlayer, GetRandomName, GetRandomModel, GetRandomInstance, GetPosition, math.random(0, 100000), "Lol", nil, false, true}

local function GetTable()
	local Table = {
		{argumentos[math.random(1, #argumentos)]},
		{argumentos[math.random(1, #argumentos)], argumentos[math.random(1, #argumentos)]},
		{argumentos[math.random(1, #argumentos)], argumentos[math.random(1, #argumentos)], argumentos[math.random(1, #argumentos)]},
		{argumentos[math.random(1, #argumentos)], argumentos[math.random(1, #argumentos)], argumentos[math.random(1, #argumentos)], argumentos[math.random(1, #argumentos)]}
	}
	
	local NewTable = Table[math.random(1, #Table)]
	
	for Index, value in pairs(NewTable) do
	if typeof(value) == "function" then
		NewTable[Index] = value()
	end
	end
	
	return NewTable
end

local Args = argumentos
table.insert(Args, GetTable)

local Intervalo_De_Tempo = 0.1

for _, Event in pairs(game:GetDescendants()) do
	if Event.ClassName == "RemoteEvent" or Event.ClassName == "RemoteFunction" then
		local quan = string.len(Event.Name)
		if quan < 20 then
			table.insert(Events, Event)
		end
	end
end

local function GetRandomArg()
	local value = Args[math.random(1, #Args)]
	if typeof(value) == "function" then
		return value()
	else
		return value
	end
end


while task.wait(Intervalo_De_Tempo) do
	local Sucess, Error = pcall(function()
		local RandomNumber = math.random(1, 7)
		for _, Event in pairs(Events) do
			if Event.ClassName == "RemoteEvent" then
				if RandomNumber == 0 then
					Event:FireServer()
				elseif RandomNumber == 1 then
					Event:FireServer(GetRandomArg())
				elseif RandomNumber == 2 then
					Event:FireServer(GetRandomArg(), GetRandomArg())
				elseif RandomNumber == 3 then
					Event:FireServer(GetRandomArg(), GetRandomArg(), GetRandomArg())
				elseif RandomNumber == 4 then
					Event:FireServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg())
				elseif RandomNumber == 5 then
					Event:FireServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg())
				elseif RandomNumber == 6 then
					Event:FireServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg())
				elseif RandomNumber == 7 then
					Event:FireServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg())
				end
			else
				if RandomNumber == 0 then
					task.spawn(function() Event:InvokeServer() end)
				elseif RandomNumber == 1 then
					task.spawn(function() Event:InvokeServer(GetRandomArg()) end)
				elseif RandomNumber == 2 then
					task.spawn(function() Event:InvokeServer(GetRandomArg(), GetRandomArg()) end)
				elseif RandomNumber == 3 then
					task.spawn(function() Event:InvokeServer(GetRandomArg(), GetRandomArg(), GetRandomArg()) end)
				elseif RandomNumber == 4 then
					task.spawn(function() Event:InvokeServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg()) end)
				elseif RandomNumber == 5 then
					task.spawn(function() Event:InvokeServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg()) end)
				elseif RandomNumber == 6 then
					task.spawn(function() Event:InvokeServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg()) end)
				elseif RandomNumber == 7 then
					task.spawn(function() Event:InvokeServer(GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg(), GetRandomArg()) end)
				end
			end
		end

	end)
	if Error then warn(Error) end
end
