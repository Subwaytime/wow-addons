--[[
    Created by Slothpala 
--]]
--wow api local
local CreateColor = CreateColor
local UnitClass = UnitClass
--lua local
local pairs = pairs
local select = select
--
--HeealthBarColor Units
local Player = {}; local Target = {}; local Focus = {}; local ToT = {}; local ToF = {}; local Pet = {}; local Boss1 = {}; local Boss2 = {}; local Boss3 = {}; local Boss4 = {}; local Boss5 = {}
--define hbc_units
--player
Player.HealthBar    = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar
Player.PowerBar     = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar
Player.Portrait     = _G.PlayerFrame.PlayerFrameContainer.PlayerPortrait
Player.Name         = _G.PlayerName
Player.LeftText     = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.LeftText
Player.RightText    = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.RightText
Player.MiddleText   = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.TextString
Player.isLocked     = false
--target
Target              = _G.TargetFrame
Target.HealthBar    = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Target.PowerBar     = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Target.Portrait     = _G.TargetFrame.TargetFrameContainer.Portrait
Target.Name         = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.Name
Target.LeftText     = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText
Target.RightText    = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Target.MiddleText   = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--focus
Focus               = _G.FocusFrame
Focus.HealthBar     = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Focus.PowerBar      = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Focus.Portrait      = _G.FocusFrame.TargetFrameContainer.Portrait
Focus.Name          = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.Name
Focus.LeftText      = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText
Focus.RightText     = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Focus.MiddleText    = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--targettarget
ToT                 = _G.TargetFrameToT
ToT.HealthBar       = _G.TargetFrameToT.HealthBar
ToT.PowerBar        = _G.TargetFrameToT.ManaBar
ToT.Portrait        = _G.TargetFrameToT.Portrait
ToT.Name            = _G.TargetFrameToT.Name
--focustarget
ToF                 = _G.FocusFrameToT
ToF.HealthBar       = _G.FocusFrameToT.HealthBar
ToF.PowerBar        = _G.FocusFrameToT.ManaBar
ToF.Portrait        = _G.FocusFrameToT.Portrait
ToT.Name            = _G.FocusFrameToT.Name
--pet
Pet.HealthBar       = _G.PetFrameHealthBar
Pet.PowerBar        = _G.PetFrameManaBar
Pet.LeftText        = _G.PetFrameHealthBarTextLeft
Pet.RightText       = _G.PetFrameHealthBarTextRight
Pet.MiddleText      = _G.PetFrameHealthBarText
--boss
--1
Boss1.HealthBar     = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Boss1.PowerBar      = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Boss1.LeftText      = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText  
Boss1.RightText     = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Boss1.MiddleText    = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--2
Boss2.HealthBar     = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Boss2.PowerBar      = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Boss2.LeftText      = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText  
Boss2.RightText     = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Boss2.MiddleText    = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--3
Boss3.HealthBar     = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Boss3.PowerBar      = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Boss3.LeftText      = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText  
Boss3.RightText     = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Boss3.MiddleText    = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--4
Boss4.HealthBar     = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Boss4.PowerBar      = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Boss4.LeftText      = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText  
Boss4.RightText     = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Boss4.MiddleText    = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--5
Boss5.HealthBar     = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar
Boss5.PowerBar      = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar
Boss5.LeftText      = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText  
Boss5.RightText     = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText
Boss5.MiddleText    = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString
--globals handles
--not needed for now
--HEALTHBARCOLOR_ADDON_PLAYER = Player; HEALTHBARCOLOR_ADDON_TARGET = Target; HEALTHBARCOLOR_ADDON_FOCUS = Focus; HEALTHBARCOLOR_ADDON_TOT = ToT; HEALTHBARCOLOR_ADDON_TOF = ToF; HEALTHBARCOLOR_ADDON_PET = Pet; HEALTHBARCOLOR_ADDON_BOSS1 = Boss1; HEALTHBARCOLOR_ADDON_BOSS2 = Boss2;  HEALTHBARCOLOR_ADDON_BOSS3 = Boss3;  HEALTHBARCOLOR_ADDON_BOSS4 = Boss4;  HEALTHBARCOLOR_ADDON_BOSS5 = Boss5;  
--Colors
--class colors
local ClassColor = {}
--reaction colors
local ReactionColor = {}
--AddOn
--create addon and get libraries
HealthBarColor = LibStub("AceAddon-3.0"):NewAddon("HealthBarColor", "AceConsole-3.0", "AceEvent-3.0", "AceSerializer-3.0")
HealthBarColor:SetDefaultModuleLibraries("AceConsole-3.0", "AceEvent-3.0")
HealthBarColor:SetDefaultModuleState(false)
local AC         = LibStub("AceConfig-3.0")
local ACD        = LibStub("AceConfigDialog-3.0")
local AceGUI     = LibStub("AceGUI-3.0")
local LibDeflate = LibStub:GetLibrary("LibDeflate")
local LDS        = LibStub("LibDualSpec-1.0")
local GUI

