--==================================================--
-----------------    [[ Config ]]    -----------------
--==================================================--

-- Micro menu bar scale / 大小
local barScale = 1.3
-- Micro menu mouseover fade / 淡出
local fadeOut = false
-- Hide bags / 隱藏背包
local hideBagbar = false
-- Move queue button to minimap / 隊列小眼睛移至小地圖
local moveQueueButton = false

-- Micro menu button color / 顏色
local Colors = {
	Character	= {0.35, 0.65, 1},
	Spellbook	= {1, 0.58, 0.65},
	Talent		= {0.21, 1, 0.95},
	Achievement	= {1, 0.62, 0.1},
	QuestLog	= {0.96, 1, 0},
	Guild		= {0, 1, 0.1},
	LFD			= {0.7, 0.7, 1},
	EJ			= {1, 1, 1},
	Collections = {1, 0.7, 0.58},
	Store		= {1, 0.83, 0.50},
	MainMenu	= {1, 0.4, 0.4},
	Help		= {1, 1, 1},
}

--=====================================================--
-----------------    [[ variables ]]    -----------------
--=====================================================--

local MicroButtonAndBagsBar, UIFrameFadeOut = MicroButtonAndBagsBar, UIFrameFadeOut

local bagBars = {
	MainMenuBarBackpackButton,
	CharacterBag0Slot,
	CharacterBag1Slot,
	CharacterBag2Slot,
	CharacterBag3Slot,
	BagBarExpandToggle,
	CharacterReagentBag0Slot,
}
--[[	
local buttons = {
	CharacterMicroButton,
	SpellbookMicroButton,
	TalentMicroButton,
	AchievementMicroButton,
	QuestLogMicroButton,
	GuildMicroButton,
	LFDMicroButton,
	EJMicroButton,
	CollectionsMicroButton,
	MainMenuMicroButton,
	HelpMicroButton,
	StoreMicroButton,
}
]]--	
local dummy = function() end

--====================================================--
-----------------    [[ Function ]]    -----------------
--====================================================--

local function Colored(button, r, g, b)
	local textures = {button:GetRegions()}
	for _, texture in pairs(textures) do
		if texture:GetAtlas() then
			texture:SetVertexColor(r, g, b)
		end
	end
end

local function mouseoverShow()
	-- init
	MicroButtonAndBagsBar:SetAlpha(0)

	--[[local function ShowBars()
		MicroButtonAndBagsBar:SetAlpha(1)
	end
	
	local reset = 0
	local function HideBars()
		if MicroButtonAndBagsBar:IsMouseOver() then return end
		if time() == reset then return end
		MicroButtonAndBagsBar:SetAlpha(0)
	end
	
	local function SetFadeTimer()
		reset = time()
		C_Timer.After(1.5, HideBars)
	end
	
	MicroButtonAndBagsBar:SetScript("OnEnter", ShowBars)
	MicroButtonAndBagsBar:SetScript("OnLeave", SetFadeTimer)
	HideBars(MicroButtonAndBagsBar)]]--
	
	local reset
	local function ShowBars()
		if reset then reset:Cancel() end
		MicroButtonAndBagsBar:SetAlpha(1)
		-- refresh fade out when you mouseover back when it's fading
		UIFrameFadeOut(MicroButtonAndBagsBar, 0, 1, 1)
	end
	
	local function HideBars()
		if MicroButtonAndBagsBar:IsMouseOver() then return end
		UIFrameFadeOut(MicroButtonAndBagsBar, 1, 1, 0)
	end
	
	local function SetFadeTimer()
		reset = C_Timer.NewTimer(1, HideBars)
	end
	
	MicroButtonAndBagsBar:SetScript("OnEnter", ShowBars)
	MicroButtonAndBagsBar:SetScript("OnLeave", SetFadeTimer)
end

local function hideBags()
	for i,v in pairs(bagBars) do
		v:Hide()
		v.Show = dummy
	end
end

local function QueueStatus()	
	QueueStatusButton:SetParent(MinimapCluster)
	QueueStatusButton:SetFrameLevel(999)
	QueueStatusButton:SetScale(.8)
	QueueStatusButton:ClearAllPoints()
	QueueStatusButton:SetPoint("TOPLEFT", Minimap, 0, -16)
	QueueStatusFrame:ClearAllPoints()
	QueueStatusFrame:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -10, -2)
	
	QueueStatusButton:SetMovable(true)
	QueueStatusButton:EnableMouse(true)
	--QueueStatusButton:SetUserPlaced(true)
	QueueStatusButton:RegisterForDrag("RightButton")
	QueueStatusButton:SetScript("OnDragStart", function(self) self:StartMoving() end)
	QueueStatusButton:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
end

--================================================--
-----------------    [[ Load ]]    -----------------
--================================================--

local function OnEvent()
	Colored(CharacterMicroButton, unpack(Colors.Character))
	Colored(SpellbookMicroButton, unpack(Colors.Spellbook))
	Colored(TalentMicroButton, unpack(Colors.Talent))
	Colored(AchievementMicroButton, unpack(Colors.Achievement))
	Colored(QuestLogMicroButton, unpack(Colors.QuestLog))
	Colored(GuildMicroButton, unpack(Colors.Guild))
	Colored(LFDMicroButton, unpack(Colors.LFD))
	Colored(EJMicroButton, unpack(Colors.EJ))
	Colored(CollectionsMicroButton, unpack(Colors.Collections))
	Colored(StoreMicroButton, unpack(Colors.Store))
	Colored(HelpMicroButton, unpack(Colors.Help))
	Colored(MainMenuMicroButton, unpack(Colors.MainMenu))
	
	MicroButtonAndBagsBar:SetScale(barScale)
	
	if fadeOut then mouseoverShow() end
	if hideBagbar then hideBags() end
	if moveQueueButton then QueueStatus() end
end

local frame = CreateFrame("FRAME", nil)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:SetScript("OnEvent", OnEvent)