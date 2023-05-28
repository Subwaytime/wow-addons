﻿-- Contributors:

local _, addonTable = ...

-- Lua
local _G = getfenv(0)

-- Mine
local L = {}
addonTable.L = L

L["LS_TOASTS"] = "LS: |cff00cc99Toasts|r"
L["CURSEFORGE"] = "CurseForge"
L["DISCORD"] = "Discord"
L["GITHUB"] = "GitHub"
L["WAGO"] = "Wago"
L["WOWINTERFACE"] = "WoWInterface"

L["ACHIEVEMENT_PROGRESSED"] = _G.ACHIEVEMENT_PROGRESSED
L["ACHIEVEMENT_UNLOCKED"] = _G.ACHIEVEMENT_UNLOCKED
L["ACTIVITIES_PROGRESSED"] = _G.MONTHLY_ACTIVITIES_PROGRESSED
L["ADD"] = _G.ADD
L["BLIZZARD_STORE"] = _G.BLIZZARD_STORE
L["BLIZZARD_STORE_PURCHASE_DELIVERED"] = _G.BLIZZARD_STORE_PURCHASE_COMPLETE
L["COVENANT_NEW_TALENT"] = _G.COVENANT_PROGRESS
L["CYPHER_NEW_TALENT"] = _G.CYPHER_RESEARCH_TOAST
L["DELETE"] = _G.DELETE
L["DIGSITE_COMPLETED"] = _G.ARCHAEOLOGY_DIGSITE_COMPLETE_TOAST_FRAME_TITLE
L["DUNGEON_COMPLETED"] = _G.DUNGEON_COMPLETED
L["ENABLE"] = _G.ENABLE
L["FEATURE_UNLOCKED"] = _G.LEVEL_UP_FEATURE
L["GARRISON_MISSION_ADDED"] = _G.GARRISON_MISSION_ADDED_TOAST1
L["GARRISON_MISSION_COMPLETED"] = _G.GARRISON_MISSION_COMPLETE
L["GARRISON_NEW_BUILDING"] = _G.GARRISON_UPDATE
L["GARRISON_NEW_TALENT"] = _G.GARRISON_TALENT_ORDER_ADVANCEMENT
L["GENERAL"] = _G.GENERAL_LABEL
L["GUILD_ACHIEVEMENT_UNLOCKED"] = _G.GUILD_ACHIEVEMENT_UNLOCKED
L["ID"] = _G.ID
L["ITEM_AZERITE_EMPOWERED"] = _G.AZERITE_EMPOWERED_ITEM_LOOT_LABEL
L["ITEM_CORRUPTED"] = _G.CORRUPTED_ITEM_LOOT_LABEL
L["ITEM_LEGENDARY"] = _G.LEGENDARY_ITEM_LOOT_LABEL
L["ITEM_UPGRADED"] = _G.ITEM_UPGRADED_LABEL
L["ITEM_UPGRADED_FORMAT"] = _G.LOOTUPGRADEFRAME_TITLE:format("%s%s|r")
L["LOOT_THRESHOLD"] = _G.LOOT_THRESHOLD
L["NEW"] = _G.NEW
L["OKAY"] = _G.OKAY
L["PROFESSION_SPECIALIZATION"] = _G.PROFESSIONS_SPECIALIZATION_TITLE
L["RECIPE_LEARNED"] = _G.NEW_RECIPE_LEARNED_TITLE
L["RECIPE_UPGRADED"] = _G.UPGRADED_RECIPE_LEARNED_TITLE
L["RUNECARVING_NOT_COLLECTED"] = _G.RUNEFORGE_LEGENDARY_POWER_TOOLTIP_NOT_COLLECTED
L["RUNECARVING_SLOT_FORMAT"] = _G.RUNEFORGE_LEGENDARY_POWER_TOOLTIP_SLOT_HEADER
L["RUNECARVING_SOURCE_FORMAT"] = _G.RUNEFORGE_LEGENDARY_POWER_SOURCE_FORMAT
L["RUNECARVING_SPEC_FORMAT"] = _G.RUNEFORGE_LEGENDARY_POWER_REQUIRES_SPEC_FORMAT
L["SCENARIO_COMPLETED"] = _G.SCENARIO_COMPLETED
L["SFX"] = _G.ENABLE_SOUNDFX
L["TYPE_ACTIVITIES"] = _G.MONTHLY_ACTIVITIES_TAB
L["TYPE_PROFESSION"] = _G.GUILD_ROSTER_DROPDOWN_PROFESSION
L["WORLD_QUEST_COMPLETED"] = _G.WORLD_QUEST_COMPLETE
L["XP_FORMAT"] = _G.BONUS_OBJECTIVE_EXPERIENCE_FORMAT
L["YOU_COLLECTED"] = _G.YOU_COLLECTED_LABEL
L["YOU_EARNED"] = _G.YOU_EARNED_LABEL

