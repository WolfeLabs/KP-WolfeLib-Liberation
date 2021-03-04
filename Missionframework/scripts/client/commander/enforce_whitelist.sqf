scriptName "[WolfeLib] Enforce Whitelist";

private [ "_target", "_playerType", "_idmatch"];

waitUntil { alive player };
sleep 1;

_target = player;
_playerType = typeOf _target;

if ( !isNull _target ) then {
	if (!([] call F_isAdmin)) then {

		[] call compileFinal preprocessFileLineNumbers "Wolfe\roles\roles.sqf";

		_idmatch = false;
		while (!(_idmatch)) {
			if ( !isNil "wolfeAdmins" ) then { 
				if ( ( getPlayerUID _target ) in wolfeAdmins ) then { //Full Access, no typeOf checks.
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_medic_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeMedics ) then {
					player setVariable	["WL_PlayerRole", "Medic"];
					_idmatch = true;					
				};
			};

			if ( _playerType == "B_engineer_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeEngineers ) then {
					player setVariable	["WL_PlayerRole", "Engineer"];
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_recon_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeSnipers ) then {
					player setVariable	["WL_PlayerRole", "Sniper"];
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_Helipilot_F" ) then {
				if ( ( getPlayerUID _target ) in wolfePilots ) then {
					player setVariable	["WL_PlayerRole", "Pilot"];
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_solider_exp_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeEOD ) then {
					player setVariable	["WL_PlayerRole", "EOD"];
					_idmatch = true;
				};
			};

			if ( _playerType == "B_solider_UAV_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeUAV ) then {
					player setVariable	["WL_PlayerRole", "UAV Operator"];
					_idmatch = true;
				};
			};

			if ( _playerType == "B_crew_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeLogics ) then {
					player setVariable	["WL_PlayerRole", "Logistics Specialist"];
					_idmatch = true;
				};
			};

			if ( !isNil "wolfeCommanders" ) then { 
				if ( ( getPlayerUID _target ) in wolfeCommanders ) then { // Full Access, they're trusted.
				player setVariable	["WL_PlayerRole", "Baby Sitter"];
					_idmatch = true;
				};
			};

			if( _playerType == "B_Soldier_F" ) then { //Rifleman, No Checks Needed.
			player setVariable	["WL_PlayerRole", "BABY"];
					_idmatch = true;
			};
		};
	if ( !(_idmatch ) ) then { //All Checks Failed, Lobby Kick.

			sleep 1;
			if ( alive _target ) then {
				endMission "End2";
			};
		};
	};
};
