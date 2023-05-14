local AB, _, T = assert(OPie.ActionBook:compatible(2,14), "Requires a compatible version of ActionBook"), ...
local ORI, EV, L, PC = OPie.UI, T.Evie, T.L, T.OPieCore
local COMPAT = select(4,GetBuildInfo())
local MODERN, CF_WRATH = COMPAT >= 10e4, COMPAT < 10e4 and COMPAT >= 3e4
local MODERN_CONTAINERS = MODERN or C_Container and C_Container.GetContainerNumSlots

local exclude, questItems, IsQuestItem, disItems = PC:RegisterPVar("AutoQuestExclude", {}), {}
local function GetContainerItemQuestInfo(bag, slot)
	if MODERN_CONTAINERS then
		local iqi = C_Container.GetContainerItemQuestInfo(bag, slot)
		return iqi.isQuestItem, iqi.questID, iqi.isActive
	end
	return _G.GetContainerItemQuestInfo(bag, slot)
end
if MODERN then
	questItems[30148] = {72986, 72985}
	local function isInPrimalistFutureScenario()
		return C_TaskQuest.IsActive(74378) and C_Scenario.IsInScenario() and select(8, GetInstanceInfo()) == 2512
	end
	local function isOnKeysOfLoyalty()
		local q = C_QuestLog.IsOnQuest
		return q(66805) or q(66133)
	end
	local function have15(iid)
		return GetItemCount(iid) >= 15
	end
	local include = {
		[33634]=true, [35797]=true, [37888]=true, [37860]=true, [37859]=true, [37815]=true, [46847]=true, [47030]=true, [39213]=true, [42986]=true, [49278]=true,
		[86425]={31332, 31333, 31334, 31335, 31336, 31337}, [90006]=true, [86536]=true, [86534]=true,
		[180008]=-60609, [180009]=-60609, [180170]=-60649,
		[174464]=true, [168035]=true,
		[191251]=isOnKeysOfLoyalty, [202096]=isInPrimalistFutureScenario, [203478]=isInPrimalistFutureScenario,
		[202670]=true, [202171]=true, [204075]=have15, [204076]=have15, [204078]=have15, [204077]=have15, [205254]=true,
	}
	local includeSpell = {
		[GetSpellInfo(375806) or 0]=true,
		[GetSpellInfo(411602) or 0]=true,
		[GetSpellInfo(409074) or 0]=true,
		[GetSpellInfo(409490) or 0]=true,
		[GetSpellInfo(409643) or 0]=true,
	}
	includeSpell[0] = nil
	disItems = {
		[198798]=1, [198800]=1, [201359]=1, [198675]=1, [198694]=1, [198689]=1, [198799]=1, [201358]=1,
		[201356]=1, [201357]=1, [201360]=1, [204990]=1, [205001]=1, [204999]=1,
	}
	function IsQuestItem(iid, bag, slot)
		if exclude[iid] then return false end
		if disItems[iid] then return true, false end
		local inc, isQuest, startQuestId, isQuestActive = include[iid], GetContainerItemQuestInfo(bag, slot)
		isQuest = iid and ((isQuest and GetItemSpell(iid)) or (inc == true) or (startQuestId and not isQuestActive and not C_QuestLog.IsQuestFlaggedCompleted(startQuestId)))
		local tinc = inc and not isQuest and type(inc)
		if tinc == "function" then
			isQuest, startQuestId, isQuestActive = inc(iid)
		elseif tinc then
			isQuest = true
			for i=tinc == "number" and 1 or #inc, 1, -1 do
				local qid, wq = tinc == "number" and inc or inc[i]
				wq, qid = qid < 0, qid < 0 and -qid or qid
				if C_QuestLog.IsQuestFlaggedCompleted(qid) or
				   wq and not C_QuestLog.IsOnQuest(qid) then
					return false
				end
			end
		end
		if inc == nil and not isQuest then
			local isn, isid = GetItemSpell(iid)
			isQuest, startQuestId = isid and includeSpell[isn] and IsUsableSpell(isid), false
		end
		return isQuest, startQuestId and not isQuestActive
	end
else
	local include = PC:RegisterPVar("AutoQuestWhitelist", {}) do
		local hexclude, hinclude = {}, {}
		for i in ("12460 12451 12450 12455 12457 12458 12459"):gmatch("%d+") do
			hexclude[i+0] = true
		end
		for i in (CF_WRATH and "33634 35797 37888 37860 37859 37815 46847 47030 39213 42986 49278" or ""):gmatch("%d+") do
			hinclude[i+0] = true
		end
		setmetatable(exclude, {__index=hexclude})
		setmetatable(include, CF_WRATH and {__index=hinclude} or nil)
	end
	local QUEST_ITEM = Enum.ItemClass.Questitem
	function IsQuestItem(iid, bag, slot, skipTypeCheck)
		local isQuest, startsQuest = false, false
		if include[iid] then
			isQuest = true
		elseif not (iid and GetItemSpell(iid) and not exclude[iid]) then
		elseif select(12, GetItemInfo(iid)) == QUEST_ITEM then
			isQuest = true
		elseif skipTypeCheck then
			include[iid], isQuest = true, true
		end
		if CF_WRATH and bag and slot then
			local _isQuestItem, startQuestId, isQuestActive = GetContainerItemQuestInfo(bag, slot)
			startsQuest = startQuestId and not isQuestActive and not C_QuestLog.IsQuestFlaggedCompleted(startQuestId) or false
			isQuest = isQuest or startsQuest
		end
		return isQuest, startsQuest
	end

	local lastQuestAcceptTime = GetTime()-20
	function EV.QUEST_ACCEPTED()
		lastQuestAcceptTime = GetTime()
	end
	function EV:CHAT_MSG_LOOT(text)
		local iid = text:match("|Hitem:(%d+).-|h")
		if iid and (GetTime()-lastQuestAcceptTime) < 1 then
			IsQuestItem(iid+0, nil, nil, true)
		end
	end
