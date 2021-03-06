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
		"0"/*DO NOT REMOVE*/
	];

wolfeMedics = /* Medics */ 
	[
		"76561198201126286", //Diesel
		"76561198196194405", //SBG
		"76561198085828451", //"The Trainee" | Gregg
		"76561198142484281", //McBride
		"76561197964084490", //NaDell
		"76561198162551581", //"4" | N8
		"0", 
		//21st
		"76561197995683487", //Recker
		"76561198101164068", //Vurtex
		"76561198124260122", //Slamm
		"0",
		"0"/*DO NOT REMOVE*/
	];
	
wolfeEngineers = /* Engineers */ 
	[
		"76561198201126286", //Diesel
		"76561198053326389", //aNUL | Greg
		"76561198085828451", //"The Trainee" | Gregg
		"76561197964084490", //NaDell
		"0", 
		//21st
		"76561197995683487", //Recker
		"76561198101164068", //Vurtex
		"76561198124260122", //Slamm
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];
	
wolfeSnipers = /* Snipers (Recon)*/ 
	[
		"76561198201126286", //Diesel
		"76561197964084490", //NaDell
		"76561198079858547 ", //BodyDropper
		"76561198162551581", //"4" | N8
		"0", 
		//21st
		"76561197995683487", //Recker
		"76561198101164068", //Vurtex
		"76561198124260122", //Slamm
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];
	
wolfePilots = /* Pilots */ 
	[
		"76561198053326389", //aNUL | Greg
		"0", 
		//21st
		"76561197995683487", //Recker
		"76561198101164068", //Vurtex
		"76561198124260122", //Slamm
		"0", 
		"0", 
		//Old Bois
		"76561198113980681", //DJ the Ace
		"76561198061065201", //ChiefTJ ACE
		"0", 
		"0", 
		"0"/*DO NOT REMOVE*/
	];

wolfeLogics = /* Logistics Specialist */
	[
		"76561198201126286", //Diesel
		"76561198196194405", //SBG
		"0",
		"0",
		"0",
		"0"/*DO NOT REMOVE*/

	];

wolfeEOD = /*EOD Specialists*/
	[
		"76561198053326389", //aNUL | Greg
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
		"0",
		"0",
		"0",
		"0",
		"0"/*DO NOT REMOVE*/
	];

wolfeCommanders = /* Commanders */
	[
		"76561198201126286", //Diesel
		"0",
		"0"/*DO NOT REMOVE*/	
	];
		
	