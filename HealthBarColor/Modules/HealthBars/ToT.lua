--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
--]]
local GetRGB = GetRGB
local HealthBar_ToT = HealthBarColor:NewModule("HealthBar_ToT")

function HealthBar_ToT:OnEnable()
    local ToT             = HealthBarColor:GetUnit("ToT")
    local color           = HealthBarColor.db.profile.HealthBars.ToT.color
    local colorbyreaction = HealthBarColor.db.profile.HealthBars.ToT.reaction

    local function OnToTChanged()
        if ToT.isPlayer then
            ToT.HealthBar:SetStatusBarColor(ToT.ClassColor:GetRGB())
        else
            ToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end

    local function OnToTChangedReaction()
        if ToT.isPlayer then
            ToT.HealthBar:SetStatusBarColor(ToT.ClassColor:GetRGB())
        else
            ToT.HealthBar:SetStatusBarColor(ToT.ReactionColor:GetRGB())
        end
    end

    if HealthBarColor.db.profile.HealthBars.ToT.selected == 1 then
        if colorbyreaction then
            HealthBarColor:RegisterOnToTChanged("HealthBar_ToT_Reaction",OnToTChangedReaction)
        else
            HealthBarColor:RegisterOnToTChanged("HealthBar_ToT",OnToTChanged)
        end
    elseif HealthBarColor.db.profile.HealthBars.ToT.selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        ToT.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    else
        ToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    end
end
