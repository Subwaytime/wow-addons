
hooksecurefunc(TargetFrame, "CheckClassification", function (self)
    local classification = UnitClassification(self.unit);

    local bossPortraitFrameTexture = self.TargetFrameContainer.BossPortraitFrameTexture;
    if (classification == "rareelite") then
        bossPortraitFrameTexture:SetTexture([[Interface\AddOns\RareDragon\UI-HUD-UnitFrame-Target-PortraitOn-SilverDragon]]);
        bossPortraitFrameTexture:SetTexCoord(0.00390625, 0.7734375, 0.001953125, 0.31640625)
        bossPortraitFrameTexture:SetSize(99, 81);
        bossPortraitFrameTexture:SetPoint("TOPRIGHT", 8, -7);
        bossPortraitFrameTexture:Show();
    elseif (classification == "rare") then
        bossPortraitFrameTexture:SetTexture([[Interface\AddOns\RareDragon\UI-HUD-UnitFrame-Target-PortraitOn-SilverDragon]]);
        bossPortraitFrameTexture:SetTexCoord(0.00390625, 0.6328125, 0.501953125, 0.81640625)
        bossPortraitFrameTexture:SetSize(81, 81);
        bossPortraitFrameTexture:SetPoint("TOPRIGHT", -10, -7);
        bossPortraitFrameTexture:Show();
    else
        bossPortraitFrameTexture:SetTexCoord(0, 1, 0, 1) -- Reset coords so no more squished dragons
    end

    self.TargetFrameContent.TargetFrameContentContextual.BossIcon:Hide();
end);

