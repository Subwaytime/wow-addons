--[[
Created by Slothpala 
--]]
local Textures = HealthBarColor:NewModule("Textures")
local media = LibStub("LibSharedMedia-3.0")
media:HashTable("statusbar")
local PowerBarColor = {}

PowerBarColor[0] = {r = 0.00, g = 0.00, b = 1.00,}
PowerBarColor[1] = {r = 1.00, g = 0.00, b = 0.00}
PowerBarColor[2] = {r = 1.00, g = 0.50, b = 0.25}
PowerBarColor[3] = {r = 1.00, g = 1.00, b = 0.00}
PowerBarColor[6] = {r = 0.00, g = 0.82, b = 1.00}
PowerBarColor[8] = {r = 0.30, g = 0.52, b = 0.90}
PowerBarColor[11] = {r = 0.00, g = 0.50, b = 1.00}
PowerBarColor[13] = {r = 0.40, g = 0.00, b = 0.80}
PowerBarColor[17] = {r = 0.788, g = 0.259, b = 0.992}
PowerBarColor[18] = {r = 1.00, g = 0.611, b = 0}

local PlayerFrame = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar
local TargetFrame = TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
local TargetFrameToT = TargetFrameToT.HealthBar
local FocusFrame = FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
local FocusFrameToT = FocusFrameToT.HealthBar
local PetFrame =  PetFrameHealthBar
local healthBarTexturePath 
local powerBarTexturePath

function Textures:OnEnable()
    self:FetchTextures()

    local function applyTexture(self)
        self.healthbar:SetStatusBarTexture(healthBarTexturePath)
    end

    for _,v in pairs({
        _G.TargetFrame,
        _G.TargetFrameToT,
        _G.FocusFrame,
        _G.FocusFrameToT
    }) do if not self:IsHooked(v, "Update") then
            self:SecureHook(v, "Update", function(self) applyTexture(self) end)
        end
    end

    if not self:IsHooked("UnitFrameManaBar_UpdateType") and not HealthBarColor.db.profile.Textures.excludepowerbar then
        self:SecureHook("UnitFrameManaBar_UpdateType", function(manaBar) 
            if PowerBarColor[manaBar.powerType] ~= nil then
                manaBar:SetStatusBarTexture(powerBarTexturePath) 
                manaBar:SetStatusBarColor(PowerBarColor[manaBar.powerType]["r"],PowerBarColor[manaBar.powerType]["g"],PowerBarColor[manaBar.powerType]["b"])
           end
        end)
    end
    self:RegisterEvent("PLAYER_ENTERING_WORLD","Player")
end

function Textures:FetchTextures()
    healthBarTexturePath  = media:Fetch("statusbar", HealthBarColor.db.profile.Textures.healthbar)
    powerBarTexturePath = media:Fetch("statusbar", HealthBarColor.db.profile.Textures.powerbar)
end

function Textures:Player()
    PlayerFrame:SetStatusBarTexture(healthBarTexturePath) 
end

function Textures:Target()
    TargetFrame:SetStatusBarTexture(healthBarTexturePath) 
end

function Textures:TargetOfTarget()
    TargetFrameToT:SetStatusBarTexture(healthBarTexturePath) 
end

function Textures:Focus()
    FocusFrame:SetStatusBarTexture(healthBarTexturePath) 
end

function Textures:TargetOfFocus()
    FocusFrameToT:SetStatusBarTexture(healthBarTexturePath) 
end

function Textures:Pet()
    PetFrame:SetStatusBarTexture(healthBarTexturePath) 
end

function Textures:ApplyAll()
    self:Player()
    self:Target()
    self:TargetOfTarget()
    self:Focus()
    self:TargetOfFocus()
    self:Pet()
end