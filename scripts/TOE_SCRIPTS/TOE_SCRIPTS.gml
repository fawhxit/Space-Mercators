function toe_create_local_struct(inst,outliers) {
    
    // Init
    var l = D.TOE.L
    var sz = ds_list_size(l)
	// M.DBGstr2 = "" // Reset DBG Str2 When Debugging this
    
    // Destroy Old Struct?
    if(inst.ES != noone) {
        
        var oArr = variable_struct_get_names(inst.ES)
        for(var i = 0; i < array_length(oArr); i++)
            delete inst.ES[$ oArr[i]]
        
        delete inst.ES
        inst.ES = noone
        
    }
    
    // Generate New Struct of Elements
    // Init ES
    inst.ES = {}
    for(var i = 0; i < sz; i++) {
        
        // Init
        var e = l[|i]
        inst.ES[$ i] = {}
        var es = inst.ES[$ i]
        
        // Base Percent
        es[$ _TOEk.pct] = lerp(random(1/e[$ _TOEk.MAS]),1/(i+1),3/4)
        
        // Natural Adjustments
        if((i >= 5 and i <= 83 and i != 42 and i != 60)
        	or i == 89 or i == 91) {
        	
        	if(i != 25 and i < 60) es[$ _TOEk.pct] *= pi // Base Adjustment
        	else if(i != 25 and i > 60) es[$ _TOEk.pct] *= pi*p67 // Base Adjustment 2
        	else es[$ _TOEk.pct] *= (pi*1.5)   // Iron Base Adjustment (Most Stable Element)
        	if(i%2 != 0) es[$ _TOEk.pct] *= pi/2 // Even Atomic Elements Stability
        	else if(i != 5 and i != 43 and i != 61 and i != 89 and i != 91)
        		es[$ _TOEk.pct] = lerp(es[$ _TOEk.pct],inst.ES[$ i-1][$ _TOEk.pct],random_range(1/3,2/3)) // Even out to prev
        	
        }
        
        #region Outliers (Randomized Systems)
	        
	        if(outliers) {
		        
		        // Abundance Chance
		        if(chance(1) and es[$ _TOEk.pct] < .2) es[$ _TOEk.pct] *= random_range(1,4.9) // Outlier Abundance
		        else if(chance(1) and es[$ _TOEk.pct] < .5) es[$ _TOEk.pct] *= random_range(1,1.9) // Outlier Abundance 2
		        
		        // Scarcity Chance
		        if(i > 0 and chance(((i+1)/sz)*99)) es[$ _TOEk.pct] *= random_range(.1,.5) // Outlier Scarcity
		        
    		}
	        
        #endregion
        
        // Apply Percent to Default Amount
        es[$ _TOEk.amt] = es[$ _TOEk.pct]*D.TOE.def[$ _TOEk.amt]
        
        // Apply Value
        es[$ _TOEk.val] = toe_gen_value(inst.ES,i,inst.exMod)
        
    	// Debug String Append
    	/*
        M.DBGstr2 += string("\n{1}: {0}", string_format(es[$ _TOEk.pct],1,20), e[$ _TOEk.SYM])
        M.DBGstr2 += string("\nSupply: {0}", es[$ _TOEk.amt])
        M.DBGstr2 += string("\nBase/Value: {0}/{1}",D.TOE.L[|i][$ _TOEk.MAS]*((i+1)/D.TOE.def[$ _TOEk.eCnt]),
        	es[$ _TOEk.val])
        */
        
    }
    
}

function toe_get_atomic_type_str(val) {
	
	switch(val) {
		
		case _TOEv.ALKALI_METAL		:	return "ALKALI METAL"
		case _TOEv.ALKALINE_EARTH	:	return "ALKALINE EARTH"
		case _TOEv.TRANSITION_METAL	:	return "TRANSITION METAL"
		case _TOEv.ICOSAGEN			:	return "ICOSAGEN"
		case _TOEv.CRYSTALLOGEN		:	return "CRYSTALLOGEN"
		case _TOEv.PNICTOGEN		:	return "PNICTOGEN"
		case _TOEv.CHALCOGEN		:	return "CHALOCOGEN"
		case _TOEv.NONMETAL			:	return "NONMETAL"
		case _TOEv.HALOGEN			: 	return "HALOGEN"
		case _TOEv.NOBLE_GAS		:	return "NOBLE GAS"
		case _TOEv.LANTHANIDE		:	return "LANTHANIDE"
		case _TOEv.ACTINIDE			:	return "ACTINIDE"
		case _TOEv.TRANSACTINIDE	:	return "TRANSACTINIDE"
		default						:	return "UNKNOWN"
		
	}
	
}

function toe_gen_value(tES,i,valMod) {
	
    // Generate Value
    var ret = D.TOE.L[|i][$ _TOEk.MAS]*((i+1)/D.TOE.def[$ _TOEk.eCnt]) // Base Value Calc
    ret *= D.TOE.def[$ _TOEk.amt]/tES[$ i][$ _TOEk.amt] // Value Supply Mod
    ret *= valMod // Apply System Value Mod
    return ret
	
}

function toe_get_density(inst,i) {
	
	// Instance is Player or NPC?
	if(is(inst,oPlayer,f) or is(inst,oNPC,t)) {
		
		// Init Refs
		var e = D.TOE.L[| i]
		var den   = e[$ _TOEk.DEN]
		var eMelt = e[$ _TOEk.MEL]
		var eBoil = e[$ _TOEk.BOI]
		var temp  = inst.cargo.temperature
		
		// Return Size based on state
		if (temp < eMelt) return D.TOE.def.sol*den
		else if (temp < eBoil) return D.TOE.def.liq*den
		else return D.TOE.def.gas*den
			
		
	}
	
	return NaN
	
}