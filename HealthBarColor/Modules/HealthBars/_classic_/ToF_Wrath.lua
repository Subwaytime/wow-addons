--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local HealthBar_ToF = HealthBarColor:NewModule("HealthBar_ToF")
local updateColor = function() end
local hooked = nil

function HealthBar_ToF:OnEnable()
    local ToF = HealthBarColor:GetUnit("ToF")
    local color =  HealthBarColor.db.profile.HealthBars.ToF.color
    local selected = HealthBarColor.db.profile.HealthBars.ToF.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.ToF.reaction
    if selected == 1 then
        if reactionColored then
            updateColor = function()
                if ToF.isPlayer then
                    ToF:SetStatusBarClassColored()
                else
                    ToF:SetStatusBarReactionColored()
                end
            end
        else
            updateColor = function()
                if ToF.isPlayer then
                    ToF:SetStatusBarClassColored()
                else
                    ToF.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        updateColor = function()
            ToF.HealthBar:SetStatusBarColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
        end
    elseif selected == 3 then
        updateColor = function()
            ToF.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    else 
        updateColor = function()
            ToF:SetStatusBarReactionColored()
        end
    end
    ToF.HealthBar.lockColor = true
    HealthBarColor:RegisterOnToFChanged("HealthBar_ToF", updateColor)
    updateColor()
end

