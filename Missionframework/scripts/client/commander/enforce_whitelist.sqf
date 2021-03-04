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
					_idmatch = true;
				};
			};

			if ( _playerType == "B_engineer_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeEngineers ) then {
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_recon_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeSnipers ) then {
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_Helipilot_F" ) then {
				if ( ( getPlayerUID _target ) in wolfePilots ) then {
					_idmatch = true;
				};
			};
			
			if ( _playerType == "B_solider_exp_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeEOD ) then {
					_idmatch = true;
				};
			};

			if ( _playerType == "B_solider_UAV_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeUAV ) then {
					_idmatch = true;
				};
			};

			if ( _playerType == "B_crew_F" ) then {
				if ( ( getPlayerUID _target ) in wolfeLogics ) then {
					_idmatch = true;
				};
			};

			if ( !isNil "wolfeCommanders" ) then { 
				if ( ( getPlayerUID _target ) in wolfeCommanders ) then { // Full Access, they're trusted.
					_idmatch = true;
				};
			};

			if( _playerType == "B_Soldier_F" ) then { //Rifleman, No Checks Needed.
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
