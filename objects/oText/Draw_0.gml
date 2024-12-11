/// @description Self

// BG1
if(active and !gui) {
	
	// Init
	draw_set_alpha(bgc[0])
	draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
		bgc[1],bgc[2],bgc[3],bgc[4],f)
	
	// Text
	draw_set_hvalign(strhva)
	draw_set_font(strf)
	var xx = lerp(xy[0],xy[2],.5)
	var yy = lerp(xy[1],xy[3],.5)
	if(strhva[0] == fa_left) xx = xy[0]
	if(strhva[1] == fa_top) yy = xy[1]
	if(strhva[0] == fa_right) xx = xy[2]
	if(strhva[1] == fa_bottom) yy = xy[3]
	draw_text_transformed_color(xx,yy,str,M.fSclx,M.fScly,0,strc[1],strc[2],
		strc[3],strc[4],strc[0])
	
}