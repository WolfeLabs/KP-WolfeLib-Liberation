/*
    WL_RPC_SetImage.sqf
    [WL] Wolfe

    Takes in 3 variables and uses them to set the images in RPC.

    Parameters recieved as : 
    [type("large"|"small"),imageKey,imageText]

    Defaults to coverart if no vars sent.

	Usage: ["large","liberation1", "Liberation Logo"] call WL_RPC_SetImage;
*/

params [
    [_type, "large", ""],
	[_imageKey, "a3_logo_whblk", ""],
	[_imageText, "Arma 3", ""]
];

switch (_type) do {
	case "large" : {
		[
			["UpdateLargeImageKey", _imageKey],["UpdateLargeImageText",_imageText]
		] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);
	};
	case "small" : {
		[
			["UpdateSmallImageKey", _imageKey],["UpdateSmallImageText",_imageText]
		] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);
	};
	default { return false; };
};

true