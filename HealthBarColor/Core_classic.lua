--[[
    Created by Slothpala 
--]]
--HeealthBarColor Units
local HBC_Unit = {}
function HBC_Unit:SetStatusBarClassColored()
    self.HealthBar:SetStatusBarColor(self.ClassColor.r,self.ClassColor.g,self.ClassColor.b)
end
function HBC_Unit:SetStatusBarReactionColored()
    self.HealthBar:SetStatusBarColor(self.ReactionColor.r,self.ReactionColor.g,self.ReactionColor.b)
end
local metatable = {__index = HBC_Unit}
--player
local Player        = setmetatable({},metatable)
Player.HealthBar    = _G.PlayerFrameHealthBar
Player.Name         = _G.PlayerName
Player.HealthText   = {_G.PlayerFrameHealthBarTextLeft, _G.PlayerFrameHealthBarTextRight, _G.PlayerFrameHealthBarText}
Player.PowerText    = {_G.PlayerFrameManaBarTextLeft,_G.PlayerFrameManaBarTextRight,_G.PlayerFrameManaBarText}
--target
local Target        = setmetatable({},metatable)
Target.HealthBar    = _G.TargetFrameHealthBar
Target.Name         = _G.TargetFrameTextureFrameName
Target.HealthText   = {_G.TargetFrameTextureFrame.HealthBarTextLeft,_G.TargetFrameTextureFrame.HealthBarTextRight,_G.TargetFrameTextureFrame.HealthBarText}
Target.PowerText    = {_G.TargetFrameTextureFrame.ManaBarTextLeft,_G.TargetFrameTextureFrame.ManaBarTextRight,_G.TargetFrameTextureFrame.ManaBarText}
--targettarget
local ToT           = setmetatable({},metatable)
ToT.HealthBar       = _G.TargetFrameToTHealthBar
ToT.Name            = _G.TargetFrameToTTextureFrameName
--focus
local Focus        = setmetatable({},metatable)
--focustarget
local ToF           = setmetatable({},metatable)
--pet
local Pet           = {}
Pet.HealthBar       = _G.PetFrameHealthBar
Pet.Name            = _G.PetName
Pet.HealthText      = {_G.PetFrameHealthBarTextLeft, _G.PetFrameHealthBarTextRight, _G.PetFrameHealthBarText}
Pet.PowerText       = {_G.PetFrameManaBarText, _G.PetFrameManaBarTextLeft, _G.PetFrameManaBarTextRight}
--AddOn
local addonName, addonTable = ...
--create addon and get libraries
addonTable.HealthBarColor = LibStub("AceAddon-3.0"):NewAddon("HealthBarColor", "AceConsole-3.0", "AceEvent-3.0", "AceSerializer-3.0")
local HealthBarColor = addonTable.HealthBarColor
HealthBarColor.isClassic = false
HealthBarColor.isWrath = false
HealthBarColor.isRetail = false
local tocversion = select(4,GetBuildInfo())
if tocversion < 30000 then
    HealthBarColor.isClassic = true
elseif tocversion > 30000 and tocversion < 100000 then
    HealthBarColor.isWrath = true
    --focus
    Focus.HealthBar    = _G.FocusFrameHealthBar
    Focus.Name         = _G.FocusFrameTextureFrameName
    Focus.HealthText   = {_G.FocusFrameTextureFrame.HealthBarTextLeft,_G.FocusFrameTextureFrame.HealthBarTextRight,_G.FocusFrameTextureFrame.HealthBarText}
    Focus.PowerText    = {_G.FocusFrameTextureFrame.ManaBarTextLeft,_G.FocusFrameTextureFrame.ManaBarTextRight,_G.FocusFrameTextureFrame.ManaBarText}
    --tof
    ToF.HealthBar       = _G.FocusFrameToTHealthBar
    ToF.Name            = _G.FocusFrameToTTextureFrameName
else
    HealthBarColor.isRetail = true
