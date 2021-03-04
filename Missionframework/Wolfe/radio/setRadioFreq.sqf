/*

Desc: Sets radio freqs on the player.
Author: WolfLabs Patches

*/


params []; 
 
_pluginEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled; // Running that plugin, right? 
 
if (_pluginEnabled) then { 
 
 _hasSW = call TFAR_fnc_haveSWRadio; // You got a SW? 
 _hasLR = call TFAR_fnc_haveLRRadio; // You got a LW? 
 _hasDD = call TFAR_fnc_haveDDRadio; // You got a DD? 
 _activeRadioSW = call TFAR_fnc_ActiveSWRadio; //Grabs Active SW
 _activeAdSWChannel = (_activeRadioSW) call TFAR_fnc_getAdditionalSwChannel; //Active SW Ad Channel
 _activeRadioLR = call TFAR_fnc_activeLRRadio; //Grabs Active LR
 _activeAdLRChannel = (_activeRadioLR) call TFAR_fnc_getAdditionalLrChannel; //Active LR Ad Channel
 
 if (_hasSW) then { 
  // SW radio - channel 1 - SQUAD 1 
  [(_activeRadioSW), 1, "44.1"] call TFAR_fnc_SetChannelFrequency; 
  // SW radio - channel 2 - SQUAD 2 
  [(_activeRadioSW), 2, "44.2"] call TFAR_fnc_SetChannelFrequency; 
  // SW radio - channel 3 - SQUAD 3 
  [(_activeRadioSW), 3, "44.3"] call TFAR_fnc_SetChannelFrequency; 
  // SW radio - channel 4 - AIR 
  [(_activeRadioSW), 4, "45.0"] call TFAR_fnc_SetChannelFrequency; 
  // SW radio - channel 5 - TEAM 
  [(_activeRadioSW), 5, "44.0"] call TFAR_fnc_SetChannelFrequency; 
  // SW radio - channel 6 - LOGI 
  [(_activeRadioSW), 6, "44.4"] call TFAR_fnc_SetChannelFrequency; 
 
 
  //Set SW additional to TEAM  
  [(_activeRadioSW), 4] call TFAR_fnc_setAdditionalSwChannel; 
  //set SW additional to R ear 
  [(_activeRadioSW), 2] call TFAR_fnc_setAdditionalSwStereo; 
 
  //Set SW channel to SQUAD 1 
  [(_activeRadioSW), 0] call TFAR_fnc_setSwChannel; 
  //Set SW channel to L ear 
  [(_activeRadioSW), 1] call TFAR_fnc_setSwStereo; 
 }; 
 
 if (_hasLR) then { 
  // LR radio - channel 1 - SQUAD 1 
  [(_activeRadioLR), 1, "44.1"] call TFAR_fnc_SetChannelFrequency; 
  // LR radio - channel 2 - SQUAD 2 
  [(_activeRadioLR), 2, "44.2"] call TFAR_fnc_SetChannelFrequency; 
  // LR radio - channel 3 - SQUAD 3 
  [(_activeRadioLR), 3, "44.3"] call TFAR_fnc_SetChannelFrequency; 
  // LR radio - channel 4 - AIR 
  [(_activeRadioLR), 4, "45.0"] call TFAR_fnc_SetChannelFrequency; 
  // LR radio - channel 5 - TEAM 
  [(_activeRadioLR), 5, "44.0"] call TFAR_fnc_SetChannelFrequency; 
  // LR radio - channel 6 - LOGI 
  [(_activeRadioLR), 6, "44.4"] call TFAR_fnc_SetChannelFrequency; 
 
 
  //Set LR channel to TEAM 
  [(_activeRadioLR), 4] call TFAR_fnc_setLrChannel; 
  //Set LR channel to R ear 
  [(_activeRadioLR), 2] call TFAR_fnc_setLrStereo; 
 }; 
 
    //Now we're gonna make sure the assholes didn't grab it twice
        _activeAdSWChannel = (_activeRadioSW) call TFAR_fnc_getAdditionalSwChannel; //(Re-grab) Active SW Ad Channel
            if (_activeAdSWChannel != 4) then {

                //They ran it twice, the fucks!

                //Set SW additional to TEAM  
                    [(_activeRadioSW), 4] call TFAR_fnc_setAdditionalSwChannel; 
            } else {
                
                //They should be good then. Do nothing.

            };
    //Should be done and good.

    //Let them know we got them some frequencies.
 	    [] spawn compile preprocessFileLineNumbers "Wolfe\radio\owoNoticesYourRadio.sqf";

} else { 
 "Error: Grabbing Radio Freq." hintC "Enable TFAR on Teamspeak!"; 
};