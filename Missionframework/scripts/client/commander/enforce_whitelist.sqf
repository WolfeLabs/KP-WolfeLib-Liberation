scriptName "[WolfeLib] Enforce Whitelist";

private [ "_target", "_playerType", "_idmatch", "_roleID", "_roleIDA", "_finalRole", "_admin"];

waitUntil { alive player };
sleep 1;

_target = player;
_playerType = typeOf _target;
_roleIDA = "";
_finalRole = "err";
_idmatch = false;
_admin = false;

if ( !isNull _target ) then {

		[] call compileFinal preprocessFileLineNumbers "Wolfe\roles\roles.sqf";

		if ( ( getPlayerUID _target ) in wolfeAdmins ) then { //Full Access.
				_roleIDA = "Carebear ";
                _admin = true;
				_idmatch = true;
		};
		if (serverCommandAvailable "#kick") then { 
			_admin = true;
			_idmatch = true;
		};

		switch (_playerType) do {
			
			case "B_Soldier_F" : { //Rifleman, No Checks Needed.
					_roleID = "BABY";
					_idmatch = true;
			};

			case "B_officer_F" : { 
				if ( ( getPlayerUID _target ) in wolfeCommanders  || _admin ) then { // Full Access, they're trusted.
					_roleIDA = "Baby Sitter";
					_roleID = "Command";
					_idmatch = true;
				};
			};

			case "B_medic_F" : {
				if ( ( getPlayerUID _target ) in wolfeMedics || _admin ) then {
					_roleID = "Medic";
					_idmatch = true;					
				};
			};

			case "B_engineer_F" : {
				if ( ( getPlayerUID _target ) in wolfeEngineers || _admin ) then {
					_roleID = "Engineer";
					_idmatch = true;
				};
			};
			
			case "B_sniper_F" : {
				if ( ( getPlayerUID _target ) in wolfeSnipers || _admin ) then {
					_roleID = "Sniper";
					_idmatch = true;
				};
			};
			
			case "B_Helipilot_F" : {
				if ( ( getPlayerUID _target ) in wolfePilots || _admin ) then {
					_roleID = "Pilot";
					_idmatch = true;
				};
			};
			
			case "B_soldier_exp_F" : {
				if ( ( getPlayerUID _target ) in wolfeEOD || _admin ) then {
					_roleID = "EOD Tech";
					_idmatch = true;
				};
			};

			case "B_soldier_UAV_F" : {
				if ( ( getPlayerUID _target ) in wolfeUAV || _admin ) then {
					_roleID = "UAV Operator";
					_idmatch = true;
				};
			};

			case "B_crew_F" : {
				if ( ( getPlayerUID _target ) in wolfeLogics || _admin ) then {
					_roleID = "Logi. Specialist";
					_idmatch = true;
				};
			};

			case "B_recon_medic_F" : {
				if ( _admin ) then {
					_roleID = "Paragod";
					_idmatch = true;
				};
			};

			case "B_recon_TL_F" : {
				if ( _admin ) then {
					_roleID = "Veteran";
					_idmatch = true;
				};
			};

			default { //You are something else, Lobby Kick.
				sleep 1;
				if ( alive _target ) then {
					["Returning to lobby","Unspecified Role"] call KPLIB_fnc_setDiscordState;
					endMission "End2";
				};
			};
		};

	if !(_idmatch) then { //You met no criteria, Lobby Kick.
		sleep 1;
		if ( alive _target ) then {
			["Returning to lobby","Failed role check"] call KPLIB_fnc_setDiscordState;
			endMission "End2";
		};
	};

	if !(_roleIDA isEqualTo "") then { //Admin/Command, Do it UP
		_finalRole = _roleIDA + "(" + _roleID + ")";
	} else { //Normal Player
		_finalRole = _roleID;
	}; 

	_target setVariable ["WL_PlayerRole", _finalRole];
};
