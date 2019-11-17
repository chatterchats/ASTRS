#include "../config_macros.hpp"
#define PROFILESETTINGS(suffix) ADDON##_Settings_##suffix
#define PROFILESETTINGS_LR PROFILE_SETTINGS(LR)
#define PROFILESETTINGS_SR PROFILE_SETTINGS(SR)
#define PROFILESETTINGS_PREF_SR PROFILE_SETTINGS(Pref_SR)
#define PROFILESETTINGS_PREF_LR PROFILE_SETTINGS(Pref_LR)
#define PROFILESETTINGS_PREF_LAYOUT PROFILE_SETTINGS(Pref_Layout)
// #define Q_DIAG_LOG_CHECK __FILE__  //Use: diag_log Q_DIAG_LOG_CHECK; Place in a fnc sqf to see if it is referenced.