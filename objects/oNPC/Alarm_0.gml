/// @description Init Vessel

#region Init Ship Sprite
	
	try {
		
		// Init
		// Inherited ( Vessel )
		sprite_index = vessel.spr
		scl = vessel.scl
		spd = vessel.spd
		hspd = vessel.hspd
		// Derived
		// Sprite
		image_xscale = scl
		image_yscale = scl
		// Control
		acc /= scl
		rot /= scl
		// Other
		patrolDist = sprite_height*10
		// Defaults
		image_blend = c_white
		image_index = 0
		image_speed  = 0
		dir2 = 0
		// Inherit Parent Stuff
		if(is(par,oNPC,t))
			sys = par.sys
		
		/* Freighter
		 *
		 * light1: 255
		 * light2: 224
		 * engine: 192
		 * light3: 160
		 * letter: 128
		 *
		 */
		
		#region Init Shader Stuff
			
			// From Colors
			cF1 = new D.C(255,255,255)
			cF2 = new D.C(224,224,224)
			cF3 = new D.C(192,192,192)
			cF4 = new D.C(160,160,160)
			cF5 = new D.C(128,128,128)
			
			// To Colors
			cT1 = new D.C(0,255,0)
			cT2 = new D.C(255,0,0)
			cT3 = new D.C(random(255),random(255),random(255))
			cT4 = new D.C(0,255,255)
			cT5 = new D.C(random(255),random(255),random(255))
			
			// Set Shader Sends
			fArr = [noone,[cF1,cF2,cF3,cF4,cF5]]
			tArr = [random_rgb_color(),[cT1,cT2,cT3,cT4,cT5]]
			bArr  = [f,[t,t,f,t,f]]
			btArr = [-1,[0,0,-2,0,-1]]
			btdArr = [-1,[round(room_speed/2),room_speed,-1,room_speed/4],-1]
			btiArr = [-1,[1,1,-1,1,-1]]
			
			// Handles
			shSwapTol = shader_get_uniform(shColorSwap,"tol")
			shSwapFrom = shader_get_uniform(shColorSwap,"cFrom")
			shSwapTo = shader_get_uniform(shColorSwap,"cTo")
			shSwapOver = shader_get_uniform(shColorSwap,"over")
			
		#endregion
		
		// Origs
		image_xscaleOrig = image_xscale
		image_yscaleOrig = image_yscale
		
	} catch(_ex) {
		
		show_debug_message("Failed to set NPC Sprite!")
		show_debug_message(_ex)
		instance_destroy(id,f)
		
	}
	
#endregion

// Set Alarm for New NPC Task
if(!ntrAnim and aiMode != _ai.simple) alarm[1] = room_speed*random_range(.2,5)

// Finish
init_done = t
active = t
persistent = t