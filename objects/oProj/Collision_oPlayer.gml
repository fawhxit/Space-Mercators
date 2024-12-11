/// @description Hit Logic

#region Hit Check
	
	// Need parent instance so dont hit self
	if(init_done and !firstFrame) {
		
		// Is it
		if(other.id != par) {
			
			#region Do Hit
				
				if(other.shp > 0) {
					
					// Shield Hit
					// Impact Screen Shake
					if(M.scrnShk[6] == noone) {
						
						M.scrnShk[3] = 10
						M.scrnShk[4] = 1
						M.scrnShk[5] = (1/room_speed)*5
						
					}
					
					// init
					var iDir = dir-180
					if(iDir < 0) iDir += 360
					else if(iDir >= 360) iDir -= 360
					var e = instance_create_layer(x,y,"FG1",oShield)
					e.par = other
					var szProj = (sprite_get_width(sprite_index)*scl)/sprite_get_width(e.sprite_index)
					var szShip = (sprite_get_width(other.sprite_index)*other.scl)/sprite_get_width(e.sprite_index)
					e.sclw = min(szShip,szProj)
					e.sclh = e.sclw
					e.dir = iDir
					e.init_done = t
					other.shp -= hitVal
					
				} else {
					
					// Hull Hit
					// Impact Screen Shake
					if(M.scrnShk[6] == noone) {
						
						M.scrnShk[3] = 20
						M.scrnShk[4] = 1
						M.scrnShk[5] = (1/room_speed)*5
						
					}
					
					// Do Damage
					other.hit = t
					other.hitVal = hitVal
					other.hitDir = point_direction(other.x,other.y,x,y)
					other.hitx = BBR
					other.hity = BBY
					
				}
				
			#endregion
			
			/* TODO: Not Implemented for Player
			#region Add Shooter to Other's TGT List
				
				// Parent still exists?
				if(is(par,oNPC,f) or is(par,oPlayer,f)) {
					
					if(!list_is(other.tgtL)) {
						
						// Create list with par as first target
						other.tgtL = ds_list_create()
						ds_list_add(other.tgtL,par)
						
					} else {
						
						// Add to list if not in list
						// Otherwise, Move up in list (raise priority)
						if(!list_has_inst(other.tgtL,par))
							ds_list_add(other.tgtL,par)
						else list_mv_up_inst(other.tgtL,par)
						
					}
					
				}
				
			#endregion
			*/
			
			instance_destroy(id)
			
		}
		
	}
	
#endregion