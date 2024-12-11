/// @description Define Element Structs + Types

#region TOE Enums
	
	// Type Enum
	enum _TOEv {
		
		ALKALI_METAL,
		ALKALINE_EARTH,
		TRANSITION_METAL,
		ICOSAGEN,
		CRYSTALLOGEN,
		PNICTOGEN,
		CHALCOGEN,
		NONMETAL,
		HALOGEN,
		NOBLE_GAS,
		LANTHANIDE,
		ACTINIDE,
		TRANSACTINIDE,
		
	}
	
	// Attribute Enum
	enum _TOEk {
		
		NUM,
		SYM,
		NAM,
		MAS,
		TYP,
		BOI,
		MEL,
		RAD,
		NEG,
		ION,
		DEN,
		eCnt,
		pct,
		amt,
		val,
		valMod
		
	}
	
#endregion

// Element Declaration Template
/*

// Add  Struct to L

i = #
L[|i] = {}
L[|i][$ _TOEk.NUM] = #	// Atomic Number
L[|i][$ _TOEk.SYM] = "" // Symbol
L[|i][$ _TOEk.NAM] = "" // Name
L[|i][$ _TOEk.MAS] = #  // Atmoic Mass
L[|i][$ _TOEk.TYP] = _TOEv. // Metal
L[|i][$ _TOEk.BOI] = # // Boiling (Celcius)
L[|i][$ _TOEk.MEL] = # // Melting (Celcius)
L[|i][$ _TOEk.RAD] = # // Radii *100 = pm (pictometres)
L[|i][$ _TOEk.NEG] = # // Electronegativity (Pauling Scale)
L[|i][$ _TOEk.ION] = # // 1st Ion
L[|i][$ _TOEk.DEN] = # // Density

*/

// Init
// Default Struct
def = {
	
	temp_name : "celcius",
	temp_sym  : "°C",
	sol : power(pi,1), // Solid State
	liq : power(pi,2), // Liquid State
	gas : power(pi,3)  // Gas State
	
}

/*
 * Create List of Structs, a Struct for each Element and its properties
 */

// ToE List Init, Holds a list of maps that define each element.
// Create a counter to keep track of list ids.
L = ds_list_create()

