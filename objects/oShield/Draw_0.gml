/// @description Draw Logic

#region Draw Updates
	
	image_blend = blend
	if(dir < 0) dir += 360
	else if(dir >= 360) dir -= 360
	image_angle = dir
	image_xscale = sclw*M.z
	image_yscale = sclh*M.z
	image_alpha = a
	
#endregion

if(init_done)
	draw_self()