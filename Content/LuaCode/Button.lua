local Button = {}

Button["KeyId"] = -1;

Button["False"] = true;

function Button:BeginPlay()
end

--Presser - who pressed the button
function Button:OnPressed(Presser)
    if(self.GetNeedsKey()==true)
    then
        PlaySoundFromFile(GetProjectDir().."Sounds/Interact/Button2.ogg",Actor:GetLocation(self.GetSelf()),1);
        self.OnFail();
    else
        PlaySoundFromFile(GetProjectDir().."Sounds/Interact/Button.ogg",Actor:GetLocation(self.GetSelf()),1);
        local Actors = self.GetAllTargetActors();
        if(Actors==nil)then print("Warning: self.GetAllTargetActors() returned empty array. Is this by desing or level issue?") end
        for i=1,self.GetAmountOfTargetActors()+1 do
            Actor:BeUsedByButton(self.GetSelf(),Actors[i]);
        end
        self.OnSuccess();
    end
end


function Button:GetVariablesToSave()
end


return Button;