/// @description System -> Galaxy

#region To Galaxy
	
	if(M.galaxy == noone) init_galaxy()
	else {
		
		M.galaxy.state = _mode.main
		room_goto(rMain)
		
	}
	
	// Movement Values
	gx = prev.gx
	gy = prev.gy
	x = gx+M.galaxy.xx
	y = gy+M.galaxy.yy
	velTGT = 0
	vel = 0
	hyper = f
	stop = t

#endregion