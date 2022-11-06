local Textures = HealthBarColor:NewModule("Textures")
local media = LibStub("LibSharedMedia-3.0")
media:HashTable("statusbar")

function Textures:OnEnable()
    Textures:ApplyAll()
    Textures:RegisterEvent("PLAYER_TARGET_CHANGED","TargetStatusbar")
    Textures:RegisterEvent("PLAYER_FOCUS_CHANGED","FocusStatusbar")
    Textures:RegisterEvent("PLAYER_ENTERING_WORLD","ApplyAll")
    Textures:RegisterEvent("ZONE_CHANGED_NEW_AREA","FocusStatusbar")
    Textures:RegisterEvent("BOSS_KILL","FocusStatusbar")
end
--Player
function Textures:PlayerStatusbar()
    if not IsAddOnLoaded("BiggerHealthBar") then
        PlayerFrameHealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
    end
end
--Target
function Textures:TargetStatusbar()
    TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
end
--TargetOfTarget
function Textures:TargetOfTargetStatusbar()
    TargetFrameToT.HealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
end
--Focus
function Textures:FocusStatusbar()
    FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
end
--TargetOfFocus
function Textures:TargetOfFocusStatusbar()
    FocusFrameToT.HealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
end
--Pet
function Textures:PetStatusbar()
    PetFrameHealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
end
function Textures:ApplyAll()
    Textures:PlayerStatusbar()
    Textures:TargetStatusbar()
    Textures:TargetOfTargetStatusbar()
    Textures:FocusStatusbar()
    Textures:TargetOfFocusStatusbar()
    Textures:PetStatusbar()
end

