--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local Font_Player = HealthBarColor:NewModule("Font_Player")
local Player = HealthBarColor:GetUnit("Player")

function Font_Player:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
    if HealthBarColor.db.profile.Fonts.Player.selected == 1 then
        self:SetColor(Player.ClassColor:GetRGB())
    else
        local color = HealthBarColor.db.profile.Fonts.Player.color
        self:SetColor(color.r,color.g,color.b)
    end  
end

function Font_Player:OnDisable()
    for _,v in pairs ({
        Player.LeftText,
        Player.RightText,
        Player.MiddleText
    })
    do
        v:SetTextColor(1,1,1)
    end
    Player.Name:SetTextColor(1,0.8196,0)
end

function Font_Player:SetColor(r,g,b)
    for _,text in pairs ({
        Player.LeftText,
        Player.RightText,
        Player.MiddleText,
        Player.Name,
    })
    do
        text:SetTextColor(r,g,b)
    end
end