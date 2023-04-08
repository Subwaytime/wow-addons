--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
--]]
local Font_Focus = HealthBarColor:NewModule("Font_Focus")
local Focus          = HealthBarColor:GetUnit("Focus")

function Font_Focus:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Fonts then return end
    local color           = HealthBarColor.db.profile.Fonts.Focus.color
    local colorbyreaction = HealthBarColor.db.profile.Fonts.Focus.reaction

    local function OnFocusChanged()
        if Focus.isPlayer then
            self:SetColor(Focus.ClassColor:GetRGB())
        else
            self:SetColor(color.r,color.g,color.b)
        end
    end

    local function OnFocusChangedReaction()
        if Focus.isPlayer then
            self:SetColor(Focus.ClassColor:GetRGB())
        else
            self:SetColor(Focus.ReactionColor:GetRGB())
        end
    end

    if HealthBarColor.db.profile.Fonts.Focus.selected == 1 then
        if colorbyreaction then
            HealthBarColor:RegisterOnFocusChanged("Font_Focus_Reaction",OnFocusChangedReaction)
        else
            HealthBarColor:RegisterOnFocusChanged("Font_Focus",OnFocusChanged)
        end
    elseif HealthBarColor.db.profile.Fonts.Focus.selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        self:SetColor(Player.ClassColor:GetRGB())
    else
        self:SetColor(color.r,color.g,color.b)
    end
end

function Font_Focus:OnDisable()
    for _,v in pairs ({
        Focus.LeftText,
        Focus.RightText,
        Focus.MiddleText
    })
    do
        v:SetTextColor(1,1,1)
    end
    Focus.Name:SetTextColor(1,0.8196,0)
end

function Font_Focus:SetColor(r,g,b)
    for _,text in pairs ({
        Focus.LeftText,
        Focus.RightText,
        Focus.MiddleText,
        Focus.Name
    })
    do
        text:SetTextColor(r,g,b)
    end
end