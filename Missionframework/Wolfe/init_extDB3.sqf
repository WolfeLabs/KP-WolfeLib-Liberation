/*

	"Oh boy! We did it! extDB3 my dudes!" - Wolfe

	This here sets it allll up, nice and ez.

*/


/* No touch-y below plz*/
	_pass = "extDB3" callExtension "9:LOCAL_TIME:[0,0,0,6,21,12]";
		_pass = dateToNumber _pass;
			_pass str _pass;
	profileNamespace setVarible ["wolfelabsLockDB3", _pass];
	_passerino = ["9:LOCK:",_pass] joinString "";
"extDB3" callExtension "9:ADD_DATABASE:WolfeLabsLib:wolfelabslib4"; //Adds Server & DB 
"extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:WolfeLabsLib:SQL_CUSTOM:wolfelabs:wolfelabslib.ini"; //Hell yeah, custom SQL Calls!
"extDB3" callExtension _passerino; //Locks it down! Security is tight up in here!