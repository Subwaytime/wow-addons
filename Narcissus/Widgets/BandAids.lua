-- Various game bug fixes and QoL improvements

local _, addon = ...


do
    --10.1.5.50199
    --Fix: Soridormi Reputation/Friendship Bar (uiMapID: 2199, 2025)
    --Display friendship bar when interacting with Soridormi in the event area

    local f = CreateFrame("Frame");
    local UnitName = UnitName;
    local SORIDORMI;

    f:SetScript("OnEvent", function(self, event, ...)
        if UnitName("npc") == SORIDORMI then    --or use
            if GossipFrame and GossipFrame:IsShown() then
                --Auto Report-in
                local options = C_GossipInfo.GetOptions();
                if options and options[1] and options[1].gossipOptionID == 109275 then
                    C_GossipInfo.SelectOption(109275);  --Maybe we don't need to check if the option is availible at all
                    return
                end

                GossipFrame.FriendshipStatusBar:Update(2553);
            end
        end
    end);

    local module = addon.CreateZoneTriggeredModule();
    module:SetValidZones(2025, 2199);

    local function OnEnabledCallback()
        if not SORIDORMI then
            SORIDORMI = NarciAPI.GetCreatureName(204450) or "Soridormi";
        end
        f:RegisterEvent("GOSSIP_SHOW");
    end

    local function OnDisabledCallback()
        f:UnregisterEvent("GOSSIP_SHOW");
    end

    module:SetOnEnabledCallback(OnEnabledCallback);
    module:SetOnDisabledCallback(OnDisabledCallback);

    addon.AddLoadingCompleteCallback(
        function ()
            NarciAPI.GetCreatureName(204450);
        end
    );
end


--[[
do
    local WidgetContainer;

    local function GetTimeRiftBeginCountdown()
        local widgetID = 4924;
        local info = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(widgetID);
        if info and info.hasTimer and info.text and info.text ~= "" then
            return NarciAPI.GetTimeFromAbbreviatedDurationText(info.text, true);
        else
            return 0
        end
    end

    local function FormatNumber(n)
        if n == 0 then
            n = "00";
        elseif n < 10 then
            n = "0"..n;
        end

        return n
    end

    local function SetupWidget()
        if not WidgetContainer then
            WidgetContainer = CreateFrame("Frame", nil, UIParent);
            WidgetContainer:SetSize(12, 12);
            WidgetContainer:SetPoint("TOP", UIParent, "TOP", 0, -12);
            WidgetContainer.Text = WidgetContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal");
            WidgetContainer.Text:SetJustifyH("CENTER");
            WidgetContainer.Text:SetPoint("CENTER", WidgetContainer, "CENTER", 0, 0);
            WidgetContainer.Text:SetTextColor(1, 1, 1, 0.5);
            WidgetContainer.t = 0;
            WidgetContainer.syncCounter = 0;
            WidgetContainer.secondsLeft = 0;
            WidgetContainer:SetScript("OnUpdate", function(self, elapsed)
                self.t = self.t + elapsed;
                if self.t >= 1 then
                    self.t = self.t - 1;
                else
                    return
                end

                self.syncCounter = self.syncCounter + 1;

                if self.syncCounter > 10 then
                    self.syncCounter = 0;
                    self.secondsLeft = GetTimeRiftBeginCountdown();
                else
                    self.secondsLeft = self.secondsLeft - 1;
                end

                if self.secondsLeft > 0 then
                    local minutes = math.floor(self.secondsLeft / 60);
                    local seconds = self.secondsLeft - 60*minutes;
    
                    minutes = FormatNumber(minutes);
                    seconds = FormatNumber(seconds);
    
                    self.Text:SetText(minutes..":"..seconds);
                else
                    self:Hide();
                end
            end);
        end
    end

    function ShowTimeRiftCountdown()
        SetupWidget();
        WidgetContainer.Text:SetText("");
        WidgetContainer.t = 1;
        local seconds = GetTimeRiftBeginCountdown();
        WidgetContainer.secondsLeft = seconds + 1;
        WidgetContainer:Show();
    end
end
--]]