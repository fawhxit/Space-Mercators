/// @description Init

#region Basic
	
	active = f
	wx  = 0
	wy  = 0
	r   = 20
	str = "Player1"
	fgc = [1,cNeonGreen,cNeonGreen,cDkGreen,cDkGreen]
	image_blend = fgc[1]
	credit = {rec:0,snt:0}
	inv = {}
	spd = 50
	spdOrig = spd
	acc = 1
	accOrig = acc
	velTGT = 0 // For Auto
	vel = 0
	velo = 0
	velxo = 0
	velyo = 0
	velx = 0
	vely = 0
	dirTGT = 0
	dir = 0
	diro = 0
	dirToCen = 0
	dirFromCen = 0
	dirToCeno = 0
	dirFromCeno = 0
	dirToCurr = 0
	dirFromCurr = 0
	dirToCurro = 0
	dirFromCurro = 0
	dirToSele = 0
	dirFromSele = 0
	dirToSeleo = 0
	dirFromSeleo = 0
	dirToPrev = 0
	dirFromPrev = 0
	dirToPrevo = 0
	dirFromPrevo = 0
	dirToTGT = 0
	dirFromTGT= 0
	dirToTGTo = 0
	dirFromTGTo= 0
	rot = 2
	image_xscale = .1
	image_yscale = .1
	gx = 0
	gy = 0

#endregion

#region Vessel Struct
	
	// (V)essel
	v = {
		
		// Basics
		n: noone, // (N)ame
		ty: noone, //(Ty)pe
		
		#region (H)ull Structure
			
			h: {
				
				i: 1, // (I)ntegrity
				s: 1, // (S)trength
				m: noone, // (M)aterial
				l: noone // (L)ist (for child instances, like fx related)
				
			},
			
		#endregion
		
		#region (S)hield System
			
			s: {
				
				i: 1, // (I)ntegrity
				s: 1, // (S)trength
				m: noone, // (M)aterial
				l: noone // (L)ist (for child instances, like fx related)
				
			},
			
		#endregion
		
		#region (W)eapon System
			
			w: {
				
				i: 1, // (I)ntegrity
				lim: 1, // (Lim)it (Number of Weapons)
				l: noone // (L)ist of weapon instances
				
			},
			
		#endregion
		
		#region (E)ngine System
			
			e: {
				
				i: 1, // (I)ntegrity
				l: noone // (L)ist (for child instances, like fx related)
				
				
			},
			
		#endregion
		
		#region (F)uel (B)asic System
			
			fb: {
				
				i: 1, // (I)ntegrity
				ava: 1, // (Ava)ilable
				lim: 1, // (Lim)it
				m: noone, // (M)aterial
				l: noone // (L)ist (for child instances, like fx related)
				
				
			},
			
		#endregion
		
		#region (F)uel (H)yper System
			
			fh: {
				
				i: 1, // (I)ntegrity
				ava: 1, // (Ava)ilable
				lim: 1, // (Lim)it
				m: noone, // (M)aterial
				l: noone // (L)ist (for child instances, like fx related)
				
				
			},
			
		#endregion
		
		#region (F)uel (W)arp System
			
			fw: {
				
				i: 1, // (I)ntegrity
				ava: 1, // (Ava)ilable
				lim: 1, // (Lim)it
				m: noone, // (M)aterial
				l: noone // (L)ist (for child instances, like fx related)
				
				
			},
			
		#endregion
		
		#region (P)ower System
			
			p: {
				
				i: 1, // (I)ntegrity
				e: 1, // (E)ngine Distribution
				s: 1, // (S)hield Distribution
				w: 1, // (W)eapon Distribution
				a: 1, // (A)uxillary Distribution
				l: noone // (L)ist (for child instances, like fx related)
				
			},
			
		#endregion
		
		#region (S)ensory (R)ange Systems
			
			sr: {
				
				// (V)isual
				v: {
					
					i: 1, // (I)ntegrity
					m: 10, // (M)ultiplier from Sprite width
					r: noone // (R)ange
					
				},
				
				// (S)hort Range
				s: {
					
					i: 1, // (I)ntegrity
					m: 3, // (M)ultiplier from Visual
					r: noone // (R)ange
					
				},
				
				// (M)id-range
				m: {
					
					i: 1, // (I)ntegrity
					m: 3, // (M)ultiplier from Short
					r: noone // (R)ange
					
				},
				
				// (L)ong Range
				l: {
					
					i: 1, // (I)ntegrity
					m: 2, // (M)ultiplier from Mid
					r: noone // (R)ange
					
				},
				
				// (E)xtended Range
				e: {
					
					i: 1, // (I)ntegrity
					m: 1.5, // (M)ultiplier from Long
					r: noone // (R)ange
					
				}
				
				
			},
			
		#endregion
		
		#region (C)rew
			
			c: {
				
				i: 1, // (I)ter (Count)
				lim: 1, // (Lim)it
				l: noone // (L)ist (crew instances)
				
			}
			
		#endregion
		
	}

