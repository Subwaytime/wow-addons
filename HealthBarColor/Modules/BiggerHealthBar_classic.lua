--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local BiggerHealthBar = HealthBarColor:NewModule("BiggerHealthBar")
--hook stuff
local hooked = nil
local callbacks = {}
local donothing = function() end
local Player, Target


--coords
--left, right, top, bottom
--ULx, ULy, LLx, LLy, URx, URy, LRx, LRy
local textures = {
	Player = {
		FrameTexture = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_Normal_classic.tga",
			coords =  {1, 0, 1, 0.78125, 0.09375, 0, 0.09375, 0.78125},
		},
		FrameFlash = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_FrameFlash_classic.tga",
			coords = {0, 0, 0, 0.53125, 0.74609375, 0, 0.74609375, 0.53125}
		},
	},
	Target = {
		normal = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_Normal_classic.tga",
			--coords =  {0.09375, 0, 0.09375, 0.78125, 1, 0, 1, 0.78125},
		},
		elite = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_Elite_classic.tga",
		},
		worldboss = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_Elite_classic.tga",
		},
		rareelite = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_Elite_classic.tga",
		},
		rare = {
			path = "Interface\\AddOns\\HealthBarColor\\Textures\\UnitFrames\\classic\\Bigger_Rare_classic.tga",
		},
	}

} 
--PLAYER--
local function toPlayerArt() 
	--player
	Player.FrameTexture:SetTexture(textures.Player.FrameTexture.path)
	Player.FrameTexture:SetTexCoord(unpack(textures.Player.FrameTexture.coords))
	Player.FrameFlash:SetTexture(textures.Player.FrameFlash.path)
	Player.FrameFlash:SetTexCoord(unpack(textures.Player.FrameFlash.coords))
	Player.HealthBar:SetPoint("TOPLEFT", Player.FrameTexture, 106, -21)
	Player.HealthBar:SetHeight(30)
end

local function restorePlayer() 
	Player.FrameTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame.blp")
	Player.FrameTexture:SetTexCoord(unpack(textures.Player.FrameTexture.coords))
	Player.FrameFlash:SetTexture("Interface\\CHARACTERFRAME\\UI-Player-Status.blp")
	Player.FrameFlash:SetTexCoord(unpack(textures.Player.FrameFlash.coords))
	Player.HealthBar:SetPoint("TOPLEFT", Player.FrameTexture, "TOPLEFT", 106, -41)
	Player.HealthBar:SetHeight(12.000005722046)
end

--TARGET--
local function toTargetArt(classification)
	if not textures.Target[classification] then 
		Target.HealthBar:SetPoint("TOPRIGHT", Target.FrameTexture, "TOPRIGHT", -106, -41)
		Target.HealthBar:SetHeight(12.000005722046)
		return 
	end
	Target.FrameTexture:SetTexture(textures.Target[classification].path)
	Target.HealthBar:SetPoint("TOPRIGHT", Target.FrameTexture, "TOPRIGHT", -106,-22.000001907349)
	Target.HealthBar:SetHeight(30)
end

local function restoreTarget() 
	local classification = UnitClassification("target")
	local isNormalTexure = nil
	if classification == "normal" then
		Target.FrameTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame.blp")
		isNormalTexure = true
	elseif classification == "minus" then
		Target.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus")
		isNormalTexure = true
	elseif classification == "worldboss" or classification == "elite" then
		Target.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
	elseif  classification == "rareelite" then
		Target.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
	elseif classification == "rare" then
		Target.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare")
	else
		Target.FrameTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame.blp")
		isNormalTexure = true
	end
	if isNormalTexure then
		if classification == "minus" then
			Target.Background:SetSize(119,12)
			Target.Background:SetPoint("BOTTOMLEFT", Target.FrameTexture, "BOTTOMLEFT", 7, 47)
		else
			Target.Background:SetSize(119,25)
			Target.Background:SetPoint("BOTTOMLEFT", Target.FrameTexture, "BOTTOMLEFT", 7, 35)
		end
	else
		Target.Background:SetSize(119,25)
		Target.Background:SetPoint("BOTTOMLEFT", Target.FrameTexture, "BOTTOMLEFT", 7, 35)
	end
	Target.HealthBar:SetPoint("TOPRIGHT", Target.FrameTexture, "TOPRIGHT", -106, -41)
	Target.HealthBar:SetHeight(12.000005722046)
	callbacks["TargetFrameNameBackground"] = donothing
	TargetFrameNameBackground:Show()
end


function BiggerHealthBar:OnEnable()
	--player
	Player = HealthBarColor:GetUnit("Player")
	Player.FrameTexture = PlayerFrameTexture
	Player.FrameFlash = PlayerStatusTexture
	HealthBarColor:RegisterOnToPlayerArt(toPlayerArt)
	toPlayerArt() 
	--target
	Target = HealthBarColor:GetUnit("Target")
	Target.FrameTexture = TargetFrameTextureFrameTexture
	Target.Background = TargetFrameBackground
	callbacks["TargetFrameNameBackground"] = function(self)
		self:Hide()
	end
	callbacks["TargetFrame_CheckClassification"] = function(self, forceNormalTexture)
		if forceNormalTexture then
			toTargetArt("normal")
		else
			local classification = UnitClassification(self.unit)
			toTargetArt(classification)
		end
	end
	if not hooked then
		TargetFrameNameBackground:HookScript("OnShow",function(self)
			callbacks["TargetFrameNameBackground"](self)
		end)
		hooksecurefunc("TargetFrame_CheckClassification",function(self, forceNormalTexture)
			callbacks["TargetFrame_CheckClassification"](self)
		end)
		hooked = true
	end
	Target.Background:SetPoint("TOPRIGHT", Target.FrameTexture, "TOPRIGHT", -106,-22.000001907349)
	TargetFrameNameBackground:Hide()
	local classification = UnitClassification("target") 
	toTargetArt(classification)
end

function BiggerHealthBar:OnDisable()
	restorePlayer() 
	restoreTarget() 
	callbacks["TargetFrameNameBackground"] = donothing
	callbacks["TargetFrame_CheckClassification"] = donothing
end

