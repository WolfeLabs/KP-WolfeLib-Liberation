/*
	This should, when complete, allow for whitelisted roles on the server.
	
	It will acommplish this through typeOf and UID checks. 
	
*/

waitUntil { alive player };
sleep 2;

wolfeAdmins = /* Full Access */
	[
		"76561198076424327", //"Patches"
		"76561197964255133", //"Reaper"
		"76561198136964498", //"Viking Actual" | "Odin Actual"
		"76561198023469897", //"TIPO" | Anthony
		"0", 
		"0", 
		"0", 
		"0", 
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];

wolfeMedics = /* Medics */ 
	[
		"76561198201126286", //Diesel
		"76561197964084490", //NaDell
		"76561197997830330",//Jade
		"76561198179255682", //Breezy
		"76561197960287930", //Kevin
		"0", 
		"0", 
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];
	
wolfeEngineers = /* Engineers */ 
	[
		"76561198201126286", //Diesel
		"76561197964084490", //NaDell
		"76561197997830330",//Jade 
		"76561198179255682", //Breezy
		"76561198067782774", //Akafog
		"0", 
		"0", 
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];
	
wolfeSnipers = /* Snipers (Recon)*/ 
	[
		"76561198201126286", //Diesel
		"76561197964084490", //NaDell
		"76561197997830330",//Jade
		"76561198179255682", //Breezy
		"76561198335133667", //kyle Jeens
		"0", 
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];
	
wolfePilots = /* Pilots */ 
	[
		//Old Bois
		"76561198113980681", //DJ the Ace
		"76561198061065201", //ChiefTJ ACE
		"76561197964084490", //NaDell 
		"76561197997830330",//Jade 
		"76561198179255682", //Breezy
		"76561197960287930", //Kevin 
		"76561198067782774", //Akafog
		"0", 
		"0"/*DO NOT REMOVE*/
	];

wolfeLogics = /* Logistics Specialist */
	[
		"76561198201126286", //Diesel
		"76561197997830330",//Jade
		"76561198179255682", //Breezy 
		"0", 
		"0", 
		"0", 
		"0",
		"0",
		"0"/*DO NOT REMOVE*/

	];

wolfeEOD = /*EOD Specialists*/
	[
		"76561198179255682", //Breezy
		"0",
		"0",
		"0", 
		"0", 
		"0", 
		"0", 
		"0",
		"0",
		"0"/*DO NOT REMOVE*/
	];

wolfeUAV = /*UAV Intel Specialists*/
	[
		"76561198087449632", //willieyum
		"76561197964084490", //Nadell
		"76561198179255682", //Breezy
		"0", 
		"0", 
		"0", 
		"0", 
		"0",
		"0",
		"0"/*DO NOT REMOVE*/
	];

wolfeCommanders = /* Commanders */
	[
		"76561198201126286", //Diesel
		"76561198179255682", //Breezy
		"0", 
		"0", 
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/	
	];
		
	