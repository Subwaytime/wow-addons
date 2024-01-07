--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local unpack = unpack
local SetTexCoord = SetTexCoord
local SetTexture = SetTexture
local SetTexCoord = SetTexCoord
local SetAllPoints = SetAllPoints
local SetPoint = SetPoint
local SetWidth = SetWidth
local SetHeight = SetHeight

local BetterBossFrames = HealthBarColor:NewModule("BetterBossFrames")
Mixin(BetterBossFrames, addonTable.hooks)
local Textures = {
	FrameTexture = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Boss\\BetterBossFrames.png",
		coords = {0.3984375, 0.84765625, 0.00390625, 0.22265625},
	},
	FrameFlash = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Boss\\BetterBossFlash.png",
		coords = {0.3984375, 0.84765625, 0.00390625, 0.22265625},
	},
	Mask = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Boss\\MaskTextureBoss.png",
		coords = {22/128, 106/128, 21/64, 43/64},
	},
}


function BetterBossFrames:replaceTextures(hbc_unit)
	hbc_unit.FrameTexture:SetTexture(Textures.FrameTexture.path)
	hbc_unit.FrameTexture:SetTexCoord(unpack(Textures.FrameTexture.coords))
	hbc_unit.FrameFlash:SetTexture(Textures.FrameFlash.path)
	hbc_unit.FrameFlash:SetTexCoord(unpack(Textures.FrameFlash.coords))
	hbc_unit.FrameFlash:SetAllPoints(hbc_unit.FrameTexture)
	hbc_unit.HealthBar.HealthBarMask:SetTexture(Textures.Mask.path)
end

function BetterBossFrames:resizeHealthBar(hbc_unit)
	hbc_unit.Skull:SetAlpha(0)
	hbc_unit.Glow:Hide()
	hbc_unit.HealthBar.HealthBarMask:ClearAllPoints()
	hbc_unit.HealthBar.HealthBarMask:SetPoint("TOPLEFT", hbc_unit.HealthBar, "TOPLEFT", -21, 20)
	hbc_unit.HealthBar.HealthBarMask:SetPoint("BOTTOMRIGHT", hbc_unit.HealthBar, "BOTTOMRIGHT", 21, -20)
	hbc_unit.HealthBar:SetHeight(22)
	hbc_unit.Name:ClearAllPoints()
	hbc_unit.Name:SetWidth(65)
	hbc_unit.Name:SetPoint("TOPLEFT", hbc_unit.Glow, "TOPLEFT",2,14)
	hbc_unit.LevelText:ClearAllPoints()
	hbc_unit.LevelText:SetPoint("TOPRIGHT", hbc_unit.Glow, "TOPRIGHT",0,14)
end

function BetterBossFrames:OnEnable()
	for i=1,5 do 
		local hbc_unit = HealthBarColor:GetUnit("Boss"..i)
		self:replaceTextures(hbc_unit)
		self:resizeHealthBar(hbc_unit)
	end
end

function BetterBossFrames:OnDisable()
	local function restoreBossFrames(hbc_unit)
		hbc_unit.FrameTexture:SetAtlas("UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff")
		hbc_unit.FrameTexture:SetTexCoord(0,1,0,1)
		hbc_unit.FrameFlash:SetAtlas("UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-InCombat")
		hbc_unit.FrameFlash:SetTexCoord(0,1,0,1)
		hbc_unit.HealthBar.HealthBarMask:SetAtlas("UI-HUD-UnitFrame-Party-PortraitOff-Bar-Health-Mask")
		hbc_unit.Skull:SetAlpha(1)
		hbc_unit.Glow:Show()
		hbc_unit.HealthBar:SetHeight(10)
		hbc_unit.Name:ClearAllPoints()
		hbc_unit.Name:SetWidth(55)
		hbc_unit.Name:SetPoint("TOPLEFT", hbc_unit.Glow, "TOPRIGHT", -56, -1)
		hbc_unit.LevelText:ClearAllPoints()
		hbc_unit.LevelText:SetPoint("TOPLEFT", hbc_unit.Glow, "TOPRIGHT", -83, -2)
	end
	for i=1,5 do 
		local hbc_unit = HealthBarColor:GetUnit("Boss"..i)
		restoreBossFrames(hbc_unit)
	end
end

