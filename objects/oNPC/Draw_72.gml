/// @description AI Logic

if(M.state == _mode.gameMain and init_done) {
	
	#region System
		
		if(sys != noone and active) {
			
			if(sys.state == _mode.main and sys.active) {
				
				#region Sanity Checks
					
					// Target List
					tgtL = list_sanity(tgtL)
					// Child List
					chiL = list_sanity(chiL)
					
				#endregion
				
				#region Weapon Powered
					
					// Enable/Disable Weapon?
					if(list_is(tgtL)) wpnRdy = t
					else wpnRdy = f
						
					if(wpnRdy) {
						
						// Get Tgt
						var tgt = noone
						var sz = ds_list_size(tgtL)
						for(var i = 0; i < sz; i++) {
							
							var e = tgtL[|i]
							var tDist = point_distance(x,y,e.x,e.y)
							if(tDist <= v.sr.s.r) {
								
								tgt = e
								break
								
							}
							
						}
						
						wpni += 1
						if(wpni >= wpnDel and tgt != noone) {
							
							var wpnDir = point_direction(x,y,tgt.x,tgt.y)
							var e = instance_create_layer(x,y,"FG2",oProj)
							e.par = id
							e.blend = cNeonGreen
							e.dir = wpnDir+random_range(-10,10)
							e.nrtx = cos2(dir,vel)
							e.nrty = sin2(dir,vel)
							x += e.nrtx*M.z
							y += e.nrty*M.z
							e.init_done = t
							
							wpni = 0
							
						}
						
					} else wpni = 0
					
				#endregion
				
				#region Simple AI
	
					if(aiMode == _ai.simple and extTGT != noone and init_done) {
		
						// Init
						dirTGT = point_direction(x,y,extTGT.x,extTGT.y)
						var tdist = point_distance(extTGT.x,extTGT.y,x,y)
		
						// Done?
						if(tdist <= (sprite_width/2)+(vel*M.z)) instance_destroy(id)
		
						// Do Velocity/Acceleration
						// Note: dird2 is for overall angle difference behavior
						// The bigger the difference, the more aggressive
						// the turning is past 45 degrees
						// and if the distance is just outside the vessel (tdistMod)
						// Vel to VelTGT
						var dird2 = abs(angle_difference(dirTGT,dir))
						var tdistMod = 1
						// Set tdistMod for turning more aggressively when approaching tgt dest
						// (Used as a PCT) Also, Account for Velocity
						if(sprite_width >= sprite_height)
							tdistMod = min(1,max(0,(tdist/(sprite_width+(vel*M.z)))-1))
						else tdistMod = min(1,max(0,(tdist/(sprite_height+(vel*M.z)))-1))
						var tacc = acc
						// Hyper? Set spd and acc appropriately
						if(hyper) {
							tacc*=2
							velTGT = hspd
						} else velTGT = spd
						// Slow down the more past 45 degree difference to destination
						var tvelTGT = velTGT/(max(1,2*(dird2/45)))
						// Apply tdistMod when angle is not aligned to destination
						if(dird2 >= 5) {
			
							tvelTGT*=tdistMod
							if(!hyper) tacc*=2 // double accel if not hyper (which would already be doubled)
			
						}
						// Finally, apply Acceleration
						if(abs(tvelTGT-vel) <= tacc) vel = tvelTGT
						else if(tvelTGT > vel) vel += tacc
						else if(tvelTGT < vel) vel -= tacc
						// Do Rotation
						var trot = rot
						// If angle difference is over 45, apply more rotation upto 2x the bigger the diff
						// Otherwise apply tdistMod to rotation if it would make a difference
						if(dird2 >= 45) trot*=min(2,max(1,dird2/45))
						else if(dird2 != 0 and tdistMod < 1)
							trot*=2-tdistMod
						// Get direction difference
						var dird = abs(dirTGT-dir) < 180
						// Get direction diff polarity
						var dirp = (dirTGT-dir) > 0
						// Finally, apply Rotation
						if(abs(dirTGT-dir) <= trot) dir = dirTGT
						else if(dird and dirp) dir += trot
						else if(!dird and dirp) dir -= trot
						else if(dird and !dirp) dir -= trot
						else if(!dird and !dirp) dir += trot
						// Loop Dir
						if(dir < 0) dir += 360
						else if(dir >= 360) dir -= 360
						// Actualize Velocity+Rotation
						x += cos2(dir,vel*M.z)
						y += sin2(dir,vel*M.z)
		
					}
	
				#endregion
				
				#region Move To AI
	
					if(aiMode == _ai.moveTo and xyTGT != noone and init_done) {
		
						// Init
						dirTGT = point_direction(x,y,xyTGT[0],xyTGT[1])
						var tdist = point_distance(xyTGT[0],xyTGT[1],x,y)
		
						// Done?
						if(tdist <= (sprite_width/2)+(vel*M.z)) {
			
							dirTGT = dir+random_range(-45,45)
							velTGT = 0
							xyTGT = noone
							alarm[1] = room_speed*random_range(.2,5)
			
						} else velTGT = spd
		
						// Do Velocity/Acceleration
						// Note: dird2 is for overall angle difference behavior
						// The bigger the difference, the more aggressive
						// the turning is past 45 degrees
						// and if the distance is just outside the vessel (tdistMod)
						// Vel to VelTGT
						var dird2 = abs(angle_difference(dirTGT,dir))
						var tdistMod = 1
						// Set tdistMod for turning more aggressively when approaching tgt dest
						// (Used as a PCT) Also, Account for Velocity
						if(sprite_width >= sprite_height)
							tdistMod = min(1,max(0,(tdist/(sprite_width+(vel*M.z)))-1))
						else tdistMod = min(1,max(0,(tdist/(sprite_height+(vel*M.z)))-1))
						var tacc = acc
						// Hyper? Set spd and acc appropriately
						if(hyper) {
							tacc*=2
							velTGT = hspd
						} else velTGT = spd
						// Slow down the more past 45 degree difference to destination
						var tvelTGT = velTGT/(max(1,2*(dird2/45)))
						// Apply tdistMod when angle is not aligned to destination
						if(dird2 >= 5) {
			
							tvelTGT*=tdistMod
							if(!hyper) tacc*=2 // double accel if not hyper (which would already be doubled)
			
						}
						// Finally, apply Acceleration
						if(abs(tvelTGT-vel) <= tacc) vel = tvelTGT
						else if(tvelTGT > vel) vel += tacc
						else if(tvelTGT < vel) vel -= tacc
						// Do Rotation
						var trot = rot
						// If angle difference is over 45, apply more rotation upto 2x the bigger the diff
						// Otherwise apply tdistMod to rotation if it would make a difference
						if(dird2 >= 45) trot*=min(2,max(1,dird2/45))
						else if(dird2 != 0 and tdistMod < 1)
							trot*=2-tdistMod
						// Get direction difference
						var dird = abs(dirTGT-dir) < 180
						// Get direction diff polarity
						var dirp = (dirTGT-dir) > 0
						// Finally, apply Rotation
						if(abs(dirTGT-dir) <= trot) dir = dirTGT
						else if(dird and dirp) dir += trot
						else if(!dird and dirp) dir -= trot
						else if(dird and !dirp) dir -= trot
						else if(!dird and !dirp) dir += trot
						// Loop Dir
						if(dir < 0) dir += 360
						else if(dir >= 360) dir -= 360
						// Actualize Velocity+Rotation
						x += cos2(dir,vel*M.z)
						y += sin2(dir,vel*M.z)
		
					} else if(aiMode == _ai.moveTo and init_done) {
		
						// Do Velocity/Acceleration (w/o tdist; no xyTGT)
						// Note: dird2 is for overall angle difference behavior
						// The bigger the difference, the more aggressive
						// the turning is past 45 degrees
						// Vel to VelTGT
						var dird2 = abs(angle_difference(dirTGT,dir))
						var tacc = acc
						// Hyper? Set spd and acc appropriately
						if(hyper) tacc*=2
						velTGT = 0
						// Slow down the more past 45 degree difference to destination
						var tvelTGT = velTGT/(max(1,2*(dird2/45)))
						// Finally, apply Acceleration
						if(abs(tvelTGT-vel) <= tacc) vel = tvelTGT
						else if(tvelTGT > vel) vel += tacc
						else if(tvelTGT < vel) vel -= tacc
						// Do Rotation (w/o tdist; no xyTGT)
						var trot = rot
						// If angle difference is over 45, apply more rotation upto 2x the bigger the diff
						// Otherwise apply tdistMod to rotation if it would make a difference
						if(dird2 >= 45) trot*=min(2,max(1,dird2/45))
						// Get direction difference
						var dird = abs(dirTGT-dir) < 180
						// Get direction diff polarity
						var dirp = (dirTGT-dir) > 0
						// Finally, apply Rotation
						if(abs(dirTGT-dir) <= trot) dir = dirTGT
						else if(dird and dirp) dir += trot
						else if(!dird and dirp) dir -= trot
						else if(dird and !dirp) dir -= trot
						else if(!dird and !dirp) dir += trot
						// Loop Dir
						if(dir < 0) dir += 360
						else if(dir >= 360) dir -= 360
						// Actualize Velocity+Rotation
						x += cos2(dir,vel*M.z)
						y += sin2(dir,vel*M.z)
		
					}
	
				#endregion
				
				#region Parent Patrol AI
	
					if(par != noone) {
		
						if(instance_exists(par) and init_done) {
			
							if(aiMode == _ai.patrolParent and xyTGT != noone) {
				
								// Init
								dirTGT = point_direction(x,y,xyTGT[0],xyTGT[1])
								var tdist = point_distance(xyTGT[0],xyTGT[1],x,y)
								var pdist = point_distance(x,y,par.x,par.y)
				
								// Relative Update?
								if(relTGT) {
					
									xyTGT[0] = par.x+cos2(relTGTDir,relTGTDist)
									xyTGT[1] = par.y+sin2(relTGTDir,relTGTDist)
									tdist = point_distance(xyTGT[0],xyTGT[1],x,y)
									if(par.vel == 0)
										velTGT = spd*(max(.6,tdist/(par.patrolDist))+max(.6,pdist/(par.patrolDist)))
									else velTGT = (par.vel*max(.6,pdist/(par.patrolDist)))+(spd*max(.6,tdist/(par.patrolDist)))
					
								}
				
								// XY Out of Perim?
								if(point_distance(xyTGT[0],xyTGT[1],par.x,par.y) > par.patrolDist) {
					
									xyTGT = noone
									alarm[1] = 1
					
								} else if(tdist <= (sprite_width/2)+(vel*M.z)) { // At xyTGT?
					
									dirTGT = dir+random_range(-45,45)
									velTGT = 0
									xyTGT = noone
									alarm[1] = room_speed*random_range(.2,5)
					
								}
				
								// Do Velocity/Acceleration
								// Note: dird2 is for overall angle difference behavior
								// The bigger the difference, the more aggressive
								// the turning is past 45 degrees
								// and if the distance is just outside the vessel (tdistMod)
								// Vel to VelTGT
								var dird2 = abs(angle_difference(dirTGT,dir))
								var tdistMod = 1
								// Set tdistMod for turning more aggressively when approaching tgt dest
								// (Used as a PCT) Also, Account for Velocity
								if(sprite_width >= sprite_height)
									tdistMod = min(1,max(0,(tdist/(sprite_width+(vel*M.z)))-1))
								else tdistMod = min(1,max(0,(tdist/(sprite_height+(vel*M.z)))-1))
								var tacc = acc
								// Hyper? Set spd and acc appropriately
								if(hyper) {
									tacc*=2
									velTGT = hspd
								} else velTGT = spd
								// Slow down the more past 45 degree difference to destination
								var tvelTGT = velTGT/(max(1,2*(dird2/45)))
								// Apply tdistMod when angle is not aligned to destination
								if(dird2 >= 5) {
					
									tvelTGT*=tdistMod
									if(!hyper) tacc*=2 // double accel if not hyper (which would already be doubled)
					
								}
								// Finally, apply Acceleration
								if(abs(tvelTGT-vel) <= tacc) vel = tvelTGT
								else if(tvelTGT > vel) vel += tacc
								else if(tvelTGT < vel) vel -= tacc
								// Do Rotation
								var trot = rot
								// If angle difference is over 45, apply more rotation upto 2x the bigger the diff
								// Otherwise apply tdistMod to rotation if it would make a difference
								if(dird2 >= 45) trot*=min(2,max(1,dird2/45))
								else if(dird2 != 0 and tdistMod < 1)
									trot*=2-tdistMod
								// Get direction difference
								var dird = abs(dirTGT-dir) < 180
								// Get direction diff polarity
								var dirp = (dirTGT-dir) > 0
								// Finally, apply Rotation
								if(abs(dirTGT-dir) <= trot) dir = dirTGT
								else if(dird and dirp) dir += trot
								else if(!dird and dirp) dir -= trot
								else if(dird and !dirp) dir -= trot
								else if(!dird and !dirp) dir += trot
								// Loop Dir
								if(dir < 0) dir += 360
								else if(dir >= 360) dir -= 360
								// Actualize Velocity+Rotation
								x += cos2(dir,vel*M.z)
								y += sin2(dir,vel*M.z)
				
							} else if(aiMode == _ai.patrolParent) {
				
								// Do Velocity/Acceleration (w/o tdist; no xyTGT)
								// Note: dird2 is for overall angle difference behavior
								// The bigger the difference, the more aggressive
								// the turning is past 45 degrees
								// Vel to VelTGT
								var dird2 = abs(angle_difference(dirTGT,dir))
								var tacc = acc
								// Hyper? Set spd and acc appropriately
								if(hyper) tacc*=2
								velTGT = 0
								// Slow down the more past 45 degree difference to destination
								var tvelTGT = velTGT/(max(1,2*(dird2/45)))
								// Finally, apply Acceleration
								if(abs(tvelTGT-vel) <= tacc) vel = tvelTGT
								else if(tvelTGT > vel) vel += tacc
								else if(tvelTGT < vel) vel -= tacc
								// Do Rotation (w/o tdist; no xyTGT)
								var trot = rot
								// If angle difference is over 45, apply more rotation upto 2x the bigger the diff
								// Otherwise apply tdistMod to rotation if it would make a difference
								if(dird2 >= 45) trot*=min(2,max(1,dird2/45))
								// Get direction difference
								var dird = abs(dirTGT-dir) < 180
								// Get direction diff polarity
								var dirp = (dirTGT-dir) > 0
								// Finally, apply Rotation
								if(abs(dirTGT-dir) <= trot) dir = dirTGT
								else if(dird and dirp) dir += trot
								else if(!dird and dirp) dir -= trot
								else if(dird and !dirp) dir -= trot
								else if(!dird and !dirp) dir += trot
								// Loop Dir
								if(dir < 0) dir += 360
								else if(dir >= 360) dir -= 360
								// Actualize Velocity+Rotation
								x += cos2(dir,vel*M.z)
								y += sin2(dir,vel*M.z)
				
							}
			
						} else if(!instance_exists(par)) {
			
							par = noone
							if(aiMode == _ai.patrolParent) aiMode = _ai.moveTo
							if(xyTGT == noone) {
				
								dirTGT = dir+random_range(-45,45)
								velTGT = 0
								xyTGT = noone
								alarm[1] = room_speed*random_range(.2,5)
				
							}
			
						}
		
					}
	
				#endregion
				
				#region Parent Return AI
	
					if(par != noone) {
		
						if(instance_exists(par) and init_done) {
			
							if(aiMode == _ai.exitParent) {
				
								// Init
								dirTGT = point_direction(x,y,par.x,par.y)
								var tdist = point_distance(par.x,par.y,x,y)
				
								// Done?
								if(tdist <= (sprite_width/2)+(vel*M.z)) instance_destroy(id)
								else velTGT = par.vel*(1+(1/3))
				
								// Do Velocity/Acceleration
								// Note: dird2 is for overall angle difference behavior
								// The bigger the difference, the more aggressive
								// the turning is past 45 degrees
								// and if the distance is just outside the vessel (tdistMod)
								// Vel to VelTGT
								var dird2 = abs(angle_difference(dirTGT,dir))
								var tdistMod = 1
								// Set tdistMod for turning more aggressively when approaching tgt dest
								// (Used as a PCT) Also, Account for Velocity
								if(sprite_width >= sprite_height)
									tdistMod = min(1,max(0,(tdist/(sprite_width+(vel*M.z)))-1))
								else tdistMod = min(1,max(0,(tdist/(sprite_height+(vel*M.z)))-1))
								var tacc = acc
								// Hyper? Set spd and acc appropriately
								if(hyper) {
									tacc*=2
									velTGT = hspd
								} else velTGT = spd
								// Slow down the more past 45 degree difference to destination
								var tvelTGT = velTGT/(max(1,2*(dird2/45)))
								// Apply tdistMod when angle is not aligned to destination
								if(dird2 >= 5) {
					
									tvelTGT*=tdistMod
									if(!hyper) tacc*=2 // double accel if not hyper (which would already be doubled)
					
								}
								// Finally, apply Acceleration
								if(abs(tvelTGT-vel) <= tacc) vel = tvelTGT
								else if(tvelTGT > vel) vel += tacc
								else if(tvelTGT < vel) vel -= tacc
								// Do Rotation
								var trot = rot
								// If angle difference is over 45, apply more rotation upto 2x the bigger the diff
								// Otherwise apply tdistMod to rotation if it would make a difference
								if(dird2 >= 45) trot*=min(2,max(1,dird2/45))
								else if(dird2 != 0 and tdistMod < 1)
									trot*=2-tdistMod
								// Get direction difference
								var dird = abs(dirTGT-dir) < 180
								// Get direction diff polarity
								var dirp = (dirTGT-dir) > 0
								// Finally, apply Rotation
								if(abs(dirTGT-dir) <= trot) dir = dirTGT
								else if(dird and dirp) dir += trot
								else if(!dird and dirp) dir -= trot
								else if(dird and !dirp) dir -= trot
								else if(!dird and !dirp) dir += trot
								// Loop Dir
								if(dir < 0) dir += 360
								else if(dir >= 360) dir -= 360
								// Actualize Velocity+Rotation
								x += cos2(dir,vel*M.z)
								y += sin2(dir,vel*M.z)
				
							}
			
						} else if(!instance_exists(par)) {
			
							par = noone
							if(aiMode == _ai.exitParent) aiMode = _ai.moveTo
							if(xyTGT == noone) {
				
								velTGT = 0
								xyTGT = noone
								alarm[1] = room_speed*random_range(.2,5)
				
							}
			
						}
		
					}
	
				#endregion
				
			}
			
		}
		
	#endregion
	
}