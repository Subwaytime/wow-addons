--[[
    Created by Slothpala 
    selected 1 = player class color
    selected 2 = static color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local Font_Player = HealthBarColor:NewModule("Font_Player")
local Player = HealthBarColor:GetUnit("Player")
local Media = LibStub("LibSharedMedia-3.0")
local name_font, healthbar_font, powerbar_font, name_outline, healthbar_outline, powerbar_outline, name_size, healthbar_size, powerbar_size
local name_color, healthbar_color, powerbar_color = {r=0,g=0,b=0}, {r=0,g=0,b=0}, {r=0,g=0,b=0}


function Font_Player:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
    --FONT
    --name
    local selected = HealthBarColor.db.profile.Fonts.General.name_outline
    name_outline = selected == 1 and "OUTLINE"  or selected == 2 and "THICKOUTLINE"  or selected == 3 and "MONOCHROME"  or selected == 4 and "NONE" 
    name_font = Media:Fetch("font",HealthBarColor.db.profile.Fonts.General.name) 
    name_size = HealthBarColor.db.profile.Fonts.General.name_size
    --healthbar
    selected = HealthBarColor.db.profile.Fonts.General.healthbar_outline
    healthbar_outline = selected == 1 and "OUTLINE"  or selected == 2 and "THICKOUTLINE"  or selected == 3 and "MONOCHROME"  or selected == 4 and "NONE" 
    healthbar_font = Media:Fetch("font",HealthBarColor.db.profile.Fonts.General.healthbar) 
    healthbar_size = HealthBarColor.db.profile.Fonts.General.healthbar_size
    --powerbar
    selected = HealthBarColor.db.profile.Fonts.General.powerbar_outline
    powerbar_outline = selected == 1 and "OUTLINE"  or selected == 2 and "THICKOUTLINE"  or selected == 3 and "MONOCHROME"  or selected == 4 and "NONE"
    powerbar_font = Media:Fetch("font",HealthBarColor.db.profile.Fonts.General.powerbar) 
    powerbar_size = HealthBarColor.db.profile.Fonts.General.powerbar_size
    --COLOR
    --name
    if HealthBarColor.db.profile.Fonts.Player.name_choice == 1 then
        name_color.r,name_color.g,name_color.b = Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b
    else
        name_color = HealthBarColor.db.profile.Fonts.Player.name_color
    end  
    --healthbar
    if HealthBarColor.db.profile.Fonts.Player.healthbar_choice == 1 then
        healthbar_color.r,healthbar_color.g,healthbar_color.b = Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b
    else
        healthbar_color = HealthBarColor.db.profile.Fonts.Player.healthbar_color
    end  
    --powerbar
    if HealthBarColor.db.profile.Fonts.Player.powerbar_choice == 1 then
        powerbar_color.r,powerbar_color.g,powerbar_color.b = Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b
    else
        powerbar_color = HealthBarColor.db.profile.Fonts.Player.powerbar_color
    end 
    self:SetFonts()
end

function Font_Player:OnDisable()
    Player.Name:SetFont("Fonts\\FRIZQT__.TTF", 10,"NONE")
    Player.Name:SetTextColor(1,0.8196,0)
    for _,text in pairs (Player.HealthText) do
        text:SetFont("Fonts\\ARIALN.TTF", 14,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
    for _,text in pairs (Player.PowerText) do
        text:SetFont("Fonts\\ARIALN.TTF", 14,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
end

local i = 0
function Font_Player:SetFonts()
    local success = Player.Name:SetFont(name_font, name_size, name_outline)
    --[[
        Hacky method to fix a problem where the PlayerName would just ignore SetFont on the first start of the game (prior to reloading or logging onto another character), even on repeat calls.
        Things I have tried without success:
        -timer after x 
        -repeatedly calling the function any numbers of times
        I don't fully understand why this is, and I assume it's a bug in the game itself.
    ]]
    if not success and i < 10 then
        i = i + 1
        name_font = Media:Fetch("font", "") --defaults to Fonts\\FRIZQT__.TTF 
        self:SetFonts()
    end
    Player.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
    for _,text in pairs (Player.HealthText) do
        text:SetFont(healthbar_font, healthbar_size, healthbar_outline)
        text:SetTextColor(healthbar_color.r,healthbar_color.g,healthbar_color.b)
    end
    for _,text in pairs (Player.PowerText) do
        text:SetFont(powerbar_font, powerbar_size, powerbar_outline)
        text:SetTextColor(powerbar_color.r,powerbar_color.g,powerbar_color.b)
    end
end