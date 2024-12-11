/// @description Room Resize

// Store Old Size
if(init_done) {
	
	wwo = ww
	who = wh
	
} else {
	
	wwo = DW
	who = DH
	
}

if(fullscreen) {
	
	ww  = DW
	wh = DH
	alarm[2] = 4
	
} else {
	
	ww  = round(DW*.75)
	wh = round(DH*.75)
	window_set_size(ww,wh)
	alarm[1] = 4
	
}

// Store Delta Size
wwd = wwo-ww
whd = who-wh

// Font Scale Pct
fSclx = ww/round(DW*.75)
fScly = wh/round(DH*.75)