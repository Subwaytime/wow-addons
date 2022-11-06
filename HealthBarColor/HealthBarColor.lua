--[[
Created by Slothpala 
--]]
HealthBarColor = LibStub("AceAddon-3.0"):NewAddon("HealthBarColor", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local media = LibStub("LibSharedMedia-3.0")
HealthBarColor:SetDefaultModuleLibraries("AceConsole-3.0", "AceEvent-3.0")
HealthBarColor:SetDefaultModuleState(false)
local ULx,ULy,LLx,LLy,URx,URy,LRx,LRy = TargetFrame.TargetFrameContainer.Portrait:GetTexCoord()
local useclassIcons = false
local reactionColor = {
    enemy = {r=1,g=0,b=0}, --enemy
    neutral = {r=1,g=1,b=0}, --neutral
    friendly ={r=0,g=1,b=0}, --friendly
}

local defaults = {
    profile = {
        Player = {
            classcolor = true,
            color =  {r = 0, g = 0, b = 0},
            unitreaction = false,
        },
        Target = {
            classcolor = false,
            targetsclasscolor = true,
            color =  {r = 0, g = 0, b = 0},
            npccolor =  {r = 0, g = 0.9, b = 0.3},
        },
        TargetOfTarget = {
            classcolor = false,
            targetsclasscolor = true,
            color =  {r = 0, g = 0, b = 0},
            npccolor =  {r = 0, g = 0.9, b = 0.3},
        },
        Focus = {
            classcolor = false,
            targetsclasscolor = true,
            color =  {r = 0, g = 0, b = 0},
            npccolor =  {r = 0, g = 0.9, b = 0.3},
        },
        TargetOfFocus = {
            classcolor = false,
            targetsclasscolor = true,
            color =  {r = 0, g = 0, b = 0},
            npccolor =  {r = 0, g = 0.9, b = 0.3},
        },
        Boss = {
            classcolor = false,
            color =  {r = 0.7, g = 0, b = 0.1},
        },
        Pet = {
            classcolor = true,
            color =  {r = 0, g = 0.9, b = 0.3},
        },
        ClassIcons = {
            useclassicons = false,
            unitreaction = false,
        },
        Textures = {
            custom = false,
            statusbar = "Solid",
        },
    },
}

local options = {
    name = "HealthBarColor",
    handler = HealthBarColor,
    type = "group",
    childGroups = "tab",
    args = {
        ColorSettings = {
            order = 1,
            name = "Color Settings",
            type = "group",
            args = {
        
            
        Player = {
            order = 1,
            name = "Player Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 1,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                },
                color = {
                    order = 2,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
            },
        },
        Target = {
            order = 2,
            name = "Target Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 3,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                    disabled = false,
                    width = 0.8,
                },
                targetsclasscolor = {
                    order = 1,
                    name = "targets class color  ",
                    type = "toggle",
                    get = "GetTargetsClassColor",
                    set = "SetTargetsClassColor",
                },
                color = {
                    order = 4,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
                npccolor = {
                    order = 2,
                    name = "npc color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    hidden = true,
                    width = 0.6,
                },
            },
        },
        TargetOfTarget = {
            order = 3,
            name = "Target of Target Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 3,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                    disabled = false,
                    width = 0.8,
                },
                targetsclasscolor = {
                    order = 1,
                    name = "target of targets class color  ",
                    type = "toggle",
                    get = "GetTargetsClassColor",
                    set = "SetTargetsClassColor",
                },
                color = {
                    order = 4,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
                npccolor = {
                    order = 2,
                    name = "npc color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    hidden = true,
                    width = 0.6,
                },
            },
        },
        Focus = {
            order = 4,
            name = "Focus Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 3,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                    disabled = false,
                    width = 0.8,
                },
                targetsclasscolor = {
                    order = 1,
                    name = "focus class color  ",
                    type = "toggle",
                    get = "GetTargetsClassColor",
                    set = "SetTargetsClassColor",
                },
                color = {
                    order = 4,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
                npccolor = {
                    order = 2,
                    name = "npc color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    hidden = true,
                    width = 0.6,
                },
            },
        },
        TargetOfFocus = {
            order = 5,
            name = "Target of Focus Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 3,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                    disabled = false,
                    width = 0.8,
                },
                targetsclasscolor = {
                    order = 1,
                    name = "target of focus class color  ",
                    type = "toggle",
                    get = "GetTargetsClassColor",
                    set = "SetTargetsClassColor",
                },
                color = {
                    order = 4,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
                npccolor = {
                    order = 2,
                    name = "npc color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    hidden = true,
                    width = 0.6,
                },
            },
        },
        Boss = {
            order = 6,
            name = "Boss Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 1,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                },
                color = {
                    order = 2,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
            },
        },
        Pet = {
            order = 7,
            name = "Pet Frame",
            type = "group",
            inline = true,
            args = {
                classcolor = {
                    order = 1,
                    name = "my class color  ",
                    type = "toggle",
                    get = "GetClassColor",
                    set = "SetClassColor",
                },
                color = {
                    order = 2,
                    name = "static color",
                    type = "color",
                    get = "GetColor",
                    set = "SetColor",
                    disabled = false,
                },
            },
        },
        ClassIcons = {
            order = 0,
            name = "Config",
            desc = "ignores your profile and is account wide",
            type = "group",
            inline = true,
            args = {
                useclassicons = {
                    order = 1,
                    name = "Class Icons",
                    desc = "Use Class Icons Instead of Portraits. This will reload your UI",
                    type = "execute",
                    width = 1,
                    confirm = true,
                    func = function() HealthBarColor:ClassIconsProfile(true); ReloadUI() end,
                },
                dontuseclassicons = {
                    order = 2,
                    name = "Use Portraits",
                    desc = "Use Portraits. This will reload your UI",
                    type = "execute",
                    width = 1,
                    confirm = true,
                    func = function() HealthBarColor:ClassIconsProfile(false); ReloadUI() end,
                },
                unitreaction = {
                    order = 3,
                    name = "NPC color based on hostility",
                    desc = "this will ignore your custom color settings and override them based on units reaction to you e.g hostile = red",
                    type = "toggle",
                    get = "GetReaction",
                    set = "SetReaction",
                    disabled = false,
                },
            },
        },
            
        },
        },
        Textures = {
            order = 2,
            name = "Textures",
            type = "group",
            args = {
                custom = {
                    order = 1,
                    name = "Use custom texture",
                    desc = "if you uncheck this /reload to get back to the original texture",
                    type = "toggle",
                    get = "Get",
                    set = "Set",
                },
                statusbar = {
                    order = 2,
                    type = "select",
                    dialogControl = "LSM30_Statusbar", 
                    name = 'Health Bar Texture', 
                    values = media:HashTable("statusbar"), 
                    get = "Get",
                    set = "Set",
                    disabled = function() return not HealthBarColor.db.profile.Textures.custom end,
                },
            },
        },
    },
}

