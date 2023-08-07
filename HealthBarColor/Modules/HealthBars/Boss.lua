--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local HealthBar_Boss = HealthBarColor:NewModule("HealthBar_Boss")

function HealthBar_Boss:OnEnable()
    local Boss1 = HealthBarColor:GetUnit("Boss1")
    local Boss2 = HealthBarColor:GetUnit("Boss2")
    local Boss3 = HealthBarColor:GetUnit("Boss3")
    local Boss4 = HealthBarColor:GetUnit("Boss4")
    local Boss5 = HealthBarColor:GetUnit("Boss5")
    
    if HealthBarColor.db.profile.HealthBars.Boss.selected == 1 then
        local Player = HealthBarColor:GetUnit("Player")
        for _ ,unit in pairs ({
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5
        })
        do
            unit.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
        end
    else
        local color = HealthBarColor.db.profile.HealthBars.Boss.color
        for _ ,unit in pairs ({
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5
        })
        do
            unit.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        end
    end  
end

