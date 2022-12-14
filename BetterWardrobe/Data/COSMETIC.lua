local addonName, addon = ...
addon = LibStub("AceAddon-3.0"):GetAddon(addonName)

addon.ArmorSets["COSMETIC"] ={
--[[	[1790]={
		["armorType"] =  13 ,
		["label"] =  64 ,
		["setID"] =  1790,
		["expansionID"] =  5 ,
		["filter"] =  5 ,
		["name"] =  "Kor'kron Dark Shaman Armor" ,
		["mod"] =  0 ,
		["classMask"] = 7 ,
		["items"] = { 105741,105742,105743,105744,105745,105746,105747,105748, },
		["sources"] = { [105744] = 21286, [105741] = 21283, [105748] = 21282, [105745] = 21287, [105743] = 21285, [105747] = 21289, [105742] = 21284, [105746] = 21288,  },
		["sourceType"] =  2 ,
	},
	[1800]={
		["armorType"] =  13 ,
		["label"] =  69 ,
		["setID"] =  1800,
		["expansionID"] =  6 ,
		["filter"] =  8 ,
		["name"] =  "Stormwind Set" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 117406,117407,117408,117409,117410,117411,117412, },
		["sources"] = { [117407] = 24476, [117411] = 24475, [117412] = 24471, [117409] = 24473, [117406] = 24474, [117408] = 24472, [117410] = 24470,  },
		["sourceType"] =  16 ,
	},
	[1801]={
		["armorType"] =  13 ,
		["label"] =  69 ,
		["setID"] =  1801,
		["expansionID"] =  6 ,
		["filter"] =  8 ,
		["name"] =  "Orgrimmar Set" ,
		["mod"] =  0 ,
		["items"] = { 118366,118367,118368,118369,118370,118371, },
		["sources"] = { [118367] = 24051, [118368] = 24052, [118371] = 24050, [118369] = 24817, [118366] = 24054, [118370] = 24053,  },
		["sourceType"] =  16 ,
	},
	[2765]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2765,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Dark Iron Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 161008,161009,161010,161011,161012,161013,161014,161015, },
		["sources"] = { [161010] = 37712, [161015] = 37718, [161014] = 37711, [161012] = 37717, [161013] = 37715, [161009] = 37716, [161008] = 37714, [161011] = 37713,  },
	},
	[2766]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2766,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Mag'har Orc Heritage Armor (Warsong Recolor)" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 160992,160993,160994,160999,161000,161001,161002,161003, },
		["sources"] = { [161003] = 35930, [161000] = 35923, [160993] = 35929, [160994] = 35925, [160992] = 35927, [161002] = 35924, [160999] = 35926, [161001] = 35928,  },
	},
	[2777]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2777,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Mag'har Orc Heritage Armor (Frostwolf Recolor)" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 161059,161060,161061,161062,161063,161064,161065,161066, },
		["sources"] = { [161061] = 37936, [161062] = 37937, [161059] = 37938, [161064] = 37939, [161060] = 37940, [161065] = 37935, [161063] = 37934, [161066] = 37941,  },
	},
	[2778]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2778,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Mag'har Orc Heritage Armor (Blackrock Recolor)" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 161050,161051,161052,161054,161055,161056,161057,161058, },
		["sources"] = { [161050] = 37930, [161057] = 37927, [161058] = 37933, [161051] = 37932, [161055] = 37926, [161056] = 37931, [161052] = 37928, [161054] = 37929,  },
	},
	[2779]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2779,
		["expansionID"] =  7 ,
		["filter"] =  1 ,
		["name"] =  "Highmountain Tauren Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 156668,156669,156670,156671,156672,156673,156674,156684, },
		["sources"] = { [156669] = 36108, [156672] = 36103, [156670] = 36110, [156673] = 36107, [156674] = 36104, [156684] = 36109, [156668] = 36105, [156671] = 36106,  },
	},
	[2780]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2780,
		["expansionID"] =  7 ,
		["filter"] =  1 ,
		["name"] =  "Lightforged Draenei Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 156699,156700,156701,156702,156703,156704,156705,156706, },
		["sources"] = { [156700] = 36127, [156706] = 36128, [156699] = 36123, [156702] = 36125, [156704] = 36126, [156705] = 36122, [156701] = 36124, [156703] = 36121,  },
	},
	[2781]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2781,
		["expansionID"] =  7 ,
		["filter"] =  1 ,
		["name"] =  "Shal'dorei (Nightborne) Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 156675,156676,156677,156678,156679,156680,156681,156685, },
		["sources"] = { [156680] = 36099, [156681] = 36095, [156675] = 36097, [156685] = 36101, [156679] = 36094, [156677] = 36102, [156676] = 36100, [156678] = 36098,  },
	},
	[2782]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2782,
		["expansionID"] =  7 ,
		["filter"] =  1 ,
		["name"] =  "Ren'dorei (Void Elf) Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 156690,156691,156692,156693,156694,156695,156696,156697,157758,158917, },
		["sources"] = { [156691] = 36151, [156690] = 36148, [156696] = 36146, [157758] = 36989, [156693] = 36149, [156694] = 36145, [156697] = 36152, [156692] = 36147, [158917] = 36153, [156695] = 36150,  },
	},
	[2896]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2896,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Sin'dorei (Blood Elf) Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 166348,166349,166351,166352,166353,166354,166355,166356,166357, },
		["sources"] = { [166356] = 39369, [166351] = 39371, [166349] = 39374, [166354] = 39370, [166353] = 39373, [166357] = 39377, [166355] = 39376, [166348] = 39372, [166352] = 39375,  },
	},
	[2897]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2897,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Bronzebeard (Dwarf) Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 165931,165932,165933,165934,165935,165936,165937,165938, },
		["sources"] = { [165938] = 39261, [165937] = 39255, [165933] = 39254, [165934] = 39256, [165935] = 39260, [165936] = 39258, [165931] = 39257, [165932] = 39259,  },
	},
	[2950]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2950,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Kul Tiran Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 165002,165003,165004,165005,165006,165007,165008,165009, },
		["sources"] = { [165006] = 38869, [165009] = 38876, [165002] = 38873, [165003] = 38875, [165008] = 38870, [165007] = 38874, [165005] = 38872, [165004] = 38871,  },
	},
	[2951]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2951,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Zandalari Troll Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 164993,164994,164995,164996,164997,164998,164999,165000, },
		["sources"] = { [164993] = 37768, [164995] = 37766, [164996] = 37767, [164998] = 37769, [165000] = 37771, [164999] = 37765, [164994] = 37770, [164997] = 37764,  },
	},
	[2952]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2952,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Ancestral Chieftain (Tauren) Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 168291,168292,168293,168294,168295,168296,168297,168298, },
		["sources"] = { [168298] = 40748, [168292] = 39908, [168293] = 39916, [168296] = 39907, [168297] = 39914, [168294] = 39917, [168291] = 39915, [168295] = 39918,  },
	},
	[2953]={
		["armorType"] =  13 ,
		["label"] =  44 ,
		["setID"] =  2953,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Brawler's Guild (Horde) Armor" ,
		["mod"] =  0 ,
		["side"] =  2 ,
		["items"] = { 167822,167823,167824,167825,167826,167827,167828,167829, },
		["sources"] = { [167824] = 39804, [167823] = 39803, [167825] = 39797, [167826] = 39805, [167827] = 39799, [167822] = 39802, [167828] = 39806, [167829] = 39807,  },
	},
	[2954]={
		["armorType"] =  13 ,
		["label"] =  44 ,
		["setID"] =  2954,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "Brawler's Guild (Alliance) Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 167813,167815,167816,167817,167818,167819,167820,167821, },
		["sources"] = { [167820] = 39800, [167821] = 39801, [167815] = 39795, [167816] = 39796, [167817] = 39797, [167819] = 39799, [167818] = 39798, [167813] = 39794,  },
	},
	[2995]={
		["armorType"] =  13 ,
		["label"] =  90 ,
		["setID"] =  2995,
		["expansionID"] =  8 ,
		["filter"] =  1 ,
		["name"] =  "G.E.A.R. Commander (Gnome) Heritage Armor" ,
		["mod"] =  0 ,
		["side"] =  1 ,
		["items"] = { 168282,168283,168284,168285,168286,168287,168288,168289, },
		["sources"] = { [168286] = 39919, [168284] = 39921, [168287] = 39924, [168289] = 39926, [168285] = 39922, [168288] = 39920, [168282] = 39923, [168283] = 39925,  },
	},]]
}