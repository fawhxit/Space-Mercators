/// @description Debug Draw
	
if(DBGenable) {
	
	// Init
	var str = ""
	
	// Room Debug
	if(DBGmode == _dbg.full or DBGmode == _dbg.txt) {
		
		str += string(room_get_name(room))+"\n"
		str += string("Zoom/old: {0}/{1}\n",z,zo)
		str += string("Room W/H: {0}/{1}\n",room_width,room_height)
		var px,py
		if(is(P,oPlayer,f)) {px = P.x; py = P.y}
		else {px = noone; py = noone}
		str += string("P X/Y: {0}/{1}\n",px,py)
		var cx,cy
		if(is(P,oPlayer,f))
			if(is(P.sys,oLocalSystem,t)) {cx = P.sys.cenx; cy = P.sys.ceny}
			else {cx = noone; cy = noone}
		str += string("System Center X/Y: {0}/{1}\n",cx,cy)
		var bx,by
		if(is(P,oPlayer,f))
			if(is(P.sys,oLocalSystem,t)) {bx = P.sys.bdyL[|0].x; by = P.sys.bdyL[|0].y}
			else {bx = noone; by = noone}
		str += string("Center Body X/Y: {0}/{1}\n",bx,by)
		str += string("Mouse GUI X/Y: {0}/{1}\n",WMX,WMY)
		str += string("Player ID: {0}\n",P.id)
		str += string("Cam 0 Target: {0}\n",camera_get_view_target(view_camera[0]))
		str += string("Cam Offset X/Y: {0}/{1}\n",camOffx,camOffy)
		str += DBGstr1
		
	}
	
	if(DBGmode == _dbg.full or DBGmode == _dbg.local)
		str += DBGstr2
	
	if(DBGmode != _dbg.none) {
		
		// Init2
		draw_set_font(fHUD)
		draw_set_hvalign([fa_left,fa_top])
		var strm = 20
		var strw = string_width_ext(str,CHARH,WW*(1/3))
		var strh = string_height_ext(str,CHARH,WW*(1/3))
		
		// Scroll Debug Print=
		if(kbCTRL and mwu) {
			
			if(!kbSHFT) DBGscrly += 5
			else DBGscrly += 10
			
		} else if(kbCTRL and mwd) {
			
			if(!kbSHFT) DBGscrly -= 5
			else DBGscrly -= 10
			
		}
		
	}
	
	#region Local Debug Graph
		
		if(DBGmode == _dbg.full or DBGmode == _dbg.local) {
			
			if(is(P,oPlayer,f)) {
				
				if(is(P.sys,oLocalSystem,t)) {
					
					// Conatext Debug (Regen Element Distro)
					if(kbENDp) toe_create_local_struct(P.sys,!P.sys.startSys)
					
					// Init
					var es = P.sys.ES
					var gw = (WW*p75)
					var gh = (WH*p75)
					var gmx = (WW*p25)-2
					var gmy = 1
					var gxy = [gmx,gmy,gmx+gw,gmy+gh]
					var gsx = gw/D.TOE.def[$ _TOEk.eCnt]
					var gsy = gh/D.TOE.def[$ _TOEk.amt]
					
					// Graph BG
					draw_set_alpha(DBGbgc[0])
					draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
						DBGbgc[1],DBGbgc[2],DBGbgc[3],DBGbgc[4],f)
					
					// Draw Graph Content
					draw_set_alpha(DBGfgc[0])
					for(var i = 0; i < D.TOE.def[$ _TOEk.eCnt]; i++) {
						
						#region Draw Lines
							
							if(i+1 < D.TOE.def[$ _TOEk.eCnt]) {
								
								var eAmt1 = es[$ i][$ _TOEk.amt]
								var eAmt2 = es[$ i+1][$ _TOEk.amt]
								var x1,x2,y1,y2
								x1 = gxy[0]+(i*gsx)
								y1 = gxy[3]-(eAmt1*gsy)
								x2 = gxy[0]+((i+1)*gsx)
								y2 = gxy[3]-(eAmt2*gsy)
								draw_line_width_color(x1,y1,x2,y2,3,cNeonYellow,cNeonYellow)
								
							}
							
						#endregion
						
					}
					
					// Graph Outline
					draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],c_white,c_white,c_white,c_white,t)
					
				}
				
			}
			
		}
		
	#endregion
	
	#region Draw Debug Text
		
		if(DBGmode != _dbg.none) {
			
			// Draw BG1
			draw_set_alpha(DBGbgc[0])
			draw_rectangle_color(0,DBGscrly,strw+(strm*2),DBGscrly+strh+(strm*2),
				DBGbgc[1],DBGbgc[2],DBGbgc[3],DBGbgc[4],f)
			
			// Draw Text
			draw_text_ext_color(strm,DBGscrly+strm,str,CHARH,strw,DBGfgc[1],DBGfgc[2],DBGfgc[3],DBGfgc[4],DBGfgc[0])
			
			// Reset Main Debug String
			DBGstr1 = ""
			
		}
		
	#endregion

}