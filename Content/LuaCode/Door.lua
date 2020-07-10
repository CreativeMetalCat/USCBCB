--the door is most one of the most common objects in game
--this script is for sliding door
local Door = {}

Door["openDoorTime"] = 1.5;--how long does it take to open door
Door["openDoorPassedTime"]= 0;--how much time passed since start of open door sequence

Door["movementDistance"] = -100;

Door["moving"] = false;

Door["doorOpenSoundFilePath"] = "Sounds/Door/DoorOpen1.ogg"

Door["doorLockedSoundFilePath"] = "Sounds/Interact/Button2.ogg"

Door["DoorObjectRef"] = nil;



function Door:OnTick(deltaTime)
    if (Door["moving"]==true)
    then
        Door["openDoorPassedTime"] = Door["openDoorPassedTime"] + deltaTime;
        if Door["openDoorPassedTime"]>=Door["openDoorTime"]
        then
            Door:StopMoving(self);
        else
        percentage = Door["openDoorPassedTime"]/Door["openDoorTime"];
        self.UpdateDoorPosition(percentage);
        end
    end
end

function Door:StartMoving()
    Door["DoorObjectRef"] = self.GetSelf();
    if(self.GetIsLocked()==false)
    then
        PlaySoundFromFile(GetProjectDir()..Door["doorOpenSoundFilePath"],Actor:GetLocation(self.GetSelf()),1)
        Door["moving"]=true;
    else
        PlaySoundFromFile(GetProjectDir()..Door["doorLockedSoundFilePath"],Actor:GetLocation(self.GetSelf()),1)
    end
end

function Door:StopMoving(actor)
    Door["openDoorPassedTime"] = 0;
    Door["moving"]=false;
    if(actor.GetIsOpened()==true)then
        actor.SetIsOpened(false);
    else
        actor.SetIsOpened(true);
    end
    
end

function Door:GetMovementDistance()
    return Door["movementDistance"];
end

function Door:GetIsMoving()
end

function Door:BeginPlay()

end

function Door:GetAllValuesToSave()
    
end

return Door;