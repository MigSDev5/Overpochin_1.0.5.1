//	=====
//	SCRIPT NAME: Server Intro Credits Script by IT07
//	SCRIPT VERSION: v1.3.7 BETA
//	Credits for original script: Bohemia Interactive http://bistudio.com
 
//	========== SCRIPT CONFIG ============
_onScreenTime = 7; 		//how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role 
	//NOTE: Above value is not in seconds. It is percentage. Default: 6
 
//	==== CUSTOMIZING THE CREDITS ===
//	If you want more or less credits on the screen, you have to add/remove roles.
//	Watch out though, you need to make sure BOTH role lists match each other in terms of amount.
//	Just take a good look at the _role1 and the rest and you will see what I mean.
 
//	== CUSTOMIZING TEXT COLOR ==
//	Find line 49 and look for: color='#f2cb0b'
//  #f2cb0b is the HTML color code for the text. As well as #FFFFFF in the row below it.
//	Find the color code you want here: http://html-color-codes.info
//	=====
 
//	==== SCRIPT START ====
waitUntil {!isNil "dayz_animalCheck"}; //remove this line completely to make it work in ArmA 3. Yes you read that correctly.
sleep 10; //Wait in seconds before the credits start after player IS ingame
 
_role1 = "Welcome to";
_role1names = ["AeG OverPochIns Taviana PVE"];
_role2 = "Server Admins :";
_role2names = ["ElDubya, Joshua, Rgscriven"];
_role3 = "Right click your ... ";
_role3names = ["... toolbox for a bike, bino's for fog and pistol to kill yourself"];
_role4 = "Server anti-hack<br />by";
_role4names = ["Aussie Epoch Gaming"];
_role5 = "Server Mods #1";				
_role5names = ["Coins","Snap Build Pro","Origins Housing","Right Click Items","Origins Vehicle Trader"];
_role6 = "Server Mods #2";
_role6names = ["Advanced Trading","Plot Management","Mining Areas","Vector Build","Precise Build","Self Bloodbag"];
_role7 = "Server Mods #3";
_role7names = ["Graphic Spawn Select","Gem Traders","No Carry Weight","Trader Safezones","Lift/Tow Vehicles"];
_role8 = "Server Mods #4";
_role8names = ["Support for JSRS/Blastcore Audio and Visual Effects","Folding MV22/SUV gun","Custom Loot Tables"];
_role9 = "This server is ***PVE***";
_role9names = ["Base raiding, theft, griefing or killing/injuring other players WILL get you banned!"];
_role10 = "BE WARNED!";
_role10names = ["If you hack, glitch, dupe or take advantage of Arma2 code flaws, you WILL be banned!"];
_role11 = "If you need an admin...";
_role11names = ["...use our teamspeak server. Any calls for admins over sidechat will be ignored."];
_role12 = "If you want do a mission";
_role12names = ["Call the mission in BLUE global side chat, MARK THE MAP with your name and THEN it's yours."];
_role13 = "For those attempting Sector B ...";
_role13names = ["... make sure you have GOOD gear and LOTS of backup! You'll need it!"];
 
{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	//_finalText = format ["<t size='0.50' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
	_finalText = format ["<t size='0.60' color='#fd0303' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.50' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names],
	[_role9, _role9names],
	[_role10, _role10names],
	[_role11, _role11names],
	[_role12, _role12names],
	[_role13, _role13names] 	//make SURE the last one here does NOT have a , at the end
];