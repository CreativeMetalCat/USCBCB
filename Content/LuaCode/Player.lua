local Player = {}

function Player:BeginPlay()
end

function Player:OnFootstep()
end

--ProjectRootFolder - content folder during development and .exe location i n shipping mode
function Player:GetFootstepSoundFilename(ProjectRootFolder)
    return ProjectRootFolder.."Sounds/Step/Step".. math.random( 1,5 )..".ogg"
end

return Player;