function HealthBarColor:OnInitialize()
    --Initial work
    --prepare status bars
    local function PrepareStatusBars()
        --major status bars
        for _,unit in pairs ({
            Player,
            Target,
            Focus,
            Boss1,
            Boss2,
            Boss3,
            Boss4,
            Boss5,
        }) 
        do 
            unit.HealthBar:SetStatusBarDesaturated(true)
            self:assignLayers(unit.HealthBar)
        end
        --minor status bars
        for _,unit in pairs ({
            ToT,
            ToF,
            Pet
        }) 
            do unit.HealthBar:SetStatusBarDesaturated(true)
        end
    end
    PrepareStatusBars()
    self:LoadDataBase()
end

--assign draw layers
function HealthBarColor:assignLayers(layered_statusbar)
    local layer, sublevel = layered_statusbar:GetStatusBarTexture():GetDrawLayer()
    layered_statusbar.OverAbsorbGlow:SetDrawLayer(layer,sublevel+1)
    layered_statusbar.TotalAbsorbBarOverlay:SetDrawLayer(layer,sublevel+1)
end

function HealthBarColor:OnEnable()
    --load own options table
    local options = self:GetOptionsTable()
    --create option table based on database structure and add them to options
    options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) 
    --register options as option table to create a gui based on it
    AC:RegisterOptionsTable("HealthBarColor_options", options) 
    --add them to blizzards settings panel for addons
    self.optionsFrame = ACD:AddToBlizOptions("HealthBarColor_options", "HealthBarColor")
    --add dual specc support 
    LDS:EnhanceDatabase(self.db, "HealthBarColor") 
    LDS:EnhanceOptions(options.args.profile, self.db) 
    self:RegisterChatCommand("hbc", "SlashCommand")
    self:RegisterEvents()
    self:LoadConfig()
end

function HealthBarColor:SlashCommand()
    if ACD.OpenFrames["HealthBarColor_options"] then
        ACD:Close("HealthBarColor_options")
    else
        ACD:SetDefaultSize("HealthBarColor_options",800,720)
        ACD:Open("HealthBarColor_options",GUI)
    end
end

function HealthBarColor:LoadConfig()  
    self:CreateColors()
    self:GetColorOverwrites()
    self:GetUnitInformation(Player, "player")
    for _, module in self:IterateModules() do
        if self.db.profile.Settings.Modules[module:GetName()] then 
            module:Enable()
        end
    end
    self:OnTargetChanged()
    self:OnToTChanged()
    self:OnFocusChanged()
    self:OnToFChanged()
end

function HealthBarColor:ReloadConfig()
    for _, module in self:IterateModules() do
        module:Disable()
    end
    self:EmptyTables()
    self:LoadConfig()
end

function HealthBarColor:RegisterEvents()
    self:RegisterEvent("PLAYER_TARGET_CHANGED","OnTargetChanged")
    self:RegisterEvent("PLAYER_FOCUS_CHANGED","OnFocusChanged")
    self:RegisterEvent("UNIT_TARGET","OnUnitTarget")
    self:RegisterEvent("UNIT_FACTION","OnSelectionColorChanged")
    --currently not needed  by any module
    --self:RegisterEvent("PLAYER_ENTERING_WORLD","OnEnteringWorld")
