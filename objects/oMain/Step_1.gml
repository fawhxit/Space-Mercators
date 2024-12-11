/// @description Global Updates/Controls

// Mouse Deltas
MXD = MXO-MX
MYD = MYO-MY
WMXD = WMXO-WMX
WMYD = WMYO-WMY

#region In System
	
	if(state == _mode.gameMain and P.active) {
		
		#region Zoom Changes for Galaxy/System Switching
			
			// If Player Leaving Sys...
			if(exZ) {
				
				z = zmn
				exZ = f
				
			}
			
			// If Player Entering Sys...
			if(inZ) {
				
				z = 0.4
				inZ = f
				
			}
			
		#endregion
		
		if(P.sys != noone) {
			
			if(P.sys.state == _mode.main and P.sys.active) {
				
				#region Zoom? (Include System Updates)
					
					// If Player not in Locale... And Not Hovering Hud
					// Normal Zoom Controls
					hudOver = P.hud.bx0.mouseIn or P.hud.bx1.mouseIn
						or P.hud.bx2.mouseIn or P.hud.bx3.mouseIn// HUD Override
					if(!P.loc.in and !hudOver) {
						
						var zi = 0.03
						if(kbSHFT)   zi *= 2
						if(mwu)      z += zi
						else if(mwd) z -= zi
						z = clamp(z,zmn,zmx)
						if(mwu or mwd) tfd = 3
						room_width  *= z/zo
						room_height *= z/zo
						room_width   = P.sys.w*10
						room_height  = P.sys.h*10
						P.sys.cenx   = room_width/2
						P.sys.ceny   = room_height/2
						P.sys.exRad  = round(P.sys.w*1.1)*z
						var zd = z/zo
						var pdist = point_distance(P.sys.cenxo,P.sys.cenyo,P.x,P.y)
						var pdir = point_direction(P.sys.cenxo,P.sys.cenyo,P.x,P.y)
						if(P.orbitDist != noone) P.orbitDist *= zd
						P.sysx = (P.sys.cenx)+(cos2(pdir,pdist*zd))
						P.sysy = (P.sys.ceny)+(sin2(pdir,pdist*zd))
						P.x = P.sysx
						P.y = P.sysy
						
						#region (V)essel Struct Updates
							
							// Sensor Ranges
							// Init Refs
							var e1 =  P.v.sr.v // Visual
							var e2 =  P.v.sr.s // Short
							var e3 =  P.v.sr.m // Mid
							var e4 =  P.v.sr.l // Long
							var e5 =  P.v.sr.e // Extended
							e1.r = ((P.sprite_width*zd)*e1.m)*e1.i
							e2.r = (e1.r*e2.m)*e2.i
							e3.r = (e2.r*e3.m)*e3.i
							e4.r = (e3.r*e4.m)*e4.i
							e5.r = (e4.r*e5.m)*e5.i
							
						#endregion
						
					}
					
				#endregion
				
			}
			
		}
		
	}
	
#endregion

#region Screen Shake DISABLED
	
	/* DISABLED
	if(scrnShk[4] > 0) {
		
		scrnShk[0] = random_range(-scrnShk[3],scrnShk[3]*scrnShk[4])
		scrnShk[1] = random_range(-scrnShk[3],scrnShk[3]*scrnShk[4])
		scrnShk[4] -= scrnShk[5]
		
	}
	*/
	
#endregion

#region Toggle Debug
	
	if(kbHOMEp) DBGmode = iterate_enum(DBGmode,_dbg.SZ)
	
#endregion