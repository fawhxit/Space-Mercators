/// @description Explosion Logic + Clean

if(killed and init_done) {
	
	M.screnShk[3] = 800
	M.scrnShk[5] = (1/room_speed)*1.67
	var e = instance_create_layer(x,y,layer,oExplosion)
	M.scrnShk [6] = e.id
	e.sprite_index = sprBoom
	e.ai = .1/(scl*.1)
	e.scl = scl*random_range(.5,.8)
	e.fadeSlow = t
	e.init_done = t
	repeat(irandom_range(1,3)) {
		
		e = instance_create_layer(x+(random_range(-sprite_width,sprite_width)),
			y+(random_range(-sprite_height,sprite_height)),layer,oExplosion)
		e.sprite_index = sprBoom
		e.ai = random_range(.1,.2)/(scl*.1)
		e.scl = scl*random_range(.1,.5)
		e.init_done = t
		
	}
	
}

// System NPC Delete
if(is(sys,oLocalSystem,f))
	if(list_is(sys.npcL)) {
		
		// Find and Delete Self...
		var sz = ds_list_size(sys.npcL)
		for(var i = 0; i < sz; i++)
			if(sys.npcL[|i] == id)
				ds_list_delete(sys.npcL,i)
		
		// Empty? Delete List...
		if(ds_list_empty(sys.npcL)) {
			
			ds_list_destroy(sys.npcL)
			sys.npcL = noone
			
		}
		
	}

// Child NPC Delete
if(par != noone) {
	
	if(list_is(par.chiL)) {
		
		var sz = par.spwnCnt
		for(var i = 0; i < sz; i++) {
			
			var e = par.chiL[|i]
			if(e == id) ds_list_delete(par.chiL,i)
			par.spwnCnt = ds_list_size(par.chiL)
			
		}
		
	}
	
}

// Clean Self
if(list_is(tgtL))
	ds_list_destroy(tgtL)
if(list_is(chiL))
	ds_list_destroy(chiL)