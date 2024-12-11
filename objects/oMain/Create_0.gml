/// @description Init Main Vars

#region Game Stuff
	
	// State
	state = _mode.init
	
	// Zoom
	zOrig = .2
	z = zOrig
	zo = z
	zmn = 0.01
	zmx = 2.00
	exZ = f
	inZ = f
	
	// Camerea Panning
	camOffx = 0
	camOffy = 0
	
	// Control Flags
	hudOver = f
	
	// Font Scale Pct
	fSclx = 1
	fScly = 1
	
	// Main Objs
	mainFade = noone
	mainStars = noone
	galaxy = noone
	
	// Screen Shake
	// X,Y,mn,mx,pct,pcti, Override
	scrnShk = [0,0,0,100,0,.01,noone]
	
#endregion

#region Room Stuff
	
	init_done  = f
	room_init  = f
	room_init2 = f
	room_prev = rInit
	
#endregion

#region Window Stuff
	
	// Full Screen
	fullscreen = f
	fullscreen_toggled = f
	fullscreen_done = t
	
	// Window Width/Height
	ww = window_get_width()
	wh = window_get_height()
	wwo = DW
	who = DH
	wwd = DW-ww
	whd = DH-wh
	
#endregion

#region Debug
	
	enum _dbg {
		
		none,
		full,
		txt,
		local,
		SZ
		
	}
	
	DBGenable = t
	DBGmode = _dbg.none
	DBGbgc = [1/3,cBlack,cBlack,cDkGrey,cDkGrey]
	DBGfgc = [2/3,cLtGrey,cLtGrey,cWhite,cWhite]
	DBGstr1 = ""
	DBGstr2 = ""
	DBGscrly = 0

#endregion

#region Audio
	
	// Note: Main Listener ID is macro: mLstn
	// Volumes
	mVol	= 1.0 // Master Volume
	musVol	= 0.0 // Music Volume
	ambVol	= 1.0 // Ambience Volume
	sfxVol	= 1.0 // SFX Volume
	musL	= ds_list_create() // Music ID List
	ambL	= ds_list_create() // Ambience ID List
	sfxL	= ds_list_create() // SFX ID List
	musP	= 2
	ambP	= 1
	sfxP	= 0
	
	
	// Play Theme
	ds_list_add(musL,audio_play_sound(musTheme,musP,f))
	audio_sound_pitch(list_pop(musL),0.85)
	
	// Set Volumes
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

// Init Finish
alarm[0] = 2
alarm[6] = room_speed