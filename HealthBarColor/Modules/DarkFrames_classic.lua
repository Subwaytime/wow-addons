--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local DarkFrames = HealthBarColor:NewModule("DarkFrames")
local color = {r=0.33,g=0.33,b=0.33,a=1}

local function recolorFrames(r,g,b,a,desaturation)
    local frameTextures = {
        PlayerFrameTexture,
        TargetFrameTextureFrameTexture,
        TargetFrameToTTextureFrameTexture,
        PetFrameTexture,
    }
    if not HealthBarColor.isClassic then
        table.insert(frameTextures,#frameTextures+1,FocusFrameTextureFrameTexture)
        table.insert(frameTextures,#frameTextures+1,FocusFrameToTTextureFrameTexture)
    end
    for _,frameTexture in pairs (frameTextures) do
        frameTexture:SetDesaturation(desaturation)
        frameTexture:SetVertexColor(r,g,b,a)
    end
end

function DarkFrames:OnEnable()
    recolorFrames(color.r,color.g,color.b,color.a,1)
end

function DarkFrames:OnDisable()
    recolorFrames(1,1,1,1,0)
end
