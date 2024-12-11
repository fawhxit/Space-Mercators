/// @description Logic

if(M.state == _mode.gameMain and init_done) {
	
	#region System
		
		if(sys != noone and active and init_done) {
			
			if(sys.state == _mode.main and sys.active) {
				
				#region Visibility Relative to Player
					
					var vRng = _vis.unk
					var pDist = point_distance(P.x,P.y,x,y)
					var pSR = P.v.sr
					if(pDist <= pSR.v.r)
						vRng = _vis.vis
					else if(pDist <= pSR.s.r)
						vRng = _vis.short
					else if(pDist <= pSR.m.r)
						vRng = _vis.mid
					else if(pDist <= pSR.l.r)
						vRng = _vis.long
					else if(pDist <= pSR.e.r)
						vRng = _vis.ext
					
				#endregion
				
				#region Sprite Drawing Logic (Modular)
					
					// Init
					var sz = array_length(fArr)
					var xscl = image_xscale
					var yscl = image_yscale
					
					#region Override Updates
						
						// Use sz of fArr since they should always be same lengths
						// Iterate (B)oolean (T)ime (Arr)ay
						for(var iy = 0; iy < sz; iy++) {
							
							// Init; Get (B)oolean (T)ime (Arr)ay Element
							var ey = btArr[iy]
							
							if(!is_array(ey)) {
								
								// Set Override (Simple; Directly True/False)
								if(ey == -1) continue // N/A
								else if(ey == -2) bArr[iy] = (vel == velTGT)
								else if(ey < btdArr[iy]) btArr[iy] += btiArr[iy]
								else {
									
									bArr[iy] = !bArr[iy]
									btArr[iy] = 0
									
								}
								
							} else {
								
								// Pre-Loop; Size of Nested (B)oolean (T)ime (Arr)ay (For Regions of a subsprite)
								var sz2 = array_length(ey)
								
								// Iterate Nested (B)oolean (T)ime (Arr)ay (For Regions of a subsprite)
								for(var ix = 0; ix < sz2; ix++) {
									
									// Init; Get Nested (B)oolean (T)ime (Arr)ay Element
									var ex = ey[ix]
									
									// Set Override
									if(ex == -1) continue
									else if(ex == -2) bArr[iy][ix] = (vel == velTGT)
									else if(ex < btdArr[iy][ix]) btArr[iy][ix] += btiArr[iy][ix]
									else {
										
										bArr[iy][ix] = !bArr[iy][ix]
										btArr[iy][ix] = 0
										
									}
									
								}
								
							}
							
						}
						
					#endregion
					
					#region Actual Draw w/ Shader Stuff
						
						if(vRng <= _vis.short and vRng > _vis.unk) {
							
							// Loop each sprite element for drawing,
							//
							// if fArr element is noone do simple blend
							// else if fArr element is an array do shader color swap
							//
							// if simple respective tArr element will be direct color
							// otherwise will be a D.(C)olor struct
							for(var iy = 0; iy < sz; iy++) {
								
								// Orbit Correction
								if(orbit) dir2 = 90
								else dir2 = 0
								
								// Get Color From
								var fe = fArr[iy]
								if(fe == noone) // Simple/Blend
									draw_sprite_ext(sprite_index,iy,x,y,xscl,yscl,dir+dir2,tArr[iy],!bArr[iy])
								else if(is_array(fe)) { // Shader
									
									// Init
									// Get Color To Array
									var te  = tArr[iy]
									var be  = bArr[iy]
									var sz2 = array_length(fe)
									for(var ix = 0; ix < sz2; ix++) {
										
										// Set Shader
										shader_set(shColorSwap)
										
										// Set Tolerance
										shader_set_uniform_f(shSwapTol,2)
										
										// Set Color From
										shader_set_uniform_f(
											shSwapFrom,
											fe[ix].toShaderVal(fe[ix].red),
											fe[ix].toShaderVal(fe[ix].green),
											fe[ix].toShaderVal(fe[ix].blue)
										)
										
										// Set Color To
										shader_set_uniform_f(
											shSwapTo,
											te[ix].toShaderVal(te[ix].red),
											te[ix].toShaderVal(te[ix].green),
											te[ix].toShaderVal(te[ix].blue)
										)
										
										// Apply Override
										shader_set_uniform_f(shSwapOver,be[ix])
										
										// Apply/Draw
										draw_sprite_ext(sprite_index,iy,x,y,xscl,yscl,dir+dir2,cWhite,1)
										
										// Back to Normal Shader
										shader_reset()
										
									}
									
								}
								
							}
							
						}
						
					#endregion
					
				#endregion
				
				#region Vague Drawing (Based on vRng)
					
					if(vRng >= _vis.mid and vRng <= _vis.ext) {
						
						// Init
						var vSZ = max(sprite_width,sprite_height)
						var vC = cGreen
						
						if(vRng == _vis.ext) {
							
							// Use Marker Width for Ping Size Min
							var marw = sprite_get_width(sprMarker)*(M.zOrig/12)
							// Vaguest, just a Circle (Like a Radar Ping)
							// Alpha
							if(vSZ > marw) draw_set_alpha(1/3)
							else draw_set_alpha(1/4)
							
							// Blend Circle for Glow Affect
							gpu_set_blendmode(bm_add)
							
							// Draw Ping
							draw_circle_color(x,y,max(vSZ*2,marw),vC,cBlack,f)
							
							// Reset Blend Mode
							gpu_set_blendmode(bm_normal)
							
						} else if(vRng == _vis.long) {
							
							// Init
							var vw2 = sprite_width/2
							var vh2 = sprite_height/2
							
							// Rectangle w/ Direction
							draw_set_alpha(1/3)
							draw_rectangle_ext_color(x-vw2,y-vh2,x+vw2,y+vh2,
								dir+dir2,vC,vC,vC,vC,f)
							
						} else if(vRng == _vis.mid) {
							
							// Draw Ghost
							draw_sprite_ext(sprite_index,0,x,y,xscl,yscl,dir+dir2,cGrey,2/3)
							
						}
						
					}
					
				#endregion
				
				#region Marker Indicator
					
					// If Inside Mid-Range
					if(vRng <= _vis.long and vRng > _vis.unk) {
						
						var sprMar = sprMarker
						var marw = sprite_get_width(sprMar)*(M.zOrig/12)
						var a = abs(clamp(sprite_width/marw*.8,0,1)-1)
						if(vRng == _vis.long and a > 0) {
							
							// Draw Long Marker for Smaller Vessels
							// Set Alpha
							draw_set_alpha(1/2)
							// Blend Circle for Glow Affect
							gpu_set_blendmode(bm_add)
							draw_circle_color(x,y,marw/2,cGreen,cBlack,f)
							// Reset Blend Mode
							gpu_set_blendmode(bm_normal)
							
						} else if(vRng == _vis.mid)
							draw_sprite_ext(sprMar,0,x,y,M.zOrig/12,M.zOrig/12,dir-90,cLtGrey,a)
						else draw_sprite_ext(sprMar,0,x,y,M.zOrig/12,M.zOrig/12,dir-90,tArr[0],a)
						
					}
					
				#endregion
				
				#region Debug Draws
					
					/*
					// xyTGT
					if(aiMode == _ai.patrolParent and xyTGT != noone) {
						
						draw_set_alpha(1)
						draw_circle_color(xyTGT[0],xyTGT[1],sprite_height/2,cYellow,cYellow,t)
						draw_line_width_color(x,y,xyTGT[0],xyTGT[1],3,cYellow,cYellow)
						
					} else if(par != noone and aiMode == _ai.exitParent) {
						
						draw_set_alpha(1)
						draw_line_width_color(x,y,par.x,par.y,3,cRed,cRed)
						
					}
					
					if(vessel == D.ves.hum.crus.car1) {
						
						draw_set_alpha(1)
						if(xyTGT != noone) draw_line_width_color(x,y,xyTGT[0],xyTGT[1],3,cYellow,cYellow)
						//draw_circle_color(x,y,sprite_height*10,cYellow,cYellow,t)
						
					}
					
					draw_set_alpha(.2)
					draw_rectangle_color(BBL,BBT,BBR,BBB,cRed,cRed,cRed,cRed,f)
					*/
					
				#endregion
				
			}
			
		}
		
	#endregion
	
}