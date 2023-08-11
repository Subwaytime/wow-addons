--[[
    Created by Slothpala 
--]]
local HideClassPowerBar = HealthBarColor:NewModule("HideClassPowerBar")
--hook stuff
local hooked   = {}
local callback = {}
local classbars = {
    ["ROGUE"]       = RogueComboPointBarFrame,
    ["DRUID"]       = DruidComboPointBarFrame,
    ["PALADIN"]     = PaladinPowerBarFrame,
    ["EVOKER"]      = EssencePlayerFrame,
    ["MONK"]        = MonkHarmonyBarFrame,
    ["DEATHKNIGHT"] = RuneFrame,
    ["MAGE"]        = MageArcaneChargesFrame,
    ["WARLOCK"]     = WarlockPowerFrame,
}
local Player = HealthBarColor:GetUnit("Player")

function HideClassPowerBar:OnEnable()
    local classbar = classbars[Player.Class]
    if not classbar then 
        return 
    end
    callback = function(classbar) 
        classbar:Hide() 
    end
    if not hooked[classbar] then
        classbar:HookScript("OnShow", function() callback(classbar) end)
        hooked[classbar] = true
    end
    classbar:Hide()
end

function HideClassPowerBar:OnDisable()
    if hooked[classbars[Player.Class]] then 
        callback = function() end  
        classbars[Player.Class]:Show()
    end
end

