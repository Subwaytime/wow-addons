--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
--]]
local GetRGB = GetRGB
local HealthBar_ToF = HealthBarColor:NewModule("HealthBar_ToF")

function HealthBar_ToF:OnEnable()
    local ToF             = HealthBarColor:GetUnit("ToF")
    local color           = HealthBarColor.db.profile.HealthBars.ToF.color
    local colorbyreaction = HealthBarColor.db.profile.HealthBars.ToF.reaction

    local function OnToFChanged()
        if ToF.isPlayer then
            ToF.HealthBar:SetStatusBarColor(ToF.ClassColor:GetRGB())
        else
            ToF.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end

    local function OnToFChangedReaction()
        if ToF.isPlayer then
            ToF.HealthBar:SetStatusBarColor(ToF.ClassColor:GetRGB())
        else
            ToF.HealthBar:SetStatusBarColor(ToF.ReactionColor:GetRGB())
        end
    end

    if HealthBarColor.db.profile.HealthBars.ToF.selected == 1 then
        if colorbyreaction then
            HealthBarColor:RegisterOnToFChanged("HealthBar_ToF_Reaction",OnToFChangedReaction)
        else
            HealthBarColor:RegisterOnToFChanged("HealthBar_ToF",OnToFChanged)
        end
    elseif HealthBarColor.db.profile.HealthBars.ToF.selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        ToF.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    else
        ToF.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    end
end