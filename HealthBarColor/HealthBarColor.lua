HealthBarColor = LibStub("AceAddon-3.0"):NewAddon("HealthBarColor", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local ULx,ULy,LLx,LLy,URx,URy,LRx,LRy = TargetFrame.TargetFrameContainer.Portrait:GetTexCoord()
local useclassIcons = false

local defaults = {
    profile = {
        Player = {
            classcolor = true,
            color =  {r = 0, g = 0, b = 0},
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
            useclassicons = true,
        },
    },
}

local options = {
    name = "HealthBarColor",
    handler = HealthBarColor,
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
            name = "Class Icons",
            desc = "ignores your profile and is account wide",
            type = "group",
            inline = true,
            args = {
                useclassicons = {
                    name = "use class icons instead of portraits",
                    desc = "This will reload your UI",
                    type = "execute",
                    width = 1.7,
                    confirm = true,
                    func = function() HealthBarColor:ClassIconsProfile(true); ReloadUI() end,
                },
                dontuseclassicons = {
                    name = "use portraits instead of class icons",
                    desc = "This will reload your UI",
                    type = "execute",
                    width = 1.7,
                    confirm = true,
                    func = function() HealthBarColor:ClassIconsProfile(false); ReloadUI() end,
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
        options.args[info[#info-1]].args.color.disabled = true
    else
        options.args[info[#info-1]].args.color.disabled = false
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
        options.args[info[#info-1]].args.color.disabled = true
        options.args[info[#info-1]].args.npccolor.hidden = false
        options.args[info[#info-1]].args.classcolor.disabled = true
    else 
        options.args[info[#info-1]].args.color.disabled = false
        options.args[info[#info-1]].args.npccolor.hidden = true
        options.args[info[#info-1]].args.classcolor.disabled = false
    end
    return self.db.profile[info[#info-1]].targetsclasscolor
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
        HealthBarColor:TargetEvent()
        if UnitIsPlayer("target") then
        local _, englishClass = UnitClass("target");
        local r, g, b = GetClassColor(englishClass)
        TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
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
    TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
    TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Target.color.r, self.db.profile.Target.color.g, self.db.profile.Target.color.b)
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
        TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
        TargetFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfTarget.npccolor.r, self.db.profile.TargetOfTarget.npccolor.g, self.db.profile.TargetOfTarget.npccolor.b)
        end
    elseif self.db.profile.TargetOfTarget.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
        TargetFrameToT.HealthBar:SetStatusBarColor(r, g, b)
    else
        TargetFrameToT.HealthBar:SetStatusBarDesaturated(true)
        TargetFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfTarget.color.r, self.db.profile.TargetOfTarget.color.g, self.db.profile.TargetOfTarget.color.b)
    end
end
--focus
function HealthBarColor:FocusColor()
    if self.db.profile.Focus.targetsclasscolor then
        HealthBarColor:FocusEvent()
        if UnitIsPlayer("focus") then
        local _, englishClass = UnitClass("focus");
        local r, g, b = GetClassColor(englishClass)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
        else
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Focus.npccolor.r, self.db.profile.Focus.npccolor.g, self.db.profile.Focus.npccolor.b)
        end
    elseif self.db.profile.Focus.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
        FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(r, g, b)
    else
    FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarDesaturated(true)
    FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar:SetStatusBarColor(self.db.profile.Focus.color.r, self.db.profile.Focus.color.g, self.db.profile.Focus.color.b)
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
        FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
        FocusFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfFocus.npccolor.r, self.db.profile.TargetOfFocus.npccolor.g, self.db.profile.TargetOfFocus.npccolor.b)
        end
    elseif self.db.profile.Focus.classcolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
        FocusFrameToT.HealthBar:SetStatusBarColor(r, g, b)
    else
        FocusFrameToT.HealthBar:SetStatusBarDesaturated(true)
        FocusFrameToT.HealthBar:SetStatusBarColor(self.db.profile.TargetOfFocus.color.r, self.db.profile.TargetOfFocus.color.g, self.db.profile.TargetOfFocus.color.b)
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
function HealthBarColor:TargetEvent()
    HealthBarColor:RegisterEvent("PLAYER_TARGET_CHANGED","TargetColor")
end
function HealthBarColor:FocusEvent()
    HealthBarColor:RegisterEvent("PLAYER_FOCUS_CHANGED","FocusColor")
end
function HealthBarColor:UnitTargetEvent()
    HealthBarColor:RegisterEvent("UNIT_TARGET","UnitTarget")
end
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