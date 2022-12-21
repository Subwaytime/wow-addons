local addonName = ...
local BetterFishing = {}
local internal = {
  -- Defaults
  _frame = CreateFrame("frame"),
  clear_override = false,
  DOUBLECLICK_MAX_SECONDS = 0.2,
  DOUBLECLICK_MIN_SECONDS = 0.04,
  previousClickTime = 0,
  isClassic = WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE,
  isClassicEra = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
}

local soundCache = {}
local CVarCacheSounds = {
  "Sound_MasterVolume",
  "Sound_SFXVolume",
  "Sound_EnableAmbience",
  "Sound_MusicVolume",
  "Sound_EnableAllSound",
  "Sound_EnablePetSounds",
  "Sound_EnableSoundWhenGameIsInBG",
  "Sound_EnableSFX",
}

BINDING_NAME_BETTERFISHINGKEY = "Cast and Interact"

local ClassicFishingIDs = {
  7620, 7731, 7732, 18248, 33095, 51294
}

function BetterFishing:GetFishingCastID()
  if internal.isClassic then
    for i=1, #ClassicFishingIDs do
      if IsSpellKnown(ClassicFishingIDs[i]) then
        return ClassicFishingIDs[i]
      end
    end
  end

  return 131476
end

function BetterFishing:GetFishingID()
  if internal.isClassic then
    for i=1, #ClassicFishingIDs do
      if IsSpellKnown(ClassicFishingIDs[i]) then
        return ClassicFishingIDs[i]
      end
    end
  end

  return 131474
end

function BetterFishing:GetFishingName()
  -- technically 7620 exists on every version but still add mainline fallback if for some reason not
  local localizedName = GetSpellInfo(7620)
  return localizedName or GetSpellInfo(131474)
end

local function IsTaintable()
  return (InCombatLockdown() or (UnitAffectingCombat("player") or UnitAffectingCombat("pet")))
end

function BetterFishing:GetSecureButton()
  if not self.secureButton then
    local button = CreateFrame("Button", addonName.."Button", nil, "SecureActionButtonTemplate")
    button:RegisterForClicks("AnyDown", "AnyUp")
    button:SetAttribute("type", "spell")
    button:SetAttribute("spell", self:GetFishingID())
    button:SetScript("PostClick", function(self, mouse_button, down)
      MouselookStart()
      if down then return end
      MouselookStop()
    end)
    SecureHandlerWrapScript(button, "PostClick", button,  string.format([[
      local isClassic = %s
      if isClassic == true then
        self:ClearBindings()
      else
        if not down then
          self:ClearBindings()
        end
      end
    ]], tostring(internal.isClassic)))

    self.secureButton = button
  end
  return self.secureButton
end

function BetterFishing_Run()
  if internal.isClassicEra then return end
  if IsTaintable() or IsFlying() or GetNumLootItems() ~= 0 or (UnitChannelInfo("player") ~= nil) then return end
  local key1, key2 = GetBindingKey("BETTERFISHINGKEY")
  local localizedName = BetterFishing:GetFishingName()
  if key1 then
    SetOverrideBindingSpell(BetterFishing:GetSecureButton(), 1, key1, localizedName)
  end
  if key2 then
    SetOverrideBindingSpell(BetterFishing:GetSecureButton(), 2, key2, localizedName)
  end
end

WorldFrame:HookScript("OnMouseDown", function(_, button, down)
  if not BetterFishingDB.doubleClickEnabled then return end
  if button == "RightButton" and not IsTaintable() then
    if GetNumLootItems() == 0 then
      local doubleClickTime = GetTime() - internal.previousClickTime
      if (doubleClickTime < internal.DOUBLECLICK_MAX_SECONDS and doubleClickTime > internal.DOUBLECLICK_MIN_SECONDS) then
        if BetterFishing:AllowFishing() then
          SetOverrideBindingClick(BetterFishing:GetSecureButton(), true, "BUTTON2", addonName.."Button")
        end
        internal.previousClickTime = nil
      end
    end
    internal.previousClickTime = GetTime()
  end
end)

function BetterFishing:IsFishing()
  local spellID = select(8,UnitChannelInfo("player"))
  if spellID == self:GetFishingCastID() then
    return true
  end
  return false
end

function BetterFishing:AllowFishing()
  if not IsSpellKnown(self:GetFishingID())
  or IsPlayerMoving()
  or IsMounted()
  or IsFlying()
  or IsFalling()
  or IsStealthed()
  or IsSwimming()
  or IsSubmerged()
  or not HasFullControl()
  or UnitHasVehicleUI("player")
  or IsInInstance() and GetNumGroupMembers() > 1 then
    return false
  end

  local form = GetShapeshiftForm(true)
  if form and form > 0 then
    return false
  end

  if (UnitChannelInfo("player") ~= nil) then
    return false
  end

  return true
end

