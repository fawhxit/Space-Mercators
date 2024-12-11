/// @description Init

#region Basic
	
	par = noone
	init_done = f
	active = f
	ntrAnim = f
	wx  = 0
	wy  = 0
	r   = 20
	str = "Pinkie"
	fgc = [1,cNeonGreen,cNeonGreen,cDkGreen,cDkGreen]
	image_blend = fgc[1]
	credit = {rec:0,snt:0}
	inv = {}
	spd = 1
	hspd = 50
	spdOrig = spd
	acc = 1
	accOrig = acc
	vel = 0
	dir = 0
	rot = 2
	scl = 1
	gx = 0
	gy = 0
	patrolDist = sprite_height*10

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
					m: 5, // (M)ultiplier from Sprite width
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
		
		credit : round2(random(1000),2),
		size_limit   : 120.00,
		weight_limit : 500.00,
		temperature  : -50.00,
		e   : {},
		size_used    : 0,
		weight_used  : 0
		
	}

#endregion

#region Vessel Vars INTEGRATE?
	
	vessel = noone
	spwnMode = _spawn.no
	spwnDel = room_speed*3
	spwnDeli = 0
	spwn   = 0
	spwnmx = 10
	spwnmn = 0
	spwnCnt = 0
	chiL = noone

#endregion

#region Stats + State Vars INTEGRATE?
	
	// Health/Shield
	hp = 5
	shp = 100
	killed = f
	
	// Hit Vars
	hit = f
	hitVal = 1
	hitxy = noone
	hitDir = 0
		
	// Galaxy Targets
	prev = noone
	prevNDX = noone
	curr = noone
	currNDX = noone
	sele = noone
	seleNDX = noone
	
	// Drive Flags
	stop  = f
	hyper = f
	warp  = f
	preAuto = f
	auto  = f
	orbit = f
	orbitRot = 90
	orbitDist = noone
	orbitPol = 1
	if(chance(50)) orbitPol*=-1
	orbitSpd = random_range(0.05,0.10)
	
	// Weapon Vars
	wpnRdy = f
	wpnDel = room_speed/2
	wpni   = 0
	
#endregion

#region AI Vars
	
	aiPers = irandom(_personality.LEN-1)
	aiMode = noone
	velTGT = 0
	dirTGT = 0
	relTGT = flip(1)
	relTGTDir = noone
	relTGTDist = noone
	xyTGT  = noone
	extTGT = noone
	wrpTGT = noone
	orbTGT = noone
	atkTGT = noone
	defTGT = noone
	tgtL = noone

#endregion

#region Game Location
	
	sys = P.sys
	sysx = 0
	sysy = 0
	xPct = 0
	yPct = 0
	sysDego = 0
	sysEx = f
	sysNtr = f
	
#endregion

#region Original Vars
	
	// Image
	image_xscaleOrig = image_xscale
	image_yscaleOrig = image_yscale
	
#endregion

#region Init Vessel Stuff
	
	dir2 = 0
	
	// Color From
	cF1 = noone
	cF2 = noone
	cF3 = noone
	cF4 = noone
	cF5 = noone
	
	// Color To
	cT1 = noone
	cT2 = noone
	cT3 = noone
	cT4 = noone
	cT5 = noone
	
	// Shader Arrs
	fArr	= noone
	tArr	= noone
	bArr	= noone
	btArr	= noone
	btdArr	= noone
	btiArr	= noone
	
	// Shader Handles
	shSwapTol	= noone
	shSwapFrom	= noone
	shSwapTo	= noone
	shSwapOver	= noone

#endregion