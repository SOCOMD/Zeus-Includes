#define PROGRAM_CHANNEL(RADIO, CHANNEL, LABEL, RX, TX) \
[RADIO, _presetId, CHANNEL, "label", LABEL] call acre_api_fnc_setPresetChannelField; \
[RADIO, _presetId, CHANNEL, "frequencyRX", RX] call acre_api_fnc_setPresetChannelField; \
[RADIO, _presetId, CHANNEL, "frequencyTX", RX] call acre_api_fnc_setPresetChannelField;

[false, false] call acre_api_fnc_setupMission;

_presetId = "SOCOMD_PRESET";

["ACRE_PRC152", "default", _presetId] call acre_api_fnc_copyPreset;
PROGRAM_CHANNEL("ACRE_PRC152", 1,  "1PL CMD", 31.9, 31.9)
PROGRAM_CHANNEL("ACRE_PRC152", 2,  "1PL ADMIN", 60.9, 60.9)
PROGRAM_CHANNEL("ACRE_PRC152", 3,  "MEDIC NET", 75.3, 75.3)
PROGRAM_CHANNEL("ACRE_PRC152", 4,  "MOVEMENTS NET", 81.4, 81.4)
PROGRAM_CHANNEL("ACRE_PRC152", 5,  "6AVN NET", 83.1, 83.1)
PROGRAM_CHANNEL("ACRE_PRC152", 6,  "COMMON AIR NET", 83.8, 83.8)
PROGRAM_CHANNEL("ACRE_PRC152", 7,  "TASKING NET 1", 84.5, 84.5)
PROGRAM_CHANNEL("ACRE_PRC152", 8,  "TASKING NET 2", 85.2, 85.2)
PROGRAM_CHANNEL("ACRE_PRC152", 9,  "1-1 INTERNAL", 85.9, 85.9)
PROGRAM_CHANNEL("ACRE_PRC152", 10, "1-2 INTERNAL", 86.6, 86.6)
PROGRAM_CHANNEL("ACRE_PRC152", 11, "1-3 INTERNAL", 87.3, 87.3)
PROGRAM_CHANNEL("ACRE_PRC152", 12, "1-4 INTERNAL", 88.0, 88.0)
PROGRAM_CHANNEL("ACRE_PRC152", 13, "1-0 INTERNAL", 88.7, 88.7)
PROGRAM_CHANNEL("ACRE_PRC152", 14, "HAVOC INTERNAL", 89.4, 89.4)
PROGRAM_CHANNEL("ACRE_PRC152", 15, "EMERGENCY NET", 65.4, 65.4)
PROGRAM_CHANNEL("ACRE_PRC152", 99, "HQ NET", 99.9, 99.9)
["ACRE_PRC152", _presetId] call acre_api_fnc_setPreset;

["ACRE_PRC117F", "default", _presetId] call acre_api_fnc_copyPreset;
PROGRAM_CHANNEL("ACRE_PRC117F", 1,  "1PL CMD", 31.9, 31.9)
PROGRAM_CHANNEL("ACRE_PRC117F", 2,  "1PL ADMIN", 60.9, 60.9)
PROGRAM_CHANNEL("ACRE_PRC117F", 3,  "MEDIC NET", 75.3, 75.3)
PROGRAM_CHANNEL("ACRE_PRC117F", 4,  "MOVEMENTS NET", 81.4, 81.4)
PROGRAM_CHANNEL("ACRE_PRC117F", 5,  "6AVN NET", 83.1, 83.1)
PROGRAM_CHANNEL("ACRE_PRC117F", 6,  "COMMON AIR NET", 83.8, 83.8)
PROGRAM_CHANNEL("ACRE_PRC117F", 7,  "TASKING NET 1", 84.5, 84.5)
PROGRAM_CHANNEL("ACRE_PRC117F", 8,  "TASKING NET 2", 85.2, 85.2)
PROGRAM_CHANNEL("ACRE_PRC117F", 9,  "1-1 INTERNAL", 85.9, 85.9)
PROGRAM_CHANNEL("ACRE_PRC117F", 10, "1-2 INTERNAL", 86.6, 86.6)
PROGRAM_CHANNEL("ACRE_PRC117F", 11, "1-3 INTERNAL", 87.3, 87.3)
PROGRAM_CHANNEL("ACRE_PRC117F", 12, "1-4 INTERNAL", 88.0, 88.0)
PROGRAM_CHANNEL("ACRE_PRC117F", 13, "1-0 INTERNAL", 88.7, 88.7)
PROGRAM_CHANNEL("ACRE_PRC117F", 14, "HAVOC INTERNAL", 89.4, 89.4)
PROGRAM_CHANNEL("ACRE_PRC117F", 15, "EMERGENCY NET", 65.4, 65.4)
PROGRAM_CHANNEL("ACRE_PRC117F", 99, "HQ NET", 99.9, 99.9)
["ACRE_PRC117F", _presetId] call acre_api_fnc_setPreset;

[] spawn {
	waitUntil { missionNamespace getVariable["SOCOMD_InitComplete", 0] == 1 };

	["e", "English"] call acre_api_fnc_babelAddLanguageType;
	["f", "Foreign"] call acre_api_fnc_babelAddLanguageType;
	["z", "Zeus"] call acre_api_fnc_babelAddLanguageType;

	_languagesPlayerSpeaks = ["e"];

	_whitelist = [
		"SOCOMD_Homestead"
	];

	_type = typeOf player;
	if(_type in _whitelist) then {
		_languagesPlayerSpeaks = _languagesPlayerSpeaks + ["f", "z"];
	};

	_languagesPlayerSpeaks call acre_api_fnc_babelSetSpokenLanguages;
};
