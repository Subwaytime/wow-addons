--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local addon = addonTable.HealthBarColor

local queue = {}
function addon:DelayUntilAfterCombat(callback)
    queue[#queue+1] = callback
end

function addon:AfterCombat()
    local k = #queue
    if k == 0 then
        return
    end
    for i=1, k do
        queue[i]()
    end
    queue = {}
end

addon:RegisterEvent("PLAYER_REGEN_ENABLED", "AfterCombat")
