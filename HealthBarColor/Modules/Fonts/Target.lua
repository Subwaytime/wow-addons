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
local Font_Target = HealthBarColor:NewModule("Font_Target")
local Target = HealthBarColor:GetUnit("Target")
local ToT = HealthBarColor:GetUnit("ToT")
local Media = LibStub("LibSharedMedia-3.0")
local name_font, healthbar_font, powerbar_font, name_outline, healthbar_outline, powerbar_outline
local name_color, healthbar_color, powerbar_color = {r=0,g=0,b=0}, {r=0,g=0,b=0}, {r=0,g=0,b=0}

function Font_Target:OnEnable()
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
    self:SetFonts()
    --COLOR
    --name
    name_color = HealthBarColor.db.profile.Fonts.Target.name_color
    selected = HealthBarColor.db.profile.Fonts.Target.name_choice
    if selected == 1 then
        local function OnTargetChanged()
            if Target.isPlayer then
                Target.Name:SetTextColor(Target.ClassColor:GetRGB())
            else
                Target.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Font_Name_ClassColor",OnTargetChanged)
        local function OnToTChanged()
            if ToT.isPlayer then
                ToT.Name:SetTextColor(ToT.ClassColor:GetRGB())
            else
                ToT.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
            end
        end
        HealthBarColor:RegisterOnToTChanged("Font_Name_ClassColor",OnToTChanged)
    elseif selected == 2 then
        local function OnTargetChanged()
            if Target.isPlayer then
                Target.Name:SetTextColor(Target.ClassColor:GetRGB())
            else
                Target.Name:SetTextColor(Target.ReactionColor:GetRGB())
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Font_Name_ClassColor",OnTargetChanged)
        local function OnToTChanged()
            if ToT.isPlayer then
                ToT.Name:SetTextColor(ToT.ClassColor:GetRGB())
            else
                ToT.Name:SetTextColor(ToT.ReactionColor:GetRGB())
            end
        end
        HealthBarColor:RegisterOnToTChanged("Font_Name_ClassColor",OnToTChanged)
    elseif selected == 3 then
        local Player = HealthBarColor:GetUnit("Player")
        Target.Name:SetTextColor(Player.ClassColor:GetRGB())
        ToT.Name:SetTextColor(Player.ClassColor:GetRGB())
    else
        Target.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
        ToT.Name:SetTextColor(name_color.r,name_color.g,name_color.b)
    end
    --healthbar
    healthbar_color = HealthBarColor.db.profile.Fonts.Target.healthbar_color
    selected = HealthBarColor.db.profile.Fonts.Target.healthbar_choice
    if selected == 1 then
        local function OnTargetChanged()
            if Target.isPlayer then
                for _,text in pairs (Target.HealthText) do
                    text:SetTextColor(Target.ClassColor:GetRGB())
                end
            else
                for _,text in pairs (Target.HealthText) do
                    text:SetTextColor(healthbar_color.r,healthbar_color.g,healthbar_color.b)
                end
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Font_HealthText_ClassColor",OnTargetChanged)
    elseif selected == 2 then
        local function OnTargetChanged()
            if Target.isPlayer then
                for _,text in pairs (Target.HealthText) do
                    text:SetTextColor(Target.ClassColor:GetRGB())
                end
            else
                for _,text in pairs (Target.HealthText) do
                    text:SetTextColor(Target.ReactionColor:GetRGB())
                end
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Font_HealthText_ClassColor",OnTargetChanged)
    elseif selected == 3 then
        local Player = HealthBarColor:GetUnit("Player")
        for _,text in pairs (Target.HealthText) do
            text:SetTextColor(Player.ClassColor:GetRGB())
        end
    else
        for _,text in pairs (Target.HealthText) do
            text:SetTextColor(healthbar_color.r,healthbar_color.g,healthbar_color.b)
        end
    end
    --powerbar
    powerbar_color = HealthBarColor.db.profile.Fonts.Target.powerbar_color
    selected = HealthBarColor.db.profile.Fonts.Target.powerbar_choice
    if selected == 1 then
        local function OnTargetChanged()
            if Target.isPlayer then
                for _,text in pairs (Target.PowerText) do
                    text:SetTextColor(Target.ClassColor:GetRGB())
                end
            else
                for _,text in pairs (Target.PowerText) do
                    text:SetTextColor(powerbar_color.r,powerbar_color.g,powerbar_color.b)
                end
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Font_PowerText_ClassColor",OnTargetChanged)
    elseif selected == 2 then
        local function OnTargetChanged()
            if Target.isPlayer then
                for _,text in pairs (Target.PowerText) do
                    text:SetTextColor(Target.ClassColor:GetRGB())
                end
            else
                for _,text in pairs (Target.PowerText) do
                    text:SetTextColor(Target.ReactionColor:GetRGB())
                end
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Font_PowerText_ClassColor",OnTargetChanged)
    elseif selected == 3 then
        local Player = HealthBarColor:GetUnit("Player")
        for _,text in pairs (Target.PowerText) do
            text:SetTextColor(Player.ClassColor:GetRGB())
        end
    else
        for _,text in pairs (Target.PowerText) do
            text:SetTextColor(powerbar_color.r,powerbar_color.g,powerbar_color.b)
        end
    end
end

function Font_Target:OnDisable()
    Target.Name:SetFont("Fonts\\FRIZQT__.TTF", 10,"NONE")
    Target.Name:SetTextColor(1,0.8196,0)
    ToT.Name:SetFont("Fonts\\FRIZQT__.TTF", 10,"NONE")
    ToT.Name:SetTextColor(1,0.8196,0)
    for _,text in pairs (Target.HealthText) do
        text:SetFont("Fonts\\FRIZQT__.TTF", 10,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
    for _,text in pairs (Target.PowerText) do
        text:SetFont("Fonts\\FRIZQT__.TTF", 10,"OUTLINE")
        text:SetTextColor(1,1,1)
    end
end

function Font_Target:SetFonts()
    Target.Name:SetFont(name_font, 10, name_outline)
    ToT.Name:SetFont(name_font, 10, name_outline)
    for _,text in pairs (Target.HealthText) do
        text:SetFont(healthbar_font, 10,healthbar_outline)
    end
    for _,text in pairs (Target.PowerText) do
        text:SetFont(powerbar_font, 10,powerbar_outline)
    end
end