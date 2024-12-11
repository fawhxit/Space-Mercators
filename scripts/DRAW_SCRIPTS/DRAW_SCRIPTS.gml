/// @desc draw rectangle primitive rotated color
/// @func draw_rectangle_ext_color(x1,y1,x2,y2,rot,col1,col2,col3,col4,outline)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param rot
/// @param col1
/// @param col2
/// @param col3
/// @param col4
/// @param outline
/// @returns n/a
function draw_rectangle_ext_color(x1,y1,x2,y2,rot,col1,col2,col3,col4,outline) {
    
    // Orign x/y
    var ox,oy
    ox = lerp(x1,x2,0.5)
    oy = lerp(y1,y2,0.5)
    
    // Get x/y rotations
    var sxx,sxy,syx,syy
    sxx =  cos(degtorad(rot))
    sxy = -sin(degtorad(rot))
    syx =  sin(degtorad(rot))
    syy =  cos(degtorad(rot))
    
    // Apply x rotations
    var sx1,sx2,sx3,sx4
    sx1 = sxx*(x1-ox)
    sx2 = sxx*(x2-ox)
    sx3 = sxy*(x1-ox)
    sx4 = sxy*(x2-ox)
    
    // Apply y rotations
    var sy1,sy2,sy3,sy4
    sy1 = syx*(y1-oy)
    sy2 = syx*(y2-oy)
    sy3 = syy*(y1-oy)
    sy4 = syy*(y2-oy)
    
    // Get rectangle x coordinates
    var xx1,xx2,xx3,xx4
    xx1=ox+sx1+sy1
    xx2=ox+sx2+sy1
    xx3=ox+sx2+sy2
    xx4=ox+sx1+sy2
    
    // Get rectangle y coordinates
    var yy1,yy2,yy3,yy4
    yy1=oy+sx3+sy3
    yy2=oy+sx4+sy3
    yy3=oy+sx4+sy4
    yy4=oy+sx3+sy4
    
    // Draw...
    if(outline) {
        
        // Outline
        draw_line_color(xx1,yy1,xx4,yy4,col1,col4)
        draw_line_color(xx2,yy2,xx1,yy1,col2,col1)
        draw_line_color(xx3,yy3,xx2,yy2,col3,col2)
        draw_line_color(xx4,yy4,xx3,yy3,col4,col3)
        
    } else {
        
        // Filled
        draw_triangle_color(xx1,yy1,xx2,yy2,xx3,yy3,col1,col2,col3,false)
        draw_triangle_color(xx1,yy1,xx3,yy3,xx4,yy4,col1,col3,col4,false)
        
    }
    
}

