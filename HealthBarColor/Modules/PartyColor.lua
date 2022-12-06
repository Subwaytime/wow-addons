--[[
Created by Slothpala 
--]]
local PartyColor = HealthBarColor:NewModule("PartyColor")
local playersclasscolor
local partymembersclasscolor
local customColor = {r=0,g=0,b=0}

function PartyColor:OnEnable()
    partymembersclasscolor = HealthBarColor.db.profile.PartyColor.targetsclasscolor
    playersclasscolor = HealthBarColor.db.profile.PartyColor.classcolor
    customColor.r = HealthBarColor.db.profile.PartyColor.color.r
    customColor.g = HealthBarColor.db.profile.PartyColor.color.g
    customColor.b = HealthBarColor.db.profile.PartyColor.color.b
    if not PartyColor:IsHooked("UnitFramePortrait_Update") then
        PartyColor:SecureHook("UnitFramePortrait_Update", function(self) 
            if self.unit:match("party") then
                PartyColor:HealthBarColor(self.unit, self.healthbar)
            end
        end)
    end
end

function PartyColor:OnDisable()
    if PartyColor:IsHooked("UnitFramePortrait_Update") then
        PartyColor:Unhook("UnitFramePortrait_Update")
    end
end

function PartyColor:HealthBarColor(unit, healthbar)
    if partymembersclasscolor then
        if UnitIsPlayer(unit) then
            local _, englishClass = UnitClass(unit);
            local r, g, b = GetClassColor(englishClass)
            healthbar:SetStatusBarDesaturated(true)
            healthbar:SetStatusBarColor(r, g, b)
        end
    elseif playersclasscolor then
        local _, englishClass = UnitClass("player");
        local r, g, b = GetClassColor(englishClass)
        healthbar:SetStatusBarDesaturated(true)
        healthbar:SetStatusBarColor(r, g, b)
    else
        healthbar:SetStatusBarDesaturated(true)
        healthbar:SetStatusBarColor(customColor.r,customColor.g,customColor.b)
    end
end