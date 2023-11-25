--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = static color
    selected 3 = hide
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local Glow_Focus = HealthBarColor:NewModule("Glow_Focus")
local Focus = HealthBarColor:GetUnit("Focus")
local hooked = {}
local OnShow_Callback = nil
local OnFocusChanged = nil

function Glow_Focus:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Glow then return end
    local selected = HealthBarColor.db.profile.Modules.Glow.focus
    if selected == 1 or selected == 2 then
        if selected == 1 then
            OnFocusChanged = function()
                if Focus.isPlayer then
                    Focus.Glow:SetVertexColor(Focus.ClassColor:GetRGB())
                else
                    Focus.Glow:SetVertexColor(Focus.ReactionColor:GetRGB())
                end
            end
        else
            local color = HealthBarColor.db.profile.Modules.Glow.focus_static_color
            OnFocusChanged = function()
                Focus.Glow:SetVertexColor(color.r,color.g,color.b)
            end
        end
        HealthBarColor:RegisterOnFocusChanged("Glow_Focus",OnFocusChanged)
        if not hooked["CheckFaction"] then
            hooksecurefunc(FocusFrame, "CheckFaction", function()
                OnFocusChanged()
            end)
            hooked["CheckFaction"] = true
        end
        Focus.Glow:Show()
    else
        OnShow_Callback = function(self)
            self:Hide()
        end
        if not hooked["OnShow"] then
            Focus.Glow:HookScript("OnShow",function(self) OnShow_Callback(self) end)
            hooked["OnShow"] = true
        end
        Focus.Glow:Hide()
    end
end

function Glow_Focus:OnDisable()
    local function doNothing() end
    OnShow_Callback = doNothing
    OnFocusChanged = doNothing
    Focus.Glow:Show()
end

