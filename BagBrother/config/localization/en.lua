--[[
  English Localization (default)
--]]

local CONFIG = ...
local L = LibStub('AceLocale-3.0'):NewLocale(CONFIG, 'enUS', true, 'raw')

-- general
L.GeneralOptionsDesc = 'These are general features that can be toggled depending on your preferences.'
L.Locked = 'Lock Frames'
L.CountItems = 'Item Tooltip Counts'
L.CountGuild = 'Include Guild Banks'
L.CountCurrency = 'Currency Tooltip Counts'
L.FlashFind = 'Flash Find'
L.FlashFindTip = 'If enabled, alt-clicking an item will flash all slots with that same item across frames.'
L.DisplayBlizzard = 'Fallback Hidden Bags'
L.DisplayBlizzardTip = 'If enabled, the default Blizzard UI bag panels will be displayed for hidden inventory or bank containers.\n\n|cffff1919Requires UI reload.|r'
L.ConfirmGlobals = 'Are you sure you want to disable specific settings for this character? All specific settings will be lost.'
L.CharacterSpecific = 'Character Specific Settings'

-- frame
L.FrameOptions = 'Frame Settings'
L.FrameOptionsDesc = 'These are configuration settings specific to a %s frame.'
L.Frame = 'Frame'
L.Enabled = 'Enable Frame'
L.EnabledTip = 'If disabled, the default Blizzard UI will not be replaced for this frame.\n\n|cffff1919Requires UI reload.|r'
L.ActPanel = 'Act as Standard Panel'
L.ActPanelTip = [[
If enabled, this panel will automatically position
itself as the standard ones do, such as the |cffffffffSpellbook|r
or the |cffffffffDungeon Finder|r, and will not be movable.]]

L.BagToggle = 'Bags Toggle'
L.Broker = 'Databroker Plugins'
L.Currency = 'Currencies'
L.ExclusiveReagent = 'Separate Reagent Bank'
L.Money = 'Money'
L.Sort = 'Sort Button'
L.Search = 'Search Toggle'
L.Options = 'Options Button'
L.LeftTabs = 'Rulesets on Left'
L.LeftTabsTip = [[
If enabled, the side tabs will be
displayed on the left side of the panel.]]

L.Appearance = 'Appearance'
L.Layer = 'Layer'
L.BagBreak = 'Bag Break'
L.ReverseBags = 'Reverse Bag Order'
L.ReverseSlots = 'Reverse Slot Order'

L.Color = 'Background Color'
L.BorderColor = 'Border Color'

L.Strata = 'Frame Layer'
L.Columns = 'Columns'
L.Scale = 'Scale'
L.ItemScale = 'Item Scale'
L.Spacing = 'Spacing'
L.Alpha = 'Opacity'

-- auto display
L.DisplayOptions = 'Automatic Display'
L.DisplayOptionsDesc = 'These settings allow you to configure when your inventory automatically opens or closes due to game events.'
L.DisplayInventory = 'Display Inventory'
L.CloseInventory = 'Close Inventory'

L.Auctioneer = 'At the Auction House'
L.Banker = 'At the Bank'
L.Combat = 'Entering Combat'
L.Crafting = 'Crafting'
L.GuildBanker = 'At the Guild Bank'
L.VoidStorageBanker = 'At Void Storage'
L.MailInfo = 'At a Mailbox'
L.MapFrame = 'Opening the World Map'
L.Merchant = 'Talking to Merchant'
L.PlayerFrame = 'Opening the Character Info'
L.ScrappingMachine = 'Scrapping Equipment'
L.Socketing = 'Socketing Equipment'
L.TradePartner = 'Trading'
L.Vehicle = 'Entering a Vehicle'

-- colors
L.ColorOptions = 'Cores'
L.ColorOptionsDesc = 'Estas preferências permitem controlar a aparência dos espaços dos itens para melhor visibilidade.'
L.GlowQuality = 'Realçar por Qualidade'
L.GlowQuest = 'Realçar Itens de Missão'
L.GlowUnusable = 'Realçar Inutilizáveis'
L.GlowSets = 'Realçar Conjuntos'
L.GlowNew = 'Realçar Itens Novos'
L.GlowPoor = 'Realçar Baixa Qualidade'
L.GlowAlpha = 'Intensidade de Brilho'

L.EmptySlots = 'Mostrar Fundo em Espaços Vazios'
L.SlotBackground = 'Arte de Fundo'
L.ColorSlots = 'Colorir Fundos por Tipo de Saco'
L.NormalColor = 'Espaços Normais'
L.KeyColor = 'Cor de Chave'
L.QuiverColor = 'Cor de Aljava'
L.SoulColor = 'Cor de Saco de Alma'
L.ReagentColor = 'Cor de Banco de Reagentes'
L.LeatherColor = 'Cor de Bolsas de Couraria'
L.InscribeColor = 'Cor de Bolsas de Escrivania'
L.HerbColor = 'Cor de Bolsas de Plantas'
L.EnchantColor = 'Cor de Bolsas de Encantamento'
L.EngineerColor = 'Cor de Mochilas de Engenharia'
L.GemColor = 'Cor de Bolsas de Gemas'
L.MineColor = 'Cor de Bolsas de Mineração'
L.TackleColor = 'Cor de Caixas de Pesca'
L.FridgeColor = 'Cor de Bolsas de Cozinhar'

-- rulesets
L.RuleOptions = 'Regras de Itens'
L.RuleOptionsDesc = 'Estas preferências permitem escolher quais regras de itens serão exibidas e em que ordem.'