#endregion

#region Cargo Struct
	
	// Element Struct (Cargo (crg)
	cargo = {
		
		credit		 : 1000.00,
		size_limit   : 120.00,
		weight_limit : 500.00,
		temperature  : -50.00,
		e   : {},
		size_used    : 0,
		weight_used  : 0
		
	}

#endregion

#region History Struct (Lists)
	
	hist = {
		
		bdyL: noone,
		tHubL: noone
		
	}
	
#endregion

#region Stats & State Vars INTEGRATE?
	
	// Health/Shield
	hp = 5
	hpmx = 5
	shp = 3
	shpmx = 3
	killed = f
	shieldL = ds_list_create()
	hit = f
	
	// Galaxy Targets
	prev = noone
	prevNDX = noone
	curr = noone
	currNDX = noone
	sele = noone
	seleNDX = noone
	
	// Drive Flags
	stop    = f
	stopped = f
	hyper   = f
	warp    = f
	preAuto = f
	auto    = f
	startOrbit = f
	orbit     = f
	orbitRot  = 90
	orbitDist = noone
	orbitPol  = 1
	if(chance(50)) orbitPol*=-1
	orbitSpd = random_range(0.05,0.10)
	engPit = 0.0
	engPitMn = -(1/3)
	engPitMx = 2/3
	engPitAcc = (1/3)/room_speed
	
	// Weapon Flags
	wpnRdy = f
	wpnDel = room_speed/5
	wpni   = 0
	wpnDir = 0
	wpnVO = [0,0] // Wpn View Offset
	wpnVOo = [0,0] // Wpn View Offset Olds
	wpnVOd = [0,0] // Wpn View Offset Deltas
	
	// Transition Vars
	tranWarp = f
	tranWarpIn = f
	tranWarpStop = f
	tranWarpCancel = f
	tranWarpFX = f
	tranBody = f
	tranWarpDel = D.anim.warp.del
	tranWarpLen = D.anim.warp.len
	tranWarpDeli = noone
	tranWarpLeni = noone
	tranWarpSclMod = D.anim.warp.sclMod

#endregion

#region Game Location/ Locale
	
	sys = instance_create_layer(0,0,"Logic",oLocalSystem)
	sys.persistent = t
	sys.startSys = t
	sys.faction = _faction.humans
	sysx = 0
	sysy = 0
	xPct = 0
	yPct = 0
	sysDego = 0
	sysEx = f
	exTxt = noone
	sysNtr = f
	ntrTxt = noone
	
	// Locale Variables
	loc = {
		
		in: f,
		txt: noone,
		inst : noone
		
	}

#endregion

#region Originals
	
	// Image
	image_xscaleOrig = image_xscale
	image_yscaleOrig = image_yscale

#endregion

#region Vessel Init
	
	// Init
	// Freighter 1h
	sprite_index = sprShipFre1H
	image_speed  = 0
	scl = 5
	scl = 5
	image_xscale = scl
	image_yscale = scl
	image_blend = c_white
	image_index = 0
	dir2 = 0
	
	// Init Shader Stuff
	// From Colors
	cF1 = new D.C(255,255,255)
	cF2 = new D.C(224,224,224)
	cF3 = new D.C(192,192,192)
	cF4 = new D.C(160,160,160)
	cF5 = new D.C(128,128,128)
	// To Colors
	cT1 = new D.C(0,255,0)
	cT2 = new D.C(255,0,0)
	cT3 = new D.C(0,255,255)
	cT4 = new D.C(0,255,255)
	cT5 = new D.C(255,255,255)
	
	fArr = [noone,[cF1,cF2,cF3,cF4,cF5]]
	tArr = [cBlue,[cT1,cT2,cT3,cT4,cT5]]
	bArr  = [f,[t,t,f,t,f]]
	btArr = [-1,[0,0,-2,0,-1]]
	btdArr = [-1,[round(room_speed/2),room_speed,-1,room_speed/4],-1]
	btiArr = [-1,[1,1,-1,1,-1]]
	
	#region Prob Init Example
		
		/*
		// Probe 1h
		sprite_index = sprShipProbe1H
		// From Colors
		cF1 = new D.C(255,255,255)
		cF2 = new D.C(224,224,224)
		cF3 = new D.C(192,192,192)
		cF4 = new D.C(160,160,160)
		// To Colors
		cT1 = new D.C(0,255,0)
		cT2 = new D.C(255,0,0)
		cT3 = new D.C(0,0,255)
		cT4 = new D.C(0,255,255)
		
		fArr = [noone,noone,noone,[cF1,cF2,cF3,cF4]]
		tArr = [cWhite,cRed,cBlue,[cT1,cT2,cT3,cT4]]
		bArr  = [f,f,f,[t,t,f,t]]
		btArr = [-1,-1,-1,[0,0,-1,0]]
		btdArr = [-1,-1,-1,[round(room_speed/2),room_speed,-1,room_speed/4]]
		btiArr = [-1,-1,-1,[1,1,-1,1]]
		*/
		
	#endregion
	
	// Handles
	shSwapTol = shader_get_uniform(shColorSwap,"tol")
	shSwapFrom = shader_get_uniform(shColorSwap,"cFrom")
	shSwapTo = shader_get_uniform(shColorSwap,"cTo")
	shSwapOver = shader_get_uniform(shColorSwap,"over")
	shGlowInt = shader_get_uniform(shGlow,"intensity")
	shGlowGSCL = shader_get_uniform(shGlow,"gscl")
	
