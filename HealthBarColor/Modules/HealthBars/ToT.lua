--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local HealthBar_ToT = HealthBarColor:NewModule("HealthBar_ToT")

function HealthBar_ToT:OnEnable()
    local ToT = HealthBarColor:GetUnit("ToT")
    local color =  HealthBarColor.db.profile.HealthBars.ToT.color
    local selected = HealthBarColor.db.profile.HealthBars.ToT.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.ToT.reaction
    local OnToTChanged
    if selected == 1 then
        if reactionColored then
            OnToTChanged = function()
                if ToT.isPlayer then
                    ToT:SetStatusBarClassColored()
                else
                    ToT:SetStatusBarReactionColored()
                end
            end
        else
            OnToTChanged = function()
                if ToT.isPlayer then
                    ToT:SetStatusBarClassColored()
                else
                    ToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
        HealthBarColor:RegisterOnToTChanged("HealthBar_ToT", OnToTChanged)
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        ToT.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    elseif selected == 3 then
        ToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    else 
        OnToTChanged = function()
            ToT:SetStatusBarReactionColored()
        end
        HealthBarColor:RegisterOnToTChanged("HealthBar_ToT", OnToTChanged)
    end
end

