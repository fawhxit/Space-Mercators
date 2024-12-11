// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_system_body(sysInst,type) {
	
	switch(type) {
		
		#region Star
		
			case _sysBody.star: {
			
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
				
					// Init
					var d = D.sys.star
				
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = "Unknown"
						typ = _sysBody.star
						xx = 0
						xxo = 0
						yy = 0
						yyo = 0
						sysx = 0
						sysxo = 0
						sysy = 0
						sysyo = 0
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = random_range(d.sclMn,d.sclMx)
						sclo = scl
						relMod = 1
						relModo = 1
						var roll = flip(array_length(d.sprArr)-1)
						sprite_index = d.sprArr[roll]
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
					
						#region Colors
						
							// Red
							if(flip(1)) {
							
								if(flip(1)) r = 255
								else r = irandom_range(192,255)
							
							} else r = 0
							ro = r
						
							// Green
							if(flip(1)) {
							
								if(flip(1)) g = 255
								else g = irandom_range(192,255)
							
							} else g = 0
							go = g
						
							// Blue
							if(flip(1)) {
							
								if(flip(1)) b = 255
								else b = irandom_range(192,255)
							
							} else b = 0
							bo = b
						
							// Ensure not black
							if(r == 0 and g == 0 and b == 0) {
							
								r = 255
								ro = r
							
							}
						
						#endregion
					
						do_blend = t
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = 0
						dego = 0
						degi = 0
						degio = 0
						port = chance(5)
						dev = noone
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
		
		#endregion
		
		#region Random
			
			default: {
				
				// Random Planetoid
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = random_sys_body()
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = "Unknown"
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = random_range(pick.sclMn,pick.sclMx)
						sclo = scl
						relMod = 1
						relModo = 1
						var roll = flip(array_length(pick.sprArr)-1)
						sprite_index = pick.sprArr[roll]
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						
						#region Colors
							
							// Red
							if(flip(1)) {
								
								if(flip(1)) r = 255
								else r = irandom_range(192,255)
								
							} else r = 0
							ro = r
							
							// Green
							if(flip(1)) {
								
								if(flip(1)) g = 255
								else g = irandom_range(192,255)
								
							} else g = 0
							go = g
							
							// Blue
							if(flip(1)) {
								
								if(flip(1)) b = 255
								else b = irandom_range(192,255)
								
							} else b = 0
							bo = b
							
							// Ensure not black
							if(r == 0 and g == 0 and b == 0) {
								
								r = 255
								ro = r
								
							}
							
						#endregion
						
						do_blend = t
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = chance(20)
						dev = pick_dev()
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
	}
	
}

function init_system_body_specific(sysInst,type) {
	
	switch(type) {
		
		#region Sol
			
			case "Sol": {
			
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
				
					// Init
					var pick = D.sys.star
				
					#region Basics
					
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = _sysBody.star
						xx = 0
						xxo = 0
						yy = 0
						yyo = 0
						sysx = 0
						sysxo = 0
						sysy = 0
						sysyo = 0
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,0.75)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprStar
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						do_blend = t
						r = color_get_red(cYellow)
						g = color_get_green(cYellow)
						b = color_get_blue(cYellow)
						blend = cYellow
						blendo = cYellow
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = (sprite_get_width(sprite_index)*scl)
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = 0
						dego = 0
						degi = 0
						degio = 0
						port = f
						dev = noone
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Mercury
		
			case "Mercury": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.dry
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,0.33)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprMercury
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just Atmos for RGB/Blend
						r = 255
						g = 255
						b = 255
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.rur
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Venus
		
			case "Venus": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.dry
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,0.5)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprVenus
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just White for rgb
						r = 255
						g = 128
						b = 0
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.urb
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Earth
		
			case "Earth": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.terran
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,0.75)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprEarth
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just White for rgb
						r = 64
						g = 64
						b = 192
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.cap
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Mars
		
			case "Mars": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.dry
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,0.5)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprMars
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just Atmos for Blend
						r = 255
						g = 128
						b = 0
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.met
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		// Asteroid Field TODO TODO TODO
		
		#region Jupiter
		
			case "Jupiter": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.gas1
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,1)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprJupiter
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just Atmos for Blend
						r = 255
						g = 128
						b = 0
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.col_mn
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Saturn
		
			case "Saturn": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.ring
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,1)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprSaturn
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just Atmos for blend
						r = 160
						g = 160
						b = 0
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.col_mj
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Uranus
		
			case "Uranus": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.ice
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,.75)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprUranus
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just White for rgb
						r = 64
						g = 64
						b = 192
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.pri
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
		#region Neptune
		
			case "Neptune": {
				
				var e = instance_create_layer(sysInst.w,0,"BG1",oSystemBody)
				with(e) {
					
					var pick = D.sys.ice
					#region Basics
						
						sys = sysInst
						par = noone
						persistent = t
						init_done = f
						nameStr = type
						typ = pick.typ
						xx = 0
						xxo = xx
						yy = 0
						yyo = yy
						sysx = 0
						sysxo = sysx
						sysy = 0
						sysyo = sysy
						relx = 0
						relxo = relx
						rely = 0
						relyo = rely
						scl = lerp(pick.sclMn,pick.sclMx,1)
						sclo = scl
						relMod = 1
						relModo = 1
						sprite_index = sprNeptune
						image_xscale = scl
						image_yscale = scl
						image_xscaleOrig = image_xscale
						image_yscaleOrig = image_yscale
						// Just White for rgb
						r = 64
						g = 64
						b = 192
						do_blend = f
						blend = make_color_rgb(r,g,b)
						blendo = make_color_rgb(r,g,b)
						if(do_blend) image_blend = blend
						else image_blend = cWhite
						a = 1
						ao = 1
						image_alpha = a
						dia = sprite_get_width(sprite_index)*scl
						diao = dia
						rad = dia/2
						rado = rad
						dist = sys.w+rad
						disto = dist
						distOrig = dist
						sys.w += dia*random_range(3,10)
						vel = 0
						velo = 0
						dir = 0
						diro = 0
						deg = random(360)
						dego = 0
						degi = dia/dist
						if(flip(1)) degi*=-1
						degio = degi
						port = t
						dev = D.dev.pri
						chiL = noone
						
					#endregion
					
				}
				
				return e
				
			}
			
		#endregion
		
	}
	
}