function HealthBarColor:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("HealthBarColorDB", defaults, true) 
    self.db.RegisterCallback(self, "OnProfileChanged", "LoadConfig")
    self.db.RegisterCallback(self, "OnProfileCopied", "LoadConfig")
    self.db.RegisterCallback(self, "OnProfileReset", "LoadConfig")
    AC:RegisterOptionsTable("HealthBarColor_options", options) 
    self.optionsFrame = ACD:AddToBlizOptions("HealthBarColor_options", "HealthBarColor")

    local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) 
    AC:RegisterOptionsTable("HealthBarColor_Profiles", profiles)
    ACD:AddToBlizOptions("HealthBarColor_Profiles", "Profiles", "HealthBarColor")

    HealthBarColor:LoadConfig()
    self:RegisterChatCommand("hbc", "SlashCommand")
end

function HealthBarColor:SlashCommand()
    InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
end

function HealthBarColor:LoadConfig()
    HealthBarColor:PlayerColor()
    HealthBarColor:TargetColor()
    HealthBarColor:FocusColor()
    HealthBarColor:BossColor()
    HealthBarColor:PetColor()
    if self.db.profile.ClassIcons.useclassicons then
        useclassIcons = true
    end
    if self.db.profile.Textures.custom then
        HealthBarColor:EnableModule("Textures")
        local Textures = HealthBarColor:GetModule("Textures")
        Textures:ApplyAll()
        if IsAddOnLoaded("BiggerHealthBar") then
            PlayerFrameHealthBar:SetStatusBarTexture(media:Fetch("statusbar", HealthBarColor.db.profile.Textures.statusbar)) 
        end
    end
end
function HealthBarColor:ClassIconsProfile(bool)
    if bool then self.db.profile.ClassIcons.useclassicons = true
    else self.db.profile.ClassIcons.useclassicons = false
    end