local cachedSoftTargetInteract = GetCVar("SoftTargetInteract");
local cachedSoftTargetInteractArc = GetCVar("SoftTargetInteractArc");
local cachedSoftTargetInteractRange = GetCVar("SoftTargetInteractRange");
local cachedSoftTargetIconGameObject = GetCVar("SoftTargetIconGameObject");
local cachedSoftTargetIconInteract= GetCVar("SoftTargetIconInteract");

function BetterFishing:ResetCVars()
  BetterFishing:EnhanceSounds()
  SetCVar("SoftTargetInteract", cachedSoftTargetInteract);
  SetCVar("SoftTargetInteractArc", cachedSoftTargetInteractArc);
  SetCVar("SoftTargetInteractRange", cachedSoftTargetInteractRange);
  SetCVar("SoftTargetIconInteract", cachedSoftTargetIconInteract);
  SetCVar("SoftTargetIconGameObject", cachedSoftTargetIconGameObject);
end

function BetterFishing:SetCVars()
  BetterFishing:EnhanceSounds(true)
  cachedSoftTargetInteract = GetCVar("SoftTargetInteract");
  cachedSoftTargetInteractArc = GetCVar("SoftTargetInteractArc");
  cachedSoftTargetInteractRange = GetCVar("SoftTargetInteractRange");
  cachedSoftTargetIconGameObject = GetCVar("SoftTargetIconGameObject");
  cachedSoftTargetIconInteract = GetCVar("SoftTargetIconInteract");
  SetCVar("SoftTargetInteract", 3);
  SetCVar("SoftTargetInteractArc", 2);
  SetCVar("SoftTargetInteractRange", 15);
  SetCVar("SoftTargetIconGameObject", BetterFishingDB.objectIconDisabled and 0 or 1);
  SetCVar("SoftTargetIconInteract", BetterFishingDB.objectIconDisabled and 0 or 1);
end

function BetterFishing:OnEvent(event, ...)
  if event == "ADDON_LOADED" and addonName == ... then
    BetterFishingDB = BetterFishingDB or {};
    BetterFishing:CreateSettings()
  elseif event == "PLAYER_REGEN_ENABLED" then
    if internal.clear_override then
      ClearOverrideBindings(BetterFishing:GetSecureButton())
      internal.clear_override = false
    end
  elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
    local unit,_,spellID = ...
    if unit == "player" and spellID == self:GetFishingCastID() then
      BetterFishing:SetCVars()
      if IsTaintable() then return end
      local key1, key2 = GetBindingKey("BETTERFISHINGKEY")
      if key1 then
        SetOverrideBinding(BetterFishing:GetSecureButton(), true, key1, "INTERACTTARGET")
      end
      if key2 then
        SetOverrideBinding(BetterFishing:GetSecureButton(), true, key2, "INTERACTTARGET")
      end
    end
  elseif event == "UNIT_SPELLCAST_CHANNEL_STOP" then
    local unit,_,spellID = ...
    if unit == "player" and spellID == self:GetFishingCastID() then
      BetterFishing:ResetCVars()
      if not IsTaintable() then
        ClearOverrideBindings(BetterFishing:GetSecureButton());
      else
        internal.clear_override = true;
      end
    end
  elseif event == "PLAYER_LOGOUT" then
    BetterFishing:ResetCVars()
  elseif event == "CVAR_UPDATE" then
    if self:IsFishing() then return end
    for i = 1, #CVarCacheSounds do
      if CVarCacheSounds[i] == ... then
        soundCache[CVarCacheSounds[i]] = GetCVar(...);
      end
    end
  end
end

internal._frame:SetScript("OnEvent", function(self, ...) BetterFishing:OnEvent(...) end)
FrameUtil.RegisterFrameForEvents(internal._frame, {
  "ADDON_LOADED",
  "PLAYER_REGEN_ENABLED",
  "UNIT_SPELLCAST_CHANNEL_START",
  "UNIT_SPELLCAST_CHANNEL_STOP",
  "CVAR_UPDATE",
  "PLAYER_LOGOUT"
})

function BetterFishing:EnhanceSounds(enable)
  if not BetterFishingDB.enhanceSounds then return end

  if not enable then
    for i = 1, #CVarCacheSounds do
      if soundCache[CVarCacheSounds[i]] then
        SetCVar(CVarCacheSounds[i], soundCache[CVarCacheSounds[i]])
      end
    end
  else
    for i = 1, #CVarCacheSounds do
      soundCache[CVarCacheSounds[i]] = GetCVar(CVarCacheSounds[i])
      SetCVar(CVarCacheSounds[i], 0)
    end
    SetCVar("Sound_EnableAmbience", 0)
    SetCVar("Sound_MusicVolume", 0)
    SetCVar("Sound_EnablePetSounds", 0)

    SetCVar("Sound_EnableSFX", 1)
    SetCVar("Sound_EnableSoundWhenGameIsInBG", 1)
    SetCVar("Sound_EnableAllSound", 1)
    BetterFishingDB.enhanceSoundsScale = BetterFishingDB.enhanceSoundsScale or 1
    SetCVar("Sound_SFXVolume", BetterFishingDB.enhanceSoundsScale)
    SetCVar("Sound_MasterVolume", BetterFishingDB.enhanceSoundsScale)
  end
