// ******************************************************************************************
// * This script is licensed under the GNU Lesser GPL v3.
// ******************************************************************************************

//Configuration for Airdrop Assistance
//Author: Apoc
// https://github.com/osuapoc

// Advanced Banking support. Change false to true if you run Advanced Banking on your server.
APOC_AA_AdvancedBanking = false;

APOC_AA_coolDownTime = 360; //Expressed in sec

APOC_AA_Drops =[
/*
	["Category Name",
		[
			["Text displayed to player",	"Name of vehicle or drop box",	cost, "vehicle or supply (use nothing but these two!"]  //This is an array, use commas between, DUH!
		] //If something breaks with your list of drops, you've likely messed up the nested arrays.
	]
*/

//Also, presently, these are NON-Persistant vehicles.  Meaning that they will not last over a restart.  Keep that in mind with prices.  Later updates I'll set that up, with pin code entry.
	["Vehicles",
		[
			["Quadbike", 		"Exile_Bike_QuadBike_Black", 			800, 	"vehicle"],
			["Kart", 			"Exile_Car_Kart_Black",					400, 	"vehicle"]
		]
	],

	["Weapons",
		[
			["Emergency M4-Drop", 		"airdrop_M4", 				2000, "supply"]
			
		]
	],

	["Supplies",
		[
			["Food (small)",		"airdrop_FoodSmall",			800, "supply"],
			["Food (large)",		"airdrop_FoodLarge",			1500, "supply"]
		]
	],
	["Equipment",
		[
			["Emergency Scuba Suit",		"airdrop_Scuba",			4000, "supply"]
		]
	]
];

APOC_AA_Drop_Contents =[
	["airdrop_M4",  //Name of the drop
		[
		// Item type, Item class(es), # of items, # of magazines per weapon
		// Valid item types: wep, itm, or bac.
			["wep", ["CUP_arifle_M4A1_black"],	 1, 5],
			["itm", ["optic_Arco"],					1],
			["itm", ["CUP_muzzle_snds_M16"],		1],
			["bac", ["B_AssaultPack_blk"],			1]
		]
	],
	

	["airdrop_FoodSmall",
		[
			["itm", ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming"], 5],
			["itm", ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming"], 5],
			["itm", ["Exile_Item_PlasticBottleCoffee","Exile_Item_PlasticBottleFreshWater","Exile_Item_MountainDupe"], 5],
			["itm", ["Exile_Item_PlasticBottleCoffee","Exile_Item_PlasticBottleFreshWater","Exile_Item_MountainDupe"], 5]
		]
	],

	["airdrop_FoodLarge",
		[
			["itm", ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming"], 10],
			["itm", ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming"], 10],
			["itm", ["Exile_Item_PlasticBottleCoffee","Exile_Item_PlasticBottleFreshWater","Exile_Item_MountainDupe"], 10],
			["itm", ["Exile_Item_PlasticBottleCoffee","Exile_Item_PlasticBottleFreshWater","Exile_Item_MountainDupe"], 10]
		]
	],
	["airdrop_Scuba",
		[
			["wep", ["arifle_SDAR_F"],1,5],
			["itm", ["U_B_Wetsuit"],	1],
			["itm", ["V_RebreatherB"],	1],
			["itm", ["G_Diving"],		1]
		]
	]

];
