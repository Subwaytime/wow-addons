--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
--]]
local Font_Target = HealthBarColor:NewModule("Font_Target")
local Target          = HealthBarColor:GetUnit("Target")

function Font_Target:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
    local color           = HealthBarColor.db.profile.Fonts.Target.color
    local colorbyreaction = HealthBarColor.db.profile.Fonts.Target.reaction

    local function OnTargetChanged()
        if Target.isPlayer then
            self:SetColor(Target.ClassColor:GetRGB())
        else
            self:SetColor(color.r,color.g,color.b)
        end
    end

    local function OnTargetChangedReaction()
        if Target.isPlayer then
            self:SetColor(Target.ClassColor:GetRGB())
        else
            self:SetColor(Target.ReactionColor:GetRGB())
        end
    end

    if HealthBarColor.db.profile.Fonts.Target.selected == 1 then
        if colorbyreaction then
            HealthBarColor:RegisterOnTargetChanged("Font_Target_Reaction",OnTargetChangedReaction)
        else
            HealthBarColor:RegisterOnTargetChanged("Font_Target",OnTargetChanged)
        end
    elseif HealthBarColor.db.profile.Fonts.Target.selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        self:SetColor(Player.ClassColor:GetRGB())
    else
        self:SetColor(color.r,color.g,color.b)
    end
end

function Font_Target:OnDisable()
    for _,v in pairs ({
        Target.LeftText,
        Target.RightText,
        Target.MiddleText
    })
    do
        v:SetTextColor(1,1,1)
    end
    Target.Name:SetTextColor(1,0.8196,0)
end

function Font_Target:SetColor(r,g,b)
    for _,text in pairs ({
        Target.LeftText,
        Target.RightText,
        Target.MiddleText,
        Target.Name
    })
    do
        text:SetTextColor(r,g,b)
    end
end