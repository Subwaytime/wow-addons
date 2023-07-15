--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local Font_Player = HealthBarColor:NewModule("Font_Player")
local Player = HealthBarColor:GetUnit("Player")
local Media = LibStub("LibSharedMedia-3.0")
local name_font, healthbar_font, powerbar_font, name_outline, healthbar_outline, powerbar_outline
local name_color, healthbar_color, powerbar_color = {r=0,g=0,b=0}, {r=0,g=0,b=0}, {r=0,g=0,b=0}


function Font_Player:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
    --FONT
    --name
    local selected = HealthBarColor.db.profile.Fonts.General.name_outline
    name_outline = selected == 1 and "OUTLINE"  or selected == 2 and "THICKOUTLINE"  or selected == 3 and "MONOCHROME"  or selected == 4 and "NONE" 
    name_font = Media:Fetch("font",HealthBarColor.db.profile.Fonts.General.name) 
    --healthbar
    selected = HealthBarColor.db.profile.Fonts.General.healthbar_outline
    healthbar_outline = selected == 1 and "OUTLINE"  or selected == 2 and "THICKOUTLINE"  or selected == 3 and "MONOCHROME"  or selected == 4 and "NONE" 
    healthbar_font = Media:Fetch("font",HealthBarColor.db.profile.Fonts.General.healthbar) 
    --powerbar
    selected = HealthBarColor.db.profile.Fonts.General.powerbar_outline
    powerbar_outline = selected == 1 and "OUTLINE"  or selected == 2 and "THICKOUTLINE"  or selected == 3 and "MONOCHROME"  or selected == 4 and "NONE"
    powerbar_font = Media:Fetch("font",HealthBarColor.db.profile.Fonts.General.powerbar) 
    --COLOR
    --name
    if HealthBarColor.db.profile.Fonts.Player.name_choice == 1 then
        name_color.r,name_color.g,name_color.b = Player.ClassColor:GetRGB()
    else
        name_color = HealthBarColor.db.profile.Fonts.Player.name_color
    end  
    --healthbar
    if HealthBarColor.db.profile.Fonts.Player.healthbar_choice == 1 then
        healthbar_color.r,healthbar_color.g,healthbar_color.b = Player.ClassColor:GetRGB()
    else
        healthbar_color = HealthBarColor.db.profile.Fonts.Player.healthbar_color
    end  
    --powerbar
    if HealthBarColor.db.profile.Fonts.Player.powerbar_choice == 1 then
        powerbar_color.r,powerbar_color.g,powerbar_color.b = Player.ClassColor:GetRGB()
    else
        powerbar_color = HealthBarColor.db.profile.Fonts.Player.powerbar_color
    end 
    self:Setup()
end

function Font_Player:OnDisable()
    Player.Name:SetFont("Fonts\\FRIZQT__.TTF", 10,"NONE")
    Player.Name:SetTextColor(1,0.8196,0)
    for _,text in pairs (Player.HealthText) do
        text:SetFont("Fonts\\FRIZQT__.TTF", 10,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
    for _,text in pairs (Player.PowerText) do
        text:SetFont("Fonts\\FRIZQT__.TTF", 10,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
end

function Font_Player:Setup()
    Player.Name:SetFont(name_font, 10, name_outline)
    Player.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
    for _,text in pairs (Player.HealthText) do
        text:SetFont(healthbar_font, 10,healthbar_outline)
        text:SetTextColor(healthbar_color.r,healthbar_color.g,healthbar_color.b)
    end
    for _,text in pairs (Player.PowerText) do
        text:SetFont(powerbar_font, 10,powerbar_outline)
        text:SetTextColor(powerbar_color.r,powerbar_color.g,powerbar_color.b)
    end
end