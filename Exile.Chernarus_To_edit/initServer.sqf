/*
	diag_log "Start initServer.sqf (Client)";

	execVM "chernarus\Balota.sqf";
	execVM "chernarus\BorTraderAll.sqf";
	execVM "chernarus\KlenTraderAll.sqf";
	execVM "chernarus\NEAAll.sqf";
	execVM "chernarus\StaryTraderAll.sqf";
	execVM "chernarus\KrutoyCap.sqf";


	if (isServer) then {
		call compile preProcessFileLineNumbers "\ExileServer\init.sqf";
		diag_log "\ExileServer\init.sqf invoked";
	};
*/
///////////////////////////////////////////////////////////////////////////////////////////////////
// Russian Roulette
///////////////////////////////////////////////////////////////////////////////////////////////////
/*
_objects =
[
    ["Land_WoodenTable_large_F", [6335.62,7826.62,304.589], 0, false],
    ["Exile_Sign_RussianRoulette", [14623.898,16820.336, 18.950966], 0.77240193, false],
    ["Land_HumanSkull_F", [14621.056, 16821.572, 18.476805], 2.0025947, false],
    ["Land_WheelCart_F", [14621.334,16821.477, 18.355867], 4.9935374, false],
    ["Land_Camping_Light_F", [14628.075,16825.77, 19.00408], 0, true]
    //["Land_SportGround_fence_F", [14625.692, 16818.945, 18.791378], 0.79693103, false], 
    //["Land_SportGround_fence_F", [14633.911, 16816.904, 17.9177], 5.4953084, false], 
    //["Land_CargoBox_V1_F", [14619.726, 16823.613, 18.75972], 5.4931207, false],
];

{
    private ["_object"];

    _object = (_x select 0) createVehicle [0,0,0];
    _object setDir (deg (_x select 2));
    _object setPosWorld (_x select 1);
    _object allowDamage false;
    _object enableSimulation (_x select 3);
    _object enableSimulationGlobal (_x select 3);; // :)
}
forEach _objects;

ExileRouletteChairs = [];

ExileRouletteChairPositions = 
[
    [[6334.62, 7826.62, 304.589], 4.9010592], 
    [[6336.62, 7826.62, 304.589], 1.3332222], 
    [[6335.62, 7824.62, 304.589], 3.1448042], 
    [[6335.62, 7827.62, 304.589], 0], 
    [[6336.62, 7825.62, 304.589], 1.7944603],
    [[6334.62, 7825.62, 304.589], 4.4050193]
];

{
    private ["_chair"];

    _chair = "Land_ChairWood_F" createVehicle [0, 0, 0];
    _chair setDir (deg (_x select 1));
    _chair setPosWorld (_x select 0);
    _chair allowDamage false;
    _chair enableSimulationGlobal true;

    ExileRouletteChairs pushBack _chair;
}
forEach ExileRouletteChairPositions; */

///////////////////////////////////////////////////////////////////////////////////////////////////
// Concrete Mixers
///////////////////////////////////////////////////////////////////////////////////////////////////

_concreteMixers = 
[
	[[11452.7,7450.42,221],  35], // Polana
	[[4555.45,4540.56,233.2],  90], // Kozlovka
	[[2872.29,9729.91,271.697], -40] // Lopatino
];

{
	_concreteMixer = "Exile_ConcreteMixer" createVehicle (_x select 0);
	_concreteMixer setDir (_x select 1);
	_concreteMixer setPosASL (_x select 0);
    _concreteMixer allowDamage false;
    _concreteMixer enableSimulationGlobal true;
}
forEach _concreteMixers;