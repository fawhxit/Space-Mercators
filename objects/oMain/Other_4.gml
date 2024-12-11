/// @description Inherit Room 2 Room

if((room == rSystem or room == rMenu)
	and is(P,oPlayer,f)) {
	
	if(P.sys != noone and P.sys.init_done) {
		
		room_width = (P.sys.w)*2
		room_height = (P.sys.h)*2
		
	}
	
} else {
	
	room_width  = ww
	room_height = wh
	
}

if(room == rMenu) {
	
	cursoro = window_get_cursor()
	window_set_cursor(cr_default)
	
}

// Set Camera View
camera_set_view_size(view_camera[0],ww,wh)
camera_set_view_target(view_camera[0],oPlayer)
camera_set_view_border(view_camera[0],ww/2,wh/2)

// Finish
alarm[2] = 4
room_init = t

// Start/Stop Stars
if(mainStars != noone) {
	
	if(room == rSystem or room == rMenu)
		mainStars.active = t
	else mainStars.active = f
	
}