end
HealthBarColor:SetDefaultModuleLibraries("AceConsole-3.0", "AceEvent-3.0")
HealthBarColor:SetDefaultModuleState(false)
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local Icon = nil
local IconObj = nil
function HealthBarColor:MinimapIcon()
    if not self.db.profile.Settings.Modules.MinimapIcon then 
        self.db.profile.MinimapIcon.hide = true
        if Icon then
            Icon:Hide("HealthBarColor")
        end
        return
    end
    if not Icon then 
        Icon = LibStub("LibDBIcon-1.0")
        IconObj = LibStub("LibDataBroker-1.1"):NewDataObject("HealthBarColor", {
            type = "launcher",
            label = "HealthBarColor",
            icon = "Interface\\AddOns\\HealthBarColor\\Textures\\Icon\\Icon.tga",
            OnClick = function(self, button) 
                if button == "LeftButton" then
                    HealthBarColor:SlashCommand() 
                elseif button == "MiddleButton" then
                    Icon:Hide("HealthBarColor")
                    HealthBarColor.db.profile.Settings.Modules.MinimapIcon = false
                end
            end,
            OnTooltipShow = function(tooltip)
                tooltip:AddLine("HealthBarColor")
                tooltip:AddLine("Left click: Open add-on settings")
                tooltip:AddLine("Middle click: Hide icon")
            end,
        })
        Icon:Register("HealthBarColor", IconObj, HealthBarColor.db.profile.MinimapIcon)
        Icon:Show("HealthBarColor")
    else
        self.db.profile.MinimapIcon.hide = false
        Icon:Show("HealthBarColor")
    end
end

function HealthBarColor:OnEnable()
    self:LoadDataBase()
    --load own options table
    local options = self:GetOptionsTable()
    --create option table based on database structure and add them to options
    options.args.ProfileSettings.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) 
    options.args.ProfileSettings.args.profiles.order = 1
    --register options as option table to create a gui based on it
    AC:RegisterOptionsTable("HealthBarColor_options", options) 
    --add them to blizzards settings panel for addons
    self.optionsFrame = ACD:AddToBlizOptions("HealthBarColor_options", "HealthBarColor")
    self:RegisterChatCommand("hbc", "SlashCommand")
    self:RegisterEvents()
    self:LoadConfig()
end

function HealthBarColor:SlashCommand()
    if ACD.OpenFrames["HealthBarColor_options"] then
        ACD:Close("HealthBarColor_options")
    else
        ACD:SetDefaultSize("HealthBarColor_options",820,500)
        ACD:Open("HealthBarColor_options")
    end
end

function HealthBarColor:LoadConfig()  
    self:MinimapIcon()
    self:CreateColors()
    self:GetColorOverwrites()
    self:GetUnitInformation(Player, "player")
    self:GetUnitInformation(Target, "target")
    self:GetUnitInformation(ToT, "targettarget")
    self:GetUnitInformation(Focus, "focus")
    self:GetUnitInformation(ToF, "focustarget")
    for _, module in self:IterateModules() do
        if self.db.profile.Settings.Modules[module:GetName()] then 
            module:Enable()
        end
    end
    self:OnTargetChanged()
    self:OnToTChanged()
    if self.isWrath then
        self:OnFocusChanged()
        self:OnToFChanged()
    end
end

local update_queued = nil
function HealthBarColor:UpdateAfterCombat()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    self:ReloadConfig()
    update_queued = false
end

function HealthBarColor:ReloadConfig()
    if InCombatLockdown() then 
        if update_queued then return end
        self:RegisterEvent("PLAYER_REGEN_ENABLED","UpdateAfterCombat") 
        self:Print("Settings will apply after combat")
        update_queued = true
        return 
    end
    for _, module in self:IterateModules() do
        module:Disable()
    end
    self:EmptyTables()
    self:LoadConfig()
end

function HealthBarColor:RegisterEvents()
    self:RegisterEvent("PLAYER_TARGET_CHANGED","OnTargetChanged")
    self:RegisterEvent("UNIT_TARGET","OnUnitTarget")
    if not self.isClassic then
        self:RegisterEvent("PLAYER_FOCUS_CHANGED","OnFocusChanged")
    end
end

--Colors
--class colors
local ClassColor = {}
--reaction colors
local ReactionColor = {}

--Color functions
function HealthBarColor:CreateColors()
    ClassColor["DRUID"]       = {r=1,g=0.49,b=0.04}
    ClassColor["DEATHKNIGHT"] = {r=0.77,g=0.12,b=0.23}
    ClassColor["HUNTER"]      = {r=0.67,g=0.83,b=0.45}
    ClassColor["MAGE"]        = {r=0.25,g=0.78,b=0.92}
    ClassColor["PALADIN"]     = {r=0.96,g=0.55,b=0.73}
    ClassColor["PRIEST"]      = {r=1,g=1,b=1}  
    ClassColor["ROGUE"]       = {r=1,g=0.96,b=0.41} 
    ClassColor["SHAMAN"]      = {r=0,g=0.44,b=0.87}
    ClassColor["WARLOCK"]     = {r=0.53,g=0.53,b=0.93}
    ClassColor["WARRIOR"]     = {r=0.78,g=0.61,b=0.43}
    ReactionColor["HOSTILE"]  = {r=1,g=0,b=0}
    ReactionColor["NEUTRAL"]  = {r=1,g=1,b=0}
    ReactionColor["FRIENDLY"] = {r=0,g=1,b=0}
