//[currentProfileIndex, [profileID, profileDisplayName, lrData, srData], [<-], [<-], prefs, version]]
#define SETTINGS_DEFAULT \
    [0, \
    ["Profile 1", [[], []], []], \
    ["Profile 2", [[], []], []], \
    ["Profile 3", [[], []], []], \
    [], \
    "3.0.0.0"]

/* 
Example Profile: 
    Blank:
    [
        "Profile 1", -- Profile Name
        [ -- Begin VLR/LR Data Array --
            [],-- LR Radio Data --
            []-- VLR Radio Data Space--
        ], -- End VLR/LR Data Array --
        [], -- SR Radio Data --
    ],
    [], -- Perfs Array
    "3.0.0.1" -- Version --

SR Radio Data Array:
    0: active channel <NUMBER>
    1: Volume <NUMBER>
    2: Frequencies for channels <ARRAY>
    3: Stereo setting - Range (0,2) (0 - Both, 1 - Left, 2 - Right) <NUMBER>
    4: Encryption code <STRING>
    5: Additional active channel <NUMBER>
    6: Additional active channel stereo mode <NUMBER>
    7: Owner's UID - UID of owner of radio <STRING>
    8: Speaker mode <NUMBER>
    9: turned on <BOOL>

LR Radio Data Array:
    0: active channel <NUMBER>
    1: Volume <NUMBER>
    2: Frequencies for channels <ARRAY>
    3: Stereo setting : Range (0,2) (0 - Both, 1 - Left, 2 - Right) <NUMBER>
    4: Encryption code <STRING>
    5: Additional active channel <NUMBER>
    6: Additional active channel stereo mode <NUMBER>
    7: Empty <NIL>
    8: Speaker mode <NUMBER>
    9: turned on <BOOL>


*/
//Main Array Indexes
#define CURRENTPROFILE_ID 0
#define PROFILE_ONE 1
#define PROFILE_TWO 2
#define PROFILE_THREE 3
#define PREFS_INDEX 4
#define VERSION_INDEX 5

//Inner-Profile Indexes (First nested array)
#define PROFILEDISPLAYNAME_INDEX 0
#define LRDATA_INDEX 1 // LR and VLR combined. See LR Indexes below
#define SRDATA_INDEX 2

//LR Indexes (For lrData Array)
#define LR_INDEX 0
#define VLR_INDEX 1

//Prefs Indexes (For prefs Array)
#define SHOWLR_INDEX 0
#define SHOWSR_INDEX 1
#define ALTERNATELAYOUT_INDEX 2
#define SHORTCUTENABLED_INDEX 3
#define SHOWVLR_INDEX 4

//[showSR, showLR, showVLR, alternateLayout, loadShortcutsEnabled]

#define PREFS_DEFAULT [true, true, true, false, false]
