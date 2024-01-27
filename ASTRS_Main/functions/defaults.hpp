//[currentProfileIndex, [profileID, profileDisplayName, lrData, srData, prefs]]
#define SETTINGS_DEFAULT [0, [0, "Profile 1", [[], []], [], []], [0, "Profile 2", [[], []], [], []], [0, "Profile 3", [[], []], [], []]]
/* Example Profile: 
    Blank:
    [
        0, 
        "Profile 1", 
        [
            [],
            []
        ], 
        [],
        []
    ]

    Filled:
    [
        0,
        "Default Profile",
        [ -- Being LR Radio Data --
            [
                0,
                4.17814,
                ["55","56","73.5","51.0","77.3","74.4","77.9","66.2","49.0","83.2"],
                1,
                "_bluefor",
                1,
                2,
                any,
                false,
                true
            ],-- End LR Radio Data --
            []-- VLR Radio Data Space--
        ],
        [ -- Begin SR Radio Data --
            7,
            5.17814,
            ["98","99","321.0","483.6","171.8","122.2","83.0","56.6","119.0"],
            0,
            "_bluefor",
            1,
            0,
            "76561198065359907",
            false,
            true
        ], -- End SR Radio Data --
        [true,true,false,false,false] - Prefs Array
    ] */
//Data Indexes(Highest Level of array)
#define CURRENTPROFILE_ID 0
//Profile Indexes (First nested array)
#define PROFILEID_INDEX 0
#define PROFILEDISPLAYNAME_INDEX 1
#define LRDATA_INDEX 2
#define SRDATA_INDEX 3
#define PREFS_INDEX 4
//Prefs Indexes (For prefs Array)
#define SHOWLR_INDEX 0
#define SHOWSR_INDEX 1
#define ALTERNATELAYOUT_INDEX 2
#define SHORTCUTENABLED_INDEX 3
#define SHOWVLR_INDEX 4
//LR Indexes (For lrData Array)
#define LR_INDEX 0
#define VLR_INDEX 1
//[showLR, showSR, alternateLayout, loadShortcutsEnabled, showVLR]
#define PREFS_DEFAULT [true, true, false, false, true]
