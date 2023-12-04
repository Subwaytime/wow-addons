--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local Font_Boss = HealthBarColor:NewModule("Font_Boss")
local Boss1 = HealthBarColor:GetUnit("Boss1")
local Boss2 = HealthBarColor:GetUnit("Boss2")
local Boss3 = HealthBarColor:GetUnit("Boss3")
local Boss4 = HealthBarColor:GetUnit("Boss4")
local Boss5 = HealthBarColor:GetUnit("Boss5")

function Font_Boss:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
    if HealthBarColor.db.profile.Fonts.Boss.selected == 1 then
        local Player = HealthBarColor:GetUnit("Player")
        for _ ,unit in pairs ({
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5
        })
        do
            unit.LeftText:SetTextColor(Player.ClassColor:GetRGB())
            unit.RightText:SetTextColor(Player.ClassColor:GetRGB())
            unit.MiddleText:SetTextColor(Player.ClassColor:GetRGB())
        end
    else
        local color = HealthBarColor.db.profile.Fonts.Boss.color
        for _ ,unit in pairs ({
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5
        })
        do
            unit.LeftText:SetTextColor(color.r,color.g,color.b)
            unit.RightText:SetTextColor(color.r,color.g,color.b)
            unit.MiddleText:SetTextColor(color.r,color.g,color.b)
        end
    end  
end

function Font_Boss:OnDisable()
    for _,v in pairs ({
        Boss1,
        Boss2,
        Boss3,
        Boss4,
        Boss5
    })
    do
        for _,k in pairs ({
            v.LeftText,
            v.RightText,
            v.MiddleText
        })
        do
            k:SetTextColor(1,1,1)
        end
    end
end