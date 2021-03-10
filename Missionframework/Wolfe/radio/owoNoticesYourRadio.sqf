/*

Desc: Explains the frequencies to the player.
Author: WolfLabs

*/

"OwO What's This? " hintC [
	"We've setup your radio frequencies for you! Talk to other squads on TEAM. Below is a layout of the channels.",
	"Channel 1: Squad 1 - Default SR Channel (CAPS Lock), Left Ear",
	"Channel 2: Squad 2",
	"Channel 3: Squad 3",
	"Channel 4: AIR - Airteam ONLY",
	"Channel 5: TEAM - Default SR Additional (Y), Default LR Channel (T), Right Ear",
	"Channel 6: LOGI - Logistics Team ONLY"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];