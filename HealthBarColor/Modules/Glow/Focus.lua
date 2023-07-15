--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = static color
    selected 3 = hide
--]]
local Glow_Focus = HealthBarColor:NewModule("Glow_Focus")
local Focus = HealthBarColor:GetUnit("Focus")
local hooked = nil
local hook_callback = nil

function Glow_Focus:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Glow then return end
    if hooked and not HealthBarColor.db.profile.Modules.Glow.focus == 3 then
        Focus.Glow:Show()
    end
    local OnFocusChanged
    if HealthBarColor.db.profile.Modules.Glow.focus == 1 then
        OnFocusChanged = function()
            if Focus.isPlayer then
                Focus.Glow:SetVertexColor(Focus.ClassColor:GetRGB())
            else
                Focus.Glow:SetVertexColor(Focus.ReactionColor:GetRGB())
            end
        end
        HealthBarColor:RegisterOnFocusChanged("Glow_Focus",OnFocusChanged)
    elseif HealthBarColor.db.profile.Modules.Glow.focus == 2 then
        local color = HealthBarColor.db.profile.Modules.Glow.focus_static_color 
        OnFocusChanged = function()
            Focus.Glow:SetVertexColor(color.r,color.g,color.b)
        end
        HealthBarColor:RegisterOnFocusChanged("Glow_Focus",OnFocusChanged)
    elseif HealthBarColor.db.profile.Modules.Glow.focus == 3 then
        hook_callback = function(self)
            self:Hide()
        end
        if not hooked then
            Focus.Glow:HookScript("OnShow",function(self) hook_callback(self) end)
            hooked = true
        end
        Focus.Glow:Hide()
    end
end

function Glow_Focus:OnDisable()
    if hooked then
        hook_callback = function() end
        Focus.Glow:Show()
    end
end

