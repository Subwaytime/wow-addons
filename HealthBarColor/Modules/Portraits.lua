--[[
    Created by Slothpala 
--]]
local ClassIconTexturePath = {
    ["DEATHKNIGHT"] = "Interface\\ICONS\\ClassIcon_DeathKnight.blp",
    ["DEMONHUNTER"] = "Interface\\ICONS\\ClassIcon_DemonHunter.blp",
    ["DRUID"]       = "Interface\\ICONS\\ClassIcon_Druid.blp",
    ["EVOKER"]      = "Interface\\ICONS\\ClassIcon_Evoker.blp",
    ["HUNTER"]      = "Interface\\ICONS\\ClassIcon_Hunter.blp",
    ["MAGE"]        = "Interface\\ICONS\\ClassIcon_Mage.blp",
    ["MONK"]        = "Interface\\ICONS\\ClassIcon_Monk.blp",
    ["PALADIN"]     = "Interface\\ICONS\\ClassIcon_Paladin.blp",
    ["PRIEST"]      = "Interface\\ICONS\\ClassIcon_Priest.blp",
    ["ROGUE"]       = "Interface\\ICONS\\ClassIcon_Rogue.blp",
    ["SHAMAN"]      = "Interface\\ICONS\\ClassIcon_Shaman.blp",
    ["WARLOCK"]     = "Interface\\ICONS\\ClassIcon_Warlock.blp",
    ["WARRIOR"]     = "Interface\\ICONS\\ClassIcon_Warrior.blp",
}
--[[
    --AI HD upscaled with https://github.com/upscayl/upscayl
    --needs some more work 
local ClassIconTexturePath = {
    ["DEATHKNIGHT"] = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_DeathKnight.blp",
    ["DEMONHUNTER"] = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_DemonHunter.blp",
    ["DRUID"]       = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Druid.blp",
    ["EVOKER"]      = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Evoker.blp",
    ["HUNTER"]      = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Hunter.blp",
    ["MAGE"]        = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Mage.blp",
    ["MONK"]        = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Monk.blp",
    ["PALADIN"]     = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Paladin.blp",
    ["PRIEST"]      = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Priest.blp",
    ["ROGUE"]       = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Rogue.blp",
    ["SHAMAN"]      = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Shaman.blp",
    ["WARLOCK"]     = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Warlock.blp",
    ["WARRIOR"]     = "Interface\\AddOns\\HealthBarColor\\Textures\\ClassIcons\\Blizzard\\ClassIcon_Warrior.blp",
}
]]--

local function anyPortraitModuleEnabled()
    if HealthBarColor.db.profile.HealthBars.Player.classicon or 
       HealthBarColor.db.profile.HealthBars.Target.classicon or
       HealthBarColor.db.profile.HealthBars.ToT.classicon    or 
       HealthBarColor.db.profile.HealthBars.Focus.classicon  or 
       HealthBarColor.db.profile.HealthBars.ToF.classicon    
    then
        return true
    end
end