function draw_rectangle_container_gui(inst,xy,bgc,fgc,fill,outline,hiPCT,action,listMenu) {
    
	// BG
	if(fill) {
        
        draw_set_alpha(bgc[0])
        draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
        bgc[1],bgc[2],bgc[3],bgc[4],f)
        
	}
	
	if(mouse_in_gui_rectangle(xy)) {
        
        if(hiPCT > 0) {
            
            if(mbl) draw_set_alpha((fgc[0]/4)*hiPCT)
            else draw_set_alpha((fgc[0]/2)*hiPCT)
            draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
                fgc[1],fgc[2],fgc[3],fgc[4],f)
            
        }
        
        if(action != noone
            and mblr)
            button_action(action)
            
        #region Other Controls (hud_e specific)
			
			if(inst != noone) {
				
				if(inst == hud.bx1 or inst == hud.bx3) {
					
					#region Bottom Left/Right Panels
						
						if(inst.inst != noone) {
								
								if(inst.inst == hud_e.map) {
									
									#region Map Zoom
										
										// Zoom with Mouse Wheel
										var he = inst.inst
										var zi = 0.03
										if(kbSHFT) zi *= 2
										if(mwu) he.z = clamp(he.z+zi,he.zmn,he.zmx)
										else if(mwd) he.z = clamp(he.z-zi,he.zmn,he.zmx)
										
									#endregion
									
									#region Map Panning & Reset
										
										if(mbr) {
											
											// Pan w/ Mouse Right
											he.xxo -= WMXD
											he.yyo -= WMYD
											
										} else if(mbm) {
											
											// Reset w/ Mouse Middle
											he.xxo = 0
											he.yyo = 0
											he.z = 1
											
										}
										
										// Pan Clamp
										he.xxo = clamp(he.xxo,-he.omx,he.omx)
										he.yyo = clamp(he.yyo,-he.omx,he.omx)
										
									#endregion
									
								}
							
						}
						
					#endregion
					
				}
				
			}
			
        #endregion
        
	}
	
	if(inst != noone) {
		
		if(inst == hud.bx1 or inst == hud.bx3) {
			
			#region Bottom Left/Right Docks
				
				if(inst.inst == hud_e.stat) {
					
					// TODO: DRAW INFO
					#region Status Component
						
						// Init
						var he = inst.inst
						he.scl = (inst.wh[1]/sprite_get_width(he.spr))-.1
						var xx,yy
						xx = lerp(xy[0],xy[2],0.5)
						yy = lerp(xy[1],xy[3],0.5)
						
						// Draw Vessel Sprite
						var c = make_color_rgb(255*(1-(P.hp/P.hpmx)),255*(P.hp/P.hpmx),0)
						draw_sprite_ext(he.spr,0,lerp(xy[0],xy[2],0.5),lerp(xy[1],xy[3],0.5),
							he.scl,he.scl,he.rot,c,1/2)
						
						// Info Init
						var mar = 10
						draw_set_font(fHUD)
						draw_set_hvalign([fa_left,fa_top])
						var str = P.str+":"
						str += "\n"
						str += "\nIntegrities:"
						str += "\nHull: "+string((P.shp/P.shpmx)*100)+"%"
						str += "\nShields: "+string((P.hp/P.hpmx)*100)+"%"
						str += "\n"
						str += "\nCargo Load:"
						str += "\nSize: "+string((P.cargo.size_used/P.cargo.size_limit)*100)+"%"
						str += "\nWeight: "+string((P.cargo.weight_used/P.cargo.weight_limit)*100)+"%"
						str += "\n"
						str += "\nCache: $"+string(P.cargo.credit)
						var strw2 = string_width(str)
						var strh2 = string_height(str)
						var xy2 = [xy[0],xy[1],xy[0]+strw2+mar,xy[1]+strh2+mar]
						var bgc2 = bgc
						bgc2[0] = 2/3
						// Draw BG
						draw_rectangle_container_gui(noone,xy2,bgc2,fgc,t,f,0,noone,noone)
						// Draw Label
						draw_text_color(xy[0]+mar,xy[1]+mar,str,
							cLtGrey,cLtGrey,cWhite,cWhite,1)
						
					#endregion
					
				} else if(inst.inst == hud_e.map
					and is(P.sys,oLocalSystem,t)) {
					
					// TODO: DRAW ON SURFACE, DRAW PLAYER+NPCS, PAN+ZOOM CONTROLS
					// TODO: SELECT TARGET, TOOLTIP INFO
					var sArr = open_surface(inst.inst,xy)
					
					#region Map Component
						
						// Init
						var he = hud_e.map
						he.sys = P.sys
						he.scl = (((inst.wh[1]/2.1)/M.z)/(he.sys.w))*he.z
						M.DBGstr2 = ""
						
						#region Draw Player
							
							// Init
							var pdir = point_direction(P.sys.cenx,P.sys.ceny,P.x,P.y)
							var pdist = point_distance(P.sys.cenx,P.sys.ceny,P.x,P.y)
							var xx = lerp(0,sArr[2][0],0.5)+(cos2(pdir,pdist)*he.scl)+he.xxo
							var yy = lerp(0,sArr[2][1],0.5)+(sin2(pdir,pdist)*he.scl)+he.yyo
							
							// Draw
							var r = 2
							draw_set_alpha(1)
							draw_circle_color(xx,yy,r,cNeonAqua,cAqua,f)
							draw_circle_color(xx,yy,r*2,cNeonAqua,cAqua,t)
							
						#endregion
						
						#region Draw Bodies
							
							var ttStr = ""
							var ttDone = f // So we don't draw more than one tooltip/overlap
							var sz0 = he.sys.bdyL[|0].sprite_width/2
							for(var i = 0; i < ds_list_size(he.sys.bdyL); ++i) {
								
								// Init Body Drawing
								var e = he.sys.bdyL[|i]
								var xx = lerp(0,sArr[2][0],0.5)+(cos2(e.deg,e.dist)*he.scl)+he.xxo
								var yy = lerp(0,sArr[2][1],0.5)+(sin2(e.deg,e.dist)*he.scl)+he.yyo
								if(i == ds_list_size(he.sys.bdyL)-1) he.omx = (e.dist*he.scl)*.9
								var bScl
								if(e.typ == _sysBody.ring)
									bScl = (e.sprite_width/4)/sz0
								else bScl = e.sprite_width/sz0
								M.DBGstr2 += string("Map {2}: {0}/{1}\n",xx,yy,e.nameStr)
								
								#region Draw Bodies
									
									// Init
									var r = max(2,(2*bScl)*he.z)
										
									// Orbit Line
									draw_set_alpha(1/2)
									draw_circle_color(lerp(0,sArr[2][0],0.5)+he.xxo,
										lerp(0,sArr[2][1],0.5)+he.yyo,(e.dist*he.scl),
										e.image_blend,e.image_blend,t)
									
									// Body
									draw_set_alpha(1)
									draw_circle_color(xx,yy,r,e.image_blend,e.image_blend,f)
									// Ringed Body Ring
									if(e.typ == _sysBody.ring)
										draw_circle_color(xx,yy,r*2,e.image_blend,e.image_blend,t)
										
								#endregion
								
								// Init Select/Interactions
								var xy2
								xy2 = [(xx)-(r*2),(yy)-(r*2),
									(xx)+(r*2),(yy)+(r*2)]
								
								#region Selection Hilights
									
									draw_set_alpha(1)
									if(P.sele == e)
										draw_rectangle_color(xy2[0],xy2[1],xy2[2],xy2[3],
											cYellow,cYellow,cNeonYellow,cNeonYellow,t)
									else if(P.curr == e)
										draw_rectangle_color(xy2[0],xy2[1],xy2[2],xy2[3],
											cGreen,cGreen,cNeonGreen,cNeonGreen,t)
									else if(P.prev == e)
										draw_rectangle_color(xy2[0],xy2[1],xy2[2],xy2[3],
											cLtGrey,cLtGrey,cWhite,cWhite,t)
									
								#endregion
								
								#region Mouse Interactions (Tooltip + Select)
									
									// Offset for where surface will be drawn
									var xo,yo
									xo = sArr[1][0]
									yo = sArr[1][1]
									if(mouse_in_gui_rectangle([xy2[0]+xo,xy2[1]+yo,
										xy2[2]+xo,xy2[3]+yo]) and !ttDone) {
										
										#region Draw Hover Outline
											
											draw_set_alpha(2/3)
											draw_rectangle_color(xy2[0],xy2[1],xy2[2],xy2[3],
												cAqua,cAqua,cNeonAqua,cNeonAqua,t)
											
										#endregion
										
										#region Tooltip (Draw off surface)
											
											ttStr += string_capAll(e.nameStr)
											if(e.dev == noone) ttStr += "\nStar"
											else ttStr += "\n"+string_capAll(e.dev.str)
											if(list_has_inst(P.hist.bdyL,e))
												ttStr += "\nVisited"
											else ttStr += "\nUnvisited"
											if(list_has_inst(P.hist.tHubL,e))
												ttStr += "\nTrade Hub"
											
										#endregion
										
										#region Selection Controls
											
											if(mblr) {
												
												if(e != P.sele and e != P.curr) {
													
													if(e == P.prev) {
														
														P.prev = noone
														P.prevNDX = noone
														
													}
													
													P.sele = e
													P.seleNDX = P.sele.ndx
													
												} else if(e == P.sele and !P.auto) {
													
													P.sele = noone
													P.seleNDX = noone
													
													if(P.curr != noone) {
														
														P.prev = P.curr
														P.prevNDX = P.prev.ndx
														
													}
													
													P.curr = e
													P.currNDX = P.curr.ndx
													
												} else if(e == P.curr and !P.auto
													and !P.tranWarp) {
													
													#region Start Auto-Pilot
														
														P.preAuto = t
														P.auto = t
														
													#endregion
													
												}
												
											}
											
										#endregion
										
										// Set Tooltip Done (So we don't overlap)
										ttDone = t
										
									}
									
								#endregion
								
							}
							
						#endregion
						
						#region Draw Info
							
							var str = string_capAll(he.sys.bdyL[|0].nameStr)+" System"
							str += "\nxo: "+string(he.xxo)
							str += "\nyo: "+string(he.yyo)
							str += "\nz : x"+string(he.z)
							draw_set_hvalign([fa_left,fa_top])
							draw_set_font(fHUD)
							draw_text_color(5,5,str,fgc[1],fgc[2],fgc[3],fgc[4],2/3)
							
						#endregion
						
					#endregion
					
					// Draw Map
					apply_surface(inst.inst,sArr)
					
					// Draw Tooltip (Have to Draw on App Surface)
					if(ttDone) draw_tooltip(bgc,fgc,ttStr,5)
					
				}
				
			#endregion
			
		} else if(inst == hud.bx2 and xy == hud.bx2.con1xy) { // ONLY FOR MINI DOCK IN MID PANEL
			
			#region Middle Mini Dock
				
				if(inst.inst1 == hud_e.tgt) {
					
					// TODO: TODO
					#region Draw Contents
						
						if(P.curr != noone) {
							
							#region Current Target
								
								// Init
								var he = inst.inst1
								he.inst = P.curr
								var spr = he.inst.sprite_index
								he.scl = ((inst.wh[1]*.75)/sprite_get_width(spr))
								var xx,yy
								xx = lerp(xy[0],xy[2],0.5)
								yy = lerp(xy[1],xy[3],0.5)
								
								// Draw Sprite
								draw_sprite_ext(spr,he.inst.image_index,xx,yy,
									he.scl,he.scl,0,he.inst.image_blend,2/3)
								
								
								// Label Init
								var mar = 10
								draw_set_font(fHUD)
								draw_set_hvalign([fa_left,fa_top])
								var str = "Current Target:"
								var e = he.inst
								if(he.info) {
									
									str += "\n"+string_capAll(e.nameStr)
									if(e.dev == noone) str += "\nStar"
									else str += "\n"+string_capAll(e.dev.str)
									if(list_has_inst(P.hist.bdyL,e))
										str += "\nVisited"
									else str += "\nUnvisited"
									if(list_has_inst(P.hist.tHubL,e))
										str += "\nTrade Hub"
									str += "\nAzimuth: "+string(point_direction(P.x,P.y,e.x,e.y))+"°"
									str += "\nDistance: "+string(point_distance(P.x,P.y,e.x,e.y))
									var strw2 = string_width(str)
									var strh2 = string_height(str)
									var xy2 = [xy[0],xy[1],xy[0]+strw2+mar,xy[1]+strh2+mar]
									var bgc2 = bgc
									bgc2[0] = 2/3
									// Draw BG
									draw_rectangle_container_gui(noone,xy2,bgc2,fgc,t,f,0,noone,noone)
									
								}
								// Draw Label
								draw_text_color(xy[0]+mar,xy[1]+mar,str,
									cGreen,cGreen,cNeonGreen,cNeonGreen,1)
								
							#endregion
							
						} else if(P.sele != noone) {
							
							#region Selection
								
								// Init
								var he = inst.inst1
								he.inst = P.sele
								var spr = he.inst.sprite_index
								he.scl = ((inst.wh[1]*.75)/sprite_get_width(spr))
								var xx,yy
								xx = lerp(xy[0],xy[2],0.5)
								yy = lerp(xy[1],xy[3],0.5)
								
								// Draw Sprite
								draw_sprite_ext(spr,he.inst.image_index,xx,yy,
									he.scl,he.scl,0,he.inst.image_blend,2/3)
								
								// Label
								var mar = 10
								draw_set_font(fHUD)
								draw_set_hvalign([fa_left,fa_top])
								var str = "Selection:"
								var e = he.inst
								if(he.info) {
									
									str += "\n"+string_capAll(e.nameStr)
									if(e.dev == noone) str += "\nStar"
									else str += "\n"+string_capAll(e.dev.str)
									if(list_has_inst(P.hist.bdyL,e))
										str += "\nVisited"
									else str += "\nUnvisited"
									if(list_has_inst(P.hist.tHubL,e))
										str += "\nTrade Hub"
									str += "\nAzimuth: "+string(point_direction(P.x,P.y,e.x,e.y))+"°"
									str += "\nDistance: "+string(point_distance(P.x,P.y,e.x,e.y))
									var strw2 = string_width(str)
									var strh2 = string_height(str)
									var xy2 = [xy[0],xy[1],xy[0]+strw2+mar,xy[1]+strh2+mar]
									var bgc2 = bgc
									bgc2[0] = 2/3
									// Draw BG
									draw_rectangle_container_gui(noone,xy2,bgc2,fgc,t,f,0,noone,noone)
									
								}
								// Draw Label
								draw_text_color(xy[0]+mar,xy[1]+mar,str,
									cYellow,cYellow,cNeonYellow,cNeonYellow,1)
								
								
								
							#endregion
							
						} else if(P.prev != noone) {
							
							#region Previous Target
								
								// Init
								var he = inst.inst1
								he.inst = P.prev
								var spr = he.inst.sprite_index
								he.scl = ((inst.wh[1]*.75)/sprite_get_width(spr))
								var xx,yy
								xx = lerp(xy[0],xy[2],0.5)
								yy = lerp(xy[1],xy[3],0.5)
								
								// Draw Sprite
								draw_sprite_ext(spr,he.inst.image_index,xx,yy,
									he.scl,he.scl,0,he.inst.image_blend,2/3)
								
								// Label
								var mar = 10
								draw_set_font(fHUD)
								draw_set_hvalign([fa_left,fa_top])
								var str = "Previous Target:"
								var e = he.inst
								if(he.info) {
									
									str += "\n"+string_capAll(e.nameStr)
									if(e.dev == noone) str += "\nStar"
									else str += "\n"+string_capAll(e.dev.str)
									if(list_has_inst(P.hist.bdyL,e))
										str += "\nVisited"
									else str += "\nUnvisited"
									if(list_has_inst(P.hist.tHubL,e))
										str += "\nTrade Hub"
									str += "\nAzimuth: "+string(point_direction(P.x,P.y,e.x,e.y))+"°"
									str += "\nDistance: "+string(point_distance(P.x,P.y,e.x,e.y))
									var strw2 = string_width(str)
									var strh2 = string_height(str)
									var xy2 = [xy[0],xy[1],xy[0]+strw2+mar,xy[1]+strh2+mar]
									var bgc2 = bgc
									bgc2[0] = 2/3
									// Draw BG
									draw_rectangle_container_gui(noone,xy2,bgc2,fgc,t,f,0,noone,noone)
									
								}
								// Draw Label
								draw_text_color(xy[0]+mar,xy[1]+mar,str,
									cLtGrey,cLtGrey,cWhite,cWhite,1)
								
							#endregion
							
						} else {
							
							#region No Target
								
								// Init
								var xx,yy
								xx = lerp(xy[0],xy[2],0.5)
								yy = lerp(xy[1],xy[3],0.5)
								
								draw_set_font(fHUD)
								draw_set_hvalign([fa_middle,fa_center])
								draw_text_color(xx,yy,"NO TARGET",cWhite,cWhite,
									cLtGrey,cLtGrey,1)
								
							#endregion
							
						}
						
					#endregion
					
					#region Mouse Interaction (Toggle Info)
						
						if(mouse_in_gui_rectangle(xy))
							if(mblr) inst.inst1.info = !inst.inst1.info // Toggle Info
						
					#endregion
					
				}
				
			#endregion
			
		}
		
		// TODO: MID PANEL LOGS ELEMENT
		
	}
	
	// Outline
	if(outline) {
        
        draw_set_alpha(fgc[0])
        draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
            fgc[1],fgc[2],fgc[3],fgc[4],t)
        
	}
    
}

