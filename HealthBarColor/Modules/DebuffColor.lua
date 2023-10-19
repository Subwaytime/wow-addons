local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local DebuffColor = HealthBarColor:NewModule("DebuffColor")
local Player = HealthBarColor:GetUnit("Player")

local auraFrame = nil
local eventFrame = nil

local IsSpellKnown = IsSpellKnown
local IsSpellKnownOrOverridesKnown = IsSpellKnownOrOverridesKnown
local next = next

local debuffColor = {
    Curse   = {r=0.6,g=0.0,b=1.0},
    Disease = {r=0.6,g=0.4,b=0.0},
    Magic   = {r=0.2,g=0.6,b=1.0},
    Poison  = {r=0.0,g=0.6,b=0.0},
}
local canCure = {}
local ignoreMagic = false
local function updateCurable(englishClass)
    canCure = {}
    local dispelAbilities = {
        ["DRUID"] = function()
            if IsSpellKnown(2782) then --Remove Corruption
                canCure.Curse = true
                canCure.Poison = true
            end
            if IsSpellKnown(88423) then --Nature's Cure
                canCure.Magic = true
                if IsPlayerSpell(392378) then --Improved Nature's Cure
                    canCure.Curse = true
                    canCure.Poison = true
                end
            end
        end,
        ["MAGE"] = function()
            if IsSpellKnown(475) then --Remove Curse
                canCure.Curse = true
            end
        end,
        ["MONK"] = function()
            if IsSpellKnown(218164) then --Detox BM/WW
                canCure.Poison = true
                canCure.Disease = true
            end
            if IsSpellKnown(115450) then --Detox MW 
                canCure.Magic = true
                if IsPlayerSpell(388874) then --Improved Detox 
                    canCure.Poison = true
                    canCure.Disease = true
                end
            end
            if IsSpellKnown(115310) then --Revival
                canCure.Magic = true
                canCure.Poison = true
                canCure.Disease = true
            end
            if IsSpellKnown(115310) then --Restoral
                canCure.Poison = true
                canCure.Disease = true
            end
        end,
        ["PALADIN"] = function()
            if IsSpellKnown(213644) then --Cleanse Toxins
                canCure.Poison = true
                canCure.Disease = true
            end
            if IsSpellKnown(4987) then --Cleanse
                canCure.Magic = true
                if IsPlayerSpell(393024) then --Improved Cleanse
                    canCure.Poison = true
                    canCure.Disease = true
                end
            end
        end,
        ["PRIEST"] = function()
            if IsSpellKnown(527) then --Purify
                canCure.Magic = true
                if IsPlayerSpell(390632) then --Improved Purify
                    canCure.Disease = true
                end
            end
            if IsSpellKnown(213634) then --Purify Disease
                canCure.Disease = true
            end
            if IsSpellKnown(32375) then --Mass Dispel
                canCure.Magic = true
            end
        end,
        ["SHAMAN"] = function()
            if IsSpellKnown(51886) then --Cleanse Spirit
                canCure.Curse = true
            end
            if IsSpellKnown(77130) then --Purify Spirit
                canCure.Magic = true
                if IsPlayerSpell(383016) then --Improved Purify Spirit
                    canCure.Curse = true
                end
            end
            if IsSpellKnown(383013) then --Poision Cleansing Totem
                canCure.Poison = true
            end
        end,
        ["WARLOCK"] = function()
            if IsSpellKnown(89808, true) then --Singe Magic
                canCure.Magic = true
            end
        end,
        ["EVOKER"] = function()
            if IsSpellKnown(374251) then --Cauterizing Flame
                canCure.Curse = true
                canCure.Poison = true
                canCure.Disease = true
            end
            if IsSpellKnown(365585) then --Expunge 
                canCure.Poison = true
            end
            if IsSpellKnownOrOverridesKnown(360823) then --Naturalize 
                canCure.Magic = true
                canCure.Poison = true
            end
        end,
        ["DEMONHUNTER"] = function()
            if IsSpellKnown(205604) then --Reverse Magic
                canCure.Magic = true
            end
        end,
        ["HUNTER"] = function()
            if IsSpellKnown(212640) then --Mending Bandage
                canCure.Poison = true
                canCure.Disease = true
            end
        end,
    }
    if dispelAbilities[englishClass] then
        dispelAbilities[englishClass]()
    end
    if ignoreMagic then
        canCure.Magic = false
    end
    local hasDispel = false
    for k,v in pairs(canCure) do
        if v then
            hasDispel = v
            break
        end
    end
    return hasDispel
