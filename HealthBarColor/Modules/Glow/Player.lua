--[[
    Created by Slothpala 
    selected 1 = units class color
    selected 2 = static color
    selected 3 = hide / don't create
    PlayerFrame doesn't actually have a glow texture so copy it from target/focus
--]]
local Glow_Player = HealthBarColor:NewModule("Glow_Player")
local Player = HealthBarColor:GetUnit("Player")
local hooked = {}
local hook_callback = {}


local toPlayerArt = function()
    Player.Glow:Show()
end

local toVehicelArt = function()
    Player.Glow:Hide()
end

function Glow_Player:OnEnable()
    if not HealthBarColor.db.profile.Settings.Modules.Glow then return end
    if HealthBarColor.db.profile.Modules.Glow.player == 3 then return end
    if not Player.Glow then 
        local Target = HealthBarColor:GetUnit("Target") 
        local atlas = Target.Glow:GetAtlas() 
        local xOfs, yOfs = select(4,Target.Glow:GetPoint(1)) --topright
        local layer, sublayer = Target.Glow:GetDrawLayer()
        Player.Glow = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain:CreateTexture(nil, layer, nil, sublayer)
        Player.Glow:SetAtlas(atlas, true) 
        Player.Glow:SetPoint("TOPLEFT", -xOfs, yOfs) 
        Player.Glow:SetTexCoord(1, 0, 0, 1) --mirror horizontal
    end
    if HealthBarColor.db.profile.Modules.Glow.player == 1 then
        Player.Glow:SetVertexColor(Player.ClassColor:GetRGB())
    end
    if HealthBarColor.db.profile.Modules.Glow.player == 2 then
        local color = HealthBarColor.db.profile.Modules.Glow.player_static_color 
        Player.Glow:SetVertexColor(color.r,color.g,color.b)
    end
    HealthBarColor:RegisterOnToPlayerArt(toPlayerArt)
    HealthBarColor:RegisterOnToVehicleArt(toVehicelArt)
    Player.Glow:Show()
end

function Glow_Player:OnDisable()
    if Player.Glow then
        Player.Glow:Hide()
    end
end