end
--getter/setter functions that will save and call settings into/from the db
--status
function HealthBarColor:GetStatus(info)
    return self.db.profile[info[#info-2]][info[#info-1]][info[#info]]
end
function HealthBarColor:SetStatus(info,value)
    self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = value
    --will reload the config each time the settings have been adjusted
    self:ReloadConfig()
end
--color
function HealthBarColor:GetColor(info)
    return self.db.profile[info[#info-2]][info[#info-1]][info[#info]].r, self.db.profile[info[#info-2]][info[#info-1]][info[#info]].g, self.db.profile[info[#info-2]][info[#info-1]][info[#info]].b
end
function HealthBarColor:SetColor(info, r,g,b)
    self.db.profile[info[#info-2]][info[#info-1]][info[#info]].r = r 
    self.db.profile[info[#info-2]][info[#info-1]][info[#info]].g = g
    self.db.profile[info[#info-2]][info[#info-1]][info[#info]].b = b
    self:ReloadConfig()
end
--profile import / export functions
--[[
    the method to share and import profiles is based on:
    https://github.com/brittyazel/EnhancedRaidFrames/blob/main/EnhancedRaidFrames.lua
]]--
function HealthBarColor:ShareProfile()
    --AceSerialize
	local serialized_profile = self:Serialize(self.db.profile) 
    --LibDeflate
	local compressed_profile = LibDeflate:CompressZlib(serialized_profile) 
	local encoded_profile    = LibDeflate:EncodeForPrint(compressed_profile)
	return encoded_profile
end

function HealthBarColor:ImportProfile(input)
    --validate input
    --empty?
    if input == "" then
        self:Print("No import string provided. Abort")
        return
    end
    --LibDeflate decode
    local decoded_profile = LibDeflate:DecodeForPrint(input)
    if decoded_profile == nil then
        self:Print("Decoding failed. Abort")
        return
    end
    --LibDefalte uncompress
    local uncompressed_profile = LibDeflate:DecompressZlib(decoded_profile)
    if uncompressed_profile == nil then
        self:Print("Uncompressing failed. Abort")
        return
    end
    --AceSerialize
    --deserialize the profile and overwirte the current values
    local valid, imported_Profile = self:Deserialize(uncompressed_profile)
    if valid and imported_Profile then
		for i,v in pairs(imported_Profile) do
			self.db.profile[i] = CopyTable(v)
		end
    else
        self:Print("Invalid profile. Abort")
    end
end
--Color functions
function HealthBarColor:CreateColors()
    ClassColor["DEATHKNIGHT"] = C_ClassColor.GetClassColor("DEATHKNIGHT")
    ClassColor["DEMONHUNTER"] = C_ClassColor.GetClassColor("DEMONHUNTER")
    ClassColor["DRUID"]       = C_ClassColor.GetClassColor("DRUID")
    ClassColor["EVOKER"]      = C_ClassColor.GetClassColor("EVOKER")
    ClassColor["HUNTER"]      = C_ClassColor.GetClassColor("HUNTER")
    ClassColor["MAGE"]        = C_ClassColor.GetClassColor("MAGE")
    ClassColor["MONK"]        = C_ClassColor.GetClassColor("MONK")
    ClassColor["PALADIN"]     = C_ClassColor.GetClassColor("PALADIN")
    ClassColor["PRIEST"]      = C_ClassColor.GetClassColor("PRIEST")
    ClassColor["ROGUE"]       = C_ClassColor.GetClassColor("ROGUE")
    ClassColor["SHAMAN"]      = C_ClassColor.GetClassColor("SHAMAN")
    ClassColor["WARLOCK"]     = C_ClassColor.GetClassColor("WARLOCK")
    ClassColor["WARRIOR"]     = C_ClassColor.GetClassColor("WARRIOR")
    ReactionColor["HOSTILE"]  = CreateColor(1,0,0)
    ReactionColor["NEUTRAL"]  = CreateColor(1,1,0)
    ReactionColor["FRIENDLY"] = CreateColor(0,1,0)
end

function HealthBarColor:GetColorOverwrites()
    if self.db.profile.Settings.ClassColorOverwrites.enabled then
        ClassColor["DEATHKNIGHT"] = CreateColor(self.db.profile.Settings.ClassColorOverwrites.deathknight.r,self.db.profile.Settings.ClassColorOverwrites.deathknight.g,self.db.profile.Settings.ClassColorOverwrites.deathknight.b)
        ClassColor["DEMONHUNTER"] = CreateColor(self.db.profile.Settings.ClassColorOverwrites.demonhunter.r,self.db.profile.Settings.ClassColorOverwrites.demonhunter.g,self.db.profile.Settings.ClassColorOverwrites.demonhunter.b)
        ClassColor["DRUID"]       = CreateColor(self.db.profile.Settings.ClassColorOverwrites.druid.r,self.db.profile.Settings.ClassColorOverwrites.druid.g,self.db.profile.Settings.ClassColorOverwrites.druid.b)
        ClassColor["EVOKER"]      = CreateColor(self.db.profile.Settings.ClassColorOverwrites.evoker.r,self.db.profile.Settings.ClassColorOverwrites.evoker.g,self.db.profile.Settings.ClassColorOverwrites.evoker.b)
        ClassColor["HUNTER"]      = CreateColor(self.db.profile.Settings.ClassColorOverwrites.hunter.r,self.db.profile.Settings.ClassColorOverwrites.hunter.g,self.db.profile.Settings.ClassColorOverwrites.hunter.b)
        ClassColor["MAGE"]        = CreateColor(self.db.profile.Settings.ClassColorOverwrites.mage.r,self.db.profile.Settings.ClassColorOverwrites.mage.g,self.db.profile.Settings.ClassColorOverwrites.mage.b)
        ClassColor["MONK"]        = CreateColor(self.db.profile.Settings.ClassColorOverwrites.monk.r,self.db.profile.Settings.ClassColorOverwrites.monk.g,self.db.profile.Settings.ClassColorOverwrites.monk.b)
        ClassColor["PALADIN"]     = CreateColor(self.db.profile.Settings.ClassColorOverwrites.paladin.r,self.db.profile.Settings.ClassColorOverwrites.paladin.g,self.db.profile.Settings.ClassColorOverwrites.paladin.b)
        ClassColor["PRIEST"]      = CreateColor(self.db.profile.Settings.ClassColorOverwrites.priest.r,self.db.profile.Settings.ClassColorOverwrites.priest.g,self.db.profile.Settings.ClassColorOverwrites.priest.b)
        ClassColor["ROGUE"]       = CreateColor(self.db.profile.Settings.ClassColorOverwrites.rogue.r,self.db.profile.Settings.ClassColorOverwrites.rogue.g,self.db.profile.Settings.ClassColorOverwrites.rogue.b)
        ClassColor["SHAMAN"]      = CreateColor(self.db.profile.Settings.ClassColorOverwrites.shaman.r,self.db.profile.Settings.ClassColorOverwrites.shaman.g,self.db.profile.Settings.ClassColorOverwrites.shaman.b)
        ClassColor["WARLOCK"]     = CreateColor(self.db.profile.Settings.ClassColorOverwrites.warlock.r,self.db.profile.Settings.ClassColorOverwrites.warlock.g,self.db.profile.Settings.ClassColorOverwrites.warlock.b)
        ClassColor["WARRIOR"]     = CreateColor(self.db.profile.Settings.ClassColorOverwrites.warrior.r,self.db.profile.Settings.ClassColorOverwrites.warrior.g,self.db.profile.Settings.ClassColorOverwrites.warrior.b)
    end
    if self.db.profile.Settings.ReactionColorOverwrites.enabled then
        ReactionColor["HOSTILE"]   = CreateColor(self.db.profile.Settings.ReactionColorOverwrites.hostile.r,self.db.profile.Settings.ReactionColorOverwrites.hostile.g,self.db.profile.Settings.ReactionColorOverwrites.hostile.b)
        ReactionColor["NEUTRAL"]   = CreateColor(self.db.profile.Settings.ReactionColorOverwrites.neutral.r,self.db.profile.Settings.ReactionColorOverwrites.neutral.g,self.db.profile.Settings.ReactionColorOverwrites.neutral.b)
        ReactionColor["FRIENDLY"]  = CreateColor(self.db.profile.Settings.ReactionColorOverwrites.friendly.r,self.db.profile.Settings.ReactionColorOverwrites.friendly.g,self.db.profile.Settings.ReactionColorOverwrites.friendly.b)
    end
end
--Get Colors for other modules
function HealthBarColor:GetClassColors()
    return ClassColor
end
--Get Units for other modules
function HealthBarColor:GetUnit(unit_name)
    if     unit_name == "Player" then
        return Player
    elseif unit_name == "Target" then
        return Target
    elseif unit_name == "Focus"  then 
        return Focus
    elseif unit_name == "ToT"    then 
        return ToT
    elseif unit_name == "ToF"    then 
        return ToF
    elseif unit_name == "Pet"    then 
        return Pet
    elseif unit_name == "Boss1"  then 
        return Boss1
    elseif unit_name == "Boss2"  then 
        return Boss2
    elseif unit_name == "Boss3"  then 
        return Boss3
    elseif unit_name == "Boss4"  then 
        return Boss4
    elseif unit_name == "Boss5"  then 
        return Boss5
    end
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
        hbc_unit.ReactionColor = self:GetReactionColor(unit)
    end
end

function HealthBarColor:GetReactionColor(unit)
    --0=hostile 2=neutral 3=firendly
    --will add more colors later only just learned that UnitSelectionType exist
    local reaction = UnitSelectionType(unit)
    local reactionColor 
    if reaction == 0 then 
        reactionColor = ReactionColor["HOSTILE"]
    elseif reaction == 2 then
        reactionColor = ReactionColor["NEUTRAL"]
    elseif reaction == 3 then
        reactionColor = ReactionColor["FRIENDLY"]
    else
        reactionColor = CreateColor(UnitSelectionColor(unit, true))
    end
    return reactionColor
end
--tables that will be used to save registered callback functions into
local OnTargetChanged_Callbacks = {}; local OnToTChanged_Callbacks = {}; local OnFocusChanged_Callbacks = {}; local OnToFChanged_Callbacks = {}; local OnEnteringWorld_Callbaks = {}

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

function HealthBarColor:EmptyTables()
    OnTargetChanged_Callbacks = {}
    OnToTChanged_Callbacks    = {}
    OnFocusChanged_Callbacks  = {}
    OnToFChanged_Callbacks    = {}
    OnEnteringWorld_Callbaks  = {}
end

