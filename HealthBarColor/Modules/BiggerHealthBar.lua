--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local BiggerHealthBar = HealthBarColor:NewModule("BiggerHealthBar")
--hook stuff
local hooked = {}
local callbacks = {}
local donothing = function() end
local Player = HealthBarColor:GetUnit("Player")
Player.frameContainer = PlayerFrame.PlayerFrameContainer
--left, right, top, bottom
local textures = {
	FrameTexture = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Player\\BiggerHealthBar_FrameTexture.tga",
		coords = {26/256, 224/256, 26/128, 97/128}
	},
	FrameFlash = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Player\\BiggerHealthBar_FrameFlash.tga",
		coords = {27.5/256, 219/256, 26/128, 96/128}
	},
	AlternateFrameTexture = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Player\\BiggerHealthBar_AlternateFrameTexture.tga",
		coords = {26/256, 224/256, 26/128, 100/128}
	},
	AlternateFrameFlash = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Player\\BiggerHealthBar_AlternateFrameFlash.tga",
		coords = {27.5/256, 219/256, 26/128, 96.5/128}
	},
	Mask = {
		path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\Player\\BiggerHealthBar_PlayerFrameHealthMask.tga",
		coords = {2/128, 126/128, 15/64, 52/64}
	},
} 

local function toPlayerArt() 
	local isAlterntePowerFrame = PlayerFrame.activeAlternatePowerBar
	local frameTexture = isAlterntePowerFrame and Player.frameContainer.AlternatePowerFrameTexture or Player.frameContainer.FrameTexture
	if isAlterntePowerFrame then
		frameTexture:SetTexture(textures["AlternateFrameTexture"].path)
		frameTexture:SetTexCoord(unpack(textures["AlternateFrameTexture"].coords))
		Player.frameContainer.FrameFlash:SetTexture(textures["AlternateFrameFlash"].path)
		Player.frameContainer.FrameFlash:SetTexCoord(unpack(textures["AlternateFrameFlash"].coords))
		Player.HealthBar.HealthBarMask:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health-Mask")
		Player.HealthBar.HealthBarMask:SetPoint("TOPLEFT",Player.HealthBar,-2,10)
		Player.HealthBar.HealthBarMask:SetPoint("BOTTOMRIGHT",Player.HealthBar,2,-10)
	else
		frameTexture:SetTexture(textures["FrameTexture"].path)
		frameTexture:SetTexCoord(unpack(textures["FrameTexture"].coords))
		Player.frameContainer.FrameFlash:SetTexture(textures["FrameFlash"].path)
		Player.frameContainer.FrameFlash:SetTexCoord(unpack(textures["FrameFlash"].coords))
		Player.HealthBar.HealthBarMask:SetTexture(textures["Mask"].path)
		Player.HealthBar.HealthBarMask:SetPoint("TOPLEFT",Player.HealthBar,-3,7)
		Player.HealthBar.HealthBarMask:SetPoint("BOTTOMRIGHT",Player.HealthBar,2,-12)
	end
	Player.HealthBar:SetHeight(31)
end

local function toVehicelArt() 
	Player.frameContainer.FrameFlash:SetTexCoord(0,1,0,1)
end


function BiggerHealthBar:OnEnable()
	HealthBarColor:RegisterOnToPlayerArt(toPlayerArt)
	HealthBarColor:RegisterOnToVehicleArt(toVehicelArt)
    toPlayerArt()
    for _,resourcebar in pairs({
        Player.PowerBar,
        InsanityBarFrame,
    }) do
        callbacks[resourcebar] = function() 
			resourcebar:SetAlpha(0)
		end
        if not hooked[resourcebar] then
            resourcebar:HookScript("OnShow",function() callbacks[resourcebar]() end)
			hooked[resourcebar] = true
        end
        resourcebar:SetAlpha(0)
    end
end

function BiggerHealthBar:OnDisable()
	local isAlterntePowerFrame = PlayerFrame.activeAlternatePowerBar
	local frameTexture = isAlterntePowerFrame and Player.frameContainer.AlternatePowerFrameTexture or Player.frameContainer.FrameTexture
    if isAlterntePowerFrame then
		frameTexture:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-ClassResource")
        frameTexture:SetTexCoord(0,1,0,1)
		Player.frameContainer.FrameFlash:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-ClassResource-InCombat")
        Player.frameContainer.FrameFlash:SetTexCoord(0,1,0,1)
	else
		frameTexture:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn")
        frameTexture:SetTexCoord(0,1,0,1)
		Player.frameContainer.FrameFlash:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-InCombat")
        Player.frameContainer.FrameFlash:SetTexCoord(0,1,0,1)
	end
    Player.HealthBar.HealthBarMask:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health-Mask")
	Player.HealthBar:SetHeight(20)
    for _,resourcebar in pairs({
        Player.PowerBar,
        InsanityBarFrame,
    }) do
        callbacks[resourcebar] = donothing
		resourcebar:SetAlpha(1)
    end
end

