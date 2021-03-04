/*
    File: fn_setDiscordState.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-10
    Last Update: 2020-04-18
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Updated the Discord rich presence state with given string.
        If empty string is given, the state is determined by player variables.

    Parameter(s):
        _state - New state which should be applied to rich presence [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_state", "", [""]]
];

if (_state isEqualTo "") then {
    _state = "In the field";
    [] call {
        if (player getVariable ["KPLIB_isNearStart", false]) exitWith {_state = "On Board the USS YIFF";};
        if !(player getVariable ["KPLIB_fobName", ""] isEqualTo "") exitWith {_state = player getVariable "KPLIB_fobName";};
        if !(player getVariable ["KPLIB_nearSector", ""] isEqualTo "") exitWith {_state = markerText (player getVariable "KPLIB_nearSector");};
    };
};


if (_details isEqualTo   "") then {
    _details = "Selecting Service Role";
    [] call {
        if (player getVariable ["WL_PlayerRole",""] isEqualTo "") exitWith { _details = "Service Role: " + (player getVariable "WL_PlayerRole");};
    };
};
[
    ["UpdateState", _state],["UpdateDetails", _details]
] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

true
