/*
	 * Author: M3ales
	 * Copies LR/SR data from the old version of CHTR_TFAR_QoL, also deletes vars (setting to nil) once loaded.
	 *
	 * Arguments:
	 * None
	 *
	 * Return Value:
	 * None
	 *
	 * Example:
	 * call CHTR_TFAR_Setter_fnc_copyLegacyRadioData
	 *
	 * Public: No
 */
#include "function_macros.hpp"
#include "defaults.hpp"

_settings = call FUNC(loadSettings); // Loads out Settings Dump
if (count _settings == 0) exitWith {
	LOG_ERROR(QUOTE(GVAR(SETTINGS) not initialised));
	[]
};

// We need to take the current _lrData, which is just for backpack LR, and copy it, then set it to be at pos LR_INDEX
// from: [currentProfileIndex, [profileID, profileDisplayName, lrData, srData, prefs]]
// to: [currentProfileIndex, [profileID, profileDisplayName, [[lrData at LR_INDEX], [Blank [] at VLR_INDEX]], srData, prefs]]

/*Selecting the correct information*/
	_profileIndex = (_settings select CURRENTPROFILE_ID) + 1;
	_currentProfile = _settings select _profileIndex;
_oldLRData = _currentProfile select LRDATA_INDEX; // Backing up the Old backpack LR Data
_new = [];// Creating a new array
	
/* Fixing the Array */
 // Changes the array to hold just our LR and vehicleRadio
_new append [+_oldLRData]; // set LR_INDEX to be _oldLRData
_new pushBack [];// set VLR_INDEX to blank []
_new// return the _lrData to calling function