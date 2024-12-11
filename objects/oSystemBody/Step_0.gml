/// @description Logic

if(M.state == _mode.gameMain) {
	
	if(init_done and !sys.cycle) {
		
		if(sys.state == _mode.main and sys.active) {
			
			#region Updates (Accounts for Zoom)
				
				// Image Scale
				image_xscale = (M.z*image_xscaleOrig)
				image_yscale = (M.z*image_yscaleOrig)
				blend = make_color_rgb(r,g,b)
				if(do_blend) image_blend = blend
				else image_blend = cWhite
				image_alpha = a
				
				// Dist Update (Now Done in oLocalSystem Inst)
				dist = distOrig*M.z
				
				// Patrol Dist
				if(sprite_width > sprite_height)
					patrolDist = sprite_width*10
				else patrolDist = sprite_height*10
				
				// Orbit Iteration
				deg += degi/(ndx+.01)
				if(deg < 0) deg += 360
				else if(deg >= 360) deg -= 360
				
				// Trade Hub?
				if(dev != noone)
					if(dev.ndx >= D.dev.urb.ndx)
						locs.tHub.ava = t
					else locs.tHub.ava = f
				
				// Apply Position
				xx = sys.cenx
				yy = sys.ceny
				sysx = ( cos(degtorad(deg))*dist)
				sysy = (-sin(degtorad(deg))*dist)
				x = xx+sysx+relx
				y = yy+sysy+rely
				
			#endregion
			
			// Select via Click Direct?
			if(mouse_in_rectangle([BBL,BBT,BBR,BBB])) {
				
				if(mblp) {
					
					if(P.curr != id and P.sele != id) {
						
						P.sele = id
						P.seleNDX = ndx
						
					} else if(P.sele == id and P.curr != id
						and !P.auto) {
						
						P.sele = noone
						P.seleNDX = noone
						P.curr = id
						P.currNDX = ndx
						
					} else if(P.curr == id and !P.auto and !P.tranWarp) {
						
						P.auto = t
						P.preAuto = t
						
					}
					
				} else if(mbrp) {
					
					if(P.curr == id and !P.auto) {
						
						P.curr = noone
						P.currNDX = noone
						P.prev = id
						P.prevNDX = ndx
						
					} else if(P.sele == id) {
						
						P.sele = noone
						P.seleNDX = noone
						
					} else if(P.prev == id) {
						
						P.prev = noone
						P.prevNDX = noone
						
					}
					
				}
				
			}
			
		}
		
	}
	
}