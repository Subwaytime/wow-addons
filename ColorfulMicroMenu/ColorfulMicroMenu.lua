--==================================================--
-----------------    [[ Config ]]    -----------------
--==================================================--

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
end

local frame = CreateFrame("FRAME", nil)
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:SetScript("OnEvent", OnEvent)