#endregion

#region HUD Structs
	
	hud_e = {
		
		stat: {
			
			spr: sprite_index,
			rot: 90,
			scl: 1
			
		},
		
		map: {
			
			sys: noone,
			scl: 1,
			surfL: noone,
			z: 1, // Zooming
			zmn: 0.1,
			zmx: 5.0,
			xxo: 0, // Panning (x/y offsets)
			yyo: 0,
			omx: 0, // Pan Max (Set by furthest body)
			
		},
		
		tgt: {
			
			inst: noone,
			scl: 1,
			info: t
			
		}
		
	}
	
	hud = {
		
		active: t,
		conm  : 0,
		
		bx0: {
			
			hide : t,
			inst : noone,
			pct  : [2/3,0,1,1/3],
			xy   : [0,0,0,0],
			wh   : [0,0],
			bgc  : [1/3,cBlack,cBlack,cDkGrey,cDkGrey],
			fgc  : [1,cLtGrey,cLtGrey,cWhite,cWhite],
			mouseIn : f
			
		},
		
		bx1: {
			
			hide : f,
			inst : hud_e.stat,
			pct  : [0,3/5,1/4,1],
			xy   : [0,0,0,0],
			wh   : [0,0],
			bgc  : [1/3,cBlack,cBlack,cDkGrey,cDkGrey],
			fgc  : [1,cLtGrey,cLtGrey,cWhite,cWhite],
			con  : [0.01,0.01,0.99,0.99],
			conxy: [0,0,0,0],
			mouseIn : f
			
		},
		
		bx2: {
			
			hide  : f,
			inst1 : hud_e.tgt,
			inst2 : noone,
			pct   : [1/4,3/4,3/4,1],
			xy    : [0,0,0,0],
			wh    : [0,0],
			bgc   : [1/3,cBlack,cBlack,cDkGrey,cDkGrey],
			fgc   : [1,cLtGrey,cLtGrey,cWhite,cWhite],
			con1  : [0.01,0.01,0.33,0.99],
			con1xy: [0,0,0,0],
			con2  : [0.34,0.01,0.99,0.99],
			con2xy: [0,0,0,0],
			mouseIn : f
			
		},
		
		bx3: {
			
			hide : f,
			inst : hud_e.map,
			pct  : [3/4,3/5,1,1],
			xy   : [0,0,0,0],
			wh   : [0,0],
			bgc  : [1/3,cBlack,cBlack,cDkGrey,cDkGrey],
			fgc  : [1,cLtGrey,cLtGrey,cWhite,cWhite],
			con  : [0.01,0.01,0.99,0.99],
			conxy: [0,0,0,0],
			mouseIn : f
			
		},
		
		docks: noone
		
	}
	
#endregion

#region Radar Sweep Init
	
	radSwpSpr = sprRadSweep
	rad1 = t
	rad2 = f
	rad3 = f
	radSwpDir1 = random(360)
	radSwpDir2 = random(360)
	radSwpDir3 = random(360)
	radSwpVel1 = 1
	radSwpVel2 = 10
	radSwpVel3 = 100
	
#region Debug
	
	// Debug Start
	startAt = f
	startAtDone = f

#endregion
	
#region (V)essel Struct Updates
	
	// Sensor Ranges
	// Init Refs
	var e1 =  v.sr.v // Visual
	var e2 =  v.sr.s // Short
	var e3 =  v.sr.m // Mid
	var e4 =  v.sr.l // Long
	var e5 =  v.sr.e // Extended
	e1.r = ((sprite_width*M.z)*e1.m)*e1.i
	e2.r = (e1.r*e2.m)*e2.i
	e3.r = (e2.r*e3.m)*e3.i
	e4.r = (e3.r*e4.m)*e4.i
	e5.r = (e4.r*e5.m)*e5.i
	
#endregion