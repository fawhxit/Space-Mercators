/// @description Logic

if(M.state == _mode.gameMain and init_done) {
	
	#region System
		
		if(sys != noone and active) {
			
			if(sys.state == _mode.main and sys.active) {
				
				#region Updates
		
					// Sprite Updates
					var xscl = image_xscale
					var yscl = image_yscale
					xscl = scl*M.z
					yscl = xscl
					image_xscale = xscl
					image_yscale = yscl
					image_angle = dir
					
					#region (V)essel Struct Updates
						
						// Sensor Ranges
						// Init Refs
						var e1 =  v.sr.v // Visual
						var e2 =  v.sr.s // Short
						var e3 =  v.sr.m // Mid
						var e4 =  v.sr.l // Long
						var e5 =  v.sr.e // Extended
						e1.r = ((sprite_width)*e1.m)*e1.i
						e2.r = (e1.r*e2.m)*e2.i
						e3.r = (e2.r*e3.m)*e3.i
						e4.r = (e3.r*e4.m)*e4.i
						e5.r = (e4.r*e5.m)*e5.i
						
					#endregion
					
		
				#endregion
				
				#region Zoom Update
		
					if(M.z != M.zo) { // Update position (zoom relative)
			
						// Position Updates
						patrolDist = sprite_height*10
						var zd = M.z/M.zo
						var tdist = point_distance(sys.cenxo,sys.cenyo,x,y)
						var tdir = point_direction(sys.cenxo,sys.cenyo,x,y)
						x = sys.cenx+cos2(tdir,tdist*zd)
						y = sys.ceny+sin2(tdir,tdist*zd)
			
						// Patrol Dist
						patrolDist *= zd
			
						// relTGT?
						if(relTGT and relTGTDist != noone) {
				
							relTGTDist*=zd
				
							if(par != noone and relTGTDir != noone) {
					
								xyTGT[0] = par.x+cos2(relTGTDir,relTGTDist)
								xyTGT[1] = par.y+sin2(relTGTDir,relTGTDist)
					
							}
				
						}
			
						// Update xyTGT
						if(xyTGT != noone and is_array(xyTGT)) {
				
							try {
					
								var xyDir = point_direction(sys.cenxo,sys.cenyo,xyTGT[0],xyTGT[1])
								var xyDist = point_distance(sys.cenxo,sys.cenyo,xyTGT[0],xyTGT[1])
								xyTGT[0] = sys.cenx+cos2(xyDir,xyDist*zd)
								xyTGT[1] = sys.ceny+sin2(xyDir,xyDist*zd)
					
							} catch(_ex) {
				
								show_debug_message("Couldn't update xyTGT for NPC after zoom!")
								show_debug_message(_ex)
								xyTGT = noone
								vel = 0
								alarm[1] = room_speed*random_range(.2,5)
					
							}
				
						}
			
					}
		
				#endregion
				
				#region Carrier Spawning
					
					// Is Spawning?
					if(spwnMode != _spawn.no) {
						
						// Init
						if(chiL == noone) chiL = ds_list_create()
						
						// Spawn Mode; Set Spawn Ranges
						if(spwnMode == _spawn.lo) {
							
							// Low
							spwnmn = floor(vessel.spwnmx*(1/4))
							spwnmx = round(vessel.spwnmx*(1/3))
							
						} else if(spwnMode == _spawn.me) {
							
							// Medium
							spwnmn = floor(vessel.spwnmx*(1/2))
							spwnmx = round(vessel.spwnmx*(2/3))
							
						} else if(spwnMode == _spawn.hi) {
							
							// High
							spwnmn = floor(vessel.spwnmx*(3/4))
							spwnmx = vessel.spwnmx
							
						}
						
						// Spawn Delay?
						if(spwnDeli >= spwnDel) {
							
							// Ensure Spawn Amount in Range
							if(spwn < spwnmn or spwn > spwnmx) spwn = irandom_range(spwnmn,spwnmx)
							
							// Spawn Another
							if(spwnCnt < spwn) {
								
								// Create NPC
								var e = instance_create_layer(x,y,"FG2",oNPC)
								e.par = id
								e.aiMode = _ai.patrolParent
								e.dir = dir-90
								if(chance(75)) e.vessel = D.ves.hum.wing.fig1
								else e.vessel = D.ves.hum.wing.bom1
								e.alarm[0] = 1
								ds_list_add(chiL,e)
								ds_list_add(sys.npcL,e)
								
							}
							
							// Recall, even if at mx to simulate refueling/cycling
							if(spwnCnt >= spwn) {
								
								// Recall oldest child NPC
								if(chiL[|0].aiMode != _ai.exitParent) {
									
									// Set Return
									chiL[|0].aiMode = _ai.exitParent
									
									// Chance to change spawn mode randomly when recalling a child
									if(chance(1))
										switch(flip(3)) {
											
											case 0: spwnMode = _spawn.no; spwn = 0; break
											case 1: spwnMode = _spawn.lo; break
											case 2: spwnMode = _spawn.me; break
											case 3: spwnMode = _spawn.hi; break
											
										}
									
								}
								
							}
							
							// Reset Delay
							spwnDel = room_speed*random_range(.1,8)
							spwnDeli = 0
							
						} else spwnDeli += 1
						
						// Update Count
						spwnCnt = ds_list_size(chiL)
						
					// Not Spawning? But list not null?
					} else if(chiL != noone) {
						
						// List Exists?
						if(ds_exists(chiL,ds_type_list)) {
							
							// No Childs?
							if(ds_list_empty(chiL)) {
								
								// Finally no child? Nullify list
								ds_list_destroy(chiL)
								chiL = noone
								
							} else if(chiL[|0].aiMode != _ai.exitParent) {
								
								// Recall Oldest Child until all are recalled
								chiL[|0].aiMode = _ai.exitParent
								spwnCnt = ds_list_size(chiL)
								
							}
							
						}
						
					// Is Spawn Capable? (TODO; cover any vessels that can; conditionize when to start)
					} else if(vessel == D.ves.hum.crus.car1) // Set Spawning
						spwnMode = _spawn.hi
					
				#endregion
				
				#region Hit
					
					if(hit) {
						
						hp -= hitVal
						var hx = hitx+(random_range(-5,5)*M.z)
						var hy = hity+(random_range(-5,5)*M.z)
						var e = instance_create_layer(hx,hy,"FG1",oExplosion)
						e.sprite_index = sprFlare
						e.init_done = t
						hit = f
						
					}
					
				#endregion
				
				#region Damage
					
					if(hit) hit = f
					if(hp == 0) killed = t
					if(killed) instance_destroy(id)
					
				#endregion
				
			}
			
		}
		
	#endregion
	
}