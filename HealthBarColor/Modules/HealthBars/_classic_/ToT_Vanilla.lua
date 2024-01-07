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
local updateColor = function() end
local hooked = nil

function HealthBar_ToT:OnEnable()
    local ToT = HealthBarColor:GetUnit("ToT")
    local color =  HealthBarColor.db.profile.HealthBars.ToT.color
    local selected = HealthBarColor.db.profile.HealthBars.ToT.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.ToT.reaction
    if selected == 1 then
        if reactionColored then
            updateColor = function()
                if ToT.isPlayer then
                    ToT:SetStatusBarClassColored()
                else
                    ToT:SetStatusBarReactionColored()
                end
            end
        else
            updateColor = function()
                if ToT.isPlayer then
                    ToT:SetStatusBarClassColored()
                else
                    ToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        updateColor = function()
            ToT.HealthBar:SetStatusBarColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
        end
    elseif selected == 3 then
        updateColor = function()
            ToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    else 
        updateColor = function()
            ToT:SetStatusBarReactionColored()
        end
    end
    ToT.HealthBar.lockColor = true
    HealthBarColor:RegisterOnToTChanged("HealthBar_ToT", updateColor)
    updateColor()
end

