/// @description Logic

#region Zoom Update
	
	if(M.z != M.zo) { // Update position (zoom relative)
		
		var sys = P.sys
		var cenxo = sys.cenxo
		var cenyo = sys.cenyo
		var tdist = point_distance(cenxo,cenyo,x,y)
		var tdir = point_direction(cenxo,cenyo,x,y)
		var zd = M.z/M.zo
		x = sys.cenx+cos2(tdir,tdist*zd)
		y = sys.ceny+sin2(tdir,tdist*zd)
		
	}
	
#endregion

#region Base
	
	if(init_done) {
		
		if(a >= amx) fadeOut = t
		if(!fadeOut) a = clamp(a+ai,amn,amx)
		else if(a <= 0) instance_destroy(id)
		else if(!fadeSlow) a -= ai
		else a -= ai/8
		
	}
	
#endregion

#region Apply Velocity
	
	if(init_done) {
		
		x += cos2(dir,vel*M.z)
		y += sin2(dir,vel*M.z)
		
	}
	
#endregion