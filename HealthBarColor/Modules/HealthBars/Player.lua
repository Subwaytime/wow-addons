--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local HealthBar_Player = HealthBarColor:NewModule("HealthBar_Player")

function HealthBar_Player:OnEnable()
    local Player = HealthBarColor:GetUnit("Player")
    if Player.isLocked then return end
    if HealthBarColor.db.profile.HealthBars.Player.selected == 1 then
        Player.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    else
        local color = HealthBarColor.db.profile.HealthBars.Player.color
        Player.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    end  
end

