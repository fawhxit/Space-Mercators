/// @description

// Main In-Game Logic...
if(M.state == _mode.gameMain and init_done) {
	
	#region System
		
		if(is(sys,oLocalSystem,f)) {
			
			if(sys.state == _mode.main and sys.active) {
				
				#region Draw Updates
					
					if(!firstFrame or !firstFlash) {
						
						// Init Draw Basics
						image_blend = blend
						if(dir < 0) dir += 360
						else if(dir >= 360) dir -= 360
						// Based on View Perspective
						image_angle = point_direction(xprevious,yprevious,x,y)
						image_alpha = a
						
						if(!velStretch) {
							
							// Static bullet shape/stretch
							image_xscale = (scl*M.z)*a
							image_yscale = (scl*M.z)*a
								
						} else if(velStretch) {
							
							// Stretch bullet based on relative velocity to View
							var velx = (cos2(dir,vel*M.z)+(nrtx*M.z))
							var vely = (sin2(dir,vel*M.z)+(nrty*M.z))
							var relx = abs(velx-V.velx)
							var rely = abs(vely-V.vely)
							var vmod = 2*((abs(velx)+abs(vely))/(vel*M.z))
							var relpct = max(1,(vmod*(((relx+rely)-(velmn*M.z))/((velmx*M.z)-(velmn*M.z)))))
							image_xscale = ((scl*M.z)*a)*(relpct)
							image_yscale = ((scl*M.z)*a)/(relpct)
							
						}
						
					} else {
						
						// This is kind of like an init and needs a parent
						// Otherwise, destroy
						if(is(par,oNPC,f) or is(par,oPlayer,f)){
							
							// Muzzle Flash
							image_blend = cWhite
							image_alpha = 1
							image_angle = 0
							var sclMult = random_range(1,2)
							image_xscale = ((scl*sclMult)*M.z)*a
							image_yscale = ((scl*sclMult)*M.z)*a
							x = par.x+(cos2(dir,par.sprite_height/2)) // Include offset
							y = par.y+(sin2(dir,par.sprite_height/2)) // (Fire from Turret Position)
							firstFrame = f
							
						} else instance_destroy(id)
						
					}
					
				#endregion
				
			}
			
			if(!firstFrame) draw_self()
			
		}
		
	#endregion
	
}
