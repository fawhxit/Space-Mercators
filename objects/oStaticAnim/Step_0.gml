/// @description Logic

if(active) {
	
	#region Sprite Anim Looping
		
		// Clamp Image Index
		image_index = clamp(image_index,0,image_number)
		
		if(loop) {
			
			if(image_index >= image_number and pingpong)
				image_speed *= -1
			else if(image_index >= image_number)
				image_index = 0
			
		}
		
	#endregion
	
	if(gui) {
		
		// Update Scale
		if(h1 != noone and h2 != noone) {
			
			image_yscale = ((M.wh*h2)-(M.wh*h1))/sprite_get_height(sprTitle)
			image_xscale = image_yscale
			
		}
		
		// Update Position
		x = M.ww*xpct
		y = M.wh*ypct
		
	}
	
	// If rotating, apply rotVel to angle
	add_to_image_angle(id,rotVel)
	
	// Perform movement relative to player
	if(rel) {
		
		update_relVelDir(id)
		apply_relVelDir(id)
		
	}
	
}