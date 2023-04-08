--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local Font_Pet = HealthBarColor:NewModule("Font_Pet")
local Pet = HealthBarColor:GetUnit("Pet")

function Font_Pet:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
   
    if HealthBarColor.db.profile.Fonts.Pet.selected == 1 then
        local Player = HealthBarColor:GetUnit("Player")
        Pet.LeftText:SetTextColor(Player.ClassColor:GetRGB())
        Pet.RightText:SetTextColor(Player.ClassColor:GetRGB())
        Pet.MiddleText:SetTextColor(Player.ClassColor:GetRGB())
    else
        local color = HealthBarColor.db.profile.Fonts.Pet.color
        Pet.LeftText:SetTextColor(color.r,color.g,color.b)
        Pet.RightText:SetTextColor(color.r,color.g,color.b)
        Pet.MiddleText:SetTextColor(color.r,color.g,color.b)
    end  
end

function Font_Pet:OnDisable()
    for _,v in pairs ({
        Pet.LeftText,
        Pet.RightText,
        Pet.MiddleText
    })
    do
        v:SetTextColor(1,1,1)
    end
end