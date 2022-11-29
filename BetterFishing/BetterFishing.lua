local addonName = ...
local BetterFishing = {}
local internal = {
  -- Defaults
  _frame = CreateFrame("frame"),
  override_binding = false,
  clear_override = false,
  fishingID = 131474,
  fishingCastingID = 131476,
  DOUBLECLICK_MAX_SECONDS = 0.2,
  DOUBLECLICK_MIN_SECONDS = 0.04,
  previousClickTime = 0,
  noFishingSkill = true,
  isFishing = false,
  blockCasting = false,
  isReady = false,
}

--BINDING_HEADER_BETTERFISHING = GetAddOnMetadata(addonName, "Title")
BINDING_NAME_BETTERFISHINGKEY = GetAddOnMetadata(addonName, "Title").."\nCast & Interact"

local function IsTaintable()
  return (internal.inCombat or InCombatLockdown() or (UnitAffectingCombat("player") or UnitAffectingCombat("pet")))
end

function BetterFishing:GetSecureButton()
  if not self.secureButton then
    local button = CreateFrame("Button", addonName.."Button", nil, "SecureActionButtonTemplate")
    button:RegisterForClicks("AnyDown", "AnyUp")
    button:SetAttribute("type", "spell")
    button:SetAttribute("spell", internal.fishingID)
    button:SetScript("PostClick", function(self, mouse_button, is_down)
      MouselookStart()
      if is_down then return end
      MouselookStop()
    end)
    SecureHandlerWrapScript(button, "PostClick", button,  [[
      self:ClearBindings()
    ]])
    self.secureButton = button
  end
  return self.secureButton
end

function BetterFishing_Run()
  local isAllowed = BetterFishing:BaseRules()
  if GetNumLootItems() ~= 0 then return end
  if not IsTaintable() and isAllowed then
    local key1, key2 = GetBindingKey("BETTERFISHINGKEY")
    local localizedName = GetSpellInfo(internal.fishingID)
    if key1 then
      SetOverrideBindingSpell(BetterFishing:GetSecureButton(), true, key1, localizedName)
    end
    if key2 then
      SetOverrideBindingSpell(BetterFishing:GetSecureButton(), true, key2, localizedName)
    end
  end
end

WorldFrame:HookScript("OnMouseDown", function(_, button, down)
  if button == "RightButton" and not IsTaintable() and not IsModifierKeyDown() then
    -- Ensure the LootFrame contains no items before attempting
    if GetNumLootItems() == 0 then
      local doubleClickTime = GetTime() - internal.previousClickTime
      if internal.isReady or (doubleClickTime < internal.DOUBLECLICK_MAX_SECONDS and doubleClickTime > internal.DOUBLECLICK_MIN_SECONDS) then
        internal.previousClickTime = nil
        local isAllowed = BetterFishing:Rules()
        if isAllowed then
          SetOverrideBindingClick(BetterFishing:GetSecureButton(), true, "BUTTON2", addonName.."Button")
          internal.override_binding = true
        end
      end
    end
    internal.isReady = false
    internal.previousClickTime = GetTime()
  end
end)

function BetterFishing:BaseRules()
  if not IsSpellKnown(internal.fishingID)
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

  return true
end

function BetterFishing:Rules()
  local continue = self:BaseRules()
  if not continue then return end

  local form = GetShapeshiftForm(true)
  if form and form > 0 then
    return false
  end

  local spellID = select(8,UnitChannelInfo("player"))
  if spellID == internal.fishingCastingID and not IsModifierKeyDown() then
    return false
  end

  return true
end

local cachedSoftTargetInteract = GetCVar("SoftTargetInteract");
local cachedSoftTargetInteractArc = GetCVar("SoftTargetInteractArc");
local cachedSoftTargetInteractRange = GetCVar("SoftTargetInteractRange");
local cachedSoftTargetIconGameObject = GetCVar("SoftTargetIconGameObject");

function BetterFishing:ResetCVars()
  SetCVar("SoftTargetInteract", cachedSoftTargetInteract);
  SetCVar("SoftTargetInteractArc", cachedSoftTargetInteractArc);
  SetCVar("SoftTargetInteractRange", cachedSoftTargetInteractRange);
  SetCVar("SoftTargetIconGameObject", cachedSoftTargetIconGameObject);
end

function BetterFishing:SetCVars()
  cachedSoftTargetInteract = GetCVar("SoftTargetInteract");
  cachedSoftTargetInteractArc = GetCVar("SoftTargetInteractArc");
  cachedSoftTargetInteractRange = GetCVar("SoftTargetInteractRange");
  cachedSoftTargetIconGameObject = GetCVar("SoftTargetIconGameObject");
  SetCVar("SoftTargetInteract", 3);
  SetCVar("SoftTargetInteractArc", 2);
  SetCVar("SoftTargetInteractRange", 15);
  SetCVar("SoftTargetIconGameObject", 1);
end

function BetterFishing:OnEvent(event, ...)
  if event == "PLAYER_REGEN_DISABLED" then
    internal.inCombat = true
  elseif event == "PLAYER_REGEN_ENABLED" then
    internal.inCombat = false
    if internal.clear_override then
      ClearOverrideBindings(BetterFishing:GetSecureButton())
      internal.override_binding = false
      internal.clear_override = false
    end
  elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
    local unit,_,spellID = ...
    if unit == "player" and spellID == internal.fishingCastingID then
      internal.isFishing = true
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
    if unit == "player" and spellID == internal.fishingCastingID then
      if not internal.blockCasting then
        internal.isFishing = false
      end
      BetterFishing:ResetCVars()
      if not IsTaintable() then
        ClearOverrideBindings(BetterFishing:GetSecureButton());
      else
        internal.clear_override = true;
      end
    end
  elseif event == "LOOT_READY" then
    if internal.isFishing then
      internal.blockCasting = true
      internal._frame:RegisterEvent("LOOT_CLOSED")
    end
  elseif event == "LOOT_CLOSED" then
    if internal.isFishing then
      internal.isFishing = false
      internal._frame:UnregisterEvent("LOOT_CLOSED")
      internal.isReady = true
      internal.blockCasting = false
    end
  elseif event == "PLAYER_STARTED_MOVING" then
    internal.blockCasting = true
  elseif event == "PLAYER_STOPPED_MOVING" then
    internal.blockCasting = false
  elseif event == "UI_INFO_MESSAGE" then
    local errorType = ...
    if errorType == 382 or errorType == 383 then
      internal.isReady = true
    end
  elseif event == "PLAYER_LOGOUT" then
    BetterFishing:ResetCVars()
  end
end

internal._frame:SetScript("OnEvent", BetterFishing.OnEvent)
FrameUtil.RegisterFrameForEvents(internal._frame, {
  "PLAYER_REGEN_DISABLED",
  "PLAYER_REGEN_ENABLED",
  "UNIT_SPELLCAST_CHANNEL_START",
  "UNIT_SPELLCAST_CHANNEL_STOP",
  "LOOT_READY",
  "LOOT_CLOSED",
  "PLAYER_STOPPED_MOVING",
  "PLAYER_STARTED_MOVING",
  "UI_INFO_MESSAGE",
  "PLAYER_LOGOUT"
})