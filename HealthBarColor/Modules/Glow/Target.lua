--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = static color
    selected 3 = hide
--]]
local Glow_Target = HealthBarColor:NewModule("Glow_Target")
local Target = HealthBarColor:GetUnit("Target")
local hooked = nil
local hook_callback = nil

function Glow_Target:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Glow then return end
    if hooked and not HealthBarColor.db.profile.Modules.Glow.target == 3 then
        Target.Glow:Show()
    end
    local OnTargetChanged
    if HealthBarColor.db.profile.Modules.Glow.target == 1 then
        OnTargetChanged = function()
            if Target.isPlayer then
                Target.Glow:SetVertexColor(Target.ClassColor:GetRGB())
            else
                Target.Glow:SetVertexColor(Target.ReactionColor:GetRGB())
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Glow_Target",OnTargetChanged)
    elseif HealthBarColor.db.profile.Modules.Glow.target == 2 then
        local color = HealthBarColor.db.profile.Modules.Glow.target_static_color 
        OnTargetChanged = function()
            Target.Glow:SetVertexColor(color.r,color.g,color.b)
        end
        HealthBarColor:RegisterOnTargetChanged("Glow_Target",OnTargetChanged)
    elseif HealthBarColor.db.profile.Modules.Glow.target == 3 then
        hook_callback = function(self)
            self:Hide()
        end
        if not hooked then
            Target.Glow:HookScript("OnShow",function(self) hook_callback(self) end)
            hooked = true
        end
        Target.Glow:Hide()
    end
end

function Glow_Target:OnDisable()
    if hooked then
        hook_callback = function() end
        Target.Glow:Show()
    end
end

