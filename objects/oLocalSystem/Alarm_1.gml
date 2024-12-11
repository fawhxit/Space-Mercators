/// @description Finish Init

// Activate Bodies
for(var i = 0; i < ds_list_size(bdyL); i++)
	bdyL[|i].init_done = t

// Activate System
state = _mode.main
init_done = t

// Go to System
room_goto(rSystem)