if not game:GetService("RunService"):IsClient() then warn("Client only module.") return {} end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid: Humanoid = character:WaitForChild("Humanoid")

local AnimationModule = {}

local animationTable = {
	template = {
		id = "rbxassetid://0000000", -- Id of your animation
		track = nil, -- don't change!!
		priority = Enum.AnimationPriority.Action, -- priority of your animation
		looped = false, -- if your animation is looped
	},
}

function AnimationModule:Init()
	for c, v in pairs(animationTable) do
		if v.id == "" then warn("ths animation doesn't have id") v.id = "rbxassetid://0" end
		local animation = Instance.new("Animation")
		animation.AnimationId = v.id
		v.track = humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(animation)

		local track: AnimationTrack = v.track

		track.Priority = v.priority
		track.Looped = v.looped
	end
end

function AnimationModule:PlayAnimation(name: string, fadeTime)
	
	if not animationTable[name] then warn("This animation doens't exist") return end
	
	if fadeTime == nil then fadeTime = .2 end
	
	local track = AnimationModule.GetTrack(name)
	
	track:Play(fadeTime)
	return track
end

function AnimationModule:StopAnimation(name: string, fadeTime)
	local track = AnimationModule.GetTrack(name)
	
	if track == nil then warn("Nothing to be stopped") return end
	
	if fadeTime == nil then fadeTime = .2 end
	
	track:Stop(fadeTime)
end

function AnimationModule.GetTrack(name: string)
	return animationTable[name].track
end

function AnimationModule:StopAllAnims(fadeTime)
	local animator = humanoid:WaitForChild("Animator")
	
	if fadeTime == nil then fadeTime = .2 end	
	
	for _, v in pairs(animator:GetPlayingAnimationTracks()) do
		v:Stop(fadeTime)
	end
end

AnimationModule:Init()

return AnimationModule
