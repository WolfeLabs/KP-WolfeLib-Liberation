private [ "_target"];

waitUntil { alive player };
sleep 1;

_SIK = "";
_SIT = "";
_target = player;
_targetRank = [] call  KPR_fnc_getRank;
_targetRankName = [] call KPR_fnc_getRankName;
_target setVariable ["WL_PlayerRankNumber", _targetRank];
_target setVariable ["WL_PlayerRankName", _targetRankName];


switch (_targetRank) do {
	case 1: { _target setVariable["WL_PlayerRank","kpd1_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 2: { _target setVariable["WL_PlayerRank","kpd2_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 3: { _target setVariable["WL_PlayerRank","kpd2_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 4: { _target setVariable["WL_PlayerRank","kpd4_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 5: { _target setVariable["WL_PlayerRank","kpd5_ca"]; _target setVariable["WL_PlayerRankName","Specialist"];};
	case 6: { _target setVariable["WL_PlayerRank","kpd6_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 7: { _target setVariable["WL_PlayerRank","kpd6_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 8: { _target setVariable["WL_PlayerRank","kpd8_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 9: { _target setVariable["WL_PlayerRank","kpd18_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 10: { _target setVariable["WL_PlayerRank","kpd10_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 11: { _target setVariable["WL_PlayerRank","kpd11_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 12: { _target setVariable["WL_PlayerRank","kpd12_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 13: { _target setVariable["WL_PlayerRank","kpd13_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 14: { _target setVariable["WL_PlayerRank","kpd14_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 15: { _target setVariable["WL_PlayerRank","kpd15_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 16: { _target setVariable["WL_PlayerRank","kpd15_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 17: { _target setVariable["WL_PlayerRank","kpd17_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 18: { _target setVariable["WL_PlayerRank","kpd18_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	case 19: { _target setVariable["WL_PlayerRank","kpd19_ca"]; _target setVariable["WL_PlayerRankName",_targetRankName];};
	default { _target setVariable["WL_PlayerRank", "a3_logo_whblk"]; _target setVariable["WL_PlayerRankName","Mutt"];};
};

if (_SIK isEqualTo "") then {
    [] call {
        if !(_target getVariable ["WL_PlayerRank", ""] isEqualTo "") exitWith {_SIK = _target getVariable "WL_PlayerRank";}
    };
};

if (_SIT isEqualTo "") then {
    [] call {
        if !(_target getVariable ["WL_PlayerRankName", ""] isEqualTo "") exitWith {_SIT = _target getVariable "WL_PlayerRankName";}
    };
};

["small", _SIK, _SIT] call WL_RPC_SetImage;

true