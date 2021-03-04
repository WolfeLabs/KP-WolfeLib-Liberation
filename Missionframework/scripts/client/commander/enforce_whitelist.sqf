scriptName "[WolfeLib] Enforce Whitelist";

private [ "_target", "_playerType", "_idmatch"];

waitUntil { alive player };
sleep 1;

_target = player;
_playerType = typeOf _target;

if ( !isNull _target ) then {
	if (!(serverCommandAvailable "#kick")) then {

		[] call compileFinal preprocessFileLineNumbers "Wolfe\roles\roles.sqf";

		_idmatch = false;

		if ( !isNil "wolfeAdmins" ) then { 
				if ( ( getPlayerUID _target ) in wolfeAdmins ) then { //Full Access, no typeOf checks.
					_target setVariable ["WL_PlayerRole", "Carebear"];
                    _idmatch = true;
				};
			};
			if ( !isNil "wolfeCommanders" ) then { 
				if ( ( getPlayerUID _target ) in wolfeCommanders ) then { // Full Access, they're trusted.
					_target setVariable ["WL_PlayerRole", "Baby Sitter"];
					_idmatch = true;
				};
		};

		switch (_playerType) do {
			
			case "B_Soldier_F" : { //Rifleman, No Checks Needed.
					_target setVariable ["WL_PlayerRole", "BABY"];
					_idmatch = true;
			};

			case "B_medic_F" : {
				if ( ( getPlayerUID _target ) in wolfeMedics ) then {
					_target setVariable ["WL_PlayerRole", "Medic"];
					_idmatch = true;					
				};
			};

			case "B_engineer_F" : {
				if ( ( getPlayerUID _target ) in wolfeEngineers ) then {
					_target setVariable ["WL_PlayerRole", "Engineer"];
					_idmatch = true;
				};
			};
			
			case "B_recon_F" : {
				if ( ( getPlayerUID _target ) in wolfeSnipers ) then {
					_target setVariable ["WL_PlayerRole", "Sniper"];
					_idmatch = true;
				};
			};
			
			case "B_Helipilot_F" : {
				if ( ( getPlayerUID _target ) in wolfePilots ) then {
					_target setVariable ["WL_PlayerRole", "Pilot"];
					_idmatch = true;
				};
			};
			
			case "B_solider_exp_F" : {
				if ( ( getPlayerUID _target ) in wolfeEOD ) then {
					_target setVariable ["WL_PlayerRole", "EOD Tech"];
					_idmatch = true;
				};
			};

			case "B_solider_UAV_F" : {
				if ( ( getPlayerUID _target ) in wolfeUAV ) then {
					_target setVariable ["WL_PlayerRole", "UAV Operator"];
					_idmatch = true;
				};
			};

			case "B_crew_F" : {
				if ( ( getPlayerUID _target ) in wolfeLogics ) then {
					_target setVariable ["WL_PlayerRole", "Logistics Specialist"];
					_idmatch = true;
				};
			};

			default { //All Checks Failed, Lobby Kick.
				sleep 1;
				if ( alive _target ) then {
					endMission "End2";
				};
			};
		};
	} else { _target setVariable ["WL_PlayerRole", "Grumpy CareBear"]; };
};