end
function HealthBarColor:SetColor(info, r, g, b)
    self.db.profile[info[#info-1]][info[#info]].r = r
    self.db.profile[info[#info-1]][info[#info]].g = g
    self.db.profile[info[#info-1]][info[#info]].b = b
end   

function HealthBarColor:GetColor(info, r, g, b)
    HealthBarColor:LoadConfig()
    return self.db.profile[info[#info-1]][info[#info]].r, self.db.profile[info[#info-1]][info[#info]].g, self.db.profile[info[#info-1]][info[#info]].b
end
-- set and get for players class color
function HealthBarColor:SetClassColor(info) 
    if self.db.profile[info[#info-1]].classcolor then
        self.db.profile[info[#info-1]].classcolor = false
    else 
        self.db.profile[info[#info-1]].classcolor = true
    end
end
     
function HealthBarColor:GetClassColor(info)
    HealthBarColor:LoadConfig()
    if self.db.profile[info[#info-1]].classcolor or self.db.profile[info[#info-1]].targetsclasscolor then
        options.args.ColorSettings.args[info[#info-1]].args.color.disabled = true
    else
        options.args.ColorSettings.args[info[#info-1]].args.color.disabled = false
    end
    return self.db.profile[info[#info-1]].classcolor
end
--set and get for targets class color
function HealthBarColor:SetTargetsClassColor(info)
    if self.db.profile[info[#info-1]].targetsclasscolor then
        self.db.profile[info[#info-1]].targetsclasscolor = false
    else 
        self.db.profile[info[#info-1]].targetsclasscolor = true
    end
end

function HealthBarColor:GetTargetsClassColor(info)
    HealthBarColor:LoadConfig()
    if self.db.profile[info[#info-1]].targetsclasscolor then 
        options.args.ColorSettings.args[info[#info-1]].args.color.disabled = true
        options.args.ColorSettings.args[info[#info-1]].args.npccolor.hidden = false
        options.args.ColorSettings.args[info[#info-1]].args.classcolor.disabled = true
    else 
        options.args.ColorSettings.args[info[#info-1]].args.color.disabled = false
        options.args.ColorSettings.args[info[#info-1]].args.npccolor.hidden = true
        options.args.ColorSettings.args[info[#info-1]].args.classcolor.disabled = false
    end
    return self.db.profile[info[#info-1]].targetsclasscolor
end
--added stuff
function HealthBarColor:GetReaction()
    HealthBarColor:LoadConfig()
    return self.db.profile.ClassIcons.unitreaction
end
function HealthBarColor:SetReaction(info, value)
    self.db.profile.ClassIcons.unitreaction = value
end
--simple toggle check
function HealthBarColor:Get(info)
    HealthBarColor:LoadConfig()
    return self.db.profile[info[#info-1]][info[#info]]
end
function HealthBarColor:Set(info, value)
    self.db.profile[info[#info-1]][info[#info]] = value
end



--color functions
--player
function HealthBarColor:PlayerColor()
    if self.db.profile.Player.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        PlayerFrameHealthBar:SetStatusBarDesaturated(true)
        PlayerFrameHealthBar:SetStatusBarColor(r, g, b)
    else
    PlayerFrameHealthBar:SetStatusBarDesaturated(true)
    PlayerFrameHealthBar:SetStatusBarColor(self.db.profile.Player.color.r, self.db.profile.Player.color.g, self.db.profile.Player.color.b)
    end
end
--target
function HealthBarColor:TargetColor()
    if self.db.profile.Target.targetsclasscolor then
        if UnitIsPlayer("target") then
            local _, englishClass = UnitClass("target");
            local r, g, b = GetClassColor(englishClass)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        elseif self.db.profile.ClassIcons.unitreaction then
            local reaction = UnitReaction("player", "target");
            local color = {r = 0,g = 0,b = 0} 
            if reaction == 2 then 
                color.r = reactionColor.enemy.r
                color.g = reactionColor.enemy.g
                color.b = reactionColor.enemy.b
            elseif reaction == 4 then 
                color.r = reactionColor.neutral.r
                color.g = reactionColor.neutral.g
                color.b = reactionColor.neutral.b
            elseif reaction == 5 then 
                color.r = reactionColor.friendly.r
                color.g = reactionColor.friendly.g
                color.b = reactionColor.friendly.b
            end
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        else
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Target.npccolor.r, self.db.profile.Target.npccolor.g, self.db.profile.Target.npccolor.b)
        end
    elseif self.db.profile.Target.classcolor then
            local _, englishClass = UnitClass("player");
            local r, g, b = GetClassColor(englishClass)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
    else
        if self.db.profile.ClassIcons.unitreaction then
            local reaction = UnitReaction("player", "target");
            local color =  {r = 0,g = 0,b = 0} 
            if reaction == 2 then 
                color.r = reactionColor.enemy.r
                color.g = reactionColor.enemy.g
                color.b = reactionColor.enemy.b
            elseif reaction == 4 then 
                color.r = reactionColor.neutral.r
                color.g = reactionColor.neutral.g
                color.b = reactionColor.neutral.b
            elseif reaction == 5 then 
                color.r = reactionColor.friendly.r
                color.g = reactionColor.friendly.g
                color.b = reactionColor.friendly.b
            end
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        else
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Target.color.r, self.db.profile.Target.color.g, self.db.profile.Target.color.b)
        end
    end
end
--target of target 
function HealthBarColor:TargetofTargetColor(unit)
    if self.db.profile.TargetOfTarget.targetsclasscolor then
        if UnitIsPlayer(unit) then
        local _, englishClass = UnitClass(unit);
        local r, g, b = GetClassColor(englishClass)
        TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
        TargetFrameToT.HealthBar:SetStatusBarColor(r, g, b)
        else
            if self.db.profile.ClassIcons.unitreaction then
                local reaction = UnitReaction("player", "targettarget");
                local color =  {r = 0,g = 0,b = 0} 
                if reaction == 2 then 
                    color.r = reactionColor.enemy.r
                    color.g = reactionColor.enemy.g
                    color.b = reactionColor.enemy.b
                elseif reaction == 4 then 
                    color.r = reactionColor.neutral.r
                    color.g = reactionColor.neutral.g
                    color.b = reactionColor.neutral.b
                elseif reaction == 5 then 
                    color.r = reactionColor.friendly.r
                    color.g = reactionColor.friendly.g
                    color.b = reactionColor.friendly.b
                end
                TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
                TargetFrameToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
            else
                TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
                TargetFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfTarget.npccolor.r, self.db.profile.TargetOfTarget.npccolor.g, self.db.profile.TargetOfTarget.npccolor.b)
            end
        end
    elseif self.db.profile.TargetOfTarget.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
        TargetFrameToT.HealthBar:SetStatusBarColor(r, g, b)
    else
        if self.db.profile.ClassIcons.unitreaction then
            local reaction = UnitReaction("player", "targettarget");
            local color =  {r = 0,g = 0,b = 0} 
            if reaction == 2 then 
                color.r = reactionColor.enemy.r
                color.g = reactionColor.enemy.g
                color.b = reactionColor.enemy.b
            elseif reaction == 4 then 
                color.r = reactionColor.neutral.r
                color.g = reactionColor.neutral.g
                color.b = reactionColor.neutral.b
            elseif reaction == 5 then 
                color.r = reactionColor.friendly.r
                color.g = reactionColor.friendly.g
                color.b = reactionColor.friendly.b
            end
            TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
            TargetFrameToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        else
            TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
            TargetFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfTarget.color.r, self.db.profile.TargetOfTarget.color.g, self.db.profile.TargetOfTarget.color.b)
        end
    end
end
--focus
function HealthBarColor:FocusColor()
    if self.db.profile.Focus.targetsclasscolor then
        if UnitIsPlayer("focus") then
        local _, englishClass = UnitClass("focus");
        local r, g, b = GetClassColor(englishClass)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        else
            if self.db.profile.ClassIcons.unitreaction then
                local reaction = UnitReaction("player", "focus");
                local color =  {r = 0,g = 0,b = 0} 
                if reaction == 2 then 
                    color.r = reactionColor.enemy.r
                    color.g = reactionColor.enemy.g
                    color.b = reactionColor.enemy.b
                elseif reaction == 4 then 
                    color.r = reactionColor.neutral.r
                    color.g = reactionColor.neutral.g
                    color.b = reactionColor.neutral.b
                elseif reaction == 5 then 
                    color.r = reactionColor.friendly.r
                    color.g = reactionColor.friendly.g
                    color.b = reactionColor.friendly.b
                end
                FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
                FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
            else
                FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
                FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Focus.npccolor.r, self.db.profile.Focus.npccolor.g, self.db.profile.Focus.npccolor.b)
            end
        end
    elseif self.db.profile.Focus.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
    else
        if self.db.profile.ClassIcons.unitreaction then
            local reaction = UnitReaction("player", "focus");
            local color =  {r = 0,g = 0,b = 0} 
            if reaction == 2 then 
                color.r = reactionColor.enemy.r
                color.g = reactionColor.enemy.g
                color.b = reactionColor.enemy.b
            elseif reaction == 4 then 
                color.r = reactionColor.neutral.r
                color.g = reactionColor.neutral.g
                color.b = reactionColor.neutral.b
            elseif reaction == 5 then 
                color.r = reactionColor.friendly.r
                color.g = reactionColor.friendly.g
                color.b = reactionColor.friendly.b
            end
            FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        else
            FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
            FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Focus.color.r, self.db.profile.Focus.color.g, self.db.profile.Focus.color.b)
        end
    end
end
--focus's target
function HealthBarColor:TargetOfFocusColor(unit)
    if self.db.profile.TargetOfFocus.targetsclasscolor then
        if UnitIsPlayer(unit) then
        local _, englishClass = UnitClass(unit);
        local r, g, b = GetClassColor(englishClass)
        FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
        FocusFrameToT.HealthBar:SetStatusBarColor(r, g, b)
        else
            if self.db.profile.ClassIcons.unitreaction then
                local reaction = UnitReaction("player", "focustarget");
                local color =  {r = 0,g = 0,b = 0} 
                if reaction == 2 then 
                    color.r = reactionColor.enemy.r
                    color.g = reactionColor.enemy.g
                    color.b = reactionColor.enemy.b
                elseif reaction == 4 then 
                    color.r = reactionColor.neutral.r
                    color.g = reactionColor.neutral.g
                    color.b = reactionColor.neutral.b
                elseif reaction == 5 then 
                    color.r = reactionColor.friendly.r
                    color.g = reactionColor.friendly.g
                    color.b = reactionColor.friendly.b
                end
                FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
                FocusFrameToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
            else
                FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
                FocusFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfFocus.npccolor.r, self.db.profile.TargetOfFocus.npccolor.g, self.db.profile.TargetOfFocus.npccolor.b)
            end
        end
    elseif self.db.profile.Focus.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
        FocusFrameToT.HealthBar:SetStatusBarColor(r, g, b)
    else
        if self.db.profile.ClassIcons.unitreaction then
            local reaction = UnitReaction("player", "focustarget");
            local color =  {r = 0,g = 0,b = 0} 
            if reaction == 2 then 
                color.r = reactionColor.enemy.r
                color.g = reactionColor.enemy.g
                color.b = reactionColor.enemy.b
            elseif reaction == 4 then 
                color.r = reactionColor.neutral.r
                color.g = reactionColor.neutral.g
                color.b = reactionColor.neutral.b
            elseif reaction == 5 then 
                color.r = reactionColor.friendly.r
                color.g = reactionColor.friendly.g
                color.b = reactionColor.friendly.b
            end
            FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
            FocusFrameToT.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
        else
            FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
            FocusFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfFocus.color.r, self.db.profile.TargetOfFocus.color.g, self.db.profile.TargetOfFocus.color.b)
        end
    end
end
--bosses
function HealthBarColor:BossColor()
    if self.db.profile.Boss.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        --might add a color selection for each boss if 1 feels the need for it
        Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)   
    else
        Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Boss.color.r, self.db.profile.Boss.color.g, self.db.profile.Boss.color.b)
        Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Boss.color.r, self.db.profile.Boss.color.g, self.db.profile.Boss.color.b)
        Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Boss.color.r, self.db.profile.Boss.color.g, self.db.profile.Boss.color.b)
        Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Boss.color.r, self.db.profile.Boss.color.g, self.db.profile.Boss.color.b)
        Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Boss.color.r, self.db.profile.Boss.color.g, self.db.profile.Boss.color.b)
    end
end
--pet
function HealthBarColor:PetColor()
    if self.db.profile.Pet.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        PetFrameHealthBar:SetStatusBarDesaturated(true)
        PetFrameHealthBar:SetStatusBarColor(r, g, b)
    else
        PetFrameHealthBar:SetStatusBarDesaturated(true)
        PetFrameHealthBar:SetStatusBarColor(self.db.profile.Pet.color.r, self.db.profile.Pet.color.g, self.db.profile.Pet.color.b)
    end
end
--events
HealthBarColor:RegisterEvent("PLAYER_TARGET_CHANGED","TargetColor")
HealthBarColor:RegisterEvent("PLAYER_FOCUS_CHANGED","FocusColor")
--target target and portrait stuff
hooksecurefunc("UnitFramePortrait_Update", function(self) 
    if self.unit == "targettarget" then 
        HealthBarColor:TargetofTargetColor(self.unit)
    end
    if self.unit == "focustarget" then 
        HealthBarColor:TargetOfFocusColor(self.unit)
    end
    if useclassIcons then
        if self.portrait then
            if UnitIsPlayer(self.unit) then
                local _, englishClass = UnitClass(self.unit)
                local classcoords = CLASS_ICON_TCOORDS[englishClass]   
                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                if classcoords ~= nil then
                    self.portrait:SetTexCoord(unpack(classcoords))  -- credit https://wowpedia.fandom.com/wiki/Class_icon       
                end
            else
                self.portrait:SetTexCoord(ULx,ULy,LLx,LLy,URx,URy,LRx,LRy)
            end
        end
    end
end)



