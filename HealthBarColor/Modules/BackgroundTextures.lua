--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local media = LibStub("LibSharedMedia-3.0")
local BackgroundTexture
local color

local Player = HealthBarColor:GetUnit("Player")
local Target = HealthBarColor:GetUnit("Target")
local Focus  = HealthBarColor:GetUnit("Focus")
local ToT    = HealthBarColor:GetUnit("ToT")
local ToF    = HealthBarColor:GetUnit("ToF")
local Boss1  = HealthBarColor:GetUnit("Boss1")
local Boss2  = HealthBarColor:GetUnit("Boss2")
local Boss3  = HealthBarColor:GetUnit("Boss3")
local Boss4  = HealthBarColor:GetUnit("Boss4")
local Boss5  = HealthBarColor:GetUnit("Boss5")

local BackgroundTextures = HealthBarColor:NewModule("BackgroundTextures")
function BackgroundTextures:OnEnable()
    color  = HealthBarColor.db.profile.Modules.BackgroundTextures.color
    BackgroundTexture = media:Fetch("statusbar", HealthBarColor.db.profile.Modules.BackgroundTextures.texture)
    for _,unit in pairs ({
        Player,
        Target,
        Focus,
        ToT,
        ToF,
        Boss1,
        Boss2,
        Boss3,
        Boss4,
        Boss5
    }) do
        --creating frames
        self:SetupFrame(unit)
        --creating texture
        self:SetupTexture(unit)
    end
    if HealthBarColor.db.profile.Settings.Modules.BiggerHealthBar then 
        Player.BackgroundTexture:RemoveMaskTexture(Player.BackgroundTexture:GetMaskTexture(1))
        Player.Background:SetHeight(31)
    end
    if HealthBarColor.db.profile.Settings.Modules.BetterBossFrames then 
        for _,unit in pairs ({
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5
        }) do
            unit.BackgroundTexture:RemoveMaskTexture(unit.BackgroundTexture:GetMaskTexture(1))
            unit.Background:SetHeight(22)
        end
    end
end

function BackgroundTextures:OnDisable()
    for _,unit in pairs ({
        Player,
        Target,
        Focus,
        ToT,
        ToF, 
        Boss1,
        Boss2,
        Boss3,
        Boss4,
        Boss5
    }) do
        if unit.BackgroundTexture then
            unit.BackgroundTexture:Hide()
        end
    end
end


function BackgroundTextures:SetupFrame(unit)
    if not unit.Background then
        unit.Background = CreateFrame("Frame",nil, unit.HealthBar)
    end
    unit.BackgroundTexture = unit.Background:CreateTexture()
    unit.Background:SetFrameStrata("BACKGROUND")
    unit.Background:SetWidth(unit.HealthBar:GetWidth()) 
    unit.Background:SetHeight(unit.HealthBar:GetHeight()) 
end

function BackgroundTextures:SetupTexture(unit)
    unit.BackgroundTexture:SetTexture(BackgroundTexture)
    unit.BackgroundTexture:AddMaskTexture(unit.HealthBar.HealthBarMask)
    unit.BackgroundTexture:SetVertexColor(color.r,color.g,color.b,1)
    unit.BackgroundTexture:SetAllPoints(unit.Background)
    unit.Background.texture = unit.BackgroundTexture
    unit.Background:SetPoint("TOPLEFT",0,0)
end



