local BtWQuests = BtWQuests
local Database = BtWQuests.Database
local L = BtWQuests.L
local EXPANSION_ID = BtWQuests.Constant.Expansions.Dragonflight
local CATEGORY_ID = BtWQuests.Constant.Category.Dragonflight.Dragonflight
local Chain = BtWQuests.Constant.Chain.Dragonflight.Dragonflight
local THREADS_OF_FATE_RESTRICTION = BtWQuests.Constant.Restrictions.DragonflightToF
local NOT_THREADS_OF_FATE_RESTRICTION = BtWQuests.Constant.Restrictions.NOTDragonflightToF
local ACHIEVEMENT_ID_1 = 16808
local LEVEL_RANGE = {70, 70}

Chain.TheChieftainsDuty = 100501
Chain.AMysterySealed = 100502
Chain.TheSilverPurpose = 100503
Chain.InTheHallsOfTitans = 100504
Chain.GardenOfSecrets = 100505
Chain.TheDreamer = 100506

Database:AddChain(Chain.TheChieftainsDuty, {
    name = BtWQuests_GetAchievementCriteriaNameDelayed(ACHIEVEMENT_ID_1, 4),
    questline = 1385,
    category = CATEGORY_ID,
    expansion = EXPANSION_ID,
    range = LEVEL_RANGE,
    prerequisites = {
        {
            type = "level",
            level = 70,
        },
        {
            type = "currency",
            id = 2087,
            amount = 11,
        },
    },
    active = {
        type = "quest",
        ids = {70846, 72773, 70180,},
        status = {'active', 'completed'}
    },
    completed = {
        type = "quest",
        id = 70633,
    },
    items = {
    },
})
Database:AddChain(Chain.AMysterySealed, {
    name = BtWQuests_GetAchievementCriteriaNameDelayed(ACHIEVEMENT_ID_1, 1),
    questline = 1386,
    category = CATEGORY_ID,
    expansion = EXPANSION_ID,
    range = LEVEL_RANGE,
    prerequisites = {
        {
            type = "level",
            level = 70,
        },
        {
            type = "currency",
            id = 2021,
            amount = 13,
        },
    },
    active = {
        type = "quest",
        ids = {69093, 66012,},
        status = {'active', 'completed'}
    },
    completed = {
        type = "quest",
        id = 66128,
    },
    items = {
        {
            type = "quest",
            id = 69093,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 66012,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 66013,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 66673,
            x = 0,
            connections = {
                1, 2, 3, 
            },
        },
        {
            type = "quest",
            id = 66094,
            x = -2,
            connections = {
                3, 
            },
        },
        {
            type = "quest",
            id = 70784,
            connections = {
                3, 
            },
        },
        {
            type = "quest",
            id = 70785,
            connections = {
                3, 
            },
        },
        {
            type = "quest",
            id = 70507,
            x = -2,
            connections = {
                3, 
            },
        },
        {
            type = "quest",
            id = 70503,
            connections = {
                2, 
            },
        },
        {
            type = "quest",
            id = 66814,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 66128,
            x = 0
        },
    },
})
Database:AddChain(Chain.TheSilverPurpose, {
    name = BtWQuests_GetAchievementCriteriaNameDelayed(ACHIEVEMENT_ID_1, 5),
    questline = 1389,
    category = CATEGORY_ID,
    expansion = EXPANSION_ID,
    range = LEVEL_RANGE,
    prerequisites = {
        {
            type = "level",
            level = 70,
        },
        {
            type = "currency",
            id = 2088,
            amount = 12,
        },
    },
    active = {
        type = "quest",
        ids = {68794, 67074,},
        status = {'active', 'completed'}
    },
    completed = {
        type = "quest",
        id = 67084,
    },
    items = {
        {
            type = "quest",
            id = 68794,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67074,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 70703,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67075,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67076,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67077,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67078,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67079,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67081,
            x = 0,
            connections = {
                1, 
            },
        },
        {
            type = "quest",
            id = 67084,
            x = 0,
        },
    },
})
Database:AddChain(Chain.InTheHallsOfTitans, {
    name = BtWQuests_GetAchievementCriteriaNameDelayed(ACHIEVEMENT_ID_1, 2),
    questline = 1384,
    category = CATEGORY_ID,
    expansion = EXPANSION_ID,
    range = LEVEL_RANGE,
    prerequisites = {
        {
            type = "level",
            level = 70,
        },
        {
            type = "chain",
            id = Chain.AMysterySealed,
        },
    },
    active = {
        type = "quest",
        ids = {70846, 72773, 70180,},
        status = {'active', 'completed'}
    },
    completed = {
        type = "quest",
        id = 70633,
    },
    items = {
    },
})
Database:AddChain(Chain.GardenOfSecrets, {
    name = BtWQuests_GetAchievementCriteriaNameDelayed(ACHIEVEMENT_ID_1, 3),
    questline = 1387,
    category = CATEGORY_ID,
    expansion = EXPANSION_ID,
    range = LEVEL_RANGE,
    prerequisites = {
        {
            type = "level",
            level = 70,
        },
        {
            type = "chain",
            id = Chain.TheSilverPurpose,
        },
        {
            type = "currency",
            id = 2088,
            amount = 19,
        },
    },
    active = {
        type = "quest",
        ids = {70846, 72773, 70180,},
        status = {'active', 'completed'}
    },
    completed = {
        type = "quest",
        id = 70633,
    },
    items = {
    },
})
Database:AddChain(Chain.TheDreamer, {
    -- name = BtWQuests_GetAchievementCriteriaNameDelayed(ACHIEVEMENT_ID_1, 4),
    questline = 1388,
    category = CATEGORY_ID,
    expansion = EXPANSION_ID,
    range = LEVEL_RANGE,
    prerequisites = {
        {
            type = "level",
            level = 70,
        },
    },
    active = {
        type = "quest",
        ids = {70846, 72773, 70180,},
        status = {'active', 'completed'}
    },
    completed = {
        type = "quest",
        id = 70633,
    },
    items = {
    },
})

Database:AddCategory(CATEGORY_ID, {
    name = BtWQuests_GetAchievementNameDelayed(ACHIEVEMENT_ID_1),
    expansion = EXPANSION_ID,
    buttonImage = 4742925,
    items = {
--[==[@debug@
        {
            type = "chain",
            id = Chain.TheChieftainsDuty,
        },
--@end-debug@]==]
        {
            type = "chain",
            id = Chain.AMysterySealed,
        },
        {
            type = "chain",
            id = Chain.TheSilverPurpose,
        },
--[==[@debug@
        {
            type = "chain",
            id = Chain.InTheHallsOfTitans,
        },
        {
            type = "chain",
            id = Chain.GardenOfSecrets,
        },
        {
            type = "chain",
            id = Chain.TheDreamer,
        },
--@end-debug@]==]
    },
})
BtWQuestsDatabase:AddExpansionItems(EXPANSION_ID, {
    {
        type = "category",
        id = CATEGORY_ID,
    },
})