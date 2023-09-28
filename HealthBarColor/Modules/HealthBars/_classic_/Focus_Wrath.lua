--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local HealthBar_Focus = HealthBarColor:NewModule("HealthBar_Focus")
local updateColor = function() end
local hooked = nil

function HealthBar_Focus:OnEnable()
    local Focus = HealthBarColor:GetUnit("Focus")
    local color =  HealthBarColor.db.profile.HealthBars.Focus.color
    local selected = HealthBarColor.db.profile.HealthBars.Focus.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.Focus.reaction
    if selected == 1 then
        if reactionColored then
            updateColor = function()
                if Focus.isPlayer then
                    Focus:SetStatusBarClassColored()
                else
                    Focus:SetStatusBarReactionColored()
                end
            end
        else
            updateColor = function()
                if Focus.isPlayer then
                    Focus:SetStatusBarClassColored()
                else
                    Focus.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
        HealthBarColor:RegisterOnFocusChanged("HealthBar_Focus", updateColor)
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        updateColor = function()
            Focus.HealthBar:SetStatusBarColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
        end
    elseif selected == 3 then
        updateColor = function()
            Focus.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    else 
        updateColor = function()
            Focus:SetStatusBarReactionColored()
        end
        HealthBarColor:RegisterOnFocusChanged("HealthBar_Focus", updateColor)
    end
    Focus.HealthBar.lockColor = true
    updateColor()
end

