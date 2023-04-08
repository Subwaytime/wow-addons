--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
--]]
local HealthBar_Focus = HealthBarColor:NewModule("HealthBar_Focus")

function HealthBar_Focus:OnEnable()
    local Focus           = HealthBarColor:GetUnit("Focus")
    local color           = HealthBarColor.db.profile.HealthBars.Focus.color
    local colorbyreaction = HealthBarColor.db.profile.HealthBars.Focus.reaction

    local function OnFocusChanged()
        if Focus.isPlayer then
            Focus.HealthBar:SetStatusBarColor(Focus.ClassColor:GetRGB())
        else
            Focus.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end

    local function OnFocusChangedReaction()
        if Focus.isPlayer then
            Focus.HealthBar:SetStatusBarColor(Focus.ClassColor:GetRGB())
        else
            Focus.HealthBar:SetStatusBarColor(Focus.ReactionColor:GetRGB())
        end
    end

    if HealthBarColor.db.profile.HealthBars.Focus.selected == 1 then
        if colorbyreaction then
            HealthBarColor:RegisterOnFocusChanged("HealthBar_Focus_Reaction",OnFocusChangedReaction)
        else
            HealthBarColor:RegisterOnFocusChanged("HealthBar_Focus",OnFocusChanged)
        end
    elseif HealthBarColor.db.profile.HealthBars.Focus.selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        Focus.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    else
        Focus.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    end
end
