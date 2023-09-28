--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local HealthBar_Pet = HealthBarColor:NewModule("HealthBar_Pet")
local hooked = nil
local updateColor = function() end


function HealthBar_Pet:OnEnable()
    local Pet = HealthBarColor:GetUnit("Pet")
    if HealthBarColor.db.profile.HealthBars.Pet.selected == 1 then
        local Player = HealthBarColor:GetUnit("Player")
        updateColor = function()
            Pet.HealthBar:SetStatusBarColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
        end
    else
        local color = HealthBarColor.db.profile.HealthBars.Pet.color
        updateColor = function()
            Pet.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end  
    Pet.HealthBar.lockColor = true
    updateColor()
end

