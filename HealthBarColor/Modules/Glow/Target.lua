--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = static color
    selected 3 = hide
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local Glow_Target = HealthBarColor:NewModule("Glow_Target")
local Target = HealthBarColor:GetUnit("Target")
local hooked = {}
local OnShow_Callback = nil
local OnTargetChanged = nil

function Glow_Target:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Glow then return end
    local selected = HealthBarColor.db.profile.Modules.Glow.target
    if selected == 1 or selected == 2 then
        if selected == 1 then
            OnTargetChanged = function()
                if Target.isPlayer then
                    Target.Glow:SetVertexColor(Target.ClassColor:GetRGB())
                else
                    Target.Glow:SetVertexColor(Target.ReactionColor:GetRGB())
                end
            end
        else
            local color = HealthBarColor.db.profile.Modules.Glow.target_static_color
            OnTargetChanged = function()
                Target.Glow:SetVertexColor(color.r,color.g,color.b)
            end
        end
        HealthBarColor:RegisterOnTargetChanged("Glow_Target",OnTargetChanged)
        if not hooked["CheckFaction"] then
            hooksecurefunc(TargetFrame, "CheckFaction", function()
                OnTargetChanged()
            end)
            hooked["CheckFaction"] = true
        end
        Target.Glow:Show()
    else
        OnShow_Callback = function(self)
            self:Hide()
        end
        if not hooked["OnShow"] then
            Target.Glow:HookScript("OnShow",function(self) OnShow_Callback(self) end)
            hooked["OnShow"] = true
        end
        Target.Glow:Hide()
    end
end

function Glow_Target:OnDisable()
    local function doNothing() end
    OnShow_Callback = doNothing
    OnTargetChanged = doNothing
    Target.Glow:Show()
end

