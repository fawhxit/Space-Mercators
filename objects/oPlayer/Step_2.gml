/// @description Olds & Debug Start

/*
if(is(sys,oLocalSystem,t)) {
	
	#region Zoom Update
		
		if(M.z != M.zo) { // Update position (zoom relative)
			
			/*
			var cenxo = sys.cenxo
			var cenyo = sys.cenyo
			var wo = sys.w*M.zo
			var ho = sys.h*M.zo
			var w = sys.w*M.z
			var h = sys.h*M.z
			var wpct = w/wo
			var hpct = h/ho
			/*
			var zd = M.z/M.zo
			var pdist = point_distance(sys.cenxo,sys.cenxo,x,y)
			var pdir = point_direction(sys.cenyo,sys.cenyo,x,y)
			if(orbitDist != noone) orbitDist *= zd
			sysx = sys.cenx+(cos2(pdir,pdist*zd))
			sysy = sys.ceny+(sin2(pdir,pdist*zd))
			
		}
		
	#endregion
	
}
*/

if(is_active_game(id,f,f)) {
	
	#region Basic Olds
		
		#region Universal
			
			// Weapon Offset Old
			wpnVOo = wpnVO
			
		#endregion
		
		#region System
			
			if(is(sys,oLocalSystem,t)) {
				
				if(is_active(sys,t)) {
					
					update_relDiros()
					
				}
				
			}
			
		#endregion
		
	#endregion
	
	#region Direction & Velocity Updates
		
		#region System
			
			if(is(sys,oLocalSystem,f)) {
				
				if(sys.state == _mode.main and sys.active) {
					
					// Update Dir Actual
					diro = dir
					if(!kbSHFT) dir = rot_dir(dir,dirTGT,rot)
					else dir = rot_dir(dir,dirTGT,rot*2)
					
					// Update Velocity Actual
					velo = vel
					if(!kbSHFT) vel = acc_vel(vel,velTGT,acc)
					else vel = acc_vel(vel,velTGT,acc*2)
					
					// Set Velx/y
					velxo = velx
					velyo = vely
					velx = cos2(dir,vel*M.z)
					vely = sin2(dir,vel*M.z)
					
					// Apply Velocity
					sysx += velx
					sysy += vely
					x = sysx
					y = sysy
					
				}
				
			}
			
		#endregion
		
	#endregion
	
	#region Audio Updates
		
		// Listener Orientation
		audio_listener_orientation(lengthdir_x(1, dir), lengthdir_y(1, dir), 1, 0, -1, 0)
		// Main Emitter Update
		audio_emitter_position(mEmt,x+lengthdir_x(1,dir),y+lengthdir_y(1,dir),0)
		
	#endregion
	
	#region Player New GameStart (@Earth)
		
		if(is(startAt,oSystemBody,t) and !startAtDone) {
			
			alarm[2] = 4
			startAtDone = t
			
		}
		
	#endregion

}