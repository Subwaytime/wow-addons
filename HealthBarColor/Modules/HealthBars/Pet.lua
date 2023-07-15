--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local HealthBar_Pet = HealthBarColor:NewModule("HealthBar_Pet")

function HealthBar_Pet:OnEnable()
    local Pet = HealthBarColor:GetUnit("Pet")
    if HealthBarColor.db.profile.HealthBars.Pet.selected == 1 then
        local Player = HealthBarColor:GetUnit("Player")
        Pet.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    else
        local color = HealthBarColor.db.profile.HealthBars.Pet.color
        Pet.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    end  
end