-- Require translation
L["ANCHOR_FRAME_#"] = "Anchor Frame #%d"
L["ANCHOR_FRAMES"] = "Anchor Frames"
L["ANCHOR_RESET_DESC"] = "|cffffffffShift-Click|r to reset the position."
L["BORDER"] = "Border"
L["CHANGELOG"] = "Changelog"
L["CHANGELOG_FULL"] = "Full"
L["COLORS"] = "Colours"
L["COORDS"] = "Coordinates"
L["COPPER_THRESHOLD"] = "Copper Threshold"
L["COPPER_THRESHOLD_DESC"] = "Min amount of copper to create a toast for."
L["DEFAULT_VALUE"] = "Default value: |cffffd200%s|r"
L["DND"] = "DND"
L["DND_TOOLTIP"] = "Toasts in DND mode won't be displayed in combat, but will be queued up in the system. Once you leave combat, they'll start popping up."
L["DOWNLOADS"] = "Downloads"
L["FADE_OUT_DELAY"] = "Fade Out Delay"
L["FLUSH_QUEUE"] = "Flush Queue"
L["FONTS"] = "Fonts"
L["GROWTH_DIR"] = "Growth Direction"
L["GROWTH_DIR_DOWN"] = "Down"
L["GROWTH_DIR_LEFT"] = "Left"
L["GROWTH_DIR_RIGHT"] = "Right"
L["GROWTH_DIR_UP"] = "Up"
L["ICON_BORDER"] = "Icon Border"
L["INFORMATION"] = "Info"
L["NAME"] = "Name"
L["RARITY_THRESHOLD"] = "Rarity Threshold"
L["SCALE"] = "Scale"
L["SHOW_ILVL"] = "Show iLvl"
L["SHOW_ILVL_DESC"] = "Show item level next to item name."
L["SHOW_QUEST_ITEMS"] = "Show Quest Items"
L["SHOW_QUEST_ITEMS_DESC"] = "Show quest items regardless of their quality."
L["SIZE"] = "Size"
L["SKIN"] = "Skin"
L["STRATA"] = "Strata"
L["SUPPORT"] = "Support"
L["TEST"] = "Test"
L["TEST_ALL"] = "Test All"
L["TOAST_NUM"] = "Number of Toasts"
L["TOAST_TYPES"] = "Toast Types"
L["TOGGLE_ANCHORS"] = "Toggle Anchors"
L["TRACK_LOSS"] = "Track Loss"
L["TRACK_LOSS_DESC"] = "This option ignores set copper threshold."
L["TYPE_LOOT_GOLD"] = "Loot (Gold)"
L["X_OFFSET"] = "xOffset"
L["Y_OFFSET"] = "yOffset"
L["YOU_LOST"] = "You Lost"
L["YOU_RECEIVED"] = "You Received"

-- Retail
L["CURRENCY_THRESHOLD_DESC"] = "Enter |cffffd200-1|r to ignore the currency, |cffffd2000|r to disable the filter, or |cffffd200any number above 0|r to set the threshold below which no toasts will be created."
L["FILTERS"] = "Filters"
L["HANDLE_LEFT_CLICK"] = "Handle Left Click"
L["NEW_CURRENCY_FILTER_DESC"] = "Enter a currency ID."
L["OPEN_CONFIG"] = "Open Config"
L["TAINT_WARNING"] = "Enabling this option may cause errors when opening or closing certain UI panels while in combat."
L["THRESHOLD"] = "Threshold"
L["TRANSMOG_ADDED"] = "Appearance Added"
L["TRANSMOG_REMOVED"] = "Appearance Removed"
L["TYPE_ACHIEVEMENT"] = "Achievement"
L["TYPE_ARCHAEOLOGY"] = "Archaeology"
L["TYPE_CLASS_HALL"] = "Class Hall"
L["TYPE_COLLECTION"] = "Collection"
L["TYPE_COLLECTION_DESC"] = "Toasts for newly collected mounts, pets and toys."
L["TYPE_COVENANT"] = "Covenant"
L["TYPE_DUNGEON"] = "Dungeon"
L["TYPE_GARRISON"] = "Garrison"
L["TYPE_LOOT_COMMON"] = "Loot (Common)"
L["TYPE_LOOT_COMMON_DESC"] = "Toasts triggered by chat events, e.g. greens, blues, some epics, everything that isn't handled by special loot toasts."
L["TYPE_LOOT_CURRENCY"] = "Loot (Currency)"
L["TYPE_LOOT_SPECIAL"] = "Loot (Special)"
L["TYPE_LOOT_SPECIAL_DESC"] = "Toasts triggered by special loot events, e.g. won rolls, legendary drops, personal loot, etc."
L["TYPE_RUNECARVING"] = "Runecarving"
L["TYPE_TRANSMOG"] = "Transmogrification"
L["TYPE_WAR_EFFORT"] = "War Effort"
L["TYPE_WORLD_QUEST"] = "World Quest"
