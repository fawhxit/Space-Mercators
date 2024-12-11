// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init_stars(inst,rep){
	
	inst.fieldArr = noone
	inst.fieldArr[rep-1] = noone
	var i = 0
	repeat(rep) {
		
		// 0:x, 1:y, 2:color, 3:scl, 4:rot, 5:spr, 6:flicker
		inst.fieldArr[i] = [random(M.ww),random(M.wh),cWhite,random(1),random(360),sprPix,f]
		var e = inst.fieldArr[i]
		if(e[4] >= 360) e[4] -= 360
		e[6] = chance(3)
		if(e[3] > .9) {
			
			switch(irandom(100)) {
				
				case  0: e[5] = sprStarFar1; e[4] = 0; break
				case  1: e[5] = sprStarFar2; e[4] = 0; break
				case  2: e[5] = sprStarFar3; e[4] = 0; break
				default: break
				
			}
			
		}
		i += 1
		
	}

}

function star_parallax_check(inst,e) {
	
	with(inst) {
		
		var sprW = sprite_get_width(e[5])*scl
		if(e[0] < (-e[3]*scl)-sprW) { // Off Left
			
			sprite_random_starFar(e)
			sprW = sprite_get_width(e[5])*scl
			e[0] = M.ww+((e[3]*scl)+sprW)
			e[1] = random(M.wh)
			e[6] = chance(3)
			
		} else if(e[1] < (-e[3]*scl)-sprW) { // Off Top
			
			sprite_random_starFar(e)
			sprW = sprite_get_width(e[5])*scl
			e[0] = random(M.ww)
			e[1] = M.wh+((e[3]*scl)+sprW)
			e[6] = chance(3)
			
		} else if(e[0] > M.ww+((e[3]*scl)+sprW)) { // Off Right
			
			sprite_random_starFar(e)
			sprW = sprite_get_width(e[5])*scl
			e[0] = -(e[3]*scl)-sprW
			e[1] = random(M.wh)
			e[6] = chance(3)
			
		} else if(e[1] > M.wh+((e[3]*scl)+sprW)) { // Off Bottom
			
			sprite_random_starFar(e)
			sprW = sprite_get_width(e[5])*scl
			e[0] = random(M.ww)
			e[1] = (-e[3]*scl)-sprW
			e[6] = chance(3)
			
		}
		
	}
	
}

function sprite_random_starFar(e) {
	
	if(e[3] >= .9) {
		
		switch(irandom(100)) {
			
			case  0: e[5] = sprStarFar1; e[4] = 0; break
			case  1: e[5] = sprStarFar2; e[4] = 0; break
			case  2: e[5] = sprStarFar3; e[4] = 0; break
			default: e[5] = sprPix; e[4] = random(360); break
			
		}
		
	}
	
}