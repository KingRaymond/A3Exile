/*
View Distance script made by Shix
http://www.exilemod.com/profile/4566-shix/
Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/
*/
/////////////////
//CONFIG
////////////////
_minVeiwDis = 500; //Minimum Veiw Distance
_maxVeiwDist = 2000; //Maximum Veiw Distance

_minObjViewDist = 500; //Minimum Object Veiw Distance
_maxObjViewDist = 2000; //Maximum Object Veiw Distance
/////////////////
//CONFIG END
////////////////

disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

//set XM8 title
(_display displayCtrl 4004) ctrlSetStructuredText (parseText (format ["<t align='center' font='RobotoMedium'>View Distance</t>"]));

_curViewDist = viewDistance;
_curObjViewDist = getObjectViewDistance select 0;

_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;
_dialog = createDialog "CHVD_dialog";
if (!_dialog) exitWith {systemChat "Error: Can't open 'CH View Distance' dialog."};
disableSerialization;

{
	ctrlSetText _x;
} forEach [[1006, str round CHVD_foot],[1007, str round CHVD_footObj],[1013, str round CHVD_car],[1014, str round CHVD_carObj],[1017, str round CHVD_air],[1018, str round CHVD_airObj],[1400, str CHVD_footTerrain],[1401, str CHVD_carTerrain],[1402, str CHVD_airTerrain]];

{
	sliderSetRange [_x select 0, 0, _x select 2];
	sliderSetRange [_x select 3, 0, (_x select 5) min (_x select 1)];
	sliderSetSpeed [_x select 0, 500, 500];
	sliderSetSpeed [_x select 3, 500, 500];
	sliderSetPosition [_x select 0, _x select 1];
	sliderSetPosition [_x select 3, (_x select 4) min (_x select 1)];
} forEach [[1900,CHVD_foot,CHVD_maxView,1901,CHVD_footObj,CHVD_maxObj],[1902,CHVD_car,CHVD_maxView,1903,CHVD_carObj,CHVD_maxObj],[1904,CHVD_air,CHVD_maxView,1905,CHVD_airObj,CHVD_maxObj]];

{
	((finddisplay 2900) displayCtrl (_x select 0)) cbSetChecked (_x select 1);
} forEach [[2800,CHVD_footSyncObj],[2801,CHVD_carSyncObj],[2802,CHVD_airSyncObj]];

{
	_ctrl = ((finddisplay 2900) displayCtrl (_x select 0));
	if (CHVD_allowNoGrass) then {
		_textLow = if (isLocalized "STR_chvd_low") then {localize "STR_chvd_low"} else {"Low"};
		_ctrl lbAdd _textLow;
	};
	_textStandard = if (isLocalized "STR_chvd_standard") then {localize "STR_chvd_standard"} else {"Standard"};
	_ctrl lbAdd _textStandard;
	_textHigh = if (isLocalized "STR_chvd_high") then {localize "STR_chvd_high"} else {"High"};
	_ctrl lbAdd _textHigh;
	_textVeryHigh = if (isLocalized "STR_chvd_veryHigh") then {localize "STR_chvd_veryHigh"} else {"Very High"};
	_ctrl lbAdd _textVeryHigh;
	
	_sel = [_x select 1] call CHVD_fnc_selTerrainQuality;
	if (CHVD_allowNoGrass) then {
		_ctrl lbSetCurSel _sel;
	} else {
		_ctrl lbSetCurSel (_sel - 1);
	};
} forEach [[1500,CHVD_footTerrain],[1501,CHVD_carTerrain],[1502,CHVD_airTerrain]];

{
	_ctrl = ((finddisplay 2900) displayCtrl (_x select 0));
	_handle = _ctrl ctrlSetEventHandler ["LBSelChanged", 
		format ["[_this select 1, '%1', %2] call CHVD_fnc_onLBSelChanged", _x select 1, _x select 2]
	];
} forEach [[1500,"CHVD_footTerrain",1400],[1501,"CHVD_carTerrain",1401],[1502,"CHVD_airTerrain",1402]];


if (CHVD_footSyncObj) then {
	ctrlEnable [1901,false];
	ctrlEnable [1007,false];
} else {	
	ctrlEnable [1901,true];
	ctrlEnable [1007,true];
};

if (CHVD_carSyncObj) then {
	ctrlEnable [1903,false];
	ctrlEnable [1014,false];
} else {	
	ctrlEnable [1903,true];
	ctrlEnable [1014,true];
};

if (CHVD_airSyncObj) then {
	ctrlEnable [1905,false];
	ctrlEnable [1018,false];
} else {	
	ctrlEnable [1905,true];
	ctrlEnable [1018,true];
};