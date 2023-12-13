--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = players class color
    selected 3 = static color
    selected 4 = reaction color
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local HealthBar_Target = HealthBarColor:NewModule("HealthBar_Target")

function HealthBar_Target:OnEnable()
    local Target = HealthBarColor:GetUnit("Target")
    local color =  HealthBarColor.db.profile.HealthBars.Target.color
    local selected = HealthBarColor.db.profile.HealthBars.Target.selected
    local reactionColored = HealthBarColor.db.profile.HealthBars.Target.reaction
    local OnTargetChanged
    if selected == 1 then
        if reactionColored then
            OnTargetChanged = function()
                if Target.isPlayer then
                    Target:SetStatusBarClassColored()
                else
                    Target:SetStatusBarReactionColored()
                end
            end
        else
            OnTargetChanged = function()
                if Target.isPlayer then
                    Target:SetStatusBarClassColored()
                else
                    Target.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
                end
            end
        end
        HealthBarColor:RegisterOnTargetChanged("HealthBar_Target", OnTargetChanged)
    elseif selected == 2 then
        local Player = HealthBarColor:GetUnit("Player")
        Target.HealthBar:SetStatusBarColor(Player.ClassColor:GetRGB())
    elseif selected == 3 then
        Target.HealthBar:SetStatusBarColor(color.r,color.g,color.b)
    else 
        OnTargetChanged = function()
            Target:SetStatusBarReactionColored()
        end
        HealthBarColor:RegisterOnTargetChanged("HealthBar_Target", OnTargetChanged)
    end
end

