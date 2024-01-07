--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor

local PartyColor = HealthBarColor:NewModule("PartyColor")
--hook stuff
local hooked    = {}
local Callbacks = {}
local function donothing() end
--
local Player = HealthBarColor:GetUnit("Player")
local ClassColor 

function PartyColor:OnEnable()
    ClassColor = HealthBarColor:GetClassColors()
    Callbacks.Update_HealthBarColor = function(self)    
    if not ShouldShowPartyFrames() then return end
        if UnitExists(self.unit) then
            self.HealthBar:SetStatusBarDesaturated(true)
            local class = select(2,UnitClass(self.unit))
            if class then
                self.HealthBar:SetStatusBarColor(ClassColor[class]:GetRGB())
            end
        end
    end 
    for i=1,4 do
        for _, PartyMemberFrame in pairs ({_G.PartyFrame["MemberFrame"..i]}) do
            if not hooked["MemberFrame"..i] then
                hooksecurefunc(PartyMemberFrame,"UpdateMember",function(self) Callbacks.Update_HealthBarColor(self) end)
                hooked["MemberFrame"..i] = true
                hooked["UpdateMember"] = true
            end
        end
    end
    --[[
        later had no time to test it properly
    for i=1,4 do
        for _, PartyMemberFrame in pairs ({_G.PartyFrame["MemberFrame"..i]}) do
            PartyMemberFrame:UpdateMember()
        end
    end
    ]]--
end

function PartyColor:OnDisable()
    if hooked["UpdateMember"] and not HealthBarColor.db.profile.Settings.Modules.PartyColor then
        --unhook workaround
        Callbacks.Update_HealthBarColor = donothing
    end
end

