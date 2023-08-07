local _, addon = ...

local ItemDatabase = {};
addon.BagItemSearchDatabase = ItemDatabase;

ItemDatabase.TeleportationItems = {};
ItemDatabase.ConjuredItems = {};


do
    local wipe = wipe;

    local function BuildDatabase(targetTable, sourceTable1, sourceTable2)
        --targetTable = {[item1ID] = true, ...}
        --sourceTable = {item1ID, item2ID, item3ID, ...}
        for _, itemID in ipairs(sourceTable1) do
            targetTable[itemID] = true;
        end
        wipe(sourceTable1);

        if sourceTable2 then
            for _, itemID in ipairs(sourceTable2) do
                targetTable[itemID] = true;
            end
            wipe(sourceTable2);
        end
    end

    local TeleItems_Generated = {
        6948,
        18984,
        24335,
        28585,
        30542,
        30544,
        32757,
        34420,
        35230,
        37118,
        37661,
        38685,
        40582,
        40585,
        40586,
        40731,
        43059,
        44314,
        44315,
        44934,
        44935,
        45688,
        45689,
        45690,
        45691,
        45705,
        46842,
        46874,
        48954,
        48955,
        48956,
        48957,
        50287,
        51557,
        51558,
        51559,
        51560,
        52567,
        54452,
        58487,
        58964,
        60374,
        61379,
        62394,
        63206,
        63207,
        63352,
        63353,
        63378,
        63379,
        64488,
        65274,
        65360,
        66061,
        68808,
        68809,
        92510,
        93672,
        95050,
        95051,
        103678,
        104110,
        104113,
        107441,
        110560,
        118662,
        118663,
        118907,
        118908,
        119183,
        122526,
        132119,
        132120,
        132122,
        134058,
        138448,
        139541,
        139590,
        139599,
        140192,
        140319,
        141013,
        141014,
        141015,
        141016,
        141017,
        142298,
        142457,
        142458,
        142459,
        142462,
        142463,
        142464,
        142465,
        142466,
        142467,
        142469,
        142470,
        142471,
        142472,
        142542,
        142543,
        144391,
        144392,
        146796,
        147354,
        147865,
        147878,
        147879,
        150733,
        157542,
        159224,
        159671,
        160218,
        160219,
        162972,
        162973,
        163045,
        163206,
        163694,
        165669,
        165670,
        165802,
        166559,
        166560,
        166746,
        166747,
        167075,
        167228,
        168907,
        169064,
        169114,
        169206,
        172179,
        172203,
        173373,
        173430,
        173523,
        173526,
        173527,
        173528,
        173530,
        173531,
        173532,
        173537,
        173698,
        173699,
        173716,
        177904,
        177905,
        178152,
        180290,
        180817,
        181163,
        183716,
        184353,
        184500,
        184501,
        184502,
        184503,
        184504,
        185764,
        188952,
        190196,
        190237,
        191029,
        193588,
    };

    local TeleItems_Manual = {
        --These items summon portals that allow you to teleport
        37863,      --Direbrew's Remote
        52251,      --Jaina's Locket
        22589, 22630, 22631, 22632,     --Atiesh
        132523, 144341,     --Reaves
        141605,     --Flight Master's Whistle
    };

    BuildDatabase(ItemDatabase.TeleportationItems, TeleItems_Generated, TeleItems_Manual);


    local ConjuredItems = {
        113509, 43523, 34062, 2288, 198831, 65499, 65515, 5349, 198832, 2136, 22018, 22895, 1487, 22019, 43518, 3772, 65516, 5350, 65500, 1114, 30703, 8075, 1113, 65517, 8076, 8077, 80618, 80610, 8078, 8079,
        5512,
    };

    BuildDatabase(ItemDatabase.ConjuredItems, ConjuredItems);
end