/*
	Wolfe Edits get init'd here!
*/

[] spawn compile preprocessFileLineNumbers "Wolfe\init_TFAR.sqf"; //TFAR Init

[] spawn compile preprocessFileLineNumbers "Wolfe\init_ACE_Spray.sqf"; //Ace3 Custom Sprays Init

WL_RPC_SetRank = compileFinal preprocessFileLineNumbers "Wolfe\roles\RPC_SetRank.sqf";// setting discord rich presence rank and role

estimatedTimeLeft 21600; // 6 hours to restart, bois

waitUntil { alive player};
sleep 1;
// Get mission version and readable world name for Discord rich presence
    _hr = floor((ceil (estimatedEndServerTime - serverTime) / 60 / 60));
    _min = floor((floor((ceil (estimatedEndServerTime - serverTime) / 60 /60)) - (ceil (estimatedEndServerTime - serverTime) / 60 /60))*-60);
    [
        ["UpdateDetails", [localize "STR_MISSION_VERSION", "on", getText (configfile >> "CfgWorlds" >> worldName >> "description")] joinString " "],
        ["UpdateEndTimestamp", [_hr,_min]]
    ] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

	
/* Hiya, please keep disabled until we just implement this, cause it's gonna break something if you don't so I need you to keep this disabled for now, thanks, okay? Good. Bye. 
if (isServer) then {
[] spawn compile preprocessFileLineNumbers "Wolfe\extDB3.sqf"; //extDB3 Init 
};
*/