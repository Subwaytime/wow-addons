--[[
    Created by Slothpala 
--]]

local BackgroundTexture = HealthBarColor:NewModule("BackgroundTexture")
local media = LibStub("LibSharedMedia-3.0")
media:HashTable("statusbar")
local color = {r=0,g=0,b=0}
local texturePath
--units
local Player = {}
local Target = {}
local ToT    = {}
local Focus  = {} 
local ToF    = {}
local Boss1  = {}
local Boss2  = {}
local Boss3  = {}
local Boss4  = {}
local Boss5  = {}


function BackgroundTexture:OnEnable()
    self:GetSettings()
    --unit health bars
    Player.HealthBar = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar
    Target.HealthBar = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
    Focus.HealthBar  = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
    ToT.HealthBar    = _G.TargetFrameToT.HealthBar
    ToF.HealthBar    = _G.FocusFrameToT.HealthBar
    Boss1.HealthBar  = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
    Boss2.HealthBar  = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
    Boss3.HealthBar  = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
    Boss4.HealthBar  = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
    Boss5.HealthBar  = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
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
end

function BackgroundTexture:OnDisable()
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
        unit.BackgroundTexture:Hide()
    end
end

function BackgroundTexture:GetSettings()
    color = HealthBarColor.db.profile.BackgroundTexture.color
    texturePath = media:Fetch("statusbar", HealthBarColor.db.profile.BackgroundTexture.texture)
end

function BackgroundTexture:SetupFrame(unit)
    if not unit.Background then
        unit.Background = CreateFrame("Frame",nil, unit.HealthBar)
    end
    unit.BackgroundTexture = unit.Background:CreateTexture()
    unit.Background:SetFrameStrata(unit.HealthBar:GetFrameStrata())
    unit.Background:SetFrameLevel(unit.HealthBar:GetFrameLevel()-1)
    unit.Background:SetWidth(unit.HealthBar:GetWidth()) 
    unit.Background:SetHeight(unit.HealthBar:GetHeight()) 
end

function BackgroundTexture:SetupTexture(unit)
    unit.BackgroundTexture:SetTexture(texturePath)
    unit.BackgroundTexture:AddMaskTexture(unit.HealthBar.HealthBarMask)
    unit.BackgroundTexture:SetVertexColor(color.r,color.g,color.b,1)
    unit.BackgroundTexture:SetAllPoints(unit.Background)
    unit.Background.texture = unit.BackgroundTexture
    unit.Background:SetPoint("TOPLEFT",0,0)
end



