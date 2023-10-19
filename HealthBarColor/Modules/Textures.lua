--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local Textures = HealthBarColor:NewModule("Textures")
local media = LibStub("LibSharedMedia-3.0")
--txtures
local HealthBarTexture 
local PowerBarTexture
--get units
local Player = HealthBarColor:GetUnit("Player")
local Target = HealthBarColor:GetUnit("Target")
local ToT    = HealthBarColor:GetUnit("ToT")
local Focus  = HealthBarColor:GetUnit("Focus")
local ToF    = HealthBarColor:GetUnit("ToF")
local Pet    = HealthBarColor:GetUnit("Pet")
local Boss1  = HealthBarColor:GetUnit("Boss1")
local Boss2  = HealthBarColor:GetUnit("Boss2")
local Boss3  = HealthBarColor:GetUnit("Boss3")
local Boss4  = HealthBarColor:GetUnit("Boss4")
local Boss5  = HealthBarColor:GetUnit("Boss5")
--hook stuff
local hooked    = {}
local Callbacks = {}
local function donothing() end

function Textures:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Textures then return end
    --get shared media statusbars
    HealthBarColor:FetchTextures()
    --colors
    local PowerBarColor = {}
    PowerBarColor[0]  = {r = 0.00,  g = 0.00,  b = 1.00,}
    PowerBarColor[1]  = {r = 1.00,  g = 0.00,  b = 0.00}
    PowerBarColor[2]  = {r = 1.00,  g = 0.50,  b = 0.25}
    PowerBarColor[3]  = {r = 1.00,  g = 1.00,  b = 0.00}
    PowerBarColor[6]  = {r = 0.00,  g = 0.82,  b = 1.00}
    PowerBarColor[8]  = {r = 0.30,  g = 0.52,  b = 0.90}
    PowerBarColor[11] = {r = 0.00,  g = 0.50,  b = 1.00}
    PowerBarColor[13] = {r = 0.40,  g = 0.00,  b = 0.80}
    PowerBarColor[17] = {r = 0.788, g = 0.259, b = 0.992}
    PowerBarColor[18] = {r = 1.00,  g = 0.611, b = 0}
    --callbacks
    if HealthBarColor.db.profile.Settings.Modules.Textures then
        Callbacks.applyHelthBarTexture = function(HealthBar)
            HealthBar:SetStatusBarTexture(HealthBarTexture)
        end
    end
    --powerbar
    if not HealthBarColor.db.profile.Modules.Textures.excludep then 
        Callbacks.applyPowerBarTexture = function(PowerBar)
            if PowerBarColor[PowerBar.powerType] ~= nil then
                PowerBar:SetStatusBarTexture(PowerBarTexture) 
                PowerBar:SetStatusBarColor(PowerBarColor[PowerBar.powerType].r,PowerBarColor[PowerBar.powerType].g,PowerBarColor[PowerBar.powerType].b)
            end
        end
    end
    --hooks
    --healthbars
    --[[
        ToT and ToF seem to never get overwritten so no need to hook it
        this also solves an issue where when you hook ToT/ToF and Target/Focus is the Player himself the game cant find ToT/ToF's frame as they don't exist
        and then calls Update each frame which could result in CPU usage spikes. 
    -]]--
    for _,hbc_unit in pairs({
        Target,
        --ToT
        Focus,
        --ToF
    }) do 
        if not hooked[hbc_unit.Frame] then
            hooksecurefunc(hbc_unit.Frame, "Update" ,function() Callbacks.applyHelthBarTexture(hbc_unit.HealthBar) end)
            hooked[hbc_unit.Frame] = true
            hooked["Update"] = true
        end
    end
    --powerbars
    if not hooked["UnitFrameManaBar_UpdateType"] and not HealthBarColor.db.profile.Modules.Textures.excludep then
        hooksecurefunc("UnitFrameManaBar_UpdateType", function(PowerBar) Callbacks.applyPowerBarTexture(PowerBar) end)
        hooked["UnitFrameManaBar_UpdateType"] = true
    end
    --apply textures to see immediate change 
    for _, hbc_unit in pairs({
        Player,
        Target,
        ToT,
        Focus,
        ToF,
        Pet,
        Boss1,
        Boss2,
        Boss3,
        Boss4,
        Boss5
    }) do
        hbc_unit.HealthBar:SetStatusBarTexture(HealthBarTexture)    
        if not HealthBarColor.db.profile.Modules.Textures.excludep then
            hbc_unit.PowerBar:SetStatusBarTexture(PowerBarTexture)
            if PowerBarColor[hbc_unit.PowerBar.powerType] ~= nil then
                hbc_unit.PowerBar:SetStatusBarColor(PowerBarColor[hbc_unit.PowerBar.powerType].r,PowerBarColor[hbc_unit.PowerBar.powerType].g,PowerBarColor[hbc_unit.PowerBar.powerType].b)
            end
        end
    end
    --was previously needed but atm it seems to stay
    --HealthBarColor:RegisterOnEnteringWorld("PlayerTexture", applyPlayerTexture)
    --
    for _,unit in pairs ({
        Player,
        Target,
        Focus,
        Boss1,
        Boss2,
        Boss3,
        Boss4,
        Boss5,
    }) do 
        HealthBarColor:assignLayers(unit.HealthBar)
    end
end

function Textures:OnDisable() 
    if hooked["UnitFrameManaBar_UpdateType"] and (HealthBarColor.db.profile.Modules.Textures.excludep or not HealthBarColor.db.profile.Settings.Modules.Textures) then
        --unhook workaround
        Callbacks.applyPowerBarTexture = donothing
        for _, hbc_unit in pairs({
            Player,
            Target,
            ToT,
            Focus,
            ToF,
            Pet,
        }) do
            UnitFrameManaBar_UpdateType(hbc_unit.PowerBar)
        end
    end

    if hooked["Update"] and not HealthBarColor.db.profile.Settings.Modules.Textures then
        --unhook workaround
        Callbacks.applyHelthBarTexture = donothing
        --restore textures
        Target.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-Target-PortraitOn-Bar-Health")
        Focus.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-Target-PortraitOn-Bar-Health")
        Player.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health")
        ToT.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-TargetofTarget-PortraitOn-Bar-Health")
        ToF.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-TargetofTarget-PortraitOn-Bar-Health")
        Pet.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-TargetofTarget-PortraitOn-Bar-Health")
        for _,v in pairs ({
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5
        }) do
            v.HealthBar:GetStatusBarTexture():SetAtlas("UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-Bar-Health")
        end
    end
end

function HealthBarColor:FetchTextures()
    HealthBarTexture = media:Fetch("statusbar", HealthBarColor.db.profile.Modules.Textures.healthbar)
    PowerBarTexture  = media:Fetch("statusbar", HealthBarColor.db.profile.Modules.Textures.powerbar)
end