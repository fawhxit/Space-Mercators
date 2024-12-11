/// @description Draw Map

if(M.state == _mode.gameMain) {
	
	if(state == _mode.main and active) {
		
		var sz = ds_list_size(D.sys.L)
		for(var i = 0; i < sz; i++) {
			
			var e = D.sys.L[|i]
			try {
				
				var x2 = e.gx+xx
				var y2 = e.gy+yy
				if(mouse_in_rectangle([x2-5,y2-5,x2+5,y2+5]))
					if(mblp) P.sele = e
				draw_sprite_ext(e.galSpr,0,x2,y2,e.galScl,e.galScl,
					e.galRot,D.sys.L[|i].image_blend,1)
				
			} catch(_ex) show_debug_message(_ex)
			
		}
		
	}
	
}