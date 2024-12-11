/// @description Do System Exit (Warp)

// Add Starting (Sol) System to System List
if(M.galaxy == noone)
	ds_list_add(D.sys.L,sys)
		
// Clear pointers
curr = noone
currNDX = noone
prev = noone
prevNDX = noone
sele = noone
seleNDX = noone

// Init/Inherit
sys.state = _mode.pause
sys.active = f
prev = sys
prevNDX = sys.ndx
sys = noone

// Reset Tran Warp
tranWarpIn = t
tranWarpFX = f
if(audio_is_playing(ambShipPres))
	audio_sound_pitch(list_find_sound(M.ambL,"ambShipPres"),1)

// Switch to Galaxy
alarm[0] = 1