--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local HealthBar_Focus = HealthBarColor:NewModule("HealthBar_Focus")

function HealthBar_Focus:OnEnable()
    local Focus = HealthBarColor:GetUnit("Focus")
    local color =  HealthBarColor.db.profile.HealthBars.Focus.color
    local selected = HealthBarColor.db.profile.HealthBars.Focus.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.Focus.reaction
    local OnFocusChanged
    if selected == 1 then
        if reactionColored then
            OnFocusChanged = function()
                if Focus.isPlayer then
                    Focus:SetStatusBarClassColored()
                else
                    Focus:SetStatusBarReactionColored()
                end
            end
        else
            OnFocusChanged = function()
                if Focus.isPlayer then
                    Focus:SetStatusBarClassColored()
                else
                    Focus.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
        HealthBarColor:RegisterOnFocusChanged("HealthBar_Focus", OnFocusChanged)
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        Focus.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    elseif selected == 3 then
        Focus.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    else 
        OnFocusChanged = function()
            Focus:SetStatusBarReactionColored()
        end
        HealthBarColor:RegisterOnFocusChanged("HealthBar_Focus", OnFocusChanged)
    end
end

