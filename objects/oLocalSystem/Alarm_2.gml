/// @description Cycle System

// If Init'd...
if(P.sys != id) { 
	
	if(init_done) {
		
		// Deactivate Bodies
		for(var i = 0; i < ds_list_size(bdyL); i++)
			instance_deactivate_object(bdyL[|i])
		
		// Deactivate NPCs
		if(list_is(npcL)) {
			
			for(var i = 0; i < ds_list_size(npcL); i++) {
				
				npcL[|i].active = f
				instance_deactivate_object(npcL[|i])
				
			}
			
		}
		
	}
	
	// Flags
	active = f
	
	// Deactivate Self
	instance_deactivate_object(id)
	
} else {
	
	#region Activate System
		
		if(list_is(P.sys.npcL))
			for(var i = 0; i < ds_list_size(P.sys.npcL); i++)
				P.sys.npcL[|i].active = t
		
	#endregion
	
	// Flags
	active = t
	
}

// Cycle Flag
cycle = f