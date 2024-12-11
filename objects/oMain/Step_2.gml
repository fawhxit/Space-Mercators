/// @description Olds/Time Updates

// Zoom Old
zo = z

// Mouse X/Y Olds
MXO = MX
MYO = MY
WMXO = WMX
WMYO = WMY

#region Clean Sound Lists
	
	// Music
	for(var i = 0; i < ds_list_size(musL); ++i)
		if(!audio_is_playing(musL[|i]))
			ds_list_delete(musL,i)
	
	// Ambience
	for(var i = 0; i < ds_list_size(ambL); ++i)
		if(!audio_is_playing(ambL[|i]))
			ds_list_delete(ambL,i)
	
	// SFX
	for(var i = 0; i < ds_list_size(sfxL); ++i)
		if(!audio_is_playing(sfxL[|i]))
			ds_list_delete(sfxL,i)
	
#endregion

#region Update Sounds
	
	// Master
	audio_set_master_gain(mLstn,mVol)
	// Music
	for(var i = 0; i < ds_list_size(musL); ++i)
		audio_sound_gain(musL[|i],musVol,1)
	// Ambience
	for(var i = 0; i < ds_list_size(ambL); ++i)
		audio_sound_gain(ambL[|i],ambVol,1)
	// SFX
	for(var i = 0; i < ds_list_size(sfxL); ++i)
		audio_sound_gain(sfxL[|i],sfxVol,1)
	
#endregion

#region Time Iteration
	
	// Frame Iterate
	tf += 1
	if(tfd >= 0) tfd -= 1
	if(tf >= room_speed) {
		
		// Second Iterate
		tf = 0
		ts += 1
		if(tsd >= 0) tsd -= 1
		if(ts >= 60) {
			
			// Minute iterate
			ts = 0
			tm += 1
			if(tmd >= 0) tmd -= 1
			
			if(tm >= 60) {
				
				// Hour Iterate
				tm = 0
				th += 1
				if(thd >= 0) thd -= 1
				
			}
			
		}
		
	}
	
#endregion