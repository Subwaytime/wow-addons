--[[
    Created by Slothpala 
--]]
local _, addonTable = ...
local HealthBarColor = addonTable.HealthBarColor
local DarkFrames = HealthBarColor:NewModule("DarkFrames")
local color = {r=0.2,g=0.2,b=0.2,a=1}

local function recolorFrames(r,g,b,a,desaturation)
    local frameTextures = {
        PlayerFrame.PlayerFrameContainer.FrameTexture,
        PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture,
        PlayerFrame.PlayerFrameContainer.VehicleFrameTexture,
        PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon,
        TargetFrame.TargetFrameContainer.FrameTexture,
        TargetFrameToT.FrameTexture,
        FocusFrame.TargetFrameContainer.FrameTexture,
        FocusFrameToT.FrameTexture,
        Boss1TargetFrame.TargetFrameContainer.FrameTexture,
        Boss2TargetFrame.TargetFrameContainer.FrameTexture,
        Boss3TargetFrame.TargetFrameContainer.FrameTexture,
        Boss4TargetFrame.TargetFrameContainer.FrameTexture,
        Boss5TargetFrame.TargetFrameContainer.FrameTexture,
        PartyFrame.MemberFrame1.Texture,
        PartyFrame.MemberFrame2.Texture,
        PartyFrame.MemberFrame3.Texture,
        PartyFrame.MemberFrame4.Texture,
        PetFrameTexture
    }
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
