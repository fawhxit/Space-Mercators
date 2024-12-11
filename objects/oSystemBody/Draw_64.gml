/// @description Offscreen Markers

if(M.state == _mode.gameMain) {
	
	if(init_done and !sys.cycle) {
		
		if(sys.state == _mode.main and sys.active) {
			
			// Offscreen Marker
			if(!on_screen(id)) {
				
				// Init
				var pdist = point_distance(P.x,P.y,x,y)
				var dir2 = point_direction(P.x,P.y,x,y)
				var sprMar = sprMarker
				var marw = sprite_get_width(sprMar)*(M.zOrig/8)
				var camx = camera_get_view_x(view_camera[0])
				var camy = camera_get_view_y(view_camera[0])
				var x2   = (P.x-camx)+( cos(degtorad(dir2))*(M.ww/2.1))
				var y2   = (P.y-camy)+(-sin(degtorad(dir2))*(M.wh/2.1))
				
				// Draw Marker
				if(P.prev == id) 
					draw_sprite_ext(sprMarker,0,x2,y2,.01,.01,dir2-90,cWhite,2/3)
				else if(P.sele == id)
					draw_sprite_ext(sprMarker,0,x2,y2,.01,.01,dir2-90,cNeonYellow,2/3)
				else if(P.curr == id)
					draw_sprite_ext(sprMarker,0,x2,y2,.01,.01,dir2-90,cNeonGreen,2/3)
				else draw_sprite_ext(sprMarker,0,x2,y2,.01,.01,dir2-90,cGrey,2/3)
				
				/* OLD (Declutter Change)
				#region Selection Draws
					
					#region Prev
					
						if(P.prev == id) {
						
							// Init
							draw_set_alpha(1)
						
							// Draw Outline
							draw_circle_color(x2,y2,marw+5,cWhite,cLtGrey,t)
						
							// Draw Name
							var str = "ID:"+string(nameStr)+" "
							if(list_is(P.hist.bdyL))
								if(list_has_inst(P.hist.bdyL,id))
									str += "(V)"
							if(list_is(P.hist.tHubL))
								if(list_has_inst(P.hist.tHubL,id))
									str += "(T)"
							str += "\nDist:"+string(pdist)
							draw_set_font(fHUD)
							var strx = x2-marw
							var stry = y2-marw-5
							draw_set_hvalign([fa_left,fa_bottom])
							draw_text_color(strx,stry,str,cLtGrey,cLtGrey,
								cWhite,cWhite,1)
						
						}
					
					#endregion
					
					#region Curr
						
						if(P.curr == id) {
							
							// Init
							draw_set_alpha(1)
							var marw = (sprite_get_width(sprMarker)*.01)/2
							
							// Outline
							draw_circle_color(x2,y2,marw+5,cNeonGreen,cGreen,t)
							
							// Draw Name
							var str = "ID:"+string(nameStr)+" "
							if(list_is(P.hist.bdyL))
								if(list_has_inst(P.hist.bdyL,id))
									str += "(V)"
							if(list_is(P.hist.tHubL))
								if(list_has_inst(P.hist.tHubL,id))
									str += "(T)"
							str += "\nDist:"+string(pdist)
							draw_set_font(fHUD)
							var strx = x2-marw
							var stry = y2-marw-5
							draw_set_hvalign([fa_left,fa_bottom])
							draw_text_color(strx,stry,str,cGreen,cGreen,
								cNeonGreen,cNeonGreen,1)
							
						}
						
					#endregion
					
					#region Sele
						
						if(P.sele == id) {
							
							// Init
							draw_set_alpha(1)
							var marw = (sprite_get_width(sprMarker)*.01)/2
							
							// Outline
							draw_circle_color(x2,y2,marw+5,cNeonYellow,cYellow,t)
							
							// Draw Name
							var str = "ID:"+string(nameStr)+" "
							if(list_is(P.hist.bdyL))
								if(list_has_inst(P.hist.bdyL,id))
									str += "(V)"
							if(list_is(P.hist.tHubL))
								if(list_has_inst(P.hist.tHubL,id))
									str += "(T)"
							str += "\nDist:"+string(pdist)
							draw_set_font(fHUD)
							var strx = x2-marw
							var stry = y2-marw-5
							draw_set_hvalign([fa_left,fa_bottom])
							draw_text_color(strx,stry,str,cYellow,cYellow,
								cNeonYellow,cNeonYellow,1)
							
						}
						
					#endregion
					
				#endregion
				*/
				
			}
			
		}
		
	}
	
}