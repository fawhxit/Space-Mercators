// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_game() {
	
	P = instance_create_layer(room_width/2,room_height/2,"FG1",oPlayer)
	V = P // Default View to Player
	M.state = _mode.gameMain
	P.active = t
	
}

function init_galaxy() {
	
	var g = instance_create_layer(0,0,"Logic",oGalaxy)
	g.persistent = t
	g.state = _mode.main
	g.active = t
	M.galaxy = g
	room_goto(rMain)
	
}

function warp_npc(sys,ship) {
	
	try {
		
		// Debug NPC
		// Init
		// Direction from Center
		var dir = random(360)
		if(dir >= 360) dir -= 360
		// Direction of ship
		var dir2 = dir+random_range(110,250)
		if(dir2 >= 360) dir2 -= 360
		// x,y of ship to spawn
		var xx = (sys.cenx+cos2(dir,sys.w*M.z))+random_range(-100,100)
		var yy = (sys.ceny+sin2(dir,sys.h*M.z))+random_range(-100,100)
		
		// Create NPC
		var e = instance_create_layer(xx,yy,"FG2",oNPC)
		e.persistent = t
		e.dir = dir2  
		e.vel = 0
		e.scl = ship.scl
		e.spr = ship.spr
		e.aiMode = noone
		e.alarm[0] = 1
		
	} catch (_ex) {
		
		show_debug_message("Unable to Spawn NPC!")
		show_debug_message(_ex)
		
	}
	
}

function pick_dev() {
	
	if(chance(33))
		return D.dev.pri
	else if(chance(20))
		return D.dev.col_mn
	else if(chance(15))
		return D.dev.col_mj
	else if(chance(10))
		return D.dev.rur
	else if(chance(5))
		return D.dev.urb
	else if(chance(1))
		return D.dev.met
	else return D.dev.unk
	
}