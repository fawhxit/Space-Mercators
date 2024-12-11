/// @description Logic

#region Init Done
	
	if(room == rInit and init_done and alarm[3] == -1)
		alarm[3] = 4
	
#endregion

#region Room Inits
	
	#region Menu
	
		if(room_init2 and room == rMenu) {
			
			// Switch State
			if(M.state == _mode.gameMain) M.state = _mode.pause
			
			// Make Version Label
			global.title = instance_create_layer(0,0,"Menu",oText)
			var e = global.title
			e.gui = t
			e.xy = [ww*.90,wh*.05,ww*.95,wh*.1]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.bgc[0] = 0
			e.str = "Alpha r2"
			e.strf = fHUD
			e.inRoom = rMenu
			e.active = t
			
			// Make Title
			var xx = lerp(ww*d2,ww*p80,0.5)
			var yy = lerp(wh*(d16),wh*(d16*3),0.5)
			global.sprite_title = instance_create_layer(xx,yy,"Menu",oStaticAnim)
			var e = global.sprite_title
			e.gui = t
			e.rel = f
			e.relMod = 0
			e.loop = f
			e.sprite_index = sprTitle
			e.image_blend = cRed
			e.image_speed = 0
			e.image_alpha = 1
			e.xpct = xx/ww
			e.ypct = yy/wh
			e.h1 = d16
			e.h2 = (d16*3)
			e.image_yscale = ((wh*(d16*3))-(wh*d16))/sprite_get_height(sprTitle)
			e.image_xscale = e.image_yscale
			e.active = t
			
			// Make Buttons
			global.button_resume = instance_create_layer(0,0,"Menu",oButton)
			var e = global.button_resume
			e.gui = t
			e.xy = [ww*d2,wh*(d16*4),ww*p80,wh*(d16*5)]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.action = _act.resume
			e.str = "Resume"
			e.bgc[0] = 3/4
			e.fgc = [1,cGreen,cGreen,cDkGreen,cDkGreen]
			e.strc = [1,cDkGreen,cDkGreen,cGreen,cGreen]
			e.inRoom = rMenu
			e.active = (state == _mode.pause)
			
			global.button_newGame = instance_create_layer(0,0,"Menu",oButton)
			e = global.button_newGame
			e.gui = t
			e.xy = [ww*d2,wh*(d16*6),ww*p80,wh*(d16*7)]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.action = _act.newGame
			e.str = "New Game"
			e.bgc[0] = 3/4
			e.fgc = [1,cYellow,cYellow,cDkYellow,cDkYellow]
			e.strc = [1,cDkYellow,cDkYellow,cYellow,cYellow]
			e.inRoom = rMenu
			e.active = (state != _mode.pause)
			
			global.button_save = instance_create_layer(0,0,"Menu",oButton)
			e = global.button_save
			e.gui = t
			e.xy = [ww*d2,wh*(d16*8),ww*p80,wh*(d16*9)]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.action = _act.saveGame
			e.str = "Save"
			e.bgc[0] = 3/4
			e.inRoom = rMenu
			
			global.button_load = instance_create_layer(0,0,"Menu",oButton)
			e = global.button_load
			e.gui = t
			e.xy = [ww*d2,wh*(d16*10),ww*p80,wh*(d16*11)]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.action = _act.loadGame
			e.str = "Load"
			e.bgc[0] = 3/4
			e.inRoom = rMenu
			
			global.button_settings = instance_create_layer(0,0,"Menu",oButton)
			e = global.button_settings
			e.gui = t
			e.xy = [ww*d2,wh*(d16*12),ww*p80,wh*(d16*13)]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.action = _act.settings
			e.str = "Settings"
			e.bgc[0] = 3/4
			e.inRoom = rMenu
			
			global.button_quit = instance_create_layer(0,0,"Menu",oButton)
			e = global.button_quit
			e.gui = t
			e.xy = [ww*d2,wh*(d16*14),ww*p80,wh*(d16*15)]
			e.xypct = [e.xy[0]/ww,e.xy[1]/wh,e.xy[2]/ww,e.xy[3]/wh]
			e.action = _act.quit
			e.str = "Exit"
			e.bgc[0] = 3/4
			e.fgc = [1,cRed,cRed,cDkRed,cDkRed]
			e.strc = [1,cDkRed,cDkRed,cRed,cRed]
			e.inRoom = rMenu
			e.active = t
			
			// Make Help
			global.help = instance_create_layer(0,0,"Menu",oText)
			var e = global.help
			e.gui = t
			e.strf = fHUD
			e.strhva = [fa_left,fa_center]
			e.xy = [0,0,ww*d3,wh]
			e.xypct = [0,0,e.xy[2]/ww,e.xy[3]/wh]
			e.bgc[0] = 2/3
			e.strc = [1,cYellow,cYellow,cNeonYellow,cNeonYellow]
			e.str = "Controls:"
				+"\nESC to toggle this Menu after game started."
				+"\nF11 to toggle Fullscreen."
				+"\n"
				+"\nKeyboard:"
				+"\nW and S to control Thrust."
				+"\nA and D to control Steer."
				+"\nX to Auto Decelerate."
				+"\nF to toggle Firing Mode."
				+"\nPage Down and Up to cycle System Selections."
				+"\nEnter to confirm Selection as CurrentAuto-Pilot"
				+"\nTarget or engage Auto-Pilot."
				+"\nBackspace to cancel/clear Selections/Targets"
				+"\nand Orbiting or Auto-Pilot."
				+"\nTab to confirm leaving/entering a system or"
				+"\nlocale."
				+"\n"
				+"\nMouse:"
				+"\nLeft Click to Shoot, Select and Interact."
				+"\nRight Click to Pan/Drag Maps."
				+"\nWheel Scroll to Zoom."
				+"\nMouse Wheel Press to reset Local Star Map."
				+"\n"
				+"\nNotes:"
				+"\nYou can interact with the HUD Star Map by"
				+"\nhovering your mouse in the Star Map HUD Frame"
				+"\nand using mouse controls to move and zoom"
				+"\nthe map and can select/confirm/engage the"
				+"\nCurrent Auto-Pilot Target."
				+"\n"
				+"\nLeft Click to toggle Target Info in Target Info"
				+"\nHUD Panel."
				+"\n"
				+"\nObjective(s):"
				+"\nFind civilized and developed planets that"
				+"\nfacilitate a trade hub to begin buying and"
				+"\nselling atmoic resources for profit."
				+"\n"
				+"\nPlanets with atleast URBAN infastructure can"
				+"\nsupport a system's trade."
			e.inRoom = rMenu
			e.active = t
			
		}
		
		if(room_init2) {
			
			room_init  = f
			room_init2 = f
			
		}
		
	#endregion
	
#endregion

#region Fade Controls
	
	// Pause
	if(mainFade != noone and state == _mode.pause)
		mainFade.active = t
	else if( mainFade != noone and state != _mode.pause)
		mainFade.active = f
	
#endregion
