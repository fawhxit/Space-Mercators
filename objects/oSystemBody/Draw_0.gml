/// @description Draw & Spawn

if(M.state == _mode.gameMain) {
	
	if(init_done and !sys.cycle) {
		
		if(sys.state == _mode.main and sys.active) {
			
			#region Planet Glows
			
				if(typ == _sysBody.dry) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.1)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.gas1) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.3)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.gas2) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.3)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.ice) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.15)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.island) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.2)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.lava) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.2)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.moon) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.ring) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*.5)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.smooth) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.1)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				} else if(typ == _sysBody.terran) {
					
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(rad*1.4)*M.z,blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				}
				
			#endregion
			
			// Draw Body
			draw_self()
			
			#region Star Glow
				
				draw_set_alpha(1)
				if(typ == _sysBody.star) {
					
					// Star Glow
					gpu_set_blendmode(bm_add)
					
					// Draw to Surface
					draw_circle_color(x,y,(dia*6)*M.z,image_blend,cBlack,f)
					
					gpu_set_blendmode(bm_normal)
					
				}
				
			#endregion
			
			// Orbit Line
			draw_set_alpha(1/3)
			draw_circle_color(sys.cenx,sys.ceny,dist,image_blend,image_blend,t)
			
			#region Relay Links & Link NPC Spawning
				
				if(port) {
					
					var nxt = ndx+1
					var prv = ndx-1
					if(nxt >= ds_list_size(sys.bdyL)) nxt = 0
					if(prv < 0) prv = ds_list_size(sys.bdyL)-1
					if(nxt == prv or prv == ndx) prv = noone
					if(nxt == ndx) nxt = noone
					var oNxt = noone
					var oPrv = noone
					if (nxt != noone) oNxt = sys.bdyL[|nxt]
					if (prv != noone) oPrv = sys.bdyL[|prv]
					spwni += 1
					if(oNxt != noone) {
						
						if(oNxt.port and (90 >= abs(oNxt.deg-deg) or 270 <= abs(oNxt.deg-deg))) {
							
							// Init
							var adj = -max(2,20*M.z)
							var txy = [x+adj,y+adj,oNxt.x+adj,oNxt.y+adj] // Shoulda used xy[0] etc?
							var lw = max(1,20*M.z)
							draw_set_alpha(1)
							draw_line_width_color(txy[0],txy[1],txy[2],txy[3],lw,cWhite,cAqua)
							draw_line_width_color(txy[0],txy[1],txy[2],txy[3],lw/2,cBlack,cDkGrey)
							
							// Spawn NPC? (No Limit)
							if(spwni >= spwn and chance(33)) {
								
								// System List NPC List Init
								if(!list_is(sys.npcL))
									sys.npcL = ds_list_create()
								var l = sys.npcL
								
								// Init
								var e = instance_create_layer(txy[0],txy[1],"FG2",oNPC)
								var ndir = point_direction(txy[0],txy[1],txy[2],txy[3])
								e.sys = sys
								e.dir = ndir
								e.aiMode = _ai.simple
								e.hyper = t
								e.extTGT = oNxt
								e.vessel = D.ves.hum.frig.fre1
								e.alarm[0] = 1
								ds_list_add(l,e)
								spwni = 0
								spwn = irandom_range(1,10)*room_speed
								
							}
							
						}
						
					}
					
					if(oPrv != noone) {
						
						if(oPrv.port and (90 >= abs(oPrv.deg-deg) or 270 <= abs(oPrv.deg-deg))) {
							
							// Init
							var adj = max(2,20*M.z)
							var txy = [x+adj,y+adj,oPrv.x+adj,oPrv.y+adj]
							var lw = max(1,20*M.z)
							draw_set_alpha(abs(oPrv.deg-deg))
							draw_line_width_color(txy[0],txy[1],txy[2],txy[3],lw,cWhite,cOrange)
							draw_line_width_color(txy[0],txy[1],txy[2],txy[3],lw/2,cBlack,cDkGrey)
							
							// Spawn NPC? (No Limit)
							if(spwni >= spwn and chance(33)) {
								
								// System List NPC List Init
								if(!list_is(sys.npcL))
									sys.npcL = ds_list_create()
								var l = sys.npcL
								
								// Init
								var e = instance_create_layer(txy[0],txy[1],"FG2",oNPC)
								var ndir = point_direction(txy[0],txy[1],txy[2],txy[3])
								e.sys = sys
								e.dir = ndir
								e.aiMode = _ai.simple
								e.hyper = t
								e.extTGT = oPrv
								e.vessel = D.ves.hum.frig.fre1
								e.alarm[0] = 1
								ds_list_add(l,e)
								spwni = 0
								spwn = irandom_range(1,10)*room_speed
								
							}
							
						}
						
					}
					
				}
				
			#endregion
			
			#region General NPC Spawning
					
					if(is(sys,oLocalSystem,t)) {
						
						if(list_is(chiL))
							spwnCnt = ds_list_size(chiL)
						else spwnCnt = 0
						
						#region Spawn Trade NPC?
							
							if(spwni >= spwn and chance(10)
								and spwnCnt < dev.spwnUL) {
								
								// Init, Get Target Index
								var dev_ndx = irandom_range(D.dev.col_mn.ndx,D.dev.cap.ndx)
								var tndx = sys_get_dest(sys,ndx,f,dev_ndx,f,6)
								
								if(tndx != noone) {
									
									// Child List Create?
									if(!ds_exists(chiL,ds_type_list))
										chiL = ds_list_create()
									
									// System List NPC List Init
									if(!list_is(sys.npcL))
										sys.npcL = ds_list_create()
									var l = sys.npcL
									
									// Init
									var tgt = sys.bdyL[|tndx]
									var e = instance_create_layer(x,y,"FG2",oNPC)
									var ndir = point_direction(x,y,tgt.x,tgt.y)
									e.sys = sys
									e.par = id
									e.dir = ndir
									e.aiMode = _ai.simple
									e.extTGT = tgt
									e.vessel = D.ves.hum.frig.fre1
									e.alarm[0] = 1
									ds_list_add(chiL,e)
									spwnCnt = ds_list_size(chiL)
									ds_list_add(l,e)
									spwni = 0
									spwn = irandom_range(1,10)*room_speed
									
								}
								
							}
							
						#endregion
						
					}
					
					// Reset Spawn Timer
					if(spwni >= spwn and flip(1)) {
						
						spwni = 0
						spwn = irandom_range(1,10)*room_speed
						
					}
							
			#endregion
			
			#region Debug
				
				/*
				// Patrol Dist
				draw_set_alpha(1)
				draw_circle_color(x,y,patrolDist,image_blend,image_blend,t)
				*/
				
			#endregion
			
		}
		
	}
	
}