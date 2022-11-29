local _, _, _, tocversion = GetBuildInfo()
HealthBarColor = LibStub("AceAddon-3.0"):NewAddon("HealthBarColor", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
    profile = {
        color = {r = 0, g = 0, b = 0, a = 1,},
    },
}

local options = {
    name = "HealthBarColor",
    handler = HealthBarColor,
    type = "group",
    args = {
        color = {
            name = "color",
            type = "color",
            get = "GetColor",
            set = "SetColor",
            hasAlpha = false,
        },
        classcolor = {
            name = "classcolor",
            type = "execute",
            func = "SetClassColor",
        },
        save = {
            name = "save",
            type = "execute",
            func = "Save",
        },

    },
}


function HealthBarColor:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("HealthBarColorDB", defaults, true) 
    --callbacks puffer zone
    AC:RegisterOptionsTable("HealthBarColor_options", options) 
    self.optionsFrame = ACD:AddToBlizOptions("HealthBarColor_options", "HealthBarColor")

    local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) 
    AC:RegisterOptionsTable("HealthBarColor_Profiles", profiles)
    ACD:AddToBlizOptions("HealthBarColor_Profiles", "Profiles", "HealthBarColor")
    HealthBarColor:ChangeColor()

    self:RegisterChatCommand("hbc", "SlashCommand")
end

function HealthBarColor:SlashCommand()
    InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function HealthBarColor:SetColor(_, r, g, b)
   self.db.profile.color.r = r
   self.db.profile.color.g = g
   self.db.profile.color.b = b
end

function HealthBarColor:GetColor(_, r, g, b)
   return self.db.profile.color.r, self.db.profile.color.g, self.db.profile.color.b
end

function HealthBarColor:SetClassColor()
    local _, englishClass = UnitClass("player")
    self.db.profile.color.r, self.db.profile.color.g, self.db.profile.color.b = GetClassColor(englishClass)
end

function HealthBarColor:Save()
    ReloadUI()
end

function HealthBarColor:ChangeColor()
local r = self.db.profile.color.r
local g = self.db.profile.color.g
local b = self.db.profile.color.b
    if tocversion >= 100000 then
        hooksecurefunc("UnitFrameHealthBar_Update", function(self) 
                    self:SetStatusBarDesaturated(true)
                    self:SetStatusBarColor(r, g, b) 
        end);
        hooksecurefunc("HealthBar_OnValueChanged", function(self)
                    self:SetStatusBarDesaturated(true)
                    self:SetStatusBarColor(r, g, b) 
        end);
    else 
        hooksecurefunc("UnitFrameHealthBar_Update", function(self) 
                self:SetStatusBarColor(r, g, b) 
        end);
        hooksecurefunc("HealthBar_OnValueChanged", function(self)
                self:SetStatusBarColor(r, g, b) 
        end);
    end
end

