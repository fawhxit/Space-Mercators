// Rand
randomize()

// Others
draw_set_circle_precision(64)

// Init
#region Macros
	
	// Bool
	#macro t true
	#macro f false
	
	#region Mouse
		
		// Mouse XY
		#macro MX mouse_x
		#macro MY mouse_y
		#macro WMX window_mouse_get_x()
		#macro WMY window_mouse_get_y()
		
		#region These need to be updated Pre/Post Step:
			
			// Room Mouse
			#macro MXO global.mouse_x_old
			#macro MYO global.mouse_y_old
			#macro MXD global.mouse_x_delta
			#macro MYD global.mouse_y_delta
			MXO = MX
			MYO = MY
			MXD = MXO-MX
			MYD = MYO-MY
			
			// Window Mouse
			#macro WMXO global.window_mouse_x_old
			#macro WMYO global.window_mouse_y_old
			#macro WMXD global.window_mouse_x_delta
			#macro WMYD global.window_mouse_y_delta
			WMXO = WMX
			WMYO = WMY
			WMXD = WMXO-WMX
			WMYD = WMYO-WMY
			
		#endregion
		
		// Mouse Button Left
		#macro mbl mouse_check_button(mb_left)
		#macro mblp mouse_check_button_pressed(mb_left)
		#macro mblr mouse_check_button_released(mb_left)
		
		// Mouse Button Middle
		#macro mbm mouse_check_button(mb_middle)
		#macro mbmp mouse_check_button_pressed(mb_middle)
		#macro mbmr mouse_check_button_released(mb_middle)
		
		// Mouse Button Right
		#macro mbr mouse_check_button(mb_right)
		#macro mbrp mouse_check_button_pressed(mb_right)
		#macro mbrr mouse_check_button_released(mb_right)
		
		// Mouse Wheel
		#macro mwu mouse_wheel_up()
		#macro mwd mouse_wheel_down()
		
	#endregion
		
	#region Keyboad
		
		#region Letter
			
			// WASD
			#macro kbW keyboard_check(ord("W"))
			#macro kbA keyboard_check(ord("A"))
			#macro kbS keyboard_check(ord("S"))
			#macro kbD keyboard_check(ord("D"))
			
			// Common
			// F
			#macro kbF keyboard_check(ord("F"))
			#macro kbFp keyboard_check_pressed(ord("F"))
			// O
			#macro kbO keyboard_check(ord("O"))
			#macro kbOp keyboard_check_pressed(ord("O"))
			
			// Other
			// Z
			#macro kbZ keyboard_check(ord("Z"))
			#macro kbZp keyboard_check_pressed(ord("Z"))
			// X
			#macro kbX keyboard_check(ord("X"))
			#macro kbXp keyboard_check_pressed(ord("X"))
			
		#endregion
		
		#region Debug
			
			// Home (Debug/Console)
			#macro kbHOMEp keyboard_check_pressed(vk_home)
			// End (Debug/Context)
			#macro kbENDp keyboard_check_pressed(vk_end)
			
		#endregion
		
		#region Modifier
			
			// Tab
			#macro kbTAB  keyboard_check(vk_tab)
			#macro kbTABp  keyboard_check_pressed(vk_tab)
			#macro kbTABr  keyboard_check_released(vk_tab)
			// Shift
			#macro kbSHFT keyboard_check(vk_shift)
			// Enter
			#macro kbNTRp keyboard_check_pressed(vk_enter)
			// Backspace
			#macro kbBCKSPCp keyboard_check_pressed(vk_backspace)
			// Page Up/Down
			#macro kbPGUp keyboard_check_pressed(vk_pageup)
			#macro kbPGDp keyboard_check_pressed(vk_pagedown)
			// Control
			#macro kbCTRL keyboard_check(vk_control)
			
		#endregion
		
	#endregion
	
	#region Time
		
		#macro tf global.time_frame
		tf = 0
		#macro ts global.time_second
		ts = 0
		#macro tm global.time_minute
		tm = 0
		#macro th global.time_hour
		th = 0
		
		#macro tfd global.time_frame_delay
		tfd = -1
		#macro tsd global.time_second_delay
		tsd = -1
		#macro tmd global.time_minute_delay
		tmd = -1
		#macro thd global.time_hour_Delay
		thd = -1
		
	#endregion
	
	#region Colors
		
		#macro cWhite		make_color_rgb(255,255,255)
		#macro cNeonRed		make_color_rgb(255,0,0)
		#macro cNeonGreen	make_color_rgb(0,255,0)
		#macro cNeonBlue	make_color_rgb(0,0,255)
		#macro cNeonYellow	make_color_rgb(255,255,0)
		#macro cNeonAqua	make_color_rgb(0,255,255)
		#macro cRed			make_color_rgb(192,0,0)
		#macro cGreen		make_color_rgb(0,192,0)
		#macro cBlue		make_color_rgb(0,0,192)
		#macro cYellow		make_color_rgb(192,192,0)
		#macro cAqua		make_color_rgb(112,255,255)
		#macro cOrange		make_color_rgb(255,192,64)
		#macro cLtGrey		make_color_rgb(192,192,192)
		#macro cGrey		make_color_rgb(128,128,128)
		#macro cDkNight		make_color_rgb(0,0,96)
		#macro cDkRed		make_color_rgb(64,0,0)
		#macro cDkGreen		make_color_rgb(0,64,0)
		#macro cDkBlue		make_color_rgb(0,0,64)
		#macro cDkYellow	make_color_rgb(64,64,0)
		#macro cDkGrey		make_color_rgb(64,64,64)
		#macro cBlack		make_color_rgb(0,0,0)
		
	#endregion
	
	#region Window/Display
		
		// Window
		#macro WW window_get_width()
		#macro WH window_get_height()
		
		// Display
		#macro DW display_get_width()
		#macro DH display_get_height()
		
	#endregion
	
	#region String
		
		#macro CHARW string_width("_")
		#macro CHARH string_height("|")
		
	#endregion
	
	#region Values
		
		#region Fractions
			
			#macro d2		(1/2)
			#macro d3		(1/3)
			#macro d4		(1/4)
			#macro d5		(1/5)
			#macro d6		(1/6)
			#macro d8		(1/8)
			#macro d10		(1/10)
			#macro d12		(1/12)
			#macro d16		(1/16)
			#macro d20		(1/20)
			#macro d25		(1/25)
			#macro d33		(1/33)
			#macro d40		(1/40)
			#macro d50		(1/50)
			#macro d60		(1/60)
			#macro d67		(1/67)
			#macro d75		(1/75)
			#macro d80		(1/80)
			#macro d90		(1/90)
			#macro d95		(1/95)
			#macro d100		(1/100)
			#macro d1000	(1/1000)
			
		#endregion
		
		#region Percents
			
			#macro p1 (1/100)
			#macro p5 (1/20)
			#macro p10 (1/10)
			#macro p20 (1/5)
			#macro p25 (1/4)
			#macro p33 (1/3)
			#macro p40 (2/5)
			#macro p50 (1/2)
			#macro p60 (3/5)
			#macro p67 (2/3)
			#macro p75 (3/4)
			#macro p80 (4/5)
			#macro p90 (9/10)
			#macro p95 (95/100)
			#macro p99 (99/100)
			
		#endregion
		
	#endregion
	
	#region Bounds
		
		#macro BBL bbox_left
		#macro BBT bbox_top
		#macro BBR bbox_right
		#macro BBB bbox_bottom
		#macro BBX lerp(bbox_left,bbox_right,1/2)
		#macro BBY lerp(bbox_top,bbox_bottom,1/2)
		#macro BBXY [bbox_left,bbox_top,bbox_right,bbox_bottom]
		#macro BBW abs(bbox_left-bbox_right)
		#macro BBH abs(bbox_top-bbox_bottom)
		
	#endregion
	
	#region Audio
		
		#macro mLstn 0 // Global Default Listener Index
		#macro mEmt global.main_emitter
		mEmt = audio_emitter_create()
		
	#endregion
	
