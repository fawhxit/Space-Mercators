/// @description Init Datae

#region Constructors
	
	C = function(r,g,b) constructor {
		
		red = r
		green = g
		blue = b
		
		static toShaderVal = function(val) {
			return val/255
		}
		
	}
	
#endregion

#region System Data
	
	sys = {
		
		L: ds_list_create(),
		
		bodyArr : [_sysBody.dry,_sysBody.gas1,_sysBody.gas2,_sysBody.ice,
			_sysBody.island,_sysBody.lava,_sysBody.moon,_sysBody.ring,
			_sysBody.smooth,_sysBody.terran],
		
		star: {
			
			typ   : _sysBody.star,
			sclMn  : 10,
			sclMx  : 30,
			sprArr : [sprStar,sprStarNF,sprStarNB,sprStarNFB]
			
		},
		
		dry: {
			
			typ   : _sysBody.dry,
			sclMn  : 3,
			sclMx  : 7,
			sprArr : [sprDry1,sprDry2,sprDry3]
			
		},
		
		gas1: {
			
			typ   : _sysBody.gas1,
			sclMn  : 10,
			sclMx  : 17,
			sprArr : [sprGas1_1,sprGas1_2,sprGas1_3]
			
		},
		
		gas2: {
			
			typ   : _sysBody.gas2,
			sclMn  : 8,
			sclMx  : 15,
			sprArr : [sprGas2_1,sprGas2_2,sprGas2_3]
			
		},
		
		ice: {
			
			typ   : _sysBody.ice,
			sclMn  : 5,
			sclMx  : 10,
			sprArr : [sprIce1,sprIce2,sprIce3]
			
		},
		
		island: {
			
			typ   : _sysBody.island,
			sclMn  : 5,
			sclMx  : 10,
			sprArr : [sprIsland1,sprIsland2,sprIsland3,sprIsland4,
				sprIsland5,sprIsland6,sprIsland7,sprIsland8,sprIsland9]
			
		},
		
		lava: {
			
			typ   : _sysBody.lava,
			sclMn  : 5,
			sclMx  : 10,
			sprArr : [sprLava1,sprLava2,sprLava3,sprLava4,
				sprLava5]
			
		},
		
		moon: {
			
			typ   : _sysBody.moon,
			sclMn  : 1,
			sclMx  : 3,
			sprArr : [sprMoon1,sprMoon2,sprMoon3]
			
		},
		
		ring: {
			
			typ   : _sysBody.ring,
			sclMn  : 12,
			sclMx  : 20,
			sprArr : [sprRing1,sprRing2,sprRing3]
			
		},
		
		smooth: {
			
			typ   : _sysBody.smooth,
			sclMn  : 3,
			sclMx  : 7,
			sprArr : [sprSmooth1,sprSmooth2,sprSmooth3]
			
		},
		
		terran: {
			
			typ   : _sysBody.terran,
			sclMn  : 5,
			sclMx  : 10,
			sprArr : [sprTerran1,sprTerran2,sprTerran3,sprTerran4,
				sprTerran5,sprTerran6,sprTerran7,sprTerran8,sprTerran9]
			
		}
		
	}
	
#endregion

#region Vessels
	
	ves = {
		
		hum: {
			
			auto: {
				
				prb1: {
					
					scl: 1,
					spr: sprShipProbe1H,
					spd: 50,
					hspd: 200
					
				}
				
			},
			
			wing: {
				
				fig1: {
					
					scl: 2,
					spr: sprShipFig1H,
					spd: 40,
					hspd: 175
					
				},
				
				bom1: {
					
					scl: 2.2,
					spr: sprShipBom1H,
					spd: 30,
					hspd: 150
					
				}
				
			},
			
			frig: {
				
				fre1: {
					
					scl: 5,
					spr: sprShipFre1H,
					spd: 25,
					hspd: 100
					
				}
				
			},
			
			crus: {
				
				car1: {
					
					scl: 75,
					spr: sprShipCar1H,
					spd: 10,
					hspd: 50,
					spwnmx: 10
					
					
				}
				
			}
			
		}
		
	}
	
#endregion

#region Development (Unknown, Wild, Civilized, etc.)
	
	dev = {
		
		unk: {
			
			str: "unknown",
			ndx: 0,
			spwnUL: 0
			
		},
		
		pri: {
			
			str: "primitive",
			ndx: 1,
			spwnUL: 2
			
		},
		
		col_mn: {
			
			str: "minor colonial",
			ndx: 2,
			spwnUL: 4
			
		},
		
		col_mj: {
			
			str: "major colonial",
			ndx: 3,
			spwnUL: 8
			
		},
		
		rur: {
			
			str: "rural",
			ndx: 4,
			spwnUL: 16
			
		},
		
		urb: {
			
			str: "urban",
			ndx: 5,
			spwnUL: 24
			
		},
		
		met: {
			
			str: "metropola",
			ndx: 6,
			spwnUL: 40
			
		},
		
		cap: {
			
			str: "capital",
			ndx: 7,
			spwnUL: 56
			
		}
		
	}
	
#endregion

#region Table of Elements
	
	TOE = instance_create_layer(0,0,"Logic",oToE)
	TOE.persistent = t
	
#endregion

#region Animation Stuff
	
	anim = {
		
		warp: {
			
			del: room_speed*10, // Delay before actual Warp Action
			len: room_speed,    // Length of Warp Action
			sclMod: 3,			// Compression/Strech mod on x/y scls
			
		}
		
	}
	
#endregion

#region Old body Init
	
	/*
	par = sysInst
	persistent = t
	init_done = f
	typ = _sysBody.star
	xx = 0
	yy = 0
	relx = 0
	relxo = relx
	rely = 0
	relyo = rely
	scl = random_range(,30)
	sclo = scl
	relMod = 1
	relModo = 1
	sprite_index = sprStar
	image_xscale = scl
	image_yscale = scl
	
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
	
	blend = make_color_rgb(r,g,b)
	blendo = make_color_rgb(r,g,b)
	image_blend = blend
	a = 1
	ao = 1
	image_alpha = a
	dia = (sprite_get_width(sprStar)*scl)
	diao = dia
	rad = dia/2
	rado = rad
	dist = par.w
	disto = dist
	par.w += rad
	vel = 0
	velo = 0
	dir = 0
	diro = 0
	deg = 0
	dego = 0
	degi = 0
	degio = 0
	*/
	
#endregion