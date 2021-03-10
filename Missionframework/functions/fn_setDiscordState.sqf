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
    _state = "In the field"; //Roaming
    [] call {
        if (player getVariable ["KPLIB_isNearStart", false]) exitWith { //On Starter Boat
                ["large","startbase","USS Yiff"] call WL_RPC_SetImage;
                _state = "Aboard the USS Yiff";
        };
        if (vehicle player isKindOf "Steerable_Parachute_F") exitWith { //HALO
        _state = "Parachuting in the field";
        _prefix = "Dropping in near ";
            if !(player getVariable ["KPLIB_nearSector", ""] isEqualTo "") exitWith { //Dropping near Sectors
                ["large","parachute","Dropping in to AO"] call WL_RPC_SetImage;
                _zoneSite = (markerText (player getVariable "KPLIB_nearSector"));
                _state = _prefix + _zoneSite; 
            };
            if (_state isEqualTo "Flying between sectors") then { //Dropping Elsewhere
                ["large", "parachute", "Parachuting"] call WL_RPC_SetImage;
            };
        };
        if (vehicle player isKindOf "Air") exitWith { //Flying
            _state = "Flying between sectors";
            _prefix = "Flying near ";
            if !(player getVariable ["KPLIB_fobName", ""] isEqualTo "") exitWith { //Flying near FOB
                ["large","flyingheli","By FOBs"] call WL_RPC_SetImage;
                _fobName = (player getVariable "KPLIB_fobName");
                _state = _prefix + _fobName;
            };
            if !(player getVariable ["KPLIB_nearSector", ""] isEqualTo "") exitWith { //Flying near Sectors
                ["large","flyingheli","Near Sectors"] call WL_RPC_SetImage;
                _zoneSite = (markerText (player getVariable "KPLIB_nearSector"));
                _state = _prefix + _zoneSite; 
            };
            if (_state isEqualTo "Flying between sectors") then { //Flying Elsewhere
                ["large", "flyingheli", "Flying"] call WL_RPC_SetImage;
            };
        };
        if !(player getVariable ["KPLIB_fobName", ""] isEqualTo "") exitWith { //Near FOB
                ["large","liberation1","In Game"] call WL_RPC_SetImage;
                _prefix = "At ";
                _fobName = (player getVariable "KPLIB_fobName");
                _state = _prefix + _fobName;
        };
        if !(player getVariable ["KPLIB_nearSector", ""] isEqualTo "") exitWith { //In Sector
                ["large","liberation1","In Game"] call WL_RPC_SetImage;
                _zoneOwned = "Near ";
                _zoneSite = "UKN SEC";
                _nearest_active_sector = "NEARESTNULL";
                _zone_size = "999";

                    _nearest_active_sector = [GRLIB_sector_size] call KPLIB_fnc_getNearestSector; // Get Nearest Active Sector
                    _zone_size = GRLIB_capture_size; //Set the zone size
                    if ( _nearest_active_sector in sectors_bigtown ) then { //Big boi
                        _zone_size = GRLIB_capture_size * 1.4; //Set zone size for big boi
                    };

                    if ( [ markerpos _nearest_active_sector, _zone_size ] call KPLIB_fnc_getSectorOwnership == GRLIB_side_friendly ) then { _zoneOwned = "Patrolling "};
                    if ( [ markerpos _nearest_active_sector, _zone_size ] call KPLIB_fnc_getSectorOwnership == GRLIB_side_enemy ) then { _zoneOwned = "Attacking " };
                    if ( [ markerpos _nearest_active_sector, _zone_size ] call KPLIB_fnc_getSectorOwnership == GRLIB_side_resistance ) then { _zoneOwned = "Attacking "};
                _zoneSite = (markerText (player getVariable "KPLIB_nearSector"));
                _state = _zoneOwned + _zoneSite;
        };    
    };
};

if (_details isEqualTo  "") then { //Fresh startup, loading..
    _details = "Waiting for role..";
    [] call {
        if !(player getVariable ["WL_PlayerRole",""] isEqualTo "") exitWith { //Role Set, Initalize
            if (serverCommandAvailable "#kick") then { //ServerAdmin, he grumpy
                _details = "Grumpy " + (player getVariable "WL_PlayerRole");
            } else {_details = (player getVariable "WL_PlayerRole"); //Normal Player
            };
        };
    };
};

[
    ["UpdateState", _state],["UpdateDetails", _details]
] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

true
