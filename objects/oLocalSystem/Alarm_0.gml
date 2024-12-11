/// @description Init System

// Entities
bdyL = ds_list_create()
if(startSys) {
	
	// No Outliers for Elements (Close to natural irl)
	toe_create_local_struct(id,f)
	
	// For initing carriers later
	earth = noone
	mars = noone
	
	// Init Starting System (Sol)
	ds_list_add(bdyL,init_system_body_specific(id,"Sol"))
	ds_list_add(bdyL,init_system_body_specific(id,"Mercury"))
	ds_list_add(bdyL,init_system_body_specific(id,"Venus"))
	ds_list_add(bdyL,init_system_body_specific(id,"Earth"))
	earth = bdyL[|ds_list_size(bdyL)-1]
	ds_list_add(bdyL,init_system_body_specific(id,"Mars"))
	mars = bdyL[|ds_list_size(bdyL)-1]
	ds_list_add(bdyL,init_system_body_specific(id,"Jupiter"))
	ds_list_add(bdyL,init_system_body_specific(id,"Saturn"))
	ds_list_add(bdyL,init_system_body_specific(id,"Uranus"))
	ds_list_add(bdyL,init_system_body_specific(id,"Neptune"))
	faction = _faction.humans
	bdyCnt = 9
	
} else {
	
	if(starred)
		ds_list_add(bdyL,init_system_body(id,_sysBody.star))
	repeat(bdyCnt-ds_list_size(bdyL))
		ds_list_add(bdyL,init_system_body(id,noone))
	
}

// Set Indexes
for(var i = 0; i < ds_list_size(bdyL); i++)
	bdyL[|i].ndx = i

// System W/H
h = w
cenx = w
ceny = h

// Starting X/Y
var randx = flip(1)
var opp = flip(1)
if(randx) ntrX = random(M.ww)
else {
	
	if(opp) ntrX = M.ww
	else  ntrX = 0
	
}
ntrY = 0

// Exit Radius
exRad = round(w*1.1)*M.z

#region Starting Location

if(startSys) {
	
	// Init (Start Position for Player)
	var dir = 0
	P.dir = dir-180
	P.dirTGT = P.dir
	P.startAt = earth
	
	/*
	// Debug Carrier
	var e = instance_create_layer(cenx+cos2(dir,w*M.z),ceny+sin2(dir,h*M.z),"FG2",oNPC)
	e.persistent = t
	e.dir = 180
	e.vessel = D.ves.hum.crus.car1
	e.alarm[0] = 1
	// Debug Freighter
	var e = instance_create_layer(cenx+cos2(dir,w*M.z),ceny+sin2(dir,h*M.z)+200,"FG2",oNPC)
	e.persistent = t
	e.dir = 180  
	e.vel = 0
	e.sprite_index = sprShipFre1H
	e.image_speed = 0            
	e.image_index = 0    
	*/
	
	// Finish
	startPos = t
	
} else alarm[3] = 4

#endregion

// Finish Init Alarm
alarm[1] = 4