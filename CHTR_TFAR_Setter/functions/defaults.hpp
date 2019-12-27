//[currentProfileIndex, [profileID, profileDisplayName, lrData, srData, prefs]]
#define SETTINGS_DEFAULT [0, [0, "Default Profile", [[]], [], []]]
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
//LR Indexes (For lrData Array)
#define LR_INDEX 0
#define VLR_INDEX 1
//[showLR, showSR, alternateLayout, loadShortcutsEnabled]
#define PREFS_DEFAULT [true, true, false, false]