// Draws from based on mouse pos & xx/yy based on str w/h
function draw_tooltip(bgc,fgc,str,mar) {
	
	// Init
	draw_set_font(fHUD)
	var xx,yy
	xx = WMX
	yy = WMY
	var strw,strh
	strw = string_width(str)
	strh = string_height(str)
	var xy = [xx,yy,xx+100,yy+100] // Debug Init
	
	#region Tooltip Alignment
		
		#region XX Align
			
			var off = 20
			// Tooltip would go off screen? (XX + (Off)set)
			if(xx+off+strw+(mar*2) >= M.ww*.99) {
				
				// Tooltip <-
				xx -= off/4
				xy[2] = xx-strw-(mar*2)
				xy[0] = xx
				draw_set_halign(fa_right)
				
			} else {
				
				// Tooltip ->
				xx += off
				xy[0] = xx
				xy[2] = xx+strw+(mar*2)
				draw_set_halign(fa_left)
				
			}
			
		#endregion
		
		#region YY Align
			
			// Tooltip would go off screen?
			if(yy+strh+(mar) >= M.wh*.99) {
				
				// Tooltip ^
				xy[3] = yy-strh-(mar)
				xy[1] = yy
				draw_set_valign(fa_bottom)
				
			} else {
				
				// Tooltip v
				xy[1] = yy
				xy[3] = yy+strh+(mar)
				draw_set_valign(fa_top)
				
			}
			
		#endregion
		
	#endregion
	
	// Draw Tooltip Container
	draw_rectangle_container_gui(noone,xy,bgc,fgc,t,t,0,noone,noone)
	
	// Draw Tooltip Text
	var marx,mary
	if(draw_get_halign() == fa_right) marx = -mar
	else marx = mar
	if(draw_get_valign() == fa_bottom) mary = -mar
	else mary = mar
	draw_text_color(xy[0]+marx,xy[1]+mary,str,fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
	
}