#endregion

#region Enums
	
	enum _act {
		
		resume,quit,newGame,
		saveGame,loadGame,settings,
		close,minimize,account,
		postings,streams,metrics,
		exchange,exbtn0,exbtn1,
		exbtn2,exbtn3
		
	}
	
	enum _mode {
		
		init,gameMain,pause,main
		
	}
	
	enum _sysBody {
		
		unknown,star,planetoid,asteroid,
		galaxy,dry,gas1,gas2,ice,island,lava,
		moon,ring,smooth,terran,derelict,station
		
	}
	
	enum _faction {
		
		neutral,
		humans,
		saurians,
		novans,
		xenos
		
	}
	
	enum _ai {
		
		simple,
		moveTo,
		exitAt,
		warpAt,
		orbit,
		attack,
		defend,
		patrolRegion,
		patrolEntity,
		patrolParent,
		exitParent
		
	}
	
	enum _spawn {
		
		no,
		lo,
		me,
		hi
		
	}
	
	enum _locale {
		
		none,
		tradeHub
		
	}
	
	enum _state {
		
		none,buy,sell
		
	}
	
	enum _vis {
		
		unk,vis,short,mid,long,ext
		
	}
	
	enum _personality {
		
		neutral,aggressive,passive,LEN
		
	}
	
	enum _hudDock {
		
		none,radar,crew,status,
		power,comms,log,map
		
	}
	
	enum _fx {
		
		none,mus,amb,sfx
		
	}
	
#endregion

#region Global Objects
	
	// Main
	#macro M global.main_object
	M = instance_create_layer(0,0,"Logic",oMain)
	// Data
	#macro D global.data_object
	D = instance_create_layer(0,0,"Logic",oData)
	
	#region Game
		
		// Player
		#macro P global.player_instance
		P = noone
		// View (Default Player; For Tracking different instances)
		#macro V global.view_instance
		V = P
		
	#endregion
	
#endregion