end

local restoreColor --= function() defined in OnEnable end
    
local function toDebuffColor(dispelName)
    local r,g,b = debuffColor[dispelName].r, debuffColor[dispelName].g, debuffColor[dispelName].b
    Player.HealthBar:SetStatusBarColor(r,g,b)
end

local auraMap = {}

local function updateColor()
    for auraInstanceID, dispelName in next, auraMap do
        if auraInstanceID then
            toDebuffColor(dispelName)
            return
        end
    end
    restoreColor()
end

local function updateAuraMap(_,_,_,updateInfo)
    if updateInfo.isFullUpdate then
        auraMap = {} --clear table 
        local function HandleAura(aura)
            if canCure[aura.dispelName] then
                auraMap[aura.auraInstanceID] = aura.dispelName
            end
        end
        AuraUtil.ForEachAura("player", "HARMFUL", nil, HandleAura, true)  
        updateColor()
        return
    end
    if updateInfo.addedAuras then
        for _, aura in pairs(updateInfo.addedAuras) do
            if aura.isHarmful and canCure[aura.dispelName] then
                toDebuffColor(aura.dispelName)
                auraMap[aura.auraInstanceID] = aura.dispelName
            end
        end
    end
    if updateInfo.removedAuraInstanceIDs then
        for _, auraInstanceID in pairs(updateInfo.removedAuraInstanceIDs) do
            auraMap[auraInstanceID] = nil
        end
        updateColor()
    end
end

function DebuffColor:UpdateModule(event)
    local hasDispel = updateCurable(Player.Class)
    if hasDispel then
        auraFrame:RegisterUnitEvent("UNIT_AURA", "player")
    else
        auraFrame:UnregisterEvent("UNIT_AURA")
    end
end

function DebuffColor:OnEnable() 
    debuffColor.Curse   = HealthBarColor.db.profile.Modules.DebuffColor.Curse
    debuffColor.Disease = HealthBarColor.db.profile.Modules.DebuffColor.Disease
    debuffColor.Magic   = HealthBarColor.db.profile.Modules.DebuffColor.Magic
    debuffColor.Poison  = HealthBarColor.db.profile.Modules.DebuffColor.Poison
    ignoreMagic = HealthBarColor.db.profile.Modules.DebuffColor.ignoreMagic
    if not auraFrame then
        auraFrame = CreateFrame("Frame")
        auraFrame:SetScript("OnEvent", updateAuraMap)
    end
    auraFrame:RegisterUnitEvent("UNIT_AURA", "player")
    if not eventFrame then
        eventFrame = CreateFrame("Frame")
        eventFrame:SetScript("OnEvent", DebuffColor.UpdateModule)
    end
    eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
    eventFrame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
    if Player.Class == "WARLOCK" then
        eventFrame:RegisterUnitEvent("UNIT_PET", "player")
    end
    local selected = HealthBarColor.db.profile.HealthBars.Player.selected
    if selected == 1 then
        restoreColor = function()
            Player:SetStatusBarClassColored()
        end
    else
        local color = HealthBarColor.db.profile.HealthBars.Player.color
        local r,g,b = color.r,color.g,color.b
        restoreColor = function()
            Player.HealthBar:SetStatusBarColor(r,g,b)
        end
    end
end

function DebuffColor:OnDisable()
    if not auraFrame or not eventFrame then
        return
    end
    auraFrame:UnregisterEvent("UNIT_AURA")
    eventFrame:UnregisterAllEvents()
end