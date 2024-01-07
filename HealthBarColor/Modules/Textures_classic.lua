--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local Textures = HealthBarColor:NewModule("Textures")
Mixin(Textures, addonTable.hooks)
local Media = LibStub("LibSharedMedia-3.0")

local units = {
    Player = HealthBarColor:GetUnit("Player"),
    Target = HealthBarColor:GetUnit("Target"),
    ToT    = HealthBarColor:GetUnit("ToT"),
    Pet    = HealthBarColor:GetUnit("Pet"),
}
if addonTable.isWrath then
    units.Focus = HealthBarColor:GetUnit("Focus")
    units.ToF = HealthBarColor:GetUnit("ToF")
end

function Textures:OnEnable()
    local healthBarTexture = Media:Fetch("statusbar", HealthBarColor.db.profile.Modules.Textures.healthbar)
    self:UpdateHealthBars(healthBarTexture)
    if not HealthBarColor.db.profile.Modules.Textures.excludep then
        local powerBarTexture = Media:Fetch("statusbar", HealthBarColor.db.profile.Modules.Textures.powerbar)
        self:HookFunc("UnitFrameManaBar_UpdateType", function(manaBar)
            manaBar:SetStatusBarTexture(powerBarTexture)
        end)
        self:UpdatePowerBars(powerBarTexture)
    end
end

function Textures:OnDisable() 
    self:DisableHooks()
    local texture = Media:Fetch("statusbar", "Blizzard")
    self:UpdateHealthBars(texture)
    self:UpdatePowerBars(texture)
end

function Textures:UpdateHealthBars(texture)
    for _, unit in pairs(units) do
        unit.HealthBar:SetStatusBarTexture(texture)
    end
end

function Textures:UpdatePowerBars(texture)
    for _, unit in pairs(units) do
        unit.PowerBar.texture:SetTexture(texture)
    end
end