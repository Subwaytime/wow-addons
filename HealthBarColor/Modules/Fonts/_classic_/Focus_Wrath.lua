--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = units class/reaction color
    selected 3 = my class color
    selected 4 = static color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local pairs = pairs
local Font_Focus = HealthBarColor:NewModule("Font_Focus")
local Focus = HealthBarColor:GetUnit("Focus")
local ToF = HealthBarColor:GetUnit("ToF")
local Media = LibStub("LibSharedMedia-3.0")
local name_font, healthbar_font, powerbar_font, name_outline, healthbar_outline, powerbar_outline, name_size, healthbar_size, powerbar_size
local name_color, healthbar_color, powerbar_color = {r=0,g=0,b=0}, {r=0,g=0,b=0}, {r=0,g=0,b=0}

function Font_Focus:OnEnable()
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
    self:SetFonts()
    --COLOR
    --name
    name_color = HealthBarColor.db.profile.Fonts.Focus.name_color
    selected = HealthBarColor.db.profile.Fonts.Focus.name_choice
    if selected == 1 then
        local function OnFocusChanged()
            if Focus.isPlayer then
                Focus.Name:SetTextColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
            else
                Focus.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
            end
        end
        HealthBarColor:RegisterOnFocusChanged("Font_Name_ClassColor",OnFocusChanged)
        local function OnToFChanged()
            if ToF.isPlayer then
                ToF.Name:SetTextColor(ToF.ClassColor.r,ToF.ClassColor.g,ToF.ClassColor.b)
            else
                ToF.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
            end
        end
        HealthBarColor:RegisterOnToFChanged("Font_Name_ClassColor",OnToFChanged)
    elseif selected == 2 then
        local function OnFocusChanged()
            if Focus.isPlayer then
                Focus.Name:SetTextColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
            else
                Focus.Name:SetTextColor(Focus.ReactionColor.r,Focus.ReactionColor.g,Focus.ReactionColor.b)
            end
        end
        HealthBarColor:RegisterOnFocusChanged("Font_Name_ClassColor",OnFocusChanged)
        local function OnToFChanged()
            if ToF.isPlayer then
                ToF.Name:SetTextColor(ToF.ClassColor.r,ToF.ClassColor.g,ToF.ClassColor.b)
            else
                ToF.Name:SetTextColor(ToF.ReactionColor.r,ToF.ReactionColor.g,ToF.ReactionColor.b)
            end
        end
        HealthBarColor:RegisterOnToFChanged("Font_Name_ClassColor",OnToFChanged)
    elseif selected == 3 then
        local Player = HealthBarColor:GetUnit("Player")
        Focus.Name:SetTextColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
        ToF.Name:SetTextColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
    else
        Focus.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
        ToF.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
    end
    if HealthBarColor.isWrath then
        --healthbar
        healthbar_color = HealthBarColor.db.profile.Fonts.Focus.healthbar_color
        selected = HealthBarColor.db.profile.Fonts.Focus.healthbar_choice
        if selected == 1 then
            local function OnFocusChanged()
                if Focus.isPlayer then
                    for _,text in pairs (Focus.HealthText) do
                        text:SetTextColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
                    end
                else
                    for _,text in pairs (Focus.HealthText) do
                        text:SetTextColor(healthbar_color.r,healthbar_color.g,healthbar_color.b)
                    end
                end
            end
            HealthBarColor:RegisterOnFocusChanged("Font_HealthText_ClassColor",OnFocusChanged)
        elseif selected == 2 then
            local function OnFocusChanged()
                if Focus.isPlayer then
                    for _,text in pairs (Focus.HealthText) do
                        text:SetTextColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
                    end
                else
                    for _,text in pairs (Focus.HealthText) do
                        text:SetTextColor(Focus.ReactionColor.r,Focus.ReactionColor.g,Focus.ReactionColor.b)
                    end
                end
            end
            HealthBarColor:RegisterOnFocusChanged("Font_HealthText_ClassColor",OnFocusChanged)
        elseif selected == 3 then
            local Player = HealthBarColor:GetUnit("Player")
            for _,text in pairs (Focus.HealthText) do
                text:SetTextColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
            end
        else
            for _,text in pairs (Focus.HealthText) do
                text:SetTextColor(healthbar_color.r,healthbar_color.g,healthbar_color.b)
            end
        end
        --powerbar
        powerbar_color = HealthBarColor.db.profile.Fonts.Focus.powerbar_color
        selected = HealthBarColor.db.profile.Fonts.Focus.powerbar_choice
        if selected == 1 then
            local function OnFocusChanged()
                if Focus.isPlayer then
                    for _,text in pairs (Focus.PowerText) do
                        text:SetTextColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
                    end
                else
                    for _,text in pairs (Focus.PowerText) do
                        text:SetTextColor(powerbar_color.r,powerbar_color.g,powerbar_color.b)
                    end
                end
            end
            HealthBarColor:RegisterOnFocusChanged("Font_PowerText_ClassColor",OnFocusChanged)
        elseif selected == 2 then
            local function OnFocusChanged()
                if Focus.isPlayer then
                    for _,text in pairs (Focus.PowerText) do
                        text:SetTextColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
                    end
                else
                    for _,text in pairs (Focus.PowerText) do
                        text:SetTextColor(Focus.ReactionColor.r,Focus.ReactionColor.g,Focus.ReactionColor.b)
                    end
                end
            end
            HealthBarColor:RegisterOnFocusChanged("Font_PowerText_ClassColor",OnFocusChanged)
        elseif selected == 3 then
            local Player = HealthBarColor:GetUnit("Player")
            for _,text in pairs (Focus.PowerText) do
                text:SetTextColor(Player.ClassColor.r,Player.ClassColor.g,Player.ClassColor.b)
            end
        else
            for _,text in pairs (Focus.PowerText) do
                text:SetTextColor(powerbar_color.r,powerbar_color.g,powerbar_color.b)
            end
        end
    end
end

function Font_Focus:OnDisable()
    Focus.Name:SetFont("Fonts\\FRIZQT__.TTF", 10,"NONE")
    Focus.Name:SetTextColor(1,0.8196,0)
    ToF.Name:SetFont("Fonts\\FRIZQT__.TTF", 10,"NONE")
    ToF.Name:SetTextColor(1,0.8196,0)
    for _,text in pairs (Focus.HealthText) do
        text:SetFont("Fonts\\ARIALN.TTF", 14,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
    for _,text in pairs (Focus.PowerText) do
        text:SetFont("Fonts\\ARIALN.TTF", 14,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
end

function Font_Focus:SetFonts()
    Focus.Name:SetFont(name_font, name_size, name_outline)
    ToF.Name:SetFont(name_font, name_size, name_outline)
    for _,text in pairs (Focus.HealthText) do
        text:SetFont(healthbar_font, healthbar_size, healthbar_outline)
    end
    for _,text in pairs (Focus.PowerText) do
        text:SetFont(powerbar_font, powerbar_size, powerbar_outline)
    end
end