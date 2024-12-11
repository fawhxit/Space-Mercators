/// @description Init

#region Basics
	
	sys = noone
	par = noone
	port = f
	init_done = f
	nameStr = "Unknown"
	typ = _sysBody.smooth
	dist = 0
	disto = 0
	distOrig = 0
	sysx = 0
	sysxo = 0
	sysy = 0
	sysyo = 0
	xx = 0
	xxo = xx
	yy = 0
	yyo = yy
	relx = 0
	relxo = relx
	rely = 0
	relyo = rely
	scl = 1
	sclo = scl
	relMod = 1
	relModo = relMod
	sprite_index = sprSmooth1
	image_xscale = scl
	image_yscale = scl
	r = 255
	ro = r
	g = 255
	go = g
	b = 255
	bo = b
	do_blend = t
	blend = make_color_rgb(r,g,b)
	blendo = make_color_rgb(r,g,b)
	if(do_blend) image_blend = blend
	else image_blend = cWhite
	a = 1
	ao = 1
	image_alpha = a
	dia = sprite_get_width(sprSmooth1)*scl
	diao = dia
	rad = dia/2
	rado = rad
	vel = 0
	velo = 0
	dir = 0
	diro = 0
	distOrig = dist
	deg = random(360)
	dego = 0
	degi = 0
	degio = 0
	ndx = noone
	spwn = irandom_range(2,10)*room_speed
	spwni = 0
	spwnCnt = 0
	dev = noone
	chiL = noone
	
#endregion

#region Other Inits
	
	// Room W/D
	ww = M.ww
	wh = M.wh
	
	// Zoom
	image_xscaleOrig = image_xscale
	image_yscaleOrig = image_yscale
	
	// Olds
	sprwo = 0
	sprho = 0
	
	// Other
	patrolDist = 1000
	
	// Trade Hub Locale Struct
	// (TODO: Modularize/Specific to Different Bodies)
	locs = {
		
		tHub : {
			
			ava: f,
			spr: sprMarket1H,
			bgc: [p75,cBlack,cBlack,cDkGrey,cDkGrey],
			fgc: [1,cLtGrey,cLtGrey,cWhite,cWhite]
			
		}
		
	}
	
#endregion