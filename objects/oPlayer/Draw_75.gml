/// @description HUD

if(is_active_game(id,f,f)) {
	
	if(is(sys,oLocalSystem,t) and !loc.in) hud.active = t
	else hud.active = f
	
	if(hud.active) {
		
		// TODO: AUTO (UN)COLLAPSE BX0 OR OVERRIDE
		#region Update Box XYs
			
			var bx = hud.bx0
			bx.xy = [bx.pct[0]*M.ww,bx.pct[1]*M.wh+1,
				bx.pct[2]*M.ww-2,bx.pct[3]*M.wh-2]
			bx.wh = [bx.xy[2]-bx.xy[0],bx.xy[3]-bx.xy[1]]
			bx.mouseIn = f
			if(!bx.hide and mouse_in_gui_rectangle(bx.xy))
				bx.mouseIn = t
			
			bx = hud.bx1
			bx.xy = [bx.pct[0]*M.ww+1,bx.pct[1]*M.wh,
				bx.pct[2]*M.ww-1,bx.pct[3]*M.wh-2]
			bx.wh = [bx.xy[2]-bx.xy[0],bx.xy[3]-bx.xy[1]]
			bx.mouseIn = f
			if(!bx.hide and mouse_in_gui_rectangle(bx.xy))
				bx.mouseIn = t
			
			bx = hud.bx2
			bx.xy = [bx.pct[0]*M.ww+1,bx.pct[1]*M.wh,
				bx.pct[2]*M.ww-1,bx.pct[3]*M.wh-2]
			bx.wh = [bx.xy[2]-bx.xy[0],bx.xy[3]-bx.xy[1]]
			hud.conm = (bx.con1[0]*bx.wh[0])
			bx.mouseIn = f
			if(!bx.hide and mouse_in_gui_rectangle(bx.xy))
				bx.mouseIn = t
			
			bx = hud.bx3
			bx.xy = [bx.pct[0]*M.ww+1,bx.pct[1]*M.wh,
				bx.pct[2]*M.ww-2,bx.pct[3]*M.wh-2]
			bx.wh = [bx.xy[2]-bx.xy[0],bx.xy[3]-bx.xy[1]]
			bx.mouseIn = f
			if(!bx.hide and mouse_in_gui_rectangle(bx.xy))
				bx.mouseIn = t
			
		#endregion
		
		#region Update Container XYs
			
			var bx = hud.bx1
			// Dock
			bx.conxy = [bx.xy[0]+hud.conm,bx.xy[1]+hud.conm,
				bx.xy[2]-hud.conm,bx.xy[3]-hud.conm]
				
			bx = hud.bx2
			// Small Dock
			bx.con1xy = [bx.xy[0]+hud.conm,bx.xy[1]+hud.conm,
				bx.xy[0]+(bx.con1[2]*bx.wh[0]),bx.xy[3]-hud.conm]
			// Log
			bx.con2xy = [bx.con1xy[2]+hud.conm,bx.xy[1]+hud.conm,
				bx.xy[2]-hud.conm,bx.xy[3]-hud.conm]
				
			bx = hud.bx3
			// Dock
			bx.conxy = [bx.xy[0]+hud.conm,bx.xy[1]+hud.conm,
				bx.xy[2]-hud.conm,bx.xy[3]-hud.conm]
			
		#endregion
		
		#region Box Controls
			
			var bx = hud.bx0
			var xy
			if(bx.hide) {
				
				// Init
				xy = [M.ww-50,1,M.ww-2,50]
				
				// Arrow < (Show)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.1)
				y1 = lerp(xy[1],xy[3],.5)
				x2 = lerp(xy[0],xy[2],.9)
				y2 = lerp(xy[1],xy[3],.1)
				x3 = lerp(xy[0],xy[2],.9)
				y3 = lerp(xy[1],xy[3],.9)
				
			} else {
				
				xy = [bx.xy[0]-50,bx.xy[1],bx.xy[0]-2,bx.xy[1]+50]
				
				// Arrow > (Hide)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.9)
				y1 = lerp(xy[1],xy[3],.5)
				x2 = lerp(xy[0],xy[2],.1)
				y2 = lerp(xy[1],xy[3],.1)
				x3 = lerp(xy[0],xy[2],.1)
				y3 = lerp(xy[1],xy[3],.9)
				
			}
			
			// Draw Box
			draw_set_alpha(bx.fgc[0])
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				bx.fgc[1],bx.fgc[2],bx.fgc[3],bx.fgc[4],t)
				
			// Draw Arrow + Interaction
			if(mouse_in_gui_rectangle(xy)) {
				
				// Draw Triangle Fill
				if(mbl) draw_set_alpha(1/3)
				else draw_set_alpha(2/3)
				draw_triangle_color(x1,y1,x2,y2,x3,y3,
					bx.fgc[1],bx.fgc[2],bx.fgc[3],f)
				
				// Toggle
				if(mblr) bx.hide = !bx.hide
				
			}
			
			// Draw Outline
			draw_triangle_color(x1,y1,x2,y2,x3,y3,
				bx.fgc[1],bx.fgc[2],bx.fgc[3],t)
				
			bx = hud.bx1
			if(bx.hide) {
				
				// Init
				var xy = [bx.xy[0],M.wh-50,bx.xy[0]+50,M.wh-2]
				
				// Arrow ^ (Show)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.5)
				y1 = lerp(xy[1],xy[3],.1)
				x2 = lerp(xy[0],xy[2],.9)
				y2 = lerp(xy[1],xy[3],.9)
				x3 = lerp(xy[0],xy[2],.1)
				y3 = lerp(xy[1],xy[3],.9)
				
			} else {
				
				var xy = [bx.xy[0],bx.xy[1]-50,bx.xy[0]+50,bx.xy[1]-1]
				
				// Arrow v (Hide)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.5)
				y1 = lerp(xy[1],xy[3],.9)
				x2 = lerp(xy[0],xy[2],.1)
				y2 = lerp(xy[1],xy[3],.1)
				x3 = lerp(xy[0],xy[2],.9)
				y3 = lerp(xy[1],xy[3],.1)
				
			}
			
			// Draw Box
			draw_set_alpha(bx.fgc[0])
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				bx.fgc[1],bx.fgc[2],bx.fgc[3],bx.fgc[4],t)
				
			// Draw Arrow + Interaction
			if(mouse_in_gui_rectangle(xy)) {
				
				// Draw Triangle Fill
				if(mbl) draw_set_alpha(1/3)
				else draw_set_alpha(2/3)
				draw_triangle_color(x1,y1,x2,y2,x3,y3,
					bx.fgc[1],bx.fgc[2],bx.fgc[3],f)
				
				// Toggle
				if(mblr) bx.hide = !bx.hide
				
			}
			
			// Draw Outline
			draw_triangle_color(x1,y1,x2,y2,x3,y3,
				bx.fgc[1],bx.fgc[2],bx.fgc[3],t)
			
			bx = hud.bx2
			if(bx.hide) {
				
				// Init
				var xy = [bx.xy[0],M.wh-50,bx.xy[0]+50,M.wh-2]
				
				// Arrow ^ (Show)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.5)
				y1 = lerp(xy[1],xy[3],.1)
				x2 = lerp(xy[0],xy[2],.9)
				y2 = lerp(xy[1],xy[3],.9)
				x3 = lerp(xy[0],xy[2],.1)
				y3 = lerp(xy[1],xy[3],.9)
				
			} else {
				
				var xy = [bx.xy[0],bx.xy[1]-50,bx.xy[0]+50,bx.xy[1]-2]
				
				// Arrow v (Hide)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.5)
				y1 = lerp(xy[1],xy[3],.9)
				x2 = lerp(xy[0],xy[2],.1)
				y2 = lerp(xy[1],xy[3],.1)
				x3 = lerp(xy[0],xy[2],.9)
				y3 = lerp(xy[1],xy[3],.1)
				
			}
			
			// Draw Box
			draw_set_alpha(bx.fgc[0])
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				bx.fgc[1],bx.fgc[2],bx.fgc[3],bx.fgc[4],t)
				
			// Draw Arrow + Interaction
			if(mouse_in_gui_rectangle(xy)) {
				
				// Draw Triangle Fill
				if(mbl) draw_set_alpha(1/3)
				else draw_set_alpha(2/3)
				draw_triangle_color(x1,y1,x2,y2,x3,y3,
					bx.fgc[1],bx.fgc[2],bx.fgc[3],f)
				
				// Toggle
				if(mblr) bx.hide = !bx.hide
				
			}
			
			// Draw Outline
			draw_triangle_color(x1,y1,x2,y2,x3,y3,
				bx.fgc[1],bx.fgc[2],bx.fgc[3],t)
			
			bx = hud.bx3
			if(bx.hide) {
				
				// Init
				var xy = [bx.xy[0],M.wh-50,bx.xy[0]+50,M.wh-2]
				
				// Arrow ^ (Show)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.5)
				y1 = lerp(xy[1],xy[3],.1)
				x2 = lerp(xy[0],xy[2],.9)
				y2 = lerp(xy[1],xy[3],.9)
				x3 = lerp(xy[0],xy[2],.1)
				y3 = lerp(xy[1],xy[3],.9)
				
			} else {
				
				var xy = [bx.xy[0],bx.xy[1]-50,bx.xy[0]+50,bx.xy[1]-1]
				
				// Arrow v (Hide)
				var x1,y1,x2,y2,x3,y3
				x1 = lerp(xy[0],xy[2],.5)
				y1 = lerp(xy[1],xy[3],.9)
				x2 = lerp(xy[0],xy[2],.1)
				y2 = lerp(xy[1],xy[3],.1)
				x3 = lerp(xy[0],xy[2],.9)
				y3 = lerp(xy[1],xy[3],.1)
				
			}
			
			// Draw Box
			draw_set_alpha(bx.fgc[0])
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				bx.fgc[1],bx.fgc[2],bx.fgc[3],bx.fgc[4],t)
				
			// Draw Arrow + Interaction
			if(mouse_in_gui_rectangle(xy)) {
				
				// Draw Triangle Fill
				if(mbl) draw_set_alpha(1/3)
				else draw_set_alpha(2/3)
				draw_triangle_color(x1,y1,x2,y2,x3,y3,
					bx.fgc[1],bx.fgc[2],bx.fgc[3],f)
				
				// Toggle
				if(mblr) bx.hide = !bx.hide
				
			}
			
			// Draw Outline
			draw_triangle_color(x1,y1,x2,y2,x3,y3,
				bx.fgc[1],bx.fgc[2],bx.fgc[3],t)
			
		#endregion
		
		#region Draw Containers
			
			var bx = hud.bx0
			if(!bx.hide) draw_rectangle_container_gui(noone,bx.xy,bx.bgc,bx.fgc,t,t,0,noone,noone)
			
			bx = hud.bx1
			if(!bx.hide) {
				
				draw_rectangle_container_gui(noone,bx.xy,bx.bgc,bx.fgc,t,t,0,noone,noone)
				draw_rectangle_container_gui(bx,bx.conxy,bx.bgc,bx.fgc,t,t,.1,noone,hud.docks)
				
			}
			
			bx = hud.bx2
			if(!bx.hide) {
				
				draw_rectangle_container_gui(noone,bx.xy,bx.bgc,bx.fgc,t,t,0,noone,noone)
				draw_rectangle_container_gui(bx,bx.con1xy,bx.bgc,bx.fgc,t,t,.1,noone,hud.docks)
				draw_rectangle_container_gui(bx,bx.con2xy,bx.bgc,bx.fgc,t,t,.1,noone,hud.docks)
				
			}
			
			bx = hud.bx3
			if(!bx.hide) {
				
				draw_rectangle_container_gui(noone,bx.xy,bx.bgc,bx.fgc,t,t,0,noone,noone)
				draw_rectangle_container_gui(bx,bx.conxy,bx.bgc,bx.fgc,t,t,.1,noone,hud.docks)
				
			}
			
		#endregion
		
	}
	
}