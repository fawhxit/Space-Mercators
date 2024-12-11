/// @description Logic

#region Set Sys?
	
	if(!is(sys,oLocalSystem,f)) {
		
		// Set Sys
		if(is(par,oNPC,f))
			sys = par.sys
		else sys = P.sys
		
	}
	
#endregion

// Main In-Game Logic...
if(M.state == _mode.gameMain and init_done) {
	
	#region System
		
		if(is(sys,oLocalSystem,f)) {
			
			if(sys.state == _mode.main and sys.active) {
				
				#region Sanity Checks
					
					// if Parent is not NPC or not Players, Set Player
					// This also applies if an NPC no longer exists.
					// TODO: IF Player killed?
					if(!is(par,oNPC,f) and !is(par,oPlayer,f))
						par = P
					
				#endregion
				
				#region Zoom Update
					
					if(M.z != M.zo) { // Update position (zoom relative)
						
						var cenxo = sys.cenxo
						var cenyo = sys.cenyo
						var tdist = point_distance(cenxo,cenyo,x,y)
						var tdir = point_direction(cenxo,cenyo,x,y)
						var zd = M.z/M.zo
						x = sys.cenx+cos2(tdir,tdist*zd)
						y = sys.ceny+sin2(tdir,tdist*zd)
						
					}
					
				#endregion
				
				#region Apply Velocity
					
					if(init_done) {
						
						x += cos2(dir,vel*M.z)+(nrtx*M.z)
						y += sin2(dir,vel*M.z)+(nrty*M.z)
						
					}
					
				#endregion
				
			}
		
		}
	
	#endregion
	
}