end

function HealthBarColor:GetColorOverwrites()
    if self.db.profile.Settings.ClassColorOverwrites.enabled then
        ClassColor["DRUID"]       = {r=self.db.profile.Settings.ClassColorOverwrites.druid.r,g=self.db.profile.Settings.ClassColorOverwrites.druid.g,b=self.db.profile.Settings.ClassColorOverwrites.druid.b}
        ClassColor["DEATHKNIGHT"] = {r=self.db.profile.Settings.ClassColorOverwrites.deathknight.r,g=self.db.profile.Settings.ClassColorOverwrites.deathknight.g,b=self.db.profile.Settings.ClassColorOverwrites.deathknight.b}
        ClassColor["HUNTER"]      = {r=self.db.profile.Settings.ClassColorOverwrites.hunter.r,g=self.db.profile.Settings.ClassColorOverwrites.hunter.g,b=self.db.profile.Settings.ClassColorOverwrites.hunter.b}
        ClassColor["MAGE"]        = {r=self.db.profile.Settings.ClassColorOverwrites.mage.r,g=self.db.profile.Settings.ClassColorOverwrites.mage.g,b=self.db.profile.Settings.ClassColorOverwrites.mage.b}
        ClassColor["PALADIN"]     = {r=self.db.profile.Settings.ClassColorOverwrites.paladin.r,g=self.db.profile.Settings.ClassColorOverwrites.paladin.g,b=self.db.profile.Settings.ClassColorOverwrites.paladin.b}
        ClassColor["PRIEST"]      = {r=self.db.profile.Settings.ClassColorOverwrites.priest.r,g=self.db.profile.Settings.ClassColorOverwrites.priest.g,b=self.db.profile.Settings.ClassColorOverwrites.priest.b}
        ClassColor["ROGUE"]       = {r=self.db.profile.Settings.ClassColorOverwrites.rogue.r,g=self.db.profile.Settings.ClassColorOverwrites.rogue.g,b=self.db.profile.Settings.ClassColorOverwrites.rogue.b}
        ClassColor["SHAMAN"]      = {r=self.db.profile.Settings.ClassColorOverwrites.shaman.r,g=self.db.profile.Settings.ClassColorOverwrites.shaman.g,b=self.db.profile.Settings.ClassColorOverwrites.shaman.b}
        ClassColor["WARLOCK"]     = {r=self.db.profile.Settings.ClassColorOverwrites.warlock.r,g=self.db.profile.Settings.ClassColorOverwrites.warlock.g,b=self.db.profile.Settings.ClassColorOverwrites.warlock.b}
        ClassColor["WARRIOR"]     = {r=self.db.profile.Settings.ClassColorOverwrites.warrior.r,g=self.db.profile.Settings.ClassColorOverwrites.warrior.g,b=self.db.profile.Settings.ClassColorOverwrites.warrior.b}
    end
    if self.db.profile.Settings.ReactionColorOverwrites.enabled then
        ReactionColor["HOSTILE"]   = {r=self.db.profile.Settings.ReactionColorOverwrites.hostile.r,g=self.db.profile.Settings.ReactionColorOverwrites.hostile.g,b=self.db.profile.Settings.ReactionColorOverwrites.hostile.b}
        ReactionColor["NEUTRAL"]   = {r=self.db.profile.Settings.ReactionColorOverwrites.neutral.r,g=self.db.profile.Settings.ReactionColorOverwrites.neutral.g,b=self.db.profile.Settings.ReactionColorOverwrites.neutral.b}
        ReactionColor["FRIENDLY"]  = {r=self.db.profile.Settings.ReactionColorOverwrites.friendly.r,g=self.db.profile.Settings.ReactionColorOverwrites.friendly.g,b=self.db.profile.Settings.ReactionColorOverwrites.friendly.b}
    end
end

--Get Colors for other modules
function HealthBarColor:GetClassColors()
    return ClassColor
end

local HBC_Units = {
    ["Player"] = Player,
    ["Target"] = Target,
    ["ToT"] = ToT,
    ["Focus"] = Focus,
    ["ToF"] = ToF,
    ["Pet"] = Pet,
}

--Get Units for other modules
function HealthBarColor:GetUnit(unit_name)
    return HBC_Units[unit_name]
end

--Collect data
--store information like class color reaction color in their local unit to be always available for all modules and to not repeat the work on every module
--hbc_unit = local healthbarcolor unit
function HealthBarColor:GetUnitInformation(hbc_unit, unit)
    if UnitIsPlayer(unit) then
        hbc_unit.isPlayer      = true
        hbc_unit.Class         = select(2,UnitClass(unit))
        hbc_unit.ClassColor    = ClassColor[hbc_unit.Class]
    else
        hbc_unit.isPlayer      = false
    end
    hbc_unit.ReactionColor = self:GetReactionColor(hbc_unit, unit)
