/// @description Other Updates/Deltas

if(is_active_game(id,f,f)) {
	
	#region Basics
		
		#region System
			
			if(is(sys,oLocalSystem,t)) {
				
				if(is_active(sys,t)) {
					
					get_relDirs(sys)
					
				}
				
			}
			
		#endregion
		
	#endregion
	
	#region Ship Ambience Updates
		
		
		var snd = list_find_sound(M.ambL,"ambShipPres")
		if(snd == noone) {
			
			ds_list_add(M.ambL,audio_play_sound_on(mEmt,ambShipPres,t,M.ambP))
			snd = list_pop(M.ambL)
			audio_sound_gain(snd,M.ambVol,1)
			
		} else if(!tranWarp) audio_sound_pitch(snd,1+engPit)
		
		
	#endregion
	
	#region Weapon VO (VO == View Offset)
		
		if(wpnRdy) {
			
			wpnVO = [WMX-(M.ww/2),WMY-(M.wh/2)]
			wpnVOd = [wpnVO[0]-wpnVOo[0],wpnVO[1]-wpnVOo[1]]
			
		}
		
	#endregion
	
	#region Hit TODO TEMP TODO TEMP TODO TEMP TODO TEMP TODO TEMP TODO TEMP TODO TEMP TODO TEMP TODO TEMP
		
		if(hit and shp <= 0) {
			hp -= 1
			hit = f
		}
		
	#endregion
	
	#region (V)essel Struct Updates
		
		// Sensor Ranges
		// Init Refs
		var e1 =  v.sr.v // Visual
		var e2 =  v.sr.s // Short
		var e3 =  v.sr.m // Mid
		var e4 =  v.sr.l // Long
		var e5 =  v.sr.e // Extended
		e1.r = ((sprite_width)*e1.m)*e1.i
		e2.r = (e1.r*e2.m)*e2.i
		e3.r = (e2.r*e3.m)*e3.i
		e4.r = (e3.r*e4.m)*e4.i
		e5.r = (e4.r*e5.m)*e5.i
		
	#endregion
	
} else {
	
	#region Audio Stoppage
		
		if(audio_is_playing(ambShipPres)) {
			
			for(var i = 0; i < ds_list_size(M.ambL); ++i)
				if(audio_get_name(M.ambL[|i]) == "sfxShipHum")
					audio_stop_sound(M.ambL[|i])
			
		}
		
	#endregion
	
}