/// @description Draw Targets

if(is_active_game(id,f,f)) {
	
	#region System
		
		if(is(sys,oLocalSystem,f)) {
			
			if(sys.init_done) {
				
				if(sys.state == _mode.main and sys.active) {
					
					#region Prev
						
						if(prev != noone) {
							
							// Init
							var sprW = prev.sprite_width/2
							var pdist = point_distance(x,y,prev.x,prev.y)
							
							// Draw Outline
							draw_set_alpha(1)
							draw_rectangle_color(prev.x-sprW,prev.y-sprW,prev.x+sprW,prev.y+sprW,
								cWhite,cWhite,cLtGrey,cLtGrey,t)
							
							// Draw Line OLD
							//if(pdist > sprW) draw_line_color(x,y,prev.x,prev.y,cWhite,cLtGrey)
							
							// Draw Name
							draw_set_font(fHUD)
							var strx = prev.x-sprW
							var stry = prev.y-sprW-(CHARH/2)
							draw_set_hvalign([fa_left,fa_bottom])
							var s1 = "ID: "+string(prev.nameStr)+" "
							if(list_is(hist.bdyL))
								if(list_has_inst(hist.bdyL,prev))
									s1 += "(V)"
							if(list_is(hist.tHubL))
								if(list_has_inst(hist.tHubL,prev))
									s1 += "(T)"
							var s2 = "\nDev: "
							if(prev.dev == noone) s2 += "STAR"
							else s2 += string_upper(prev.dev.str)
							draw_text_color(strx,stry,s1+s2,
								cLtGrey,cLtGrey,cWhite,cWhite,1)
							
						}
						
					#endregion
					
					#region Curr
						
						if(curr != noone) {
							
							// Init
							var sprW = curr.sprite_width/2
							var pdist = point_distance(x,y,curr.x,curr.y)
							
							// Draw Outline
							draw_set_alpha(1)
							draw_rectangle_color(curr.x-sprW,curr.y-sprW,curr.x+sprW,curr.y+sprW,
								cNeonGreen,cNeonGreen,cGreen,cGreen,t)
							
							// Draw Line OLD
							// if(pdist > sprW) draw_line_color(x,y,curr.x,curr.y,cNeonGreen,cGreen)
							
							// Draw Info
							draw_set_font(fHUD)
							var strx = curr.x-sprW
							var stry = curr.y-sprW-(CHARH/2)
							draw_set_hvalign([fa_left,fa_bottom])
							var s1 = "ID: "+string(curr.nameStr)+" "
							if(list_is(hist.bdyL))
								if(list_has_inst(hist.bdyL,curr))
									s1 += "(V)"
							if(list_is(hist.tHubL))
								if(list_has_inst(hist.tHubL,curr))
									s1 += "(T)"
							var s2 = "\nDev: "
							if(curr.dev == noone) s2 += "STAR"
							else s2 += string_upper(curr.dev.str)
							draw_text_color(strx,stry,s1+s2,
								cGreen,cGreen,cNeonGreen,cNeonGreen,1)
							
						}
						
					#endregion
					
					#region Sele
						
						if(sele != noone) {
							
							// Init
							var sprW = sele.sprite_width/2
							var pdist = point_distance(x,y,sele.x,sele.y)
							
							// Draw Outline
							draw_set_alpha(1)
							draw_rectangle_color(sele.x-sprW,sele.y-sprW,sele.x+sprW,sele.y+sprW,
								cNeonYellow,cNeonYellow,cYellow,cYellow,t)
							
							// Draw Line OLD
							// if(pdist > sprW) draw_line_color(x,y,sele.x,sele.y,cNeonYellow,cYellow)
							
							// Draw Name
							draw_set_font(fHUD)
							var strx = sele.x-sprW
							var stry = sele.y-sprW-(CHARH/2)
							draw_set_hvalign([fa_left,fa_bottom])
							var s1 = "ID: "+string(sele.nameStr)+" "
							if(list_is(hist.bdyL))
								if(list_has_inst(hist.bdyL,sele))
									s1 += "(V)"
							if(list_is(hist.tHubL))
								if(list_has_inst(hist.tHubL,sele))
									s1 += "(T)"
							var s2 = "\nDev: "
							if(sele.dev == noone) s2 += "STAR"
							else s2 += string_upper(sele.dev.str)
							draw_text_color(strx,stry,s1+s2,
								cYellow,cYellow,cNeonYellow,cNeonYellow,1)
							
						}
						
					#endregion
					
					#region Debug Sensory Ranges
						
						/*
						// Sensor Ranges
						// Init Refs
						var e1 = v.sr.v // Visual
						var e2 = v.sr.s // Short
						var e3 = v.sr.m // Mid
						var e4 = v.sr.l // Long
						var e5 = v.sr.e // Extended
						
						// Draw Ranges
						draw_set_alpha(1/3)
						if(e1.r != noone)
							draw_circle_color(x,y,e1.r,cWhite,cWhite,t)
						if(e2.r != noone)
							draw_circle_color(x,y,e2.r,cLtGrey,cLtGrey,t)
						if(e3.r != noone)
							draw_circle_color(x,y,e3.r,cGrey,cGrey,t)
						if(e4.r != noone)
							draw_circle_color(x,y,e4.r,cLtGrey,cLtGrey,t)
						if(e5.r != noone)
							draw_circle_color(x,y,e5.r,cYellow,cYellow,t)
						*/
						
					#endregion
					
				}
				
			}
			
		}
		
	#endregion
	
	#region Galaxy
	
		if(M.galaxy != noone) {
		
			if(M.galaxy.state == _mode.main and M.galaxy.active) {
			
				#region Prev
				
					if(prev != noone) {
						
						// Init
						var galxx = M.galaxy.xx
						var galyy = M.galaxy.yy
						var pdist = point_distance(x,y,prev.gx+galxx,prev.gy+galyy)
						draw_set_alpha(1)
						
						// Draw Outline
						draw_rectangle_color(prev.gx+galxx-5,prev.gy+galyy-5,
							prev.gx+galxx+5,prev.gy+galyy+5,
							cWhite,cWhite,cLtGrey,cLtGrey,t)
							
						// Draw Line
						if(pdist > sprite_width/2)
							draw_line_color(x,y,prev.gx+galxx,prev.gy+galyy,cWhite,cLtGrey)
					
					}
				
				#endregion
			
				#region Curr
				
					if(curr != noone) {
						
						// Init
						var galxx = M.galaxy.xx
						var galyy = M.galaxy.yy
						var pdist = point_distance(x,y,curr.gx+galxx,curr.gy+galyy)
						draw_set_alpha(1)
						
						// Draw Outline
						draw_rectangle_color(curr.gx+galxx-5,curr.gy+galyy-5,
							curr.gx+galxx+5,curr.gy+galyy+5,
							cNeonGreen,cNeonGreen,cGreen,cGreen,t)
						
						// Draw Line
						if(pdist > sprite_width/2)
							draw_line_color(x,y,curr.gx+galxx,curr.gy+galyy,cNeonGreen,cGreen)
					
					}
				
				#endregion
			
				#region Sele
				
					if(sele != noone) {
						
						// Init
						var galxx = M.galaxy.xx
						var galyy = M.galaxy.yy
						var pdist = point_distance(x,y,sele.gx+galxx,sele.gy+galyy)
						draw_set_alpha(1)
						
						// Draw Outline
						draw_rectangle_color(sele.gx+galxx-5,sele.gy+galyy-5,
							sele.gx+galxx+5,sele.gy+galyy+5,
							cNeonYellow,cNeonYellow,cYellow,cYellow,t)
						
						// Draw Line
						if(pdist > sprite_width/2)
							draw_line_color(x,y,sele.gx+galxx,sele.gy+galyy,cNeonYellow,cYellow)
					
					}
				
				#endregion
			
			}
		
		}

	#endregion
	
	// Debug Bounds
	/*
	var sprw2 = sprite_width/2
	var sprh2 = sprite_height/2
	draw_set_alpha(1)
	draw_rectangle_ext_color(x-sprw2,y-sprh2,x+sprw2,y+sprh2,
		dir,cNeonRed,cNeonRed,cDkRed,cDkRed,t)
	*/
	
}