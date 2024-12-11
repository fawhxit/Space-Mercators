/// @description Logic

if(M.state == _mode.gameMain) {
	
	if(init_done and !cycle) {
		
		if(state == _mode.main and active) {
			
			#region Spawn Carriers for Eligible planets
				
				if(initSpawnsDel <= 0 and !initSpawns) {
					
					for(var i = 0; i < ds_list_size(bdyL); ++i) {
						
						var e = bdyL[|i]
						if(e.dev != noone) {
							
							// For Metropolae & Capitals
							if(e.dev.ndx >= D.dev.met.ndx) {
								
								// Init NPC List for Start System + Add Carriers
								if(!list_is(npcL)) npcL = ds_list_create()
								
								// Carrier
								var ex = e.x+random_range(-e.sprite_width*10,e.sprite_width*10)
								var ey = e.y+random_range(-e.sprite_height*10,e.sprite_height*10)
								var e2 = instance_create_layer(ex,ey,"FG2",oNPC)
								e2.persistent = t
								e2.sys = id
								e2.par = e
								e2.aiMode = _ai.patrolParent
								e2.dir = random(360)
								e2.vessel = D.ves.hum.crus.car1
								e2.alarm[0] = 1
								ds_list_add(npcL,e2)
								
							}
							
						}
						
					}
					
					initSpawns = t
					
				} else if(initSpawnsDel > 0) initSpawnsDel--
				
			#endregion
			
			#region Zoom Updates
				
				if(M.z != M.zo) {
					
					var sz = ds_list_size(bdyL)
					for(var i = 0; i < sz; ++i) {
						
						var e = bdyL[|i]
						e.image_xscale = (M.z*e.image_xscaleOrig)
						e.image_yscale = (M.z*e.image_yscaleOrig)
						e.dist = e.distOrig*M.z
						e.xx = cenx
						e.yy = ceny
						
					}
					
				}
				
			#endregion
			
		}
		
	}
	
}
