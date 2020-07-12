local Button = {}

Button["KeyId"] = -1;
Button["NeedsKey"] = -1;
Button["RemoveKeyOnUse"] = -1;

function Button:BeginPlay(KeyId,NeedsKey,RemoveKeyOnUse)
    Button["KeyId"] = KeyId;
    Button["NeedsKey"] = NeedsKey;
    Button["RemoveKeyOnUse"] = RemoveKeyOnUse;
end

--Presser - who pressed the button
function Button:OnPressed(Presser)
    if( Button["NeedsKey"]==true)
    then
        if(Player:HasKey(Presser, Button["KeyId"]))
        then 
            PlaySoundFromFile(GetProjectDir().."Sounds/Interact/KeycardUse1.ogg",Actor:GetLocation(self.GetSelf()),1);
            self.OnSuccess();
        else
            PlaySoundFromFile(GetProjectDir().."Sounds/Interact/KeycardUse2.ogg",Actor:GetLocation(self.GetSelf()),1);
            self.OnFail();
        end
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