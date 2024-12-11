/// @description Init

// Basic
do_init = f
init_done = f
state = _mode.init
active = f
starred = t
cycle = f
startPos = f
startSys = f
startxy = [0,0]
ndx = 0
faction = _faction.neutral
cenx = 0
ceny = 0
cenxo = 0
cenyo = 0

// (E)lement (S)truct
exTax = random_range(3,12)
exMod = random_range(0.9,1.1)
ES = noone
toe_create_local_struct(id,t)

#region Galaxy
	
	gx = 0
	gy = 0
	galSpr = sprPix
	/*
	switch(irandom(3)) {
		
		case  0: galSpr = sprStarFar1; break
		case  1: galSpr = sprStarFar2; break
		case  2: galSpr = sprStarFar3; break
		default: galSpr = sprPix; break
		
	}
	*/
	galScl = random_range(3,6)
	galRot = random(360)
	
#endregion

// Bodies
bdyCnt = irandom_range(1,16)
bdyL = noone

// NPCs
npcL = noone

// System W/H
w = 0
h = 0

// Starting
ntrX = noone
ntrY = noone

// Exit Radius
exRad = noone

// Planet Spawns
initSpawnsDel = 4
initSpawns = f