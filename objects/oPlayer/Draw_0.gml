/// @description Zoom + Self Draw

if(is_active_game(id,f,f)) {
	
	#region Radar Sweep FX
		
		// Radar Dirs
		radSwpDir1 = rot_dir(radSwpDir1,radSwpDir1+radSwpVel1,radSwpVel1)
		radSwpDir2 = rot_dir(radSwpDir2,radSwpDir2+radSwpVel2,radSwpVel2)
		radSwpDir3 = rot_dir(radSwpDir3,radSwpDir3+radSwpVel3,radSwpVel3)
		
		// Cycle Radar Visibility
		if(kbOp) {
			
			if(rad1) {
				
				if(!rad2)
					rad2 = t
				else if(!rad3)
					rad3 = t
				else {
					
					rad1 = f
					rad2 = f
					rad3 = f
					
				}
				
			} else rad1 = t
			
		}
		
		// Blend for Radars
		gpu_set_blendmode(bm_add)
		
		// Radar 1 (Long)
		if(rad1) for(var i = 0; i < 20; ++i) {
				
				draw_set_alpha(1/(i+1))
				draw_line_color(P.x,P.y,P.x+cos2(radSwpDir1-i,v.sr.e.r),P.y+sin2(radSwpDir1-i,v.sr.e.r),cNeonGreen,cBlack)
				
			}
		
		// Radar 2 (Med)
		if(rad2) {
			
			draw_set_alpha(1/5)
			var clc = (360/4)/2
			draw_triangle_color(P.x,P.y,P.x+cos2(radSwpDir2-clc,v.sr.m.r),P.y+sin2(radSwpDir2-clc,v.sr.m.r),
				P.x+cos2(radSwpDir2+clc,v.sr.m.r),P.y+sin2(radSwpDir2+clc,v.sr.m.r),cNeonGreen,cBlack,cBlack,f)
			
		}
		
		// Radar 3 (Short)
		if(rad3) {
			
			draw_set_alpha(1/10)
			clc = (360*(2/3))/2
			draw_triangle_color(P.x,P.y,P.x+cos2(radSwpDir3-clc,v.sr.s.r),P.y+sin2(radSwpDir3-clc,v.sr.s.r),
				P.x+cos2(radSwpDir3+clc,v.sr.s.r),P.y+sin2(radSwpDir3+clc,v.sr.s.r),cNeonGreen,cBlack,cBlack,f)
			
		}
		
		gpu_set_blendmode(bm_normal)
		
		
	#endregion
	
	#region Vessel Drawing
		
		// Init
		var sz = array_length(fArr)
		var xscl = image_xscale
		var yscl = image_yscale
		var xxo,yyo
		xxo = 0
		yyo = 0
		if(tranWarpLeni <= 0) {
			
			xscl = scl*M.z
			yscl = xscl
			
		} else if(is(sys,oLocalSystem,t)) {
			
			var pct = tranWarpLeni/(tranWarpLen/2)
			xscl = (scl*M.z)*(1+(tranWarpSclMod*pct))
			yscl = (scl*M.z)/(1+(tranWarpSclMod*pct))
			var dir2 = 0
			if(tranWarpIn) dir2 = 180
			if(pct >= 1/2 and !tranWarpIn) {
				
				// Warp Explosion!
				if(!tranWarpFX) {
					
					list_sfx_add(audio_play_sound_on(mEmt,sfxWarp1,f,0),.9)
					list_sfx_add(audio_play_sound_on(mEmt,sfxWarp2,f,0),.9)
					var e = instance_create_layer(0,0,"Logic",oAudioTrigger)
					e.emt = mEmt
					e.del = room_speed/5
					e.audioType = _fx.sfx
					e.loops = f
					e.priority = 0
					e.soundid = sfxWarpSplashOut1
					e.pitch = 2/3
					e.init_done = t
					tranWarpFX = t
					
				}
				
				pct*=1000
				
				
			} else if(pct >= 1/2) {
				
				// Warp Explosion!
				if(!tranWarpFX and pct-(1/2) <= .1) {
					
					list_sfx_add(audio_play_sound_on(mEmt,sfxWarp1,f,0),.9)
					list_sfx_add(audio_play_sound_on(mEmt,sfxWarp2,f,0),.9)
					var e = instance_create_layer(0,0,"Logic",oAudioTrigger)
					e.emt = mEmt
					e.del = room_speed/5
					e.audioType = _fx.sfx
					e.loops = f
					e.priority = 0
					e.soundid = sfxWarpSplashOut1
					e.pitch = 2/3
					e.init_done = t
					tranWarpFX = t
					
				}
				
				pct*=1000
				
			}
			xxo = cos2(dir+dir2,sprite_width*pct)
			yyo = sin2(dir+dir2,sprite_width*pct)
			
		}
		image_xscale = xscl
		image_yscale = yscl
		image_angle = dir
		
		#region Override Updates
			
			// Use sz of fArr since they should always be same lengths
			// Iterate (B)oolean (T)ime (Arr)ay
			for(var iy = 0; iy < sz; iy++) {
				
				// Init; Get (B)oolean (T)ime (Arr)ay Element
				var ey = btArr[iy]
				
				if(!is_array(ey)) {
					
					// Set Override (Simple; Directly True/False)
					if(ey == -1) continue // N/A
					else if(ey == -2) bArr[iy] = velTGT == vel
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
						else if(ex == -2) bArr[iy][ix] = velTGT == vel
						else if(ex < btdArr[iy][ix]) btArr[iy][ix] += btiArr[iy][ix]
						else {
							
							bArr[iy][ix] = !bArr[iy][ix]
							btArr[iy][ix] = 0
							
						}
						
					}
					
				}
				
			}
			
		#endregion
		
		var no = noone
		
		#region Draw Actual w/ Shader Stuff
			
			// Loop each sprite element for drawing,
			//
			// if fArr element is noone do simple blend
			// else if fArr element is an array do shader color swap
			//
			// if simple respective tArr element will be direct color
			// otherwise will be a D.(C)olor struct
			for(var iy = 0; iy < sz; iy++) {
				
				// Orbit Correction
				if(orbit) dir2 = 90*-orbitPol
				else dir2 = 0
				
				// Get Color From
				var fe = fArr[iy]
				if(fe == noone) { // Simple/Blend
					
					draw_sprite_ext(sprite_index,iy,x+xxo,y+yyo,xscl,yscl,dir+dir2,tArr[iy],!bArr[iy])
					
					// Warp Glow FX
					if(tranWarp) {
						
						// Init Shader
						shader_set(shGlow)
						shader_set_uniform_f(shGlowInt,tranWarpLeni/(tranWarpLen/4))
						shader_set_uniform_f(shGlowGSCL,tranWarpLeni/(tranWarpLen/4))
						
						// Draw w/ Shader
						draw_sprite_ext(sprite_index,iy,x+xxo,y+yyo,xscl,yscl,dir+dir2,cWhite,tranWarpLeni/tranWarpLen)
						shader_reset()
						
					}
					
				} else if(is_array(fe)) { // Shader
					
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
						draw_sprite_ext(sprite_index,iy,x+xxo,y+yyo,xscl,yscl,dir+dir2,cWhite,1)
						
						// Back to Normal Shader
						shader_reset()
						
					}
					
				}
				
			}
			
		#endregion
		
		#region Marker Indicator
			
			var sprMar = sprMarker
			var marw = sprite_get_width(sprMar)*(M.zOrig/8)
			var tdir = -90
			if(orbit and orbitPol == -1) tdir = 0
			else if(orbit) tdir = 180
			var a = abs(clamp(sprite_width/marw*.8,0,1)-1)
			draw_sprite_ext(sprMar,0,x+xxo,y+yyo,M.zOrig/8,M.zOrig/8,dir+tdir,c_aqua,a)
			
		#endregion
		
	#endregion
	
}