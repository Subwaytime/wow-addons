--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local HealthBar_Player = HealthBarColor:NewModule("HealthBar_Player")
local hooked = nil
local updateColor = function() end

function HealthBar_Player:OnEnable()
    local Player = HealthBarColor:GetUnit("Player")
    if HealthBarColor.db.profile.HealthBars.Player.selected == 1 then
        updateColor = function() 
            Player:SetStatusBarClassColored() 
        end
    else
        local color = HealthBarColor.db.profile.HealthBars.Player.color
        updateColor = function() 
            Player.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end  
    if not hooked then
        Player.HealthBar.lockColor = true
    end
    updateColor()
end

