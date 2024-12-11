/// @description Draw Stars

if((ww != M.ww or wh != M.wh) and active and alarm[0] == -1) {
		
	alarm[0] = 2
	ww = M.ww
	wh = M.wh
	active = f
		
}
	
if(active) {
		
	var sz = array_length(fieldArr)
	for(var i = 0; i < sz; i++) {
		
		var e = fieldArr[i]
		if(P != noone) {
			
			e[0] += ((cos2(dir,vel*relMod)-(P.wpnVOd[0]*relMod))*max(.01,e[3]))*M.z
			e[1] += ((sin2(dir,vel*relMod)-(P.wpnVOd[1]*relMod))*max(.01,e[3]))*M.z
			
		} else {
			
			e[0] += (cos2(dir,vel*relMod)*max(.01,e[3]))*M.z
			e[1] += (sin2(dir,vel*relMod)*max(.01,e[3]))*M.z
			
		}
		var a = e[3]
		var xx = camera_get_view_x(view_camera[0])
		var yy = camera_get_view_y(view_camera[0])
		if(e[6]) a += random_range(-e[3]/4,(1-e[3])/4)
		if(P != noone)
			draw_sprite_ext(e[5],0,e[0]+xx,e[1]+yy,(a*scl)/*M.z*/,
				(a*scl)/*M.z*/,e[4],e[2],a)
		else draw_sprite_ext(e[5],0,e[0],e[1],(a*scl)/*M.z*/,
				(a*scl)/*M.z*/,e[4],e[2],a)
		star_parallax_check(id,e)
			
	}
		
}