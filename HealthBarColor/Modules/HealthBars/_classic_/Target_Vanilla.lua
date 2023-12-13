--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local HealthBar_Target = HealthBarColor:NewModule("HealthBar_Target")
local updateColor = function() end
local hooked = nil

function HealthBar_Target:OnEnable()
    local Target = HealthBarColor:GetUnit("Target")
    local color =  HealthBarColor.db.profile.HealthBars.Target.color
    local selected = HealthBarColor.db.profile.HealthBars.Target.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.Target.reaction
    if selected == 1 then
        if reactionColored then
            updateColor = function()
                if Target.isPlayer then
                    Target:SetStatusBarClassColored()
                else
                    Target:SetStatusBarReactionColored()
                end
            end
        else
            updateColor = function()
                if Target.isPlayer then
                    Target:SetStatusBarClassColored()
                else
                    Target.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
        HealthBarColor:RegisterOnTargetChanged("HealthBar_Target", updateColor)
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        updateColor = function()
            Target.HealthBar:SetStatusBarColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
        end
    elseif selected == 3 then
        updateColor = function()
            Target.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    else 
        updateColor = function()
            Target:SetStatusBarReactionColored()
        end
        HealthBarColor:RegisterOnTargetChanged("HealthBar_Target", updateColor)
    end
    Target.HealthBar.lockColor = true
    updateColor()
end

