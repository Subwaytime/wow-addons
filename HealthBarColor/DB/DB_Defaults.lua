--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local defaults = {
    profile = {
        HealthBars = {
            Player = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
            },
            Target = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
                reaction  = true,
            },
            Focus = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
                reaction  = true,
            },
            ToT = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
                reaction  = true,
            },
            ToF = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
                reaction  = true,
            },
            Pet = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
            },
            Boss = {
                selected  = 1,
                color     = {r=0,g=1,b=0},
            },
        },
        Fonts = {
            General = {
                name              = "TeX Gyre Adventor Bold",
                name_outline      = 4,
                healthbar         = "Friz Quadrata TT",
                healthbar_outline = 1,
                powerbar          = "Friz Quadrata TT",
                powerbar_outline  = 1,
            },
            Player = {
                name_choice      = 1,
                name_color       = {r=0,g=1,b=0},
                healthbar_choice = 1,
                healthbar_color  = {r=0,g=1,b=0},
                powerbar_choice  = 2,
                powerbar_color   = {r=1,g=1,b=1}, 
            },
            Target = {
                name_choice      = 2,
                name_color       = {r=0,g=1,b=0},
                healthbar_choice = 2,
                healthbar_color  = {r=0,g=1,b=0},
                powerbar_choice  = 4,
                powerbar_color   = {r=1,g=1,b=1}, 
            },
            Focus = {
                name_choice      = 2,
                name_color       = {r=0,g=1,b=0},
                healthbar_choice = 2,
                healthbar_color  = {r=0,g=1,b=0},
                powerbar_choice  = 4,
                powerbar_color   = {r=1,g=1,b=1},  
            },
            Pet = {
                name_choice      = 1,
                name_color       = {r=0,g=1,b=0},
                healthbar_choice = 1,
                healthbar_color  = {r=0,g=1,b=0},
                powerbar_choice  = 2,
                powerbar_color   = {r=1,g=1,b=1},
            },
            Boss = {
                selected  = 1,
                color     = {r=1,g=0,b=0},
            },
        },
        Settings = {
            Modules = {
                Fonts              = false,
                Textures           = false,
                BackgroundTextures = false,
                DebuffColor        = false,
                PartyColor         = false,
                Glow               = false,
                HideClassPowerBar  = false,
                BiggerHealthBar    = false,
                Overabsorb         = false,
                ['*']              = true,
            },
            ClassColorOverwrites = {
                enabled       = false,
                deathknight   = {r=0.77,g=0.12,b=0.23},
                demonhunter   = {r=0.64,g=0.19,b=0.79},
                druid         = {r=1.00,g=0.49,b=0.04},
                evoker        = {r=0.20,g=0.58,b=0.50},
                hunter        = {r=0.67,g=0.83,b=0.45},
                mage          = {r=0.25,g=0.78,b=0.923},
                monk          = {r=0.00,g=1.00,b=0.60},
                paladin       = {r=0.96,g=0.55,b=0.73},
                priest        = {r=1.00,g=1.00,b=1.00},
                rogue         = {r=1.00,g=0.96,b=0.41},
                shaman        = {r=0.00,g=0.44,b=0.87},
                warlock       = {r=0.53,g=0.53,b=0.9},
                warrior       = {r=0.78,g=0.61,b=0.43},
            },
            ReactionColorOverwrites = {
                enabled  = false,
                hostile  = {r=1,g=0,b=0},
                neutral  = {r=1,g=1,b=0},
                friendly = {r=0,g=1,b=0},
            }
        },
        Modules = {
            Textures = {
                healthbar = "Solid",
                powerbar  = "Solid",
                excludep  = false,
            },
            BackgroundTextures = {
                texture = "Solid",
                color   = {r=0,g=0,b=0},
            },
            DebuffColor = {
                Curse       = {r=0.6,g=0.0,b=1.0},
                Disease     = {r=0.6,g=0.4,b=0.0},
                Magic       = {r=0.2,g=0.6,b=1.0},
                Poison      = {r=0.0,g=0.6,b=0.0},
                ignoreMagic = false,
            },
            Glow = {
                player = 1,
                player_static_color = {r=0,g=1,b=0},
                target = 1,
                target_static_color = {r=0,g=1,b=0},
                focus  = 1,
                focus_static_color = {r=0,g=1,b=0},
            },
        },
    },
}

function HealthBarColor:LoadDataBase()
    self.db = LibStub("AceDB-3.0"):New("HealthBarColorDB", defaults, true) 
    --db callbacks
    self.db.RegisterCallback(self, "OnProfileChanged", "ReloadConfig")
    self.db.RegisterCallback(self, "OnProfileCopied", "ReloadConfig")
    self.db.RegisterCallback(self, "OnProfileReset", "ReloadConfig")
end