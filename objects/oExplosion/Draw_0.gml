/// @description

#region Draw Updates
	
	image_blend = blend
	if(dir < 0) dir += 360
	else if(dir >= 360) dir -= 360
	image_angle = dir
	image_xscale = (scl*M.z)*a
	image_yscale = (scl*M.z)*a
	image_alpha = a
	
#endregion

if(init_done)
	draw_self()
