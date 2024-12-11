/// @description Draw Scene

if(init_done and gui) {
    
    // Draw Sprite BG
    draw_self()
    
    switch(locale.typ) {
        
        case _locale.tradeHub: {
            
            if(locale.account) {
                
                #region Draw Account
					
					if(is(P,oPlayer,f)) {
					    
						if(is(par,oLocalSystem,t)) {
							
							// Init
							var xypct = locale.xypct
							var gxy = [WW*xypct[0],WH*xypct[1],WW*xypct[2],WH*xypct[3]]
							var gw = gxy[2]-gxy[0]
							var gh = gxy[3]-gxy[1]
							
							// Graph BG
							draw_set_alpha(bgc[0])
							draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
								bgc[1],bgc[2],bgc[3],bgc[4],f)
							
							// Draw Graph Content
							draw_set_alpha(fgc[0])
							for(var i = 0; i < D.TOE.def[$ _TOEk.eCnt]; i++) {
								
								// TODO
								
							}
							
							// Graph Outline
							draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
								fgc[1],fgc[2],fgc[3],fgc[4],t)
							
						}
						
					}
					
				#endregion
                
            } else if(locale.postings) {
                
                #region Draw Postings
					
					if(is(P,oPlayer,f)) {
					    
						if(is(par,oLocalSystem,t)) {
							
							// Init
							var xypct = locale.xypct
							var gxy = [WW*xypct[0],WH*xypct[1],WW*xypct[2],WH*xypct[3]]
							var gw = gxy[2]-gxy[0]
							var gh = gxy[3]-gxy[1]
							
							// Graph BG
							draw_set_alpha(bgc[0])
							draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
								bgc[1],bgc[2],bgc[3],bgc[4],f)
							
							// Draw Graph Content
							draw_set_alpha(fgc[0])
							for(var i = 0; i < D.TOE.def[$ _TOEk.eCnt]; i++) {
								
								// TODO
								
							}
							
							// Graph Outline
							draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
								fgc[1],fgc[2],fgc[3],fgc[4],t)
							
						}
						
					}
					
				#endregion
                
            } else if(locale.streams) {
                
                #region Draw Streams
					
					if(is(P,oPlayer,f)) {
					    
						if(is(par,oLocalSystem,t)) {
							
							// Init
							var xypct = locale.xypct
							var gxy = [WW*xypct[0],WH*xypct[1],WW*xypct[2],WH*xypct[3]]
							var gw = gxy[2]-gxy[0]
							var gh = gxy[3]-gxy[1]
							
							// Graph BG
							draw_set_alpha(bgc[0])
							draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
								bgc[1],bgc[2],bgc[3],bgc[4],f)
							
							// Draw Graph Content
							draw_set_alpha(fgc[0])
							for(var i = 0; i < D.TOE.def[$ _TOEk.eCnt]; i++) {
								
								// TODO
								
							}
							
							// Graph Outline
							draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
								fgc[1],fgc[2],fgc[3],fgc[4],t)
							
						}
						
					}
					
				#endregion
                
            } else if(locale.metrics) {
                
                #region Draw Metrics
					
					if(is(P,oPlayer,f)) {
						
						if(is(par,oLocalSystem,t)) {
							
							#region Graph Frame
								
								// Init
								var xypct = locale.xypct
								var gxy = [WW*xypct[0],WH*xypct[1],WW*xypct[2],WH*xypct[3]]
								var gw = gxy[2]-gxy[0]
								var gh = gxy[3]-gxy[1]
								var gsx = gw/D.TOE.def[$ _TOEk.eCnt]
								var gsy = gh/D.TOE.def[$ _TOEk.amt]
								
								// Graph BG
								draw_set_alpha(bgc[0])
								draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
									bgc[1],bgc[2],bgc[3],bgc[4],f)
									
							#endregion
							
							#region Draw Graph Content
								
								draw_set_alpha(fgc[0])
								for(var i = 0; i < D.TOE.def[$ _TOEk.eCnt]; i++) {
									
									// Init
									var x1,x2,y1,y2
									
									#region Chart Elements
										
										var eAmt1 = par.ES[$ i][$ _TOEk.amt]
										var eAmt2
										x1 = gxy[0]+(i*gsx)
										y1 = gxy[3]-(eAmt1*gsy)
										// X2 & eAmt2 Are dependent on next element
										// So if is last element, just stretch it to end
										if(i+1 < D.TOE.def[$ _TOEk.eCnt]) {
											
											// Not
											eAmt2 = par.ES[$ i+1][$ _TOEk.amt]
											x2 = gxy[0]+((i+1)*gsx)
											
										} else {
											
											// Yes, Last...
											eAmt2 = eAmt1
											x2 = gxy[0]+((i+1)*gsx)
											
										}
										y2 = gxy[3]-(eAmt2*gsy)
										draw_line_width_color(x1,y1,x2,y2,3,cNeonGreen,cGreen)
										
									#endregion
									
									#region Element Ticks (Every 10)
										
										if(i%10 == 0 or i == D.TOE.def[$ _TOEk.eCnt]-1) {
											
											// Tick
											draw_line_color(x1,gxy[3],x1,gxy[3]+CHARH,fgc[1],fgc[3])
											
											// Tick Label
											draw_set_hvalign([fa_middle,fa_top])
											draw_text_color(x1,gxy[3]+CHARH,string(i+1)+"\n"+D.TOE.L[|i][$ _TOEk.SYM],
												fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
											
										}
										
									#endregion
									
									#region Mouse Over
										
										if(mouse_in_gui_rectangle([x1,gxy[1],x2,gxy[3]])) {
											
											// Draw Vert Line
											draw_line_width_color(x1,gxy[1],x1,y1,2,cNeonYellow,cYellow)
											
											// Draw Info (Like Tooltip)
											var xx
											// Text Padding from Mouse
											if(i <= D.TOE.def[$ _TOEk.eCnt]/2) {
												
												draw_set_hvalign([fa_left,fa_bottom])
												xx = WMX+CHARW
												
											} else {
												
												draw_set_hvalign([fa_right,fa_bottom])
												xx = WMX-(CHARW*1.5)
												
											}
											draw_text_color(xx,WMY,string(i+1)+"\n"+string_upper(D.TOE.L[|i][$ _TOEk.NAM])
												+"\n"+string(eAmt1)+"mt",cNeonYellow,cNeonYellow,cYellow,cYellow,fgc[0])
											
										}
										
									#endregion
									
								}
								
							#endregion
							
							#region Final Draws
								
								#region Amount Lines
									
									for(var i = D.TOE.def[$ _TOEk.amt]-(D.TOE.def[$ _TOEk.amt]/10);
										i > 0; i -= D.TOE.def[$ _TOEk.amt]/10) {
										
										// Init
										var xx = lerp(gxy[0],gxy[2],.8)
										var yy = gxy[3]-(gsy*i)
										
										// Line
										draw_line_color(gxy[0],yy,gxy[2],yy,fgc[1],fgc[3])
										
										// Line Label
										draw_set_hvalign([fa_middle,fa_bottom])
										draw_text_color(xx,yy,string(i)+"mt",
											fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
										
									}
									
								#endregion
								
								// Graph Outline
								draw_rectangle_color(gxy[0],gxy[1],gxy[2],gxy[3],
									fgc[1],fgc[2],fgc[3],fgc[4],t)
									
							#endregion
							
						}
						
					}
					
				#endregion
                
            } else if(locale.exchange) {
                
                #region Draw Exchange
					
					if(is(P,oPlayer,f)) {
						
						if(is(par,oLocalSystem,t)) {
							
							#region Exchange Frame
								
								// Init
								var xypct = locale.xypct
								var sxy = [WW*xypct[0],WH*xypct[1],WW*xypct[2],WH*xypct[3]]
								var sw = sxy[2]-sxy[0]
								var sh = sxy[3]-sxy[1]
								
								// Scroll Control
								if(mouse_in_gui_rectangle(sxy)) {
									
									if(mwu) {
										
										if(kbSHFT) locale.exScrly += 40
										else locale.exScrly += 20
										
									} else if(mwd) {
										
										if(kbSHFT) locale.exScrly -= 40
										else locale.exScrly -= 20
										
									}
									
								}
								
								// Exchange BG
								draw_set_alpha(bgc[0])
								draw_rectangle_color(sxy[0],sxy[1],sxy[2],sxy[3],
									bgc[1],bgc[2],bgc[3],bgc[4],f)
								
							#endregion
							
							#region Surface Init TODO: Use Surface_Open
								
								var s = surface_create(max(sw,100),max(sh,100))
								if(!list_is(surfL)) surfL = ds_list_create()
								ds_list_add(surfL,s)
								surface_set_target(s)
								
							#endregion
							
							#region Element Declaration Template
								
								/*
								
								// Add  Struct to L
								
								i = #
								L[|i] = {}
								L[|i][$ _TOEk.NUM] = #
								L[|i][$ _TOEk.SYM] = ""
								L[|i][$ _TOEk.NAM] = ""
								L[|i][$ _TOEk.MAS] = #
								L[|i][$ _TOEk.TYP] = _TOEv.
								L[|i][$ _TOEk.BOI] = #
								L[|i][$ _TOEk.MEL] = #
								L[|i][$ _TOEk.RAD] = #
								L[|i][$ _TOEk.NEG] = #
								L[|i][$ _TOEk.ION] = #
								L[|i][$ _TOEk.DEN] = #
								
								*/
								
							#endregion
							
							#region Draw Surface Content (Elemnt Listings)
								
								for(var i = 0; i < D.TOE.def[$ _TOEk.eCnt]; i++) {
									
									#region Listing Container
										
										// Init Line
										draw_set_alpha(fgc[0])
										var xx1 = CHARW
										var yy1 = locale.exScrly+CHARH+(i*(CHARH*5))
										var xx2 = sw-CHARW
										var yy2 = locale.exScrly+CHARH+((i+1)*(CHARH*5))
										
										// Top Line
										draw_line_width_color(xx1,yy1,xx2,yy1,2,fgc[1],fgc[3])
										// Bot Line
										draw_line_width_color(xx1,yy2,xx2,yy2,2,fgc[1],fgc[3])
										
									#endregion
									
									#region Selection Hilight
										
										if(sele == i) {
											
											// Hilight
											draw_set_alpha(fgc[0]*d3)
											draw_rectangle_color(xx1,yy1,xx2,yy2,
												cYellow,cYellow,cNeonYellow,cNeonYellow,f)
											
										}
										
									#endregion
									
									#region Init Strings (Element Info)
										
										// Init Str1
										var s1,s2,s3
										#region String Parts (Unknown Parts?)
											
											// Number
											s1 = D.TOE.L[|i][$ _TOEk.NUM]
											if(is_undefined(s1)) s1 = "UNK"
											else s1 = string(s1)
											// Mass
											s2 = D.TOE.L[|i][$ _TOEk.MAS]
											if(is_undefined(s2)) s2 = "UNK"
											else s2 = string(s2)
											// Type
											s3 = D.TOE.L[|i][$ _TOEk.TYP]
											if(is_undefined(s3)) s3 = "UNK"
											else s3 = toe_get_atomic_type_str(D.TOE.L[|i][$ _TOEk.TYP])
											
										#endregion
										var str1 = string_upper(D.TOE.L[|i][$ _TOEk.NAM])
											+" ("+D.TOE.L[|i][$ _TOEk.SYM]+")"
											+"\nAtomic Number: "+s1
											+"\nAtomic Mass: "+s2
											+"\nType: "+s3
										var str1w = string_width(str1)+CHARW
										// Init Str2
										#region String Parts (Unknown Parts?)
											
											// Boiling
											s1 = D.TOE.L[|i][$ _TOEk.BOI]
											if(is_undefined(s1)) s1 = "UNK"
											else s1 = string(s1)
											// Melting
											s2 = D.TOE.L[|i][$ _TOEk.MEL]
											if(is_undefined(s2)) s2 = "UNK"
											else s2 = string(s2)
											// Radii
											s3 = D.TOE.L[|i][$ _TOEk.RAD]
											if(is_undefined(s3)) s3 = "UNK"
											else s3 = string(s3)
											
										#endregion
										var str2 = "\nBoil: "+s1
											+"\nMelt: "+s2
											+"\nRadii: "+s3
										var str2w = string_width(str2)+CHARW
										// Init Str3
										#region String Parts (Unknown parts?)
											
											// Electronegativity
											s1 = D.TOE.L[|i][$ _TOEk.NEG]
											if(is_undefined(s1)) s1 = "UNK"
											else s1 = string(s1)
											// 1st Ionization
											s2 = D.TOE.L[|i][$ _TOEk.ION]
											if(is_undefined(s2)) s2 = "UNK"
											else s2 = string(s2)
											// Density
											s3 = D.TOE.L[|i][$ _TOEk.DEN]
											if(is_undefined(s3)) s3 = "UNK"
											else s3 = string(s3)
											
										#endregion
										var str3 = "\nElectro: "+s1
											+"\n1st Ion: "+s2
											+"\nDensity: "+s3
										var str3w = string_width(str3)+CHARW
										// Init Str4
										var s2 = ""
										if(!variable_struct_exists(P.cargo.e,i))
											s2 = 0
										else s2 = P.cargo.e[$ i][$ _TOEk.amt]
										var str4 = "\nMarket: "+string(par.ES[$ i][$ _TOEk.amt])
											+"\nCargo: "+string(s2)
											+"\nValue: "+string(par.ES[$ i][$ _TOEk.val])
										var str4w = string_width(str4)+CHARW
										
									#endregion
									
									#region Draw Strings (Element info)
										
										// Str 1 (Don't need to add strw for 1st string since 0)
										var strw = 0
										draw_set_hvalign([fa_left,fa_top])
										draw_text_color(xx1,yy1+(CHARH/2),str1,
											fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
										strw += str1w	// Add drawn string width to strw for each
														// since we're drawing more to the right
										// Str 2
										draw_set_hvalign([fa_left,fa_top])
										draw_text_color(xx1+strw,yy1+(CHARH/2),str2,
											fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
										strw += str2w
										// Str 3
										draw_set_hvalign([fa_left,fa_top])
										draw_text_color(xx1+strw,yy1+(CHARH/2),str3,
											fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
										strw += str3w
										// Str 4
										draw_set_hvalign([fa_left,fa_top])
										draw_text_color(xx1+strw,yy1+(CHARH/2),str4,
											fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
										strw += str4w
										
									#endregion
									
									#region Selection Buttons
										
										if(sele == i) {
											
											// Init
											var bxy = [xx1+strw+CHARW,yy1+CHARH,xx2-CHARW,yy2-CHARH]
											var bw = bxy[2]-bxy[0]
											var bh = bxy[3]-bxy[1]
											var xypct = [bxy[0]/WW,bxy[1]/WH,bxy[2]/WW,bxy[3]/WH]
											var pctw = xypct[2]-xypct[0]
											var pct4 = pctw/4
											
											// Buy/Sell Toggle
											locale.exBtn0.xypct = [bxy[0]/WW,bxy[1]/WH,bxy[2]/WW,bxy[3]/WH]
											locale.exBtn0.xypct[2] += 0.01 
											locale.exBtn0.xypct[2] = locale.exBtn0.xypct[0]+pct4-0.01
											locale.exBtn0.hide = f
											locale.exBtn0.active = t
											button_draw(locale.exBtn0,sxy)
											
											// x1
											locale.exBtn1.xypct = [bxy[0]/WW,bxy[1]/WH,bxy[2]/WW,bxy[3]/WH]
											locale.exBtn1.xypct[0] = locale.exBtn0.xypct[2]+0.01
											locale.exBtn1.xypct[2] = locale.exBtn1.xypct[0]+pct4-0.01
											locale.exBtn1.hide = f
											locale.exBtn1.active = t
											button_draw(locale.exBtn1,sxy)
											
											// x10
											locale.exBtn2.xypct = [bxy[0]/WW,bxy[1]/WH,bxy[2]/WW,bxy[3]/WH]
											locale.exBtn2.xypct[0] = locale.exBtn1.xypct[2]+0.01
											locale.exBtn2.xypct[2] = locale.exBtn2.xypct[0]+pct4-0.01
											locale.exBtn2.hide = f
											locale.exBtn2.active = t
											button_draw(locale.exBtn2,sxy)
											// x100
											locale.exBtn3.xypct = [bxy[0]/WW,bxy[1]/WH,bxy[2]/WW,bxy[3]/WH]
											locale.exBtn3.xypct[0] = locale.exBtn2.xypct[2]+0.01
											locale.exBtn3.xypct[2] = locale.exBtn3.xypct[0]+pct4-0.01
											locale.exBtn3.hide = f
											locale.exBtn3.active = t
											button_draw(locale.exBtn3,sxy)
											
										}
										
									#endregion
									
									#region Mouse Over Container
										
										var mx1 = sxy[0]+xx1
										var my1 = sxy[1]+yy1
										var mx2 = sxy[0]+xx2
										var my2 = sxy[1]+yy2
										
										if(mouse_in_gui_rectangle([sxy[0],sxy[1],sxy[2],sxy[3]])
											and mouse_in_gui_rectangle([mx1,my1,mx2,my2])) {
											
											#region Tooltip
												
												var xx
												// Text Padding from Mouse
												if(i <= D.TOE.def[$ _TOEk.eCnt]/2) {
													
													draw_set_hvalign([fa_left,fa_bottom])
													xx = (WMX+CHARW)-sxy[0]
													
												} else {
													
													draw_set_hvalign([fa_right,fa_bottom])
													xx = (WMX-(CHARW*1.5))-sxy[0]
													
												}
												
												if(sele != i) {
													
													// Tooltip Not Selected
													draw_text_color(xx,WMY-sxy[1],"Select "
														+string_upper(D.TOE.L[|i][$ _TOEk.NAM]),
														cNeonYellow,cNeonYellow,cYellow,cYellow,fgc[0])
													
												}
													
											#endregion
											
											#region Hilight
												
												if(sele != i) {
													
													if(!mbl) draw_set_alpha(fgc[0]*d2)
													else draw_set_alpha(fgc[0]*d3)
													draw_rectangle_color(xx1,yy1,xx2,yy2,
														fgc[1],fgc[2],fgc[3],fgc[4],f)
													
												}
												
											#endregion
											
											// Select
											if(mblr) sele = i
											
										}
										
									#endregion
									
								}
								
							#endregion
							
							#region Final Draws TODO: Use Surface Apply
								
								// Finally, Draw Surface
								draw_set_alpha(fgc[0])
								surface_reset_target()
								draw_surface(s,sxy[0],sxy[1])
								
								// Graph Outline
								draw_rectangle_color(sxy[0],sxy[1],sxy[2],sxy[3],
									fgc[1],fgc[2],fgc[3],fgc[4],t)
									
							#endregion
							
						}
						
					}
					
				#endregion
                
            }
            
            #region Cargo Info & System Info
            	
            	draw_set_hvalign([fa_left,fa_top])
            	draw_text_color(CHARW,CHARH,"Credits: "+string(P.cargo.credit)
					+"  System Tax: "+string(par.exTax)+"%"
            		+"\nWeight: "+string(P.cargo.weight_limit)+"/"+string(P.cargo.weight_used)+" mt"
            		+"\nSpace: "+string(P.cargo.size_limit)+"/"+string(P.cargo.size_used)+" m³"
            		,cWhite,cWhite,cLtGrey,cLtGrey,1)
            	
            #endregion
            
            break
            
        }
        
    }
    
}

// Destroy Surface List TODO: Use Surface Apply
surface_destroy_list(surfL)