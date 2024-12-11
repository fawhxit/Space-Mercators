/// @description Fullscreen

// Do it if safe (determined by delay)
if(tfd <= 0) {
	
	fullscreen = !fullscreen
	window_set_fullscreen(fullscreen)
	alarm[0] = 4
	fullscreen_toggled = t
	
}