end
local GetQuestLogTitle = GetQuestLogTitle or function(i)
	local q = C_QuestLog.GetInfo(i)
	if q then
		local qid = q.questID
		return nil, nil, nil, q.isHeader, q.isCollapsed, C_QuestLog.IsComplete(qid), nil, qid
	end
end

local colId, current, changed
local collection, inring, ctok = MODERN and {"EB", EB=AB:GetActionSlot("extrabutton", 1)} or {}, {}, 0
local function scanQuests(i)
	for i=i or 1, (MODERN and C_QuestLog.GetNumQuestLogEntries or GetNumQuestLogEntries)() do
		local _, _, _, isHeader, isCollapsed, isComplete, _, qid = GetQuestLogTitle(i)
		if isHeader and isCollapsed then
			ExpandQuestHeader(i)
			return scanQuests(i+1), CollapseQuestHeader(i)
		elseif questItems[qid] and not isComplete then
			for _, iid in ipairs(questItems[qid]) do
				local act = not exclude[iid] and AB:GetActionSlot("item", iid)
				if act then
					local tok = "OpieBundleQuest" .. iid
					if not inring[tok] then
						collection[#collection+1], collection[tok], changed = tok, act, true
					end
					inring[tok] = current
					break
				end
			end
		elseif MODERN then
			local link, _, _, showWhenComplete = GetQuestLogSpecialItemInfo(i)
			if link and (showWhenComplete or not isComplete) then
				local iid = tonumber(link:match("item:(%d+)"))
				if not exclude[iid] then
					local tok = "OPieBundleQuest" .. iid
					if not inring[tok] then
						collection[#collection+1], collection[tok], changed = tok, AB:GetActionSlot("item", iid), true
					end
					inring[tok] = current
				end
			end
		end
	end
end
local function syncRing(_, _, upId)
	if upId ~= colId then return end
	changed, current = false, (ctok + 1) % 2
	
	local za = C_ZoneAbility and C_ZoneAbility.GetActiveAbilities()
	for i=1, za and #za or 0 do
		local ai = za[i]
		local asid = ai and ai.spellID
		if asid and not IsPassiveSpell(asid) then
			local tok = "OPieBundleQuestZA" .. ai.spellID
			if not inring[tok] then
				collection[#collection+1], collection[tok], changed = tok, AB:GetActionSlot("spell", asid), true
			end
			inring[tok] = current
		end
	end

	local ns = MODERN_CONTAINERS and C_Container.GetContainerNumSlots or GetContainerNumSlots
	local giid = MODERN_CONTAINERS and C_Container.GetContainerItemID or GetContainerItemID
	for bag=0,4 do
		for slot=1, ns(bag) do
			local iid = giid(bag, slot)
			local include, startsQuestMark = IsQuestItem(iid, bag, slot)
			if include then
				local tok = "OPieBundleQuest" .. iid
				if not inring[tok] then
					collection[#collection+1], collection[tok], changed = tok, AB:GetActionSlot(disItems and disItems[iid] and "disenchant" or "item", iid), true
				end
				ORI:SetQuestHint(tok, startsQuestMark)
				inring[tok] = current
			end
		end
	end
	for i=0,INVSLOT_LAST_EQUIPPED do
		local tok = "OPieBundleQuest" .. (GetInventoryItemID("player", i) or 0)
		if inring[tok] then
			inring[tok] = current
		end
	end
	scanQuests()

	local freePos, oldCount = MODERN and 2 or 1, #collection
	for i=freePos, oldCount do
		local v = collection[i]
		collection[freePos], freePos, collection[v], inring[v] = collection[i], freePos + (inring[v] == current and 1 or 0), (inring[v] == current and collection[v] or nil), inring[v] == current and current or nil
	end
	for i=oldCount,freePos,-1 do collection[i] = nil end
	ctok = current

	if changed or freePos <= oldCount then
		AB:UpdateActionSlot(colId, collection)
	end
end
colId = AB:CreateActionSlot(nil,nil, "collection",collection)
OPie:SetRing("OPieAutoQuest", colId, {name=L"Quest Items", hotkey="ALT-Q"})
AB:AddObserver("internal.collection.preopen", syncRing)
function EV.PLAYER_REGEN_DISABLED()
	syncRing(nil, nil, colId)
end

local function excludeItemID(iid)
	if iid > 0 then
		exclude[iid] = true
	else
		exclude[-iid] = nil
		if exclude[-iid] then
			exclude[-iid] = false
		end
	end
end
T.AddSlashSuffix(function(msg)
	local args = msg:match("^%s*%S+%s*(.*)$")
	if args:match("^[%d%s%-]+$") then
		for iid in args:gmatch("[%-]?%d+") do
			excludeItemID(tonumber(iid))
		end
	else
		local flag, _, link
		flag, args = args:match("^(%-?)(.*)$")
		_, link = GetItemInfo(args:match("|H(item:%d+)") or args)
		local iid = link and link:match("item:(%d+)")
		if iid then
			excludeItemID(tonumber(iid) * (flag == "-" and -1 or 1))
		end
	end
end, "exclude-quest-item")