local UnitMasked = {}
local OnPortraitUpdate_RegisteredUnit = {}
local OnPortraitUpdate_Callback       = {}
--to restore portraits while in the menu
local PortraitState = {}
local hooked = {}
--[[
    Portraits
--]]
local Portraits = HealthBarColor:NewModule("Portraits")
function Portraits:OnEnable()   
    if not hooked["UnitFramePortrait_Update"] and anyPortraitModuleEnabled() then
        hooksecurefunc("UnitFramePortrait_Update",function(self)
            if not OnPortraitUpdate_RegisteredUnit[self.unit] then return end
            if not UnitIsPlayer(self.unit) then return end
            local class = select(2,UnitClass(self.unit))
            if class then
                self.portrait:SetTexture(ClassIconTexturePath[class])
            end
        end)
        hooked["UnitFramePortrait_Update"] = true
    end
    --[[
        Player
    --]]
    if HealthBarColor.db.profile.HealthBars.Player.classicon then
        local Player = HealthBarColor:GetUnit("Player")
        OnPortraitUpdate_RegisteredUnit["player"] = true
        Player.Portrait:SetTexture(ClassIconTexturePath[Player.Class])
        PortraitState["player"] = true
    else
        if PortraitState["player"] == true then
            OnPortraitUpdate_RegisteredUnit["player"] = nil
            UnitFramePortrait_Update(PlayerFrame)
            PortraitState["player"] = false
        end
    end
    --[[
        Target
    --]]
    if HealthBarColor.db.profile.HealthBars.Target.classicon then
        OnPortraitUpdate_RegisteredUnit["target"] = true
        local Target = HealthBarColor:GetUnit("Target")
        if Target.isPlayer then
            Target.Portrait:SetTexture(ClassIconTexturePath[Target.Class])
        end
        PortraitState["target"] = true
        if not UnitMasked["target"] then
            Target.Portrait:SetMask("Interface\\CharacterFrame\\TempPortraitAlphaMask")
            UnitMasked["target"] = true
        end
    else
        if PortraitState["target"] == true then
            OnPortraitUpdate_RegisteredUnit["target"] = nil
            UnitFramePortrait_Update(TargetFrame)
            PortraitState["target"] = false
        end
    end
    --[[
        ToT
    --]]
    if HealthBarColor.db.profile.HealthBars.ToT.classicon then
        OnPortraitUpdate_RegisteredUnit["targettarget"] = true
        local ToT = HealthBarColor:GetUnit("ToT")
        if ToT.isPlayer then
            ToT.Portrait:SetTexture(ClassIconTexturePath[ToT.Class])
        end
        PortraitState["targettarget"] = true
        if not UnitMasked["targettarget"] then
            ToT.Portrait:SetMask("Interface\\CharacterFrame\\TempPortraitAlphaMask")
            UnitMasked["targettarget"] = true
        end
    else
        if PortraitState["targettarget"] == true then
            OnPortraitUpdate_RegisteredUnit["targettarget"] = nil
            UnitFramePortrait_Update(TargetFrameToT)
            PortraitState["targettarget"] = false
        end
    end
    --[[
        Focus
    --]]
    if HealthBarColor.db.profile.HealthBars.Focus.classicon then
        OnPortraitUpdate_RegisteredUnit["focus"] = true
        local Focus = HealthBarColor:GetUnit("Focus")
        if Focus.isPlayer then
            Focus.Portrait:SetTexture(ClassIconTexturePath[Focus.Class])
        end
        PortraitState["focus"] = true
        if not UnitMasked["focus"] then
            Focus.Portrait:SetMask("Interface\\CharacterFrame\\TempPortraitAlphaMask")
            UnitMasked["focus"] = true
        end
    else
        if PortraitState["focus"] == true then
            OnPortraitUpdate_RegisteredUnit["focus"] = nil
            UnitFramePortrait_Update(FocusFrame)
            PortraitState["focus"] = false
        end
    end
    --[[
        ToF
    --]]
    if HealthBarColor.db.profile.HealthBars.ToF.classicon then
        OnPortraitUpdate_RegisteredUnit["focustarget"] = true
        local ToF = HealthBarColor:GetUnit("ToF")
        if ToF.isPlayer then
            ToF.Portrait:SetTexture(ClassIconTexturePath[ToF.Class])
        end
        PortraitState["focustarget"] = true
        if not UnitMasked["focustarget"] then
            ToF.Portrait:SetMask("Interface\\CharacterFrame\\TempPortraitAlphaMask")
            UnitMasked["focustarget"] = true
        end
    else
        if PortraitState["focustarget"] == true then
            OnPortraitUpdate_RegisteredUnit["focustarget"] = nil
            UnitFramePortrait_Update(FocusFrameToT)
            PortraitState["focustarget"] = false
        end
    end
end

