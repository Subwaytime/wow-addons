--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local DebuffColor = HealthBarColor:NewModule("DebuffColor")
local Player = HealthBarColor:GetUnit("Player")
local defaultColor = {r,g,b}
local debuffTypeColor = {
    Curse   = {r=0.6,g=0.0,b=1.0},
    Disease = {r=0.6,g=0.4,b=0.0},
    Magic   = {r=0.2,g=0.6,b=1.0},
    Poison  = {r=0.0,g=0.6,b=0.0},
}
local PlayerDebuffs = {}
local ignoreMagic = false
--lua speed reference 
local ipairs = ipairs
local pairs = pairs

function DebuffColor:OnEnable()
    self:GetSettings()
    self:ProcessAurasFull()
    self:RegisterEvent("UNIT_AURA","OnUnitAura")
end

function DebuffColor:OnDisable()
    self:UnregisterEvent("UNIT_AURA")
    self:RestoreStatusBarColor()
end

function DebuffColor:GetSettings()
    if HealthBarColor.db.profile.HealthBars.Player.selected == 1 then
        defaultColor.r,defaultColor.g,defaultColor.b = Player.ClassColor:GetRGB()
    else
        defaultColor = HealthBarColor.db.profile.HealthBars.Player.color
    end
    self:GetDebuffColorOverrides()
    ignoreMagic = HealthBarColor.db.profile.Modules.DebuffColor.ignoreMagic
end

function DebuffColor:GetDebuffColorOverrides()
    debuffTypeColor.Curse   = HealthBarColor.db.profile.Modules.DebuffColor.Curse
    debuffTypeColor.Disease = HealthBarColor.db.profile.Modules.DebuffColor.Disease
    debuffTypeColor.Magic   = HealthBarColor.db.profile.Modules.DebuffColor.Magic
    debuffTypeColor.Poison  = HealthBarColor.db.profile.Modules.DebuffColor.Poison
end

function DebuffColor:DebuffTypeFilteredOut(debuffType)
    --check if e.g. the user does not want to see magic as a shadow with mass dispel
    if ( ignoreMagic and ( debuffType == "Magic" ) ) then 
        return true
    end
    return false
end

function DebuffColor:PlayerCanDispel(debuffType)
    --check if filtered first
    if self:DebuffTypeFilteredOut(debuffType) then 
        return false
    end
    --HARMFUL|RAID Filter: from personal testing this filter seems to randomly work depending on specc 
    --seome classes take talents into account others not will have to implement my own filter 
    return true
end

function DebuffColor:SetStatusBarToDebuffColor(debuffType)
    Player.isLocked = true
    Player.HealthBar:SetStatusBarColor(debuffTypeColor[debuffType].r,debuffTypeColor[debuffType].g,debuffTypeColor[debuffType].b)
end

function DebuffColor:RestoreStatusBarColor()
    PlayerDebuffs = {} --clear table 
    Player.isLocked = false
    Player.HealthBar:SetStatusBarColor(defaultColor.r,defaultColor.g,defaultColor.b)
end

function DebuffColor:PlayerHasNoMoreDebuffs()
    for _,k in pairs(PlayerDebuffs) do
        if k ~= nil then
            self:SetStatusBarToDebuffColor(k)
            return false
        end
    end
    return true
end

function DebuffColor:ProcessAurasFull()
    PlayerDebuffs = {} --clear table 
    AuraUtil.ForEachAura("player", "HARMFUL|RAID", nil, function(_, _, _, dispelType, _, _, _, _, _, spellId)
        if not self:PlayerCanDispel(dispelType) then return end
        local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellId)
        if aura.auraInstanceID then
            PlayerDebuffs[aura.auraInstanceID] = aura.dispelName
            self:SetStatusBarToDebuffColor(aura.dispelName) 
        end
    end)    
end

function DebuffColor:ProcessAurasIncremental(unitAuraUpdateInfo)
    if unitAuraUpdateInfo.addedAuras ~= nil then
        for _, aura in ipairs(unitAuraUpdateInfo.addedAuras) do
            if aura.isRaid and aura.isHarmful then
                if not self:PlayerCanDispel(aura.dispelName) then return end
                PlayerDebuffs[aura.auraInstanceID] = aura.dispelName
                self:SetStatusBarToDebuffColor(aura.dispelName)             
            end
        end
    end
    if unitAuraUpdateInfo.removedAuraInstanceIDs ~= nil then
        for _, auraInstanceID in ipairs(unitAuraUpdateInfo.removedAuraInstanceIDs) do
            if PlayerDebuffs[auraInstanceID] then
                PlayerDebuffs[auraInstanceID] = nil
                if self:PlayerHasNoMoreDebuffs() then
                    self:RestoreStatusBarColor()
                end
            end
        end
    end
end

function DebuffColor:OnUnitAura(_,unit,unitAuraUpdateInfo)
    if unit ~= "player" then
        return
    end
    if unitAuraUpdateInfo == nil or unitAuraUpdateInfo.isFullUpdate then
        self:ProcessAurasFull()
        return
    end 
    if unitAuraUpdateInfo then
        self:ProcessAurasIncremental(unitAuraUpdateInfo)
    end
end