end

function HealthBarColor:GetReactionColor(hbc_unit, unit)
    local reaction
    local reactionColor 
    reaction = UnitReaction("player", unit)
    if reaction == 2 then 
        reactionColor = ReactionColor["HOSTILE"]
    elseif reaction == 4 then 
        reactionColor = ReactionColor["NEUTRAL"]
    else
        reactionColor = ReactionColor["FRIENDLY"]
    end
    return reactionColor
end

--tables that will be used to save registered callback functions into
local OnTargetChanged_Callbacks , OnToTChanged_Callbacks, OnFocusChanged_Callbacks, OnToFChanged_Callbacks , OnEnteringWorld_Callbaks, ToPlayerArt_Callbacks, ToVehiceleArt_Callbacks = {}, {}, {}, {}, {}, {}, {}
local hooked = {}

function HealthBarColor:OnTargetChanged()
    self:OnToTChanged()
    self:GetUnitInformation(Target,"target")
    for _, callback in pairs(OnTargetChanged_Callbacks) do
        callback()
    end
end

function HealthBarColor:OnToTChanged()
    self:GetUnitInformation(ToT,"targettarget")
    for _, callback in pairs(OnToTChanged_Callbacks) do
        callback()
    end
end

function HealthBarColor:OnFocusChanged()
    self:OnToFChanged()
    self:GetUnitInformation(Focus,"focus")
    for _, callback in pairs(OnFocusChanged_Callbacks) do
        callback()
    end
end

function HealthBarColor:OnToFChanged()
    self:GetUnitInformation(ToF,"focustarget")
    for _, callback in pairs(OnToFChanged_Callbacks) do
        callback()
    end
end

function HealthBarColor:OnUnitTarget(self, unit)
    if unit == "target" then
        HealthBarColor:OnToTChanged()
    end
    if unit == "focus" then
        HealthBarColor:OnToFChanged()
    end
end

function HealthBarColor:OnEnteringWorld()
    for _, callback in pairs(OnEnteringWorld_Callbaks) do
        callback()
    end
end

function HealthBarColor:OnSelectionColorChanged(self, unit)
    if unit == "target" then
        HealthBarColor:OnTargetChanged()
    end
    if unit == "focus" then
        HealthBarColor:OnFocusChanged()
    end
end

--Register
--modules will register callback functions on events
--first parameter can be any string for debug purposes use "ModuleName.."
function HealthBarColor:RegisterOnTargetChanged(anyname, callback)
    OnTargetChanged_Callbacks[anyname] = callback
end

function HealthBarColor:RegisterOnToTChanged(anyname, callback)
    OnToTChanged_Callbacks[anyname] = callback
end

function HealthBarColor:RegisterOnFocusChanged(anyname, callback)
    OnFocusChanged_Callbacks[anyname] = callback
end

function HealthBarColor:RegisterOnToFChanged(anyname, callback)
    OnToFChanged_Callbacks[anyname] = callback
end

function HealthBarColor:RegisterOnEnteringWorld(anyname, callback)
    OnEnteringWorld_Callbaks[anyname] = callback
end

function HealthBarColor:RegisterOnToPlayerArt(callback)
    ToPlayerArt_Callbacks[#ToPlayerArt_Callbacks+1] = callback
    if not hooked["PlayerFrame_ToPlayerArt"] then
        hooksecurefunc("PlayerFrame_ToPlayerArt", function() 
            for i = 1,#ToPlayerArt_Callbacks do 
                ToPlayerArt_Callbacks[i]()
            end
        end)
        hooked["PlayerFrame_ToPlayerArt"] = true
    end
end

function HealthBarColor:RegisterOnToVehicleArt(callback)
    ToVehiceleArt_Callbacks[#ToVehiceleArt_Callbacks+1] = callback
    if not hooked["PlayerFrame_ToVehicleArt"] then
        hooksecurefunc("PlayerFrame_ToVehicleArt", function() 
            for i = 1,#ToVehiceleArt_Callbacks do 
                ToVehiceleArt_Callbacks[i]()
            end
        end)
        hooked["PlayerFrame_ToVehicleArt"] = true
    end
end

function HealthBarColor:EmptyTables()
    OnTargetChanged_Callbacks = {}
    OnToTChanged_Callbacks = {}
    OnFocusChanged_Callbacks = {}
    OnToFChanged_Callbacks = {}
    OnEnteringWorld_Callbaks = {}
    ToPlayerArt_Callbacks = {}
    ToVehiceleArt_Callback = {}
end