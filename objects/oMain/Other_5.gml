/// @description Cycle Local Systems

// Init
var sz = ds_list_size(D.sys.L)

// For Each System...
for(var i = 0; i < sz; i++) {
	
	// Init
	var e = D.sys.L[|i]
	
	// Cycle System
	instance_activate_object(e.id)
	e.cycle = t
	e.alarm[2] = 4
	
	// If Init'd...
	if(e.init_done) {
		
		// Cycle Bodies
		for(var i2 = 0; i2 < ds_list_size(e.bdyL); i2++)
			instance_activate_object(e.bdyL[|i2])
		
		// Cycle NPCs
		if(list_is(e.npcL)) {
			
			for(var i2 = 0; i2 < ds_list_size(e.npcL); i2++)
				instance_activate_object(e.npcL[|i2])
			
		}
		
	}
	
}

// Reset Cursor?
if(room == rMenu)
	window_set_cursor(cursoro)

// Rem last room
room_prev = room