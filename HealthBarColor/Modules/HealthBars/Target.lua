--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
--]]
local GetRGB = GetRGB
local HealthBar_Target = HealthBarColor:NewModule("HealthBar_Target")

function HealthBar_Target:OnEnable()
    local Target          = HealthBarColor:GetUnit("Target")
    local color           = HealthBarColor.db.profile.HealthBars.Target.color
    local colorbyreaction = HealthBarColor.db.profile.HealthBars.Target.reaction

    local function OnTargetChanged()
        if Target.isPlayer then
            Target.HealthBar:SetStatusBarColor(Target.ClassColor:GetRGB())
        else
            Target.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end

    local function OnTargetChangedReaction()
        if Target.isPlayer then
            Target.HealthBar:SetStatusBarColor(Target.ClassColor:GetRGB())
        else
            Target.HealthBar:SetStatusBarColor(Target.ReactionColor:GetRGB())
        end
    end

    if HealthBarColor.db.profile.HealthBars.Target.selected == 1 then
        if colorbyreaction then
            HealthBarColor:RegisterOnTargetChanged("HealthBar_Target_Reaction",OnTargetChangedReaction)
        else
            HealthBarColor:RegisterOnTargetChanged("HealthBar_Target",OnTargetChanged)
        end
    elseif HealthBarColor.db.profile.HealthBars.Target.selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        Target.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    else
        Target.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    end
end

