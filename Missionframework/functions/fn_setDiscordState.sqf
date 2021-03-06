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
    ["_state", "", [""]],
    ["_details", "", [""]]
];


if (_state isEqualTo "") then {
    _state = "In the field between sectors"; //Roaming
    [] call {
        if (player getVariable ["KPLIB_isNearStart", false]) exitWith { //On Starter Boat
                _state = "Aboard the USS Yiff";
        };
        if (vehicle player isKindOf "Air") exitWith { //Flying
            _state = "Flying between sectors";
            _prefix = "Flying near ";
            if !(player getVariable ["KPLIB_fobName", ""] isEqualTo "") exitWith {
                _fobName = (player getVariable "KPLIB_fobName");
                _state = _prefix + _fobName;
            };
            if !(player getVariable ["KPLIB_nearSector", ""] isEqualTo "") exitWith {    
                _zoneSite = (markerText (player getVariable "KPLIB_nearSector"));
                _state = _prefix + _zoneSite; 
            };
        };
        if !(player getVariable ["KPLIB_fobName", ""] isEqualTo "") exitWith { //Near FOB
                _prefix = "At ";
                _fobName = str (player getVariable "KPLIB_fobName");
                _state = _prefix + _fobName;
        };
        if !(player getVariable ["KPLIB_nearSector", ""] isEqualTo "") exitWith { //In Sector
                _zoneOwned = "";
                    if ( [ markerpos _nearest_active_sector, _zone_size ] call KPLIB_fnc_getSectorOwnership == GRLIB_side_friendly ) then { _zoneOwned = "Holding Friendly Sector "};
                    if ( [ markerpos _nearest_active_sector, _zone_size ] call KPLIB_fnc_getSectorOwnership == GRLIB_side_enemy ) then { _zoneOwned = "Attacking Enemy Sector " };
                    if ( [ markerpos _nearest_active_sector, _zone_size ] call KPLIB_fnc_getSectorOwnership == GRLIB_side_resistance ) then { _zoneOwned = "In Independent Sector "};
                _zoneSite = str (markerText (player getVariable "KPLIB_nearSector"));
                _state = _zoneOwned + _zoneSite;
        };    
    };
};

if (_details isEqualTo  "") then {
    _details = "Waiting for role..";
    [] call {
        if !(player getVariable ["WL_PlayerRole",""] isEqualTo "") exitWith { _details = "Role: " + (player getVariable "WL_PlayerRole");};
    };
};

[
    ["UpdateState", _state],["UpdateDetails", _details]
] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

true
