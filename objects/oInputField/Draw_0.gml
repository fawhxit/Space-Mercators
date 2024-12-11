/// @description Self

if(!gui) {
	
	// BG
	if(active) draw_set_alpha(bgc[0])
	else draw_set_alpha(bgc[0]/2)
	draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
		bgc[1],bgc[2],bgc[3],bgc[4],f)
	
	// Highlight & Action
	if(mouse_in_rectangle(xy) and active) {
		
		// Hilight
		if(mbl) draw_set_alpha(fgc[0]*(.1))
		else draw_set_alpha(fgc[0]*(1/3))
		draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
			fgc[4],fgc[3],fgc[2],fgc[1],f)
		
		if(mblr) button_action(id)
		
	}
	
	// FG1
	if(active) draw_set_alpha(fgc[0])
	else draw_set_alpha(fgc[0]/2)
	draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
		fgc[1],fgc[2],fgc[3],fgc[4],t)
	
	// Label
	draw_set_hvalign(strhva)
	draw_set_font(strf)
	var xx = lerp(xy[0],xy[2],.5)
	var yy = lerp(xy[1],xy[3],.5)
	if(active) draw_text_transformed_color(xx,yy,str,M.fSclx,M.fScly,0,strc[1],strc[2],
		strc[3],strc[4],strc[0])
	else draw_text_transformed_color(xx,yy,str,M.fSclx,M.fScly,0,strc[1],strc[2],
		strc[3],strc[4],strc[0]/2)
		
}