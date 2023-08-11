--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local HealthBar_ToF = HealthBarColor:NewModule("HealthBar_ToF")

function HealthBar_ToF:OnEnable()
    local ToF = HealthBarColor:GetUnit("ToF")
    local color =  HealthBarColor.db.profile.HealthBars.ToF.color
    local selected = HealthBarColor.db.profile.HealthBars.ToF.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.ToF.reaction
    local OnToFChanged
    if selected == 1 then
        if reactionColored then
            OnToFChanged = function()
                if ToF.isPlayer then
                    ToF:SetStatusBarClassColored()
                else
                    ToF:SetStatusBarReactionColored()
                end
            end
        else
            OnToFChanged = function()
                if ToF.isPlayer then
                    ToF:SetStatusBarClassColored()
                else
                    ToF.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
        HealthBarColor:RegisterOnToFChanged("HealthBar_ToF", OnToFChanged)
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        ToF.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    elseif selected == 3 then
        ToF.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    else 
        OnToFChanged = function()
            ToF:SetStatusBarReactionColored()
        end
        HealthBarColor:RegisterOnToFChanged("HealthBar_ToF", OnToFChanged)
    end
end