end

function BetterFishing:CreateSettings()
  local optionsFrame
  if internal.isClassic then
    optionsFrame = CreateFrame("Frame", addonName.."_OptionsFrame", InterfaceOptionsFramePanelContainer)
    optionsFrame.name = "Better Fishing"
  else
    optionsFrame = CreateFrame("Frame")
    category, layout = Settings.RegisterCanvasLayoutCategory(optionsFrame, "Better Fishing |Tinterface/cursor/crosshair/fishing:18:18:0:0|t");
    category.ID = "Better Fishing";
    Settings.RegisterAddOnCategory(category);
  end

  local header = optionsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightHuge")
  header:SetPoint("TOPLEFT", 7, -22)
  header:SetText("Better Fishing")

  local function makeCheckButton(text)
    local checkBox
    if internal.isClassic then
      checkBox = CreateFrame("CheckButton", addonName.."CheckBox", optionsFrame, "UICheckButtonTemplate")
    else
      checkBox = CreateFrame("CheckButton", addonName.."CheckBox", optionsFrame, "SettingsCheckBoxTemplate")
    end
    checkBox.text = checkBox:CreateFontString(addonName.."CheckBoxText", "ARTWORK", "GameFontNormal")
    checkBox.text:SetText(text)
    checkBox.text:SetPoint("LEFT", checkBox, "RIGHT", 4, 0)

    return checkBox
  end
  local info = {
    "enhanceSounds#Enhance Sounds",
    "doubleClickEnabled#Double Click to cast",
    "objectIconDisabled#Disable icon above bobber (visibility varies for nameplate addons)"
  }
  local prevCheckButton
  for i, keyInfo in ipairs(info) do
    local option, text = strsplit("#", keyInfo)
    if not (internal.isClassic and option == "objectIconDisabled") then
      local checkButton = makeCheckButton(text)
      if not prevCheckButton then
        checkButton:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -16)
      else
        checkButton:SetPoint("TOPLEFT", prevCheckButton, "BOTTOMLEFT", 0, 0)
      end
      checkButton:SetChecked(BetterFishingDB[option])
      checkButton:SetScript("OnClick", function()
        BetterFishingDB[option] = not BetterFishingDB[option]
        checkButton:SetChecked(BetterFishingDB[option])
      end)

      prevCheckButton = checkButton
    end
  end
  if internal.isClassic then
    local slider = CreateFrame("Slider", addonName.."_Slider", optionsFrame, "OptionsSliderTemplate")
    slider:SetWidth(120)
    slider:SetHeight(16)
    slider:SetPoint("LEFT", addonName.."CheckBox", "RIGHT", 120, 0)
    slider:SetMinMaxValues(0, 100)
    slider:SetValueStep(5)
    slider:SetOrientation('HORIZONTAL')
    slider:SetObeyStepOnDrag(true)
    BetterFishing_SliderLow:SetText('0')
    BetterFishing_SliderHigh:SetText('100')

    slider:SetScript("OnValueChanged", function(self, value)
      BetterFishingDB.enhanceSoundsScale = value*0.01
      BetterFishing_SliderText:SetText(FormatPercentage(value*0.01))
    end)

    slider:Show()
    BetterFishingDB.enhanceSoundsScale = BetterFishingDB.enhanceSoundsScale or 1
    optionsFrame:SetScript('OnShow', function(self)
      slider:SetValue(BetterFishingDB.enhanceSoundsScale*100 or 50)
    end)
    InterfaceOptions_AddCategory(optionsFrame)
  else
    local function FormatPercentageRound(value)
      return FormatPercentage(value, true);
    end

    local right = MinimalSliderWithSteppersMixin.Label.Right
    local slider = CreateFrame("Slider", addonName.."Slider", optionsFrame, "MinimalSliderWithSteppersTemplate")
    local formatters = {}
    formatters[right] = CreateMinimalSliderFormatter(right, FormatPercentageRound);
    slider:Init(BetterFishingDB.enhanceSoundsScale or 1, 0, 1, 20, formatters)
    slider:SetPoint("LEFT", addonName.."CheckBoxText", "RIGHT", 10, 0)
    local function OnValueChanged(_, value)
      BetterFishingDB.enhanceSoundsScale = value
    end
    slider:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, OnValueChanged)
  end
end

SLASH_BETTERFISHING1, SLASH_BETTERFISHING2 = '/bf', '/betterfishing'
SlashCmdList.BETTERFISHING = function(msg)
  if internal.isClassic then
    InterfaceOptionsFrame_OpenToCategory("Better Fishing")
    InterfaceOptionsFrame_OpenToCategory("Better Fishing")
  else
    Settings.OpenToCategory("Better Fishing")
  end
end