private [ "_target"];

waitUntil { alive player };
sleep 1;

_target = player;
_targetRank = KPR_fnc_getRank(_target);
_targetRankName = KRP_fnc_getRankName(_target);
setVariable ["WL_PlayerRankNumber", _targetRank];
setVariable ["WL_PlayerRankName", _targetRankName];




switch (_targetRank) do {
	case "1": { setVariable["WL_PlayerRank","kpd1_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "2": { setVariable["WL_PlayerRank","kpd2_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "3": { setVariable["WL_PlayerRank","kpd2_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "4": { setVariable["WL_PlayerRank","kpd4_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "5": { setVariable["WL_PlayerRank","kpd5_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "6": { setVariable["WL_PlayerRank","kpd6_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "7": { setVariable["WL_PlayerRank","kpd6_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "8": { setVariable["WL_PlayerRank","kpd8_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "9": { setVariable["WL_PlayerRank","kpd18_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "10": { setVariable["WL_PlayerRank","kpd10_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "11": { setVariable["WL_PlayerRank","kpd11_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "12": { setVariable["WL_PlayerRank","kpd12_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "13": { setVariable["WL_PlayerRank","kpd13_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "14": { setVariable["WL_PlayerRank","kpd14_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "15": { setVariable["WL_PlayerRank","kpd15_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "16": { setVariable["WL_PlayerRank","kpd15_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "17": { setVariable["WL_PlayerRank","kpd17_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "18": { setVariable["WL_PlayerRank","kpd18_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	case "19": { setVariable["WL_PlayerRank","kpd19_ca"]; setVariable["WL_PlayerRankName",_targetRankName];};
	default { setVariable["WL_PlayerRank", "a3_logo_whblk"];setVariable["WL_PlayerRankName","Mutt"];};
};