#region Init TOE List

	// Add Hydrogen Struct to L
	/*
	 * L[|i] is a struct of an element
	 */
	var i = 0
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 1
	L[|i][$ _TOEk.SYM] = "H"
	L[|i][$ _TOEk.NAM] = "hydrogen"
	L[|i][$ _TOEk.MAS] = 1.008
	L[|i][$ _TOEk.TYP] = _TOEv.NONMETAL
	L[|i][$ _TOEk.BOI] = -252.9
	L[|i][$ _TOEk.MEL] = -259.1
	L[|i][$ _TOEk.RAD] = 0.25
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 1312
	L[|i][$ _TOEk.DEN] = 0.06
	
	// Add Helium Struct to L
	i = 1
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 2
	L[|i][$ _TOEk.SYM] = "He"
	L[|i][$ _TOEk.NAM] = "helium"
	L[|i][$ _TOEk.MAS] = 4.003
	L[|i][$ _TOEk.TYP] = _TOEv.NOBLE_GAS
	L[|i][$ _TOEk.BOI] = -268.9
	L[|i][$ _TOEk.MEL] = -272.2
	L[|i][$ _TOEk.RAD] = 0.31
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = 2372
	L[|i][$ _TOEk.DEN] = 0.18
	
	// Add Lithium Struct to L
	i = 2
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 3
	L[|i][$ _TOEk.SYM] = "Li"
	L[|i][$ _TOEk.NAM] = "lithium"
	L[|i][$ _TOEk.MAS] = 6.941
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALI_METAL
	L[|i][$ _TOEk.BOI] = 1347
	L[|i][$ _TOEk.MEL] = 180.5
	L[|i][$ _TOEk.RAD] = 1.45
	L[|i][$ _TOEk.NEG] = 0.98
	L[|i][$ _TOEk.ION] = 520.2
	L[|i][$ _TOEk.DEN] = 0.54
	
	// Add Beryllium Struct to L
	i = 3
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 4
	L[|i][$ _TOEk.SYM] = "Be"
	L[|i][$ _TOEk.NAM] = "beryllium"
	L[|i][$ _TOEk.MAS] = 9.012
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALINE_EARTH
	L[|i][$ _TOEk.BOI] = 2970
	L[|i][$ _TOEk.MEL] = 1287
	L[|i][$ _TOEk.RAD] = 1.05
	L[|i][$ _TOEk.NEG] = 1.57
	L[|i][$ _TOEk.ION] = 899.5
	L[|i][$ _TOEk.DEN] = 1.85
	
	// Add Boron Struct to L
	i = 4
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 5
	L[|i][$ _TOEk.SYM] = "B"
	L[|i][$ _TOEk.NAM] = "boron"
	L[|i][$ _TOEk.MAS] = 10.811
	L[|i][$ _TOEk.TYP] = _TOEv.ICOSAGEN
	L[|i][$ _TOEk.BOI] = 3927
	L[|i][$ _TOEk.MEL] = 2076
	L[|i][$ _TOEk.RAD] = 0.85
	L[|i][$ _TOEk.NEG] = 2.04
	L[|i][$ _TOEk.ION] = 800.6
	L[|i][$ _TOEk.DEN] = 2.46
	
	// Add Carbon Struct to L
	i = 5
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 6
	L[|i][$ _TOEk.SYM] = "C"
	L[|i][$ _TOEk.NAM] = "carbon"
	L[|i][$ _TOEk.MAS] = 12.011
	L[|i][$ _TOEk.TYP] = _TOEv.CRYSTALLOGEN
	L[|i][$ _TOEk.BOI] = 4027
	L[|i][$ _TOEk.MEL] = 3527
	L[|i][$ _TOEk.RAD] = 0.70
	L[|i][$ _TOEk.NEG] = 2.55
	L[|i][$ _TOEk.ION] = 1087
	L[|i][$ _TOEk.DEN] = 2.26
	
	// Add Nitrogen Struct to L
	i = 6
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 7
	L[|i][$ _TOEk.SYM] = "N"
	L[|i][$ _TOEk.NAM] = "nitrogen"
	L[|i][$ _TOEk.MAS] = 14.007
	L[|i][$ _TOEk.TYP] = _TOEv.PNICTOGEN
	L[|i][$ _TOEk.BOI] = -195.8
	L[|i][$ _TOEk.MEL] = -210.0
	L[|i][$ _TOEk.RAD] = 0.65
	L[|i][$ _TOEk.NEG] = 3.04
	L[|i][$ _TOEk.ION] = 1402
	L[|i][$ _TOEk.DEN] = 1.25
	
	// Add Oxygen Struct to L
	i = 7
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 8
	L[|i][$ _TOEk.SYM] = "O"
	L[|i][$ _TOEk.NAM] = "oxygen"
	L[|i][$ _TOEk.MAS] = 15.999
	L[|i][$ _TOEk.TYP] = _TOEv.CHALCOGEN
	L[|i][$ _TOEk.BOI] = -182.953
	L[|i][$ _TOEk.MEL] = -259.1
	L[|i][$ _TOEk.RAD] = 0.25
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 1312
	L[|i][$ _TOEk.DEN] = 0.06
	
	// Add Fluorine Struct to L
	i = 8
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 9
	L[|i][$ _TOEk.SYM] = "F"
	L[|i][$ _TOEk.NAM] = "fluorine"
	L[|i][$ _TOEk.MAS] = 18.998
	L[|i][$ _TOEk.TYP] = _TOEv.HALOGEN
	L[|i][$ _TOEk.BOI] = -188.1
	L[|i][$ _TOEk.MEL] = -219.7
	L[|i][$ _TOEk.RAD] = 0.50
	L[|i][$ _TOEk.NEG] = 3.98
	L[|i][$ _TOEk.ION] = 1681
	L[|i][$ _TOEk.DEN] = 1.70
	
	// Add Neon Struct to L
	i = 9
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 10
	L[|i][$ _TOEk.SYM] = "Ne"
	L[|i][$ _TOEk.NAM] = "neon"
	L[|i][$ _TOEk.MAS] = 20.180
	L[|i][$ _TOEk.TYP] = _TOEv.NOBLE_GAS
	L[|i][$ _TOEk.BOI] = -246.0
	L[|i][$ _TOEk.MEL] = -248.6
	L[|i][$ _TOEk.RAD] = 0.38
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = 2081
	L[|i][$ _TOEk.DEN] = 0.90
	
	// Add Sodium Struct to L
	i = 10
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 11
	L[|i][$ _TOEk.SYM] = "Na"
	L[|i][$ _TOEk.NAM] = "sodium"
	L[|i][$ _TOEk.MAS] = 22.990
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALI_METAL
	L[|i][$ _TOEk.BOI] = 882.9
	L[|i][$ _TOEk.MEL] = 97.79
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 0.93
	L[|i][$ _TOEk.ION] = 495.8
	L[|i][$ _TOEk.DEN] = 0.97
	
	// Add Magnesium Struct to L
	i = 11
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 12
	L[|i][$ _TOEk.SYM] = "Mg"
	L[|i][$ _TOEk.NAM] = "magnesium"
	L[|i][$ _TOEk.MAS] = 24.305
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALINE_EARTH
	L[|i][$ _TOEk.BOI] = 1090
	L[|i][$ _TOEk.MEL] = 650.0
	L[|i][$ _TOEk.RAD] = 1.50
	L[|i][$ _TOEk.NEG] = 1.31
	L[|i][$ _TOEk.ION] = 737.7
	L[|i][$ _TOEk.DEN] = 1.74
	
	// Add Aluminum Struct to L
	i = 12
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 13
	L[|i][$ _TOEk.SYM] = "Al"
	L[|i][$ _TOEk.NAM] = "aluminum"
	L[|i][$ _TOEk.MAS] = 26.982
	L[|i][$ _TOEk.TYP] = _TOEv.ICOSAGEN
	L[|i][$ _TOEk.BOI] = 2470
	L[|i][$ _TOEk.MEL] = 660.3
	L[|i][$ _TOEk.RAD] = 1.25
	L[|i][$ _TOEk.NEG] = 1.61
	L[|i][$ _TOEk.ION] = 577.5
	L[|i][$ _TOEk.DEN] = 2.70
	
	// Add Silicon Struct to L
	i = 13
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 14
	L[|i][$ _TOEk.SYM] = "Si"
	L[|i][$ _TOEk.NAM] = "silicon"
	L[|i][$ _TOEk.MAS] = 28.086
	L[|i][$ _TOEk.TYP] = _TOEv.CRYSTALLOGEN
	L[|i][$ _TOEk.BOI] = 3265
	L[|i][$ _TOEk.MEL] = 1414
	L[|i][$ _TOEk.RAD] = 1.10
	L[|i][$ _TOEk.NEG] = 1.90
	L[|i][$ _TOEk.ION] = 786.5
	L[|i][$ _TOEk.DEN] = 2.33
	
	// Add Phosphorus Struct to L
	i = 14
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 15
	L[|i][$ _TOEk.SYM] = "P"
	L[|i][$ _TOEk.NAM] = "phosphorus"
	L[|i][$ _TOEk.MAS] = 30.974
	L[|i][$ _TOEk.TYP] = _TOEv.PNICTOGEN
	L[|i][$ _TOEk.BOI] = 277.0
	L[|i][$ _TOEk.MEL] = 44.15
	L[|i][$ _TOEk.RAD] = 1.00
	L[|i][$ _TOEk.NEG] = 2.19
	L[|i][$ _TOEk.ION] = 1012
	L[|i][$ _TOEk.DEN] = 1.82
	
	// Add Sulfur Struct to L
	i = 15
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 16
	L[|i][$ _TOEk.SYM] = "S"
	L[|i][$ _TOEk.NAM] = "sulfur"
	L[|i][$ _TOEk.MAS] = 32.066
	L[|i][$ _TOEk.TYP] = _TOEv.CHALCOGEN
	L[|i][$ _TOEk.BOI] = 444.6
	L[|i][$ _TOEk.MEL] = 95.30
	L[|i][$ _TOEk.RAD] = 1.00
	L[|i][$ _TOEk.NEG] = 2.58
	L[|i][$ _TOEk.ION] = 999.6
	L[|i][$ _TOEk.DEN] = 1.96
	
	// Add Chlorine Struct to L
	i = 16
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 17
	L[|i][$ _TOEk.SYM] = "Cl"
	L[|i][$ _TOEk.NAM] = "chlorine"
	L[|i][$ _TOEk.MAS] = 35.453
	L[|i][$ _TOEk.TYP] = _TOEv.HALOGEN
	L[|i][$ _TOEk.BOI] = -34.04
	L[|i][$ _TOEk.MEL] = -101.5
	L[|i][$ _TOEk.RAD] = 1.00
	L[|i][$ _TOEk.NEG] = 3.16
	L[|i][$ _TOEk.ION] = 1251
	L[|i][$ _TOEk.DEN] = 3.21
	
	// Add Argon Struct to L
	i = 17
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 18
	L[|i][$ _TOEk.SYM] = "Ar"
	L[|i][$ _TOEk.NAM] = "argon"
	L[|i][$ _TOEk.MAS] = 39.948
	L[|i][$ _TOEk.TYP] = _TOEv.NOBLE_GAS
	L[|i][$ _TOEk.BOI] = -185.8
	L[|i][$ _TOEk.MEL] = -189.3
	L[|i][$ _TOEk.RAD] = 0.71
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = 1521
	L[|i][$ _TOEk.DEN] = 1.78
	
	// Add Potassium Struct to L
	i = 18
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 19
	L[|i][$ _TOEk.SYM] = "K"
	L[|i][$ _TOEk.NAM] = "potassium"
	L[|i][$ _TOEk.MAS] = 39.098
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALI_METAL
	L[|i][$ _TOEk.BOI] = 759.0
	L[|i][$ _TOEk.MEL] = 63.50
	L[|i][$ _TOEk.RAD] = 2.20
	L[|i][$ _TOEk.NEG] = 0.82
	L[|i][$ _TOEk.ION] = 418.8
	L[|i][$ _TOEk.DEN] = 0.86
	
	// Add Calcium Struct to L
	i = 19
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 20
	L[|i][$ _TOEk.SYM] = "Ca"
	L[|i][$ _TOEk.NAM] = "calcium"
	L[|i][$ _TOEk.MAS] = 40.078
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALINE_EARTH
	L[|i][$ _TOEk.BOI] = 1484
	L[|i][$ _TOEk.MEL] = 842.0
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 1.00
	L[|i][$ _TOEk.ION] = 589.8
	L[|i][$ _TOEk.DEN] = 1.55
	
	// Add Scandium Struct to L
	i = 20
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 21
	L[|i][$ _TOEk.SYM] = "Sc"
	L[|i][$ _TOEk.NAM] = "scandium"
	L[|i][$ _TOEk.MAS] = 44.956
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2836
	L[|i][$ _TOEk.MEL] = 1541
	L[|i][$ _TOEk.RAD] = 1.60
	L[|i][$ _TOEk.NEG] = 1.36
	L[|i][$ _TOEk.ION] = 633.1
	L[|i][$ _TOEk.DEN] = 2.99
	
	// Add Titanium Struct to L
	i = 21
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 22
	L[|i][$ _TOEk.SYM] = "Ti"
	L[|i][$ _TOEk.NAM] = "titanium"
	L[|i][$ _TOEk.MAS] = 47.867
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 3287
	L[|i][$ _TOEk.MEL] = 1668
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 1.54
	L[|i][$ _TOEk.ION] = 658.8
	L[|i][$ _TOEk.DEN] = 4.51
	
	// Add Vanadium Struct to L
	i = 22
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 23
	L[|i][$ _TOEk.SYM] = "V"
	L[|i][$ _TOEk.NAM] = "vanadium"
	L[|i][$ _TOEk.MAS] = 50.942
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 3407
	L[|i][$ _TOEk.MEL] = 1910
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.63
	L[|i][$ _TOEk.ION] = 650.9
	L[|i][$ _TOEk.DEN] = 6.11
	
	// Add Chromium Struct to L
	i = 23
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 24
	L[|i][$ _TOEk.SYM] = "Cr"
	L[|i][$ _TOEk.NAM] = "chromium"
	L[|i][$ _TOEk.MAS] = 51.996
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2482
	L[|i][$ _TOEk.MEL] = 1907
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 1.66
	L[|i][$ _TOEk.ION] = 652.9
	L[|i][$ _TOEk.DEN] = 7.14
	
	// Add Manganese Struct to L
	i = 24
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 25
	L[|i][$ _TOEk.SYM] = "Mn"
	L[|i][$ _TOEk.NAM] = "maganese"
	L[|i][$ _TOEk.MAS] = 54.938
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2061
	L[|i][$ _TOEk.MEL] = 1246
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 1.55
	L[|i][$ _TOEk.ION] = 717.3
	L[|i][$ _TOEk.DEN] = 7.47
	
	// Add Iron Struct to L
	i = 25
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 26
	L[|i][$ _TOEk.SYM] = "Fe"
	L[|i][$ _TOEk.NAM] = "iron"
	L[|i][$ _TOEk.MAS] = 55.845
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2861
	L[|i][$ _TOEk.MEL] = 1538
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 1.83
	L[|i][$ _TOEk.ION] = 762.5
	L[|i][$ _TOEk.DEN] = 7.87
	
	// Add Cobalt Struct to L
	i = 26
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 27
	L[|i][$ _TOEk.SYM] = "Co"
	L[|i][$ _TOEk.NAM] = "cobalt"
	L[|i][$ _TOEk.MAS] = 58.933
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2927
	L[|i][$ _TOEk.MEL] = 1495
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.88
	L[|i][$ _TOEk.ION] = 760.4
	L[|i][$ _TOEk.DEN] = 8.90
	
	// Add Nickel Struct to L
	i = 27
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 28
	L[|i][$ _TOEk.SYM] = "Ni"
	L[|i][$ _TOEk.NAM] = "nickel"
	L[|i][$ _TOEk.MAS] = 58.693
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2730
	L[|i][$ _TOEk.MEL] = 1455
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.91
	L[|i][$ _TOEk.ION] = 737.1
	L[|i][$ _TOEk.DEN] = 8.91
	
	// Add Copper Struct to L
	i = 28
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 29
	L[|i][$ _TOEk.SYM] = "Cu"
	L[|i][$ _TOEk.NAM] = "copper"
	L[|i][$ _TOEk.MAS] = 63.546
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2562
	L[|i][$ _TOEk.MEL] = 1085
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.90
	L[|i][$ _TOEk.ION] = 745.5
	L[|i][$ _TOEk.DEN] = 8.92
	
	// Add Zinc Struct to L
	i = 29
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 30
	L[|i][$ _TOEk.SYM] = "Zn"
	L[|i][$ _TOEk.NAM] = "zinc"
	L[|i][$ _TOEk.MAS] = 65.382
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 907.0
	L[|i][$ _TOEk.MEL] = 419.5
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.65
	L[|i][$ _TOEk.ION] = 906.4
	L[|i][$ _TOEk.DEN] = 7.14
	
	// Add Gallium Struct to L
	i = 30
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 31
	L[|i][$ _TOEk.SYM] = "Ga"
	L[|i][$ _TOEk.NAM] = "gallium"
	L[|i][$ _TOEk.MAS] = 69.723
	L[|i][$ _TOEk.TYP] = _TOEv.ICOSAGEN
	L[|i][$ _TOEk.BOI] = 2400
	L[|i][$ _TOEk.MEL] = 29.76
	L[|i][$ _TOEk.RAD] = 1.30
	L[|i][$ _TOEk.NEG] = 1.81
	L[|i][$ _TOEk.ION] = 578.8
	L[|i][$ _TOEk.DEN] = 5.90
	
	// Add Germanium Struct to L
	i = 31
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 32
	L[|i][$ _TOEk.SYM] = "Ge"
	L[|i][$ _TOEk.NAM] = "germanium"
	L[|i][$ _TOEk.MAS] = 72.640
	L[|i][$ _TOEk.TYP] = _TOEv.CRYSTALLOGEN
	L[|i][$ _TOEk.BOI] = 2833
	L[|i][$ _TOEk.MEL] = 938.3
	L[|i][$ _TOEk.RAD] = 1.25
	L[|i][$ _TOEk.NEG] = 1.01
	L[|i][$ _TOEk.ION] = 762.2
	L[|i][$ _TOEk.DEN] = 5.32
	
	// Add Arsenic Struct to L
	i = 32
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 33
	L[|i][$ _TOEk.SYM] = "As"
	L[|i][$ _TOEk.NAM] = "arsenic"
	L[|i][$ _TOEk.MAS] = 74.922
	L[|i][$ _TOEk.TYP] = _TOEv.PNICTOGEN
	L[|i][$ _TOEk.BOI] = 614.0
	L[|i][$ _TOEk.MEL] = 817.0
	L[|i][$ _TOEk.RAD] = 1.15
	L[|i][$ _TOEk.NEG] = 2.18
	L[|i][$ _TOEk.ION] = 944.5
	L[|i][$ _TOEk.DEN] = 5.73
	
	// Add Selenium Struct to L
	i = 33
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 34
	L[|i][$ _TOEk.SYM] = "Se"
	L[|i][$ _TOEk.NAM] = "selenium"
	L[|i][$ _TOEk.MAS] = 78.971
	L[|i][$ _TOEk.TYP] = _TOEv.CHALCOGEN
	L[|i][$ _TOEk.BOI] = 685.0
	L[|i][$ _TOEk.MEL] = 221.0
	L[|i][$ _TOEk.RAD] = 1.15
	L[|i][$ _TOEk.NEG] = 2.55
	L[|i][$ _TOEk.ION] = 941.0
	L[|i][$ _TOEk.DEN] = 4.82
	
	// Add Bromine Struct to L
	i = 34
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 35
	L[|i][$ _TOEk.SYM] = "Br"
	L[|i][$ _TOEk.NAM] = "bromine"
	L[|i][$ _TOEk.MAS] = 79.904
	L[|i][$ _TOEk.TYP] = _TOEv.HALOGEN
	L[|i][$ _TOEk.BOI] = 58.80
	L[|i][$ _TOEk.MEL] = -7.30
	L[|i][$ _TOEk.RAD] = 1.15
	L[|i][$ _TOEk.NEG] = 2.96
	L[|i][$ _TOEk.ION] = 1140
	L[|i][$ _TOEk.DEN] = 3.12
	
	// Add Krypton Struct to L
	i = 35
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 36
	L[|i][$ _TOEk.SYM] = "Kr"
	L[|i][$ _TOEk.NAM] = "krypton"
	L[|i][$ _TOEk.MAS] = 83.798
	L[|i][$ _TOEk.TYP] = _TOEv.NOBLE_GAS
	L[|i][$ _TOEk.BOI] = -153.4
	L[|i][$ _TOEk.MEL] = -157.4
	L[|i][$ _TOEk.RAD] = 0.88
	L[|i][$ _TOEk.NEG] = 3.00
	L[|i][$ _TOEk.ION] = 1351
	L[|i][$ _TOEk.DEN] = 3.75
	
	// Add Rubidium Struct to L
	i = 36
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 37
	L[|i][$ _TOEk.SYM] = "Rb"
	L[|i][$ _TOEk.NAM] = "rubidium"
	L[|i][$ _TOEk.MAS] = 85.468
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALI_METAL
	L[|i][$ _TOEk.BOI] = 688.0
	L[|i][$ _TOEk.MEL] = 39.30
	L[|i][$ _TOEk.RAD] = 2.35
	L[|i][$ _TOEk.NEG] = 0.82
	L[|i][$ _TOEk.ION] = 403.0
	L[|i][$ _TOEk.DEN] = 1.53
	
	// Add Strontium Struct to L
	i = 37
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 38
	L[|i][$ _TOEk.SYM] = "Sr"
	L[|i][$ _TOEk.NAM] = "strontium"
	L[|i][$ _TOEk.MAS] = 87.620
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALINE_EARTH
	L[|i][$ _TOEk.BOI] = 1382
	L[|i][$ _TOEk.MEL] = 777.0
	L[|i][$ _TOEk.RAD] = 2.00
	L[|i][$ _TOEk.NEG] = 0.95
	L[|i][$ _TOEk.ION] = 549.5
	L[|i][$ _TOEk.DEN] = 2.63
	
	// Add Yttrium Struct to L
	i = 38
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 39
	L[|i][$ _TOEk.SYM] = "Y"
	L[|i][$ _TOEk.NAM] = "yttrium"
	L[|i][$ _TOEk.MAS] = 88.906
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2930
	L[|i][$ _TOEk.MEL] = 1526
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 1.22
	L[|i][$ _TOEk.ION] = 599.9
	L[|i][$ _TOEk.DEN] = 4.47
	
	// Add Zirconium Struct to L
	i = 39
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 40
	L[|i][$ _TOEk.SYM] = "Zr"
	L[|i][$ _TOEk.NAM] = "zirconium"
	L[|i][$ _TOEk.MAS] = 91.224
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4377
	L[|i][$ _TOEk.MEL] = 1855
	L[|i][$ _TOEk.RAD] = 1.55
	L[|i][$ _TOEk.NEG] = 1.33
	L[|i][$ _TOEk.ION] = 640.1
	L[|i][$ _TOEk.DEN] = 6.51
	
	// Add Niobium Struct to L
	i = 40
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 41
	L[|i][$ _TOEk.SYM] = "Nb"
	L[|i][$ _TOEk.NAM] = "niobium"
	L[|i][$ _TOEk.MAS] = 92.906
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4744
	L[|i][$ _TOEk.MEL] = 2477
	L[|i][$ _TOEk.RAD] = 1.45
	L[|i][$ _TOEk.NEG] = 1.60
	L[|i][$ _TOEk.ION] = 652.1
	L[|i][$ _TOEk.DEN] = 8.57
	
	// Add Molybdenum Struct to L
	i = 41
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 42
	L[|i][$ _TOEk.SYM] = "Mo"
	L[|i][$ _TOEk.NAM] = "molybdenum"
	L[|i][$ _TOEk.MAS] = 95.951
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4639
	L[|i][$ _TOEk.MEL] = 2623
	L[|i][$ _TOEk.RAD] = 1.45
	L[|i][$ _TOEk.NEG] = 2.16
	L[|i][$ _TOEk.ION] = 684.3
	L[|i][$ _TOEk.DEN] = 10.28
	
	// Add Technetium Struct to L
	i = 42
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 43
	L[|i][$ _TOEk.SYM] = "Tc"
	L[|i][$ _TOEk.NAM] = "technetium"
	L[|i][$ _TOEk.MAS] = 97.907
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4265
	L[|i][$ _TOEk.MEL] = 2157
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.90
	L[|i][$ _TOEk.ION] = 702.4
	L[|i][$ _TOEk.DEN] = 11.49
	
	// Add Ruthenium Struct to L
	i = 43
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 44
	L[|i][$ _TOEk.SYM] = "Ru"
	L[|i][$ _TOEk.NAM] = "ruthenium"
	L[|i][$ _TOEk.MAS] = 101.072
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4150
	L[|i][$ _TOEk.MEL] = 2334
	L[|i][$ _TOEk.RAD] = 1.30
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 710.2
	L[|i][$ _TOEk.DEN] = 12.37
	
	// Add Rhodium Struct to L
	i = 44
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 45
	L[|i][$ _TOEk.SYM] = "Rh"
	L[|i][$ _TOEk.NAM] = "rhodium"
	L[|i][$ _TOEk.MAS] = 102.906
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 3695
	L[|i][$ _TOEk.MEL] = 1964
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 2.28
	L[|i][$ _TOEk.ION] = 719.7
	L[|i][$ _TOEk.DEN] = 12.45
	
	// Add Palladium Struct to L
	i = 45
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 46
	L[|i][$ _TOEk.SYM] = "Pd"
	L[|i][$ _TOEk.NAM] = "palladium"
	L[|i][$ _TOEk.MAS] = 106.421
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2963
	L[|i][$ _TOEk.MEL] = 1555
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 804.4
	L[|i][$ _TOEk.DEN] = 12.02
	
	// Add Silver Struct to L
	i = 46
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 47
	L[|i][$ _TOEk.SYM] = "Ag"
	L[|i][$ _TOEk.NAM] = "silver"
	L[|i][$ _TOEk.MAS] = 107.868
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2210
	L[|i][$ _TOEk.MEL] = 961.8
	L[|i][$ _TOEk.RAD] = 1.60
	L[|i][$ _TOEk.NEG] = 1.93
	L[|i][$ _TOEk.ION] = 731.0
	L[|i][$ _TOEk.DEN] = 10.49
	
	// Add Cadmium Struct to L
	i = 47
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 48
	L[|i][$ _TOEk.SYM] = "Cd"
	L[|i][$ _TOEk.NAM] = "cadmium"
	L[|i][$ _TOEk.MAS] = 112.414
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 767.0
	L[|i][$ _TOEk.MEL] = 321.1
	L[|i][$ _TOEk.RAD] = 1.55
	L[|i][$ _TOEk.NEG] = 1.69
	L[|i][$ _TOEk.ION] = 867.8
	L[|i][$ _TOEk.DEN] = 8.65
	
	// Add Indium Struct to L
	i = 48
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 49
	L[|i][$ _TOEk.SYM] = "In"
	L[|i][$ _TOEk.NAM] = "indium"
	L[|i][$ _TOEk.MAS] = 114.818
	L[|i][$ _TOEk.TYP] = _TOEv.ICOSAGEN
	L[|i][$ _TOEk.BOI] = 2072
	L[|i][$ _TOEk.MEL] = 156.6
	L[|i][$ _TOEk.RAD] = 1.55
	L[|i][$ _TOEk.NEG] = 1.78
	L[|i][$ _TOEk.ION] = 558.3
	L[|i][$ _TOEk.DEN] = 7.31
	
	// Add Tin Struct to L
	i = 49
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 50
	L[|i][$ _TOEk.SYM] = "Sn"
	L[|i][$ _TOEk.NAM] = "tin"
	L[|i][$ _TOEk.MAS] = 118.711
	L[|i][$ _TOEk.TYP] = _TOEv.CRYSTALLOGEN
	L[|i][$ _TOEk.BOI] = 2602
	L[|i][$ _TOEk.MEL] = 231.9
	L[|i][$ _TOEk.RAD] = 1.45
	L[|i][$ _TOEk.NEG] = 1.96
	L[|i][$ _TOEk.ION] = 708.6
	L[|i][$ _TOEk.DEN] = 7.31
	
	// Add Antimony Struct to L
	i = 50
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 51
	L[|i][$ _TOEk.SYM] = "Sb"
	L[|i][$ _TOEk.NAM] = "antimony"
	L[|i][$ _TOEk.MAS] = 121.760
	L[|i][$ _TOEk.TYP] = _TOEv.PNICTOGEN
	L[|i][$ _TOEk.BOI] = 1635
	L[|i][$ _TOEk.MEL] = 630.6
	L[|i][$ _TOEk.RAD] = 1.45
	L[|i][$ _TOEk.NEG] = 2.05
	L[|i][$ _TOEk.ION] = 830.6
	L[|i][$ _TOEk.DEN] = 6.69
	
	// Add Tellurium Struct to L
	i = 51
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 52
	L[|i][$ _TOEk.SYM] = "Te"
	L[|i][$ _TOEk.NAM] = "tellurium"
	L[|i][$ _TOEk.MAS] = 127.603
	L[|i][$ _TOEk.TYP] = _TOEv.CHALCOGEN
	L[|i][$ _TOEk.BOI] = 988.0
	L[|i][$ _TOEk.MEL] = 449.5
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 2.10
	L[|i][$ _TOEk.ION] = 869.3
	L[|i][$ _TOEk.DEN] = 6.24
	
	// Add Iodine Struct to L
	i = 52
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 53
	L[|i][$ _TOEk.SYM] = "I"
	L[|i][$ _TOEk.NAM] = "iodine"
	L[|i][$ _TOEk.MAS] = 126.904
	L[|i][$ _TOEk.TYP] = _TOEv.HALOGEN
	L[|i][$ _TOEk.BOI] = 184.3
	L[|i][$ _TOEk.MEL] = 113.7
	L[|i][$ _TOEk.RAD] = 1.40
	L[|i][$ _TOEk.NEG] = 2.66
	L[|i][$ _TOEk.ION] = 1008
	L[|i][$ _TOEk.DEN] = 4.94
	
	// Add Xenon Struct to L
	i = 53
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 54
	L[|i][$ _TOEk.SYM] = "Xe"
	L[|i][$ _TOEk.NAM] = "xenon"
	L[|i][$ _TOEk.MAS] = 131.294
	L[|i][$ _TOEk.TYP] = _TOEv.NOBLE_GAS
	L[|i][$ _TOEk.BOI] = -108.1
	L[|i][$ _TOEk.MEL] = -111.8
	L[|i][$ _TOEk.RAD] = 1.08
	L[|i][$ _TOEk.NEG] = 2.60
	L[|i][$ _TOEk.ION] = 1170
	L[|i][$ _TOEk.DEN] = 5.90
	
	// Add Caesium Struct to L
	i = 54
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 55
	L[|i][$ _TOEk.SYM] = "Cs"
	L[|i][$ _TOEk.NAM] = "caesium"
	L[|i][$ _TOEk.MAS] = 132.905
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALI_METAL
	L[|i][$ _TOEk.BOI] = 671.0
	L[|i][$ _TOEk.MEL] = 28.50
	L[|i][$ _TOEk.RAD] = 2.60
	L[|i][$ _TOEk.NEG] = 0.79
	L[|i][$ _TOEk.ION] = 375.7
	L[|i][$ _TOEk.DEN] = 1.88
	
	// Add Barium Struct to L
	i = 55
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 56
	L[|i][$ _TOEk.SYM] = "Ba"
	L[|i][$ _TOEk.NAM] = "barium"
	L[|i][$ _TOEk.MAS] = 137.328
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALINE_EARTH
	L[|i][$ _TOEk.BOI] = 1640
	L[|i][$ _TOEk.MEL] = 727.0
	L[|i][$ _TOEk.RAD] = 2.15
	L[|i][$ _TOEk.NEG] = 0.89
	L[|i][$ _TOEk.ION] = 502.9
	L[|i][$ _TOEk.DEN] = 3.51
	
	// Add Lanthanum Struct to L
	i = 56
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 57
	L[|i][$ _TOEk.SYM] = "La"
	L[|i][$ _TOEk.NAM] = "lanthanum"
	L[|i][$ _TOEk.MAS] = 138.905
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3464
	L[|i][$ _TOEk.MEL] = 920.0
	L[|i][$ _TOEk.RAD] = 1.95
	L[|i][$ _TOEk.NEG] = 1.10
	L[|i][$ _TOEk.ION] = 538.1
	L[|i][$ _TOEk.DEN] = 6.15
	
	// Add Cerium Struct to L
	i = 57
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 58
	L[|i][$ _TOEk.SYM] = "Ce"
	L[|i][$ _TOEk.NAM] = "cerium"
	L[|i][$ _TOEk.MAS] = 140.116
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3443
	L[|i][$ _TOEk.MEL] = 795.0
	L[|i][$ _TOEk.RAD] = 1.85
	L[|i][$ _TOEk.NEG] = 1.12
	L[|i][$ _TOEk.ION] = 534.4
	L[|i][$ _TOEk.DEN] = 6.69
	
	// Add Praseodymium Struct to L
	i = 58
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 59
	L[|i][$ _TOEk.SYM] = "Pr"
	L[|i][$ _TOEk.NAM] = "praseodymium"
	L[|i][$ _TOEk.MAS] = 140.908
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3130
	L[|i][$ _TOEk.MEL] = 935.0
	L[|i][$ _TOEk.RAD] = 1.85
	L[|i][$ _TOEk.NEG] = 1.13
	L[|i][$ _TOEk.ION] = 528.1
	L[|i][$ _TOEk.DEN] = 6.40
	
	// Add Neodymiun Struct to L
	i = 59
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 60
	L[|i][$ _TOEk.SYM] = "Nd"
	L[|i][$ _TOEk.NAM] = "neodymium"
	L[|i][$ _TOEk.MAS] = 144.242
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3074
	L[|i][$ _TOEk.MEL] = 1024
	L[|i][$ _TOEk.RAD] = 1.85
	L[|i][$ _TOEk.NEG] = 1.14
	L[|i][$ _TOEk.ION] = 533.1
	L[|i][$ _TOEk.DEN] = 7.01
	
	// Add Prometheum Struct to L
	i = 60
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 61
	L[|i][$ _TOEk.SYM] = "Pm"
	L[|i][$ _TOEk.NAM] = "prometheum"
	L[|i][$ _TOEk.MAS] = 144.000
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3000
	L[|i][$ _TOEk.MEL] = 1042
	L[|i][$ _TOEk.RAD] = 1.85
	L[|i][$ _TOEk.NEG] = 1.13
	L[|i][$ _TOEk.ION] = 538.6
	L[|i][$ _TOEk.DEN] = 7.26
	
	// Add Samrium Struct to L
	i = 61
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 62
	L[|i][$ _TOEk.SYM] = "Sm"
	L[|i][$ _TOEk.NAM] = "samarium"
	L[|i][$ _TOEk.MAS] = 150.362
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 1900
	L[|i][$ _TOEk.MEL] = 1072
	L[|i][$ _TOEk.RAD] = 1.85
	L[|i][$ _TOEk.NEG] = 1.17
	L[|i][$ _TOEk.ION] = 544.5
	L[|i][$ _TOEk.DEN] = 7.35
	
	// Add Europium Struct to L
	i = 62
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 63
	L[|i][$ _TOEk.SYM] = "Eu"
	L[|i][$ _TOEk.NAM] = "europium"
	L[|i][$ _TOEk.MAS] = 151.94
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 1529
	L[|i][$ _TOEk.MEL] = 826.0
	L[|i][$ _TOEk.RAD] = 1.85
	L[|i][$ _TOEk.NEG] = 1.20
	L[|i][$ _TOEk.ION] = 547.1
	L[|i][$ _TOEk.DEN] = 5.24
	
	// Add Gadolinium Struct to L
	i = 63
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 64
	L[|i][$ _TOEk.SYM] = "Gd"
	L[|i][$ _TOEk.NAM] = "gadolinium"
	L[|i][$ _TOEk.MAS] = 157.253
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3000
	L[|i][$ _TOEk.MEL] = 1312
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 1.20
	L[|i][$ _TOEk.ION] = 593.4
	L[|i][$ _TOEk.DEN] = 7.90
	
	// Add Terbium Struct to L
	i = 64
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 65
	L[|i][$ _TOEk.SYM] = "Tb"
	L[|i][$ _TOEk.NAM] = "terbium"
	L[|i][$ _TOEk.MAS] = 158.925
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3123
	L[|i][$ _TOEk.MEL] = 1356
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.10
	L[|i][$ _TOEk.ION] = 565.8
	L[|i][$ _TOEk.DEN] = 8.22
	
	// Add Dysprosium Struct to L
	i = 65
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 66
	L[|i][$ _TOEk.SYM] = "Dy"
	L[|i][$ _TOEk.NAM] = "dysprosium"
	L[|i][$ _TOEk.MAS] = 162.500
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 2567
	L[|i][$ _TOEk.MEL] = 1407
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.22
	L[|i][$ _TOEk.ION] = 573.0
	L[|i][$ _TOEk.DEN] = 8.55
	
	// Add Holmium Struct to L
	i = 66
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 67
	L[|i][$ _TOEk.SYM] = "Ho"
	L[|i][$ _TOEk.NAM] = "holmium"
	L[|i][$ _TOEk.MAS] = 164.930
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 2600
	L[|i][$ _TOEk.MEL] = 1461
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.23
	L[|i][$ _TOEk.ION] = 581.0
	L[|i][$ _TOEk.DEN] = 8.79
	
	// Add Erbium Struct to L
	i = 67
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 68
	L[|i][$ _TOEk.SYM] = "Er"
	L[|i][$ _TOEk.NAM] = "erbium"
	L[|i][$ _TOEk.MAS] = 167.259
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 2868
	L[|i][$ _TOEk.MEL] = 1529
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.24
	L[|i][$ _TOEk.ION] = 589.3
	L[|i][$ _TOEk.DEN] = 9.07
	
	// Add Thulium Struct to L
	i = 68
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 69
	L[|i][$ _TOEk.SYM] = "Tm"
	L[|i][$ _TOEk.NAM] = "thulium"
	L[|i][$ _TOEk.MAS] = 168.934
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 1730
	L[|i][$ _TOEk.MEL] = 1545
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.25
	L[|i][$ _TOEk.ION] = 596.7
	L[|i][$ _TOEk.DEN] = 9.32
	
	// Add Ytterbium Struct to L
	i = 69
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 70
	L[|i][$ _TOEk.SYM] = "Yb"
	L[|i][$ _TOEk.NAM] = "ytterbium"
	L[|i][$ _TOEk.MAS] = 173.054
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 1196
	L[|i][$ _TOEk.MEL] = 824.0
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.10
	L[|i][$ _TOEk.ION] = 603.4
	L[|i][$ _TOEk.DEN] = 6.57
	
	// Add Lutetium Struct to L
	i = 70
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 71
	L[|i][$ _TOEk.SYM] = "Lu"
	L[|i][$ _TOEk.NAM] = "lutetium"
	L[|i][$ _TOEk.MAS] = 174.967
	L[|i][$ _TOEk.TYP] = _TOEv.LANTHANIDE
	L[|i][$ _TOEk.BOI] = 3402
	L[|i][$ _TOEk.MEL] = 1652
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.27
	L[|i][$ _TOEk.ION] = 523.5
	L[|i][$ _TOEk.DEN] = 9.84
	
	// Add Hafnium Struct to L
	i = 71
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 72
	L[|i][$ _TOEk.SYM] = "Hf"
	L[|i][$ _TOEk.NAM] = "hafnium"
	L[|i][$ _TOEk.MAS] = 178.492
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4603
	L[|i][$ _TOEk.MEL] = 2233
	L[|i][$ _TOEk.RAD] = 1.55
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 658.5
	L[|i][$ _TOEk.DEN] = 13.31
	
	// Add Tantalum Struct to L
	i = 72
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 73
	L[|i][$ _TOEk.SYM] = "Ta"
	L[|i][$ _TOEk.NAM] = "tantalum"
	L[|i][$ _TOEk.MAS] = 180.948
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 5458
	L[|i][$ _TOEk.MEL] = 3017
	L[|i][$ _TOEk.RAD] = 1.45
	L[|i][$ _TOEk.NEG] = 1.50
	L[|i][$ _TOEk.ION] = 728.4
	L[|i][$ _TOEk.DEN] = 16.65
	
	// Add Tungsten Struct to L
	i = 73
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 74
	L[|i][$ _TOEk.SYM] = "W"
	L[|i][$ _TOEk.NAM] = "tungsten"
	L[|i][$ _TOEk.MAS] = 183.841
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 5930
	L[|i][$ _TOEk.MEL] = 3422
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 2.36
	L[|i][$ _TOEk.ION] = 758.8
	L[|i][$ _TOEk.DEN] = 19.25
	
	// Add Rhenium Struct to L
	i = 74
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 75
	L[|i][$ _TOEk.SYM] = "Re"
	L[|i][$ _TOEk.NAM] = "rhenium"
	L[|i][$ _TOEk.MAS] = 186.207
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 5596
	L[|i][$ _TOEk.MEL] = 3186
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 1.90
	L[|i][$ _TOEk.ION] = 755.8
	L[|i][$ _TOEk.DEN] = 21.02
	
	// Add Osmium Struct to L
	i = 75
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 76
	L[|i][$ _TOEk.SYM] = "Os"
	L[|i][$ _TOEk.NAM] = "osmium"
	L[|i][$ _TOEk.MAS] = 190.233
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 5012
	L[|i][$ _TOEk.MEL] = 3033
	L[|i][$ _TOEk.RAD] = 1.30
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 814.2
	L[|i][$ _TOEk.DEN] = 22.61
	
	// Add Iridium Struct to L
	i = 76
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 77
	L[|i][$ _TOEk.SYM] = "Ir"
	L[|i][$ _TOEk.NAM] = "iridium"
	L[|i][$ _TOEk.MAS] = 192.217
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 4130
	L[|i][$ _TOEk.MEL] = 2446
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 865.2
	L[|i][$ _TOEk.DEN] = 22.65
	
	// Add Platinum Struct to L
	i = 77
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 78
	L[|i][$ _TOEk.SYM] = "Pt"
	L[|i][$ _TOEk.NAM] = "platinum"
	L[|i][$ _TOEk.MAS] = 195.084
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 3825
	L[|i][$ _TOEk.MEL] = 1768
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 2.28
	L[|i][$ _TOEk.ION] = 864.4
	L[|i][$ _TOEk.DEN] = 21.09
	
	// Add Gold Struct to L
	i = 78
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 79
	L[|i][$ _TOEk.SYM] = "Au"
	L[|i][$ _TOEk.NAM] = "gold"
	L[|i][$ _TOEk.MAS] = 196.967
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 2970
	L[|i][$ _TOEk.MEL] = 1064
	L[|i][$ _TOEk.RAD] = 1.35
	L[|i][$ _TOEk.NEG] = 2.54
	L[|i][$ _TOEk.ION] = 890.1
	L[|i][$ _TOEk.DEN] = 19.32
	
	// Add Mercury Struct to L
	i = 79
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 80
	L[|i][$ _TOEk.SYM] = "Hg"
	L[|i][$ _TOEk.NAM] = "mercury"
	L[|i][$ _TOEk.MAS] = 200.592
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSITION_METAL
	L[|i][$ _TOEk.BOI] = 356.7
	L[|i][$ _TOEk.MEL] = -38.83
	L[|i][$ _TOEk.RAD] = 1.50
	L[|i][$ _TOEk.NEG] = 2.00
	L[|i][$ _TOEk.ION] = 1007
	L[|i][$ _TOEk.DEN] = 13.53
	
	// Add Thallium Struct to L
	i = 80
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 81
	L[|i][$ _TOEk.SYM] = "Tl"
	L[|i][$ _TOEk.NAM] = "thallium"
	L[|i][$ _TOEk.MAS] = 204.383
	L[|i][$ _TOEk.TYP] = _TOEv.ICOSAGEN
	L[|i][$ _TOEk.BOI] = 1473
	L[|i][$ _TOEk.MEL] = 304.0
	L[|i][$ _TOEk.RAD] = 1.90
	L[|i][$ _TOEk.NEG] = 1.62
	L[|i][$ _TOEk.ION] = 589.4
	L[|i][$ _TOEk.DEN] = 11.85
	
	// Add Lead Struct to L
	i = 81
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 82
	L[|i][$ _TOEk.SYM] = "Pb"
	L[|i][$ _TOEk.NAM] = "lead"
	L[|i][$ _TOEk.MAS] = 207.210
	L[|i][$ _TOEk.TYP] = _TOEv.CRYSTALLOGEN
	L[|i][$ _TOEk.BOI] = 1749
	L[|i][$ _TOEk.MEL] = 327.5
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 2.33
	L[|i][$ _TOEk.ION] = 715.6
	L[|i][$ _TOEk.DEN] = 11.34
	
	// Add Bismuth Struct to L
	i = 82
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 83
	L[|i][$ _TOEk.SYM] = "Bi"
	L[|i][$ _TOEk.NAM] = "bismuth"
	L[|i][$ _TOEk.MAS] = 208.980
	L[|i][$ _TOEk.TYP] = _TOEv.PNICTOGEN
	L[|i][$ _TOEk.BOI] = 1564
	L[|i][$ _TOEk.MEL] = 271.5
	L[|i][$ _TOEk.RAD] = 1.60
	L[|i][$ _TOEk.NEG] = 2.02
	L[|i][$ _TOEk.ION] = 703.0
	L[|i][$ _TOEk.DEN] = 9.78
	
	// Add Polonium Struct to L
	i = 83
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 84
	L[|i][$ _TOEk.SYM] = "Po"
	L[|i][$ _TOEk.NAM] = "polonium"
	L[|i][$ _TOEk.MAS] = 208.982
	L[|i][$ _TOEk.TYP] = _TOEv.CHALCOGEN
	L[|i][$ _TOEk.BOI] = 962.0
	L[|i][$ _TOEk.MEL] = 254.0
	L[|i][$ _TOEk.RAD] = 1.90
	L[|i][$ _TOEk.NEG] = 2.00
	L[|i][$ _TOEk.ION] = 812.1
	L[|i][$ _TOEk.DEN] = 9.20
	
	// Add Astatine Struct to L
	i = 84
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 85
	L[|i][$ _TOEk.SYM] = "At"
	L[|i][$ _TOEk.NAM] = "astatine"
	L[|i][$ _TOEk.MAS] = 209.987
	L[|i][$ _TOEk.TYP] = _TOEv.HALOGEN
	L[|i][$ _TOEk.BOI] = 337.0
	L[|i][$ _TOEk.MEL] = 302.0
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 2.20
	L[|i][$ _TOEk.ION] = 930.1
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Radon Struct to L
	i = 85
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 86
	L[|i][$ _TOEk.SYM] = "Rn"
	L[|i][$ _TOEk.NAM] = "radon"
	L[|i][$ _TOEk.MAS] = 222.018
	L[|i][$ _TOEk.TYP] = _TOEv.NOBLE_GAS
	L[|i][$ _TOEk.BOI] = -61.70
	L[|i][$ _TOEk.MEL] = -71.00
	L[|i][$ _TOEk.RAD] = 1.20
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = 1037
	L[|i][$ _TOEk.DEN] = 9.73
	
	// Add Francium Struct to L
	i = 86
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 87
	L[|i][$ _TOEk.SYM] = "Fr"
	L[|i][$ _TOEk.NAM] = "francium"
	L[|i][$ _TOEk.MAS] = 223.020
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALI_METAL
	L[|i][$ _TOEk.BOI] = 677.0
	L[|i][$ _TOEk.MEL] = 27.00
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 0.70
	L[|i][$ _TOEk.ION] = 393.0
	L[|i][$ _TOEk.DEN] = 1.87
	
	// Add Radium Struct to L
	i = 87
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 88
	L[|i][$ _TOEk.SYM] = "Ra"
	L[|i][$ _TOEk.NAM] = "radium"
	L[|i][$ _TOEk.MAS] = 226.025
	L[|i][$ _TOEk.TYP] = _TOEv.ALKALINE_EARTH
	L[|i][$ _TOEk.BOI] = 1737
	L[|i][$ _TOEk.MEL] = 696.0
	L[|i][$ _TOEk.RAD] = 2.15
	L[|i][$ _TOEk.NEG] = 0.90
	L[|i][$ _TOEk.ION] = 509.3
	L[|i][$ _TOEk.DEN] = 5.50
	
	// Add Actinium Struct to L
	i = 88
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 89
	L[|i][$ _TOEk.SYM] = "Ac"
	L[|i][$ _TOEk.NAM] = "actinium"
	L[|i][$ _TOEk.MAS] = 227.028
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 3198
	L[|i][$ _TOEk.MEL] = 1050
	L[|i][$ _TOEk.RAD] = 1.95
	L[|i][$ _TOEk.NEG] = 1.10
	L[|i][$ _TOEk.ION] = 498.8
	L[|i][$ _TOEk.DEN] = 10.07
	
	// Add Thorium Struct to L
	i = 89
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 90
	L[|i][$ _TOEk.SYM] = "Th"
	L[|i][$ _TOEk.NAM] = "thorium"
	L[|i][$ _TOEk.MAS] = 232.038
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 4788
	L[|i][$ _TOEk.MEL] = 1755
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 608.5
	L[|i][$ _TOEk.DEN] = 11.72
	
	// Add Protactinium Struct to L
	i = 90
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 91
	L[|i][$ _TOEk.SYM] = "Pa"
	L[|i][$ _TOEk.NAM] = "protactinium"
	L[|i][$ _TOEk.MAS] = 231.036
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 4027
	L[|i][$ _TOEk.MEL] = 1568
	L[|i][$ _TOEk.RAD] = 1.80
	L[|i][$ _TOEk.NEG] = 1.50
	L[|i][$ _TOEk.ION] = 568.3
	L[|i][$ _TOEk.DEN] = 15.37
	
	// Add Uranium Struct to L
	i = 91
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 92
	L[|i][$ _TOEk.SYM] = "U"
	L[|i][$ _TOEk.NAM] = "uranium"
	L[|i][$ _TOEk.MAS] = 238.029
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 4131
	L[|i][$ _TOEk.MEL] = 1135
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.38
	L[|i][$ _TOEk.ION] = 597.6
	L[|i][$ _TOEk.DEN] = 19.10
	
	// Add Neptunium Struct to L
	i = 92
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 93
	L[|i][$ _TOEk.SYM] = "Np"
	L[|i][$ _TOEk.NAM] = "neptunium"
	L[|i][$ _TOEk.MAS] = 237.048
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 4000
	L[|i][$ _TOEk.MEL] = 644.0
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.36
	L[|i][$ _TOEk.ION] = 604.5
	L[|i][$ _TOEk.DEN] = 20.20
	
	// Add Plutonium Struct to L
	i = 93
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 94
	L[|i][$ _TOEk.SYM] = "Pu"
	L[|i][$ _TOEk.NAM] = "plutonium"
	L[|i][$ _TOEk.MAS] = 244.064
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 3228
	L[|i][$ _TOEk.MEL] = 639.4
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.28
	L[|i][$ _TOEk.ION] = 581.4
	L[|i][$ _TOEk.DEN] = 19.81
	
	// Add Americium Struct to L
	i = 94
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 95
	L[|i][$ _TOEk.SYM] = "Am"
	L[|i][$ _TOEk.NAM] = "americium"
	L[|i][$ _TOEk.MAS] = 243.061
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 2607
	L[|i][$ _TOEk.MEL] = 1176
	L[|i][$ _TOEk.RAD] = 1.75
	L[|i][$ _TOEk.NEG] = 1.13
	L[|i][$ _TOEk.ION] = 576.4
	L[|i][$ _TOEk.DEN] = 12.00
	
	// Add Curium Struct to L
	i = 95
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 96
	L[|i][$ _TOEk.SYM] = "Cm"
	L[|i][$ _TOEk.NAM] = "curium"
	L[|i][$ _TOEk.MAS] = 247.070
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = 3110
	L[|i][$ _TOEk.MEL] = 1340
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.28
	L[|i][$ _TOEk.ION] = 578.1
	L[|i][$ _TOEk.DEN] = 13.51
	
	// Add Berkelium Struct to L
	i = 96
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 97
	L[|i][$ _TOEk.SYM] = "Bk"
	L[|i][$ _TOEk.NAM] = "berkelium"
	L[|i][$ _TOEk.MAS] = 247.070
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 986.0
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 598.0
	L[|i][$ _TOEk.DEN] = 13.25
	
	// Add Californium Struct to L
	i = 97
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 98
	L[|i][$ _TOEk.SYM] = "Cf"
	L[|i][$ _TOEk.NAM] = "californium"
	L[|i][$ _TOEk.MAS] = 251.080
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 900.0
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 606.1
	L[|i][$ _TOEk.DEN] = 15.10
	
	// Add Einsteinium Struct to L
	i = 98
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 99
	L[|i][$ _TOEk.SYM] = "Es"
	L[|i][$ _TOEk.NAM] = "einsteinium"
	L[|i][$ _TOEk.MAS] = 252.083
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 860.0
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 619.4
	L[|i][$ _TOEk.DEN] = 8.84
	
	// Add Fermium Struct to L
	i = 99
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 100
	L[|i][$ _TOEk.SYM] = "Fm"
	L[|i][$ _TOEk.NAM] = "fermium"
	L[|i][$ _TOEk.MAS] = 257.095
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 1527
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 627.2
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Mendelevium Struct to L
	i = 100
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 101
	L[|i][$ _TOEk.SYM] = "Md"
	L[|i][$ _TOEk.NAM] = "mendelevium"
	L[|i][$ _TOEk.MAS] = 258.098
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 827.0
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 634.9
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Nobelium Struct to L
	i = 101
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 102
	L[|i][$ _TOEk.SYM] = "No"
	L[|i][$ _TOEk.NAM] = "nobelium"
	L[|i][$ _TOEk.MAS] = 259.101
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 827.0
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = 1.30
	L[|i][$ _TOEk.ION] = 641.6
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Lawrencium Struct to L
	i = 102
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 103
	L[|i][$ _TOEk.SYM] = "Lr"
	L[|i][$ _TOEk.NAM] = "lawrencium"
	L[|i][$ _TOEk.MAS] = 262.110
	L[|i][$ _TOEk.TYP] = _TOEv.ACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = 1627
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = 472.8
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Rutherfordium Struct to L
	i = 103
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 104
	L[|i][$ _TOEk.SYM] = "Rf"
	L[|i][$ _TOEk.NAM] = "rutherfordium"
	L[|i][$ _TOEk.MAS] = 261.109
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = 578.9
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Dubnium Struct to L
	i = 104
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 105
	L[|i][$ _TOEk.SYM] = "Db"
	L[|i][$ _TOEk.NAM] = "dubnium"
	L[|i][$ _TOEk.MAS] = 262.114
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Seaborgium Struct to L
	i = 105
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 106
	L[|i][$ _TOEk.SYM] = "Sg"
	L[|i][$ _TOEk.NAM] = "seaborgium"
	L[|i][$ _TOEk.MAS] = 266.122
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Bohrium Struct to L
	i = 106
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 107
	L[|i][$ _TOEk.SYM] = "Bh"
	L[|i][$ _TOEk.NAM] = "bohrium"
	L[|i][$ _TOEk.MAS] = 264.120
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Hassium Struct to L
	i = 107
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 108
	L[|i][$ _TOEk.SYM] = "Hs"
	L[|i][$ _TOEk.NAM] = "hassium"
	L[|i][$ _TOEk.MAS] = 277.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Meitnerium Struct to L
	i = 108
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 109
	L[|i][$ _TOEk.SYM] = "Mt"
	L[|i][$ _TOEk.NAM] = "meitnerium"
	L[|i][$ _TOEk.MAS] = 268.139
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Darmstadtium Struct to L
	i = 109
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 110
	L[|i][$ _TOEk.SYM] = "Ds"
	L[|i][$ _TOEk.NAM] = "darmstadtium"
	L[|i][$ _TOEk.MAS] = 281.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Roentgenium Struct to L
	i = 110
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 111
	L[|i][$ _TOEk.SYM] = "Rg"
	L[|i][$ _TOEk.NAM] = "roentgenium"
	L[|i][$ _TOEk.MAS] = 280.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Copernicium Struct to L
	i = 111
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 112
	L[|i][$ _TOEk.SYM] = "Cn"
	L[|i][$ _TOEk.NAM] = "copernicium"
	L[|i][$ _TOEk.MAS] = 285.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Nihonium Struct to L
	i = 112
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 113
	L[|i][$ _TOEk.SYM] = "Nh"
	L[|i][$ _TOEk.NAM] = "nihonium"
	L[|i][$ _TOEk.MAS] = 286.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Flerovium Struct to L
	i = 113
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 114
	L[|i][$ _TOEk.SYM] = "Fl"
	L[|i][$ _TOEk.NAM] = "flerovium"
	L[|i][$ _TOEk.MAS] = 289.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Moscovium Struct to L
	i = 114
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 115
	L[|i][$ _TOEk.SYM] = "Mc"
	L[|i][$ _TOEk.NAM] = "moscovium"
	L[|i][$ _TOEk.MAS] = 289.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Livermorium Struct to L
	i = 115
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 116
	L[|i][$ _TOEk.SYM] = "Lv"
	L[|i][$ _TOEk.NAM] = "livermorium"
	L[|i][$ _TOEk.MAS] = 293.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Tennessine Struct to L
	i = 116
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 117
	L[|i][$ _TOEk.SYM] = "Ts"
	L[|i][$ _TOEk.NAM] = "tennessine"
	L[|i][$ _TOEk.MAS] = 294.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined
	
	// Add Oganesson Struct to L
	i = 117
	L[|i] = {}
	L[|i][$ _TOEk.NUM] = 118
	L[|i][$ _TOEk.SYM] = "Og"
	L[|i][$ _TOEk.NAM] = "oganesson"
	L[|i][$ _TOEk.MAS] = 294.000
	L[|i][$ _TOEk.TYP] = _TOEv.TRANSACTINIDE
	L[|i][$ _TOEk.BOI] = undefined
	L[|i][$ _TOEk.MEL] = undefined
	L[|i][$ _TOEk.RAD] = undefined
	L[|i][$ _TOEk.NEG] = undefined
	L[|i][$ _TOEk.ION] = undefined
	L[|i][$ _TOEk.DEN] = undefined

#endregion

#region TOE Default Struct
	
	// Default/Base Struct
	def[$ _TOEk.amt]  = 10000
	def[$ _TOEk.eCnt] = i+1
	
#endregion