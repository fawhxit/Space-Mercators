/// @description Control Logic

if(is_active_game(id,f,f)) {
	
	#region Universal
		
		var autoDelay = f // If Current is just set; So we don't immediatly Autopilot
		#region Selection Controls
			
			if(sele != noone) {
				
				if(kbNTRp and curr == noone) {
					
					curr = sele
					currNDX = curr.ndx
					sele = noone
					seleNDX = noone
					autoDelay = t
					
				} else if(kbBCKSPCp and curr == noone) {
					
					sele = noone
					seleNDX = noone
					
				} else if(curr == noone) {
					
					// Touch Select
					var tBdy = touching_body(id)
					if(tBdy != noone and curr == noone) {
						
						if(seleNDX == tBdy) {
							
							sele = noone
							seleNDX = noone
							
						} else if(prevNDX == tBdy) {
							
							prev = noone
							prevNDX = noone
							
						}
						
						curr = sys.bdyL[|tBdy]
						currNDX = tBdy
						
					}
					
				}
				
			} else if(kbBCKSPCp and sele == noone and curr == noone) {
				
				prev = noone
				prevNDX = noone
				
			} else {
				
				// Touch Select
				var tBdy = touching_body(id)
				if(tBdy != noone and curr == noone) {
					
					if(seleNDX == tBdy) {
						
						sele = noone
						seleNDX = noone
						
					} else if(prevNDX == tBdy) {
						
						prev = noone
						prevNDX = noone
						
					}
					
					curr = sys.bdyL[|tBdy]
					currNDX = tBdy
					
				}
				
			}
			
		#endregion
		
	#endregion
	
	#region System
		
		if(is(sys,oLocalSystem,f)) {
			
			#region System Init?
				
				if(sys.init_done and !sys.active) {
					
					sys.active = t
					if(sys.state == _mode.init)
						sys.state = _mode.main
					
				} else if(!sys.do_init) {
					
					sys.do_init = t
					sys.alarm[0] = 1
					
				}
				
			#endregion
			
			if(is_active(sys,t)) {
				
				#region Thrust
					
					if(!auto and !tranWarp) {
						
						#region Drives
							
							// Toggle
							if(kbZp) hyper = !hyper
							if(kbXp) stop  = !stop
							
							// Apply
							if(hyper) spd = (spdOrig*M.z)*2
							else spd = spdOrig
							
						#endregion
						
						if(kbW) {
							
							if(stop) {
								
								stop = f
								velTGT = vel
								
							}
							if(kbSHFT and velTGT < spd*2) {
								velTGT += acc*2   // Speed up x2
							} else if(!kbSHFT and velTGT < spd) {
								velTGT += acc // Speed up
							}
							
						}
						
						if(kbS) {
							
							if(stop) {
								
								stop = f
								velTGT = vel
								
							}
							if(kbSHFT and velTGT > -spd*2) {
								velTGT -= acc*2   // Speed up x2 (Reverse)
							} else if(!kbSHFT and velTGT > -spd) {
								velTGT -= acc // Speed up (Reverse)
							}
							
						}
						
					}
					
					// Stopped?
					if(velTGT == 0 and vel == velTGT)
						stopped = t
					else stopped = f
					
				#endregion
				
				#region Steering
					
					if(!auto and !tranWarp) {
						
						if(kbA) {
							
							if(kbSHFT) dirTGT += rot*2
							else dirTGT += rot
							if(dirTGT >= 360) dirTGT -= 360
							
						}
						
						if(kbD) {
							
							if(kbSHFT) dirTGT -= rot*2
							else dirTGT -= rot
							if(dirTGT < 0) dirTGT += 360
							
						}
						
					}
					
				#endregion
				
				#region Fire Control
					
					if(wpnRdy) {
						
						#region Weapon Powered
							
							// View Offset
							var camx = ((x-(M.ww/2))+wpnVO[0])
							var camy = ((y-(M.wh/2))+wpnVO[1])
							var shkx = M.scrnShk[0]*M.z
							var shky = M.scrnShk[1]*M.z
							camera_set_view_pos(view_camera[0],camx+shkx+M.camOffx,camy+shky+M.camOffy)
							
							wpnDir = point_direction(x,y,MX,MY)
							if(kbFp) {
								
								wpnRdy = f
								window_set_cursor(cr_default)
								camera_set_view_border(view_camera[0],M.ww/2,M.wh/2)
								camera_set_view_target(view_camera[0],oPlayer)
								wpnVO = [0,0]
								wpnVOo = [0,0]
								wpnVOd = [0,0]
								wpni = 0
								
							} else if(mbr) {
								
								wpni += 1
								if(wpni >= wpnDel) {
									
									var e = instance_create_layer(x,y,"FG2",oProj)
									e.par = id
									e.blend = cNeonGreen
									e.dir = wpnDir+random_range(-5,5)
									e.nrtx = cos2(dir,vel)
									e.nrty = sin2(dir,vel)
									x += e.nrtx*M.z
									y += e.nrty*M.z
									e.init_done = t
									
									wpni = 0
									
									// SFX
									var snd = audio_play_sound_on(mEmt,sfxLzrShot,f,0)
									ds_list_add(M.sfxL,snd)
									audio_sound_pitch(snd,random_range(.9,1.1))
									audio_sound_gain(snd,M.sfxVol,0)
									
								}
								
								if(M.scrnShk[6] == noone) {
									
									M.scrnShk[3] = 1
									M.scrnShk[4] = 1
									M.scrnShk[5] = (1/room_speed)*12
									
								}
								
							} else wpni = 0
							
						#endregion
						
					} else if(!tranWarp) {
						
						#region Weapon Unpowered
							
							if(kbFp) {
							
								wpnRdy = t
								window_set_cursor(cr_none)
								camera_set_view_target(view_camera[0],noone)
								wpni = 0
								
							}
							
						#endregion
						
					}
					
				#endregion
				
 				#region Velocity & Auto(+Orbit+Locale)
					
					#region Curr/Auto check
						
						if(curr == noone) {
							
							#region Reset w/ No Current
								
								auto = f
								preAuto = f
								orbit = f
								startOrbit = f
								orbitDist = noone
								
							#endregion
							
						} else if(curr != noone and !auto and kbBCKSPCp) {
							
							#region Cancel Current
								
								prev = curr
								prevNDX = prev.ndx
								curr = noone
								currNDX = noone
								
							#endregion
							
						} else if(curr != noone and kbNTRp
							and !autoDelay and !tranWarp) {
							
							#region Start Auto
								
								preAuto = t
								auto = t
								
							#endregion
							
						}
						
					#endregion
					
					if(!auto and !tranWarp) {
						
						#region Manual (WASD)
							
							if(stop) {
								
								hyper = f
								velTGT = 0
								if(vel == velTGT)
									stop = f
								
							}
							
						#endregion
						
					} else {
						
						#region Auto, Orbit, Locale Controls
							
							#region Disable Autopilot/Orbiting
								
								if(kbBCKSPCp) {
									
									// Keep dir from orbit; Nullify orbit distance
									if(orbit) {
										
										dir += 90*-orbitPol
										orbitDist = noone
										
									}
									
									// Disable all auto flags
									orbit = f
									auto = f
									preAuto = f
									startOrbit = f
									
									// Stop moving if moving from auto pilot
									stop = t
									
								}
								
							#endregion
							
							if(auto) {
								
								// Do Autopilot
								if(!preAuto and !orbit) {
									
									#region Auto to Dest
										
										// Init
										var pdist = point_distance(x,y,curr.x,curr.y)
										var pdir = point_direction(x,y,curr.x,curr.y)
										var dird = abs(dir-pdir)
										
										if(!startOrbit) {
											
											// Set Dir
											if(dird <= rot*2) dir = pdir
											if(dir != pdir) {
												
												// Rotate
												if(dird > 180) {
													
													if(!kbSHFT) {
														
														if(dir > pdir) dir += rot
														else dir -= rot
														
													} else {
														
														if(dir > pdir) dir += rot*2
														else dir -= rot*2
														
													}
													
												} else {
													
													if(!kbSHFT) {
														
														if(dir > pdir) dir -= rot
														else dir += rot
														
													} else {
														
														if(dir > pdir) dir -= rot*2
														else dir += rot*2
														
													}
													
												}
												
												// Loop Rotation
												if(dir >= 360) dir -= 360
												else if(dir < 0) dir += 360
												
											}
											
											#region Move to Orbit
												
												if(!kbSHFT) {
													
													if(pdist <= (curr.dia*M.z)*3)
														velTGT = spd*(2/3)
													else if(pdist <= (curr.dia*M.z)*2)
														velTGT = spd*(1/3)
													else velTGT = spd
													
												} else {
													
													if(pdist <= (curr.dia*M.z)*3)
														velTGT = (spd*2)*(2/3)
													else if(pdist <= (curr.dia*M.z)*2)
														velTGT = (spd*2)*(1/3)
													else velTGT = spd*2
													
												}
												
											#endregion
											
										}
										
										if(pdist <= curr.dia*M.z or startOrbit) {
											
											#region Start Orbit
												
												if(!startOrbit) {
													
													startOrbit = t
													if(chance(50)) orbitPol *= -1
													orbitSpd = random_range(0.05,0.10)
													
												} else if(!orbit) {
													
													// Slow to stop for Orbit
													velTGT = 0
													
													var ddir = abs(point_direction(x,y,curr.x,curr.y)-dir)
													if (ddir < 90) dir += orbitPol*rot // Rotate to Orbit
													else if(ddir >= 90 and vel == velTGT) {
														
														// Start Orbit
														dir += orbitPol*90
														// Loop Rotation
														if(dir >= 360) dir -= 360
														else if(dir < 0) dir += 360
														orbitDist = point_distance(x,y,curr.x,curr.y)
														orbit = t
														startOrbit = f
														
													}
													
												}
												
											#endregion
											
										}
										
									#endregion
									
								} if(orbit and !preAuto) {
									
									#region Historize Body
										
										hist.bdyL = list_account_inst(hist.bdyL,curr)
										
									#endregion
									
									#region Orbit
										
										// Update Orbit Movement
										x = curr.x+cos2(dir,orbitDist)
										y = curr.y+sin2(dir,orbitDist)
										sysx = x
										sysy = y
										dir += orbitSpd*-orbitPol
										
										#region Access Trade Hub
											
											// Is atleast Urban Development?
											if(curr.locs.tHub.ava) {
												
												#region Historize Trade Hub
													
													hist.tHubL = list_account_inst(hist.tHubL,curr)
													
												#endregion
												
												#region Trade Hub Access Message (Make)
													
													// Make Message?
													if(!loc.in and loc.txt == noone) {
														
														loc.txt    	= instance_create_layer(0,0,"GUI1",oText)
														loc.txt.xy 	= [M.ww*d3,M.wh*d16,M.ww*p67,M.wh*(d16*3)]
														loc.txt.xypct  = [d3,d16,p67,d16*3]
														loc.txt.str    = "Press Tab to Access Trade Hub"
														loc.txt.inRoom = rSystem
														loc.txt.gui	= t
														loc.txt.active = t
														// Message Destruction occurs outside to ensure message
														// is always destroyed when not relevant.
														
													} else if(loc.in and loc.txt != noone) {
														
														instance_destroy(loc.txt)
														loc.txt = noone
														
													}
													M.DBGstr1 += "Trade Hub Msg Inst: " + string(loc.txt) + "\n"
													
												#endregion
												
												#region Toggle Trade Hub Access (TODO: Modularize/Specific System Bodies)
													
													if(!loc.in and loc.txt != noone and kbTABp) {
														
														// Toggle On
														loc.in = t
														
														// Make Scene
														var tHub = curr.locs.tHub
														loc.inst = instance_create_layer(0,0,"GUI1",oLocale)
														var e = loc.inst
														e.par = P.sys
														e.spr = tHub.spr
														e.sprx = WW/2
														e.spry = WH/2
														e.sprSclW = WW/sprite_get_width(tHub.spr)
														e.sprSclH = WH/sprite_get_height(tHub.spr)
														e.bgc = tHub.bgc
														e.fgc = tHub.fgc
														e.sprBlend = cWhite
														e.gui = t
														e.locale = _locale.tradeHub
														e.alarm[0] = 1
														
													} else if(loc.in and loc.txt == noone and kbTABp) {
														
														// Toggle Off
														loc.in = f
														
														// Destroy Locale Instance
														if(loc.inst != noone) {
															
															if(is(loc.inst,oLocale,f))
																instance_destroy(loc.inst)
															loc.inst = noone
															
														}
														
													}
													
												#endregion
												
											} else {
												
												#region No Trade Hub Available Message
													
													if(is(loc.txt,oText,f))
														loc.txt.str = "No Trade Hub Available"
													else {
														
														loc.txt    	= instance_create_layer(0,0,"GUI1",oText)
														loc.txt.xy 	= [M.ww*d3,M.wh*d16,M.ww*p67,M.wh*(d16*3)]
														loc.txt.xypct  = [d3,d16,p67,d16*3]
														loc.txt.str    = "No Trade Hub Available"
														loc.txt.inRoom = rSystem
														loc.txt.gui	= t
														loc.txt.active = t
														
													}
													
												#endregion
												
											}
											
										#endregion
										
									#endregion
									
								} else if(preAuto) {
									
									#region Pre-Auto (Align to Dest)
										
										// Pre-Autopilot, slow to stop first + Turn
										// Init
										stop = f
										hyper = f
										warp = f
										var pdir = point_direction(x,y,curr.x,curr.y)
										var dird = abs(dir-pdir)
										
										// Rotate
										if(dird <= rot) dir = pdir
										else if(dird > 180) {
											
											if(!kbSHFT) {
												
												if(dir > pdir) dir += rot
												else dir -= rot
												
											} else {
												
												if(dir > pdir) dir += rot*2
												else dir -= rot*2
												
											}
											
										} else {
											
											if(!kbSHFT) {
												
												if(dir > pdir) dir -= rot
												else dir += rot
												
											} else {
												
												if(dir > pdir) dir -= rot*2
												else dir += rot*2
												
											}
											
										}
										
										// Loop Rotation
										if(dir >= 360) dir -= 360
										else if(dir < 0) dir += 360
										
										// Slow to Stop
										velTGT = 0
										
										// Pre-Auto Done
										if((vel == velTGT and dird < 45) or abs(dir-pdir) <= 45)
											preAuto = f
										
									#endregion
									
								}
								
							} 
							
						#endregion
						
					}
					
					#region Locale Sanity
						
						// Destroy Trade Hub Message (Not in Orbit)
						if(loc.txt != noone and !orbit) {
							
							instance_destroy(loc.txt)
							loc.txt = noone
							
						}
						
						// If Locale Instance Deleted, We can't be in it!
						if(loc.in and !is(loc.inst,oLocale,f))
							loc.in = f
						
					#endregion
					
					#region Engine Audio Pitching
						
						// Unpitch Eng
						if(vel == velTGT) {
							
							if(abs(engPit) < engPitAcc)
								engPit = 0
							else if(engPit > 0)
								engPit -= engPitAcc*2
							else if(engPit < 0)
								engPit += engPitAcc*2
								
						} else if(vel < velTGT) {
							
							if(kbSHFT) engPit += engPitAcc*2
							else engPit += engPitAcc
							
						} else if(vel > velTGT) {
							
							if(kbSHFT) engPit -= engPitAcc*2
							else engPit -= engPitAcc
							
						}
						engPit = clamp(engPit,engPitMn,engPitMx)
						
					#endregion
					
				#endregion
				
				#region View Panning
					
					if(!M.hudOver and !wpnRdy) {
						
						if(mbr) {
							
							M.camOffx += MXD
							M.camOffy += MYD
							
						} else if(mbmp) {
							
							M.camOffx = 0
							M.camOffy = 0
							
						}
						
					} else if(wpnRdy) {
						
						M.camOffx = 0
						M.camOffy = 0
						
					}
					
					// Do Camera Panning; Disable Camera Follow
					if((M.camOffx != 0 or M.camOffy != 0) and !wpnRdy) {
						
						// Stop Follow
						if(camera_get_view_target(view_camera[0]) == oPlayer)
							camera_set_view_target(view_camera[0],noone)
						
						// Pan Cam Relative to Player
						var camx = x-(M.ww/2)
						var camy = y-(M.wh/2)
						camera_set_view_pos(view_camera[0],camx+M.camOffx,camy+M.camOffy)
						
					} else if(camera_get_view_target(view_camera[0]) == noone
						and !wpnRdy){
						
						camera_set_view_border(view_camera[0],M.ww/2,M.wh/2)
						camera_set_view_target(view_camera[0],oPlayer)
						
					}
					
				#endregion
				
				#region Selection Cycle
					
					var sz = ds_list_size(sys.bdyL)
					if(kbPGUp) {
						
						// Get Next in Index/First if none
						if(seleNDX == noone) seleNDX = 0
						else {
							
							// Loop/Iterate
							if(seleNDX >= sz-1) seleNDX = 0
							else seleNDX += 1
							
						}
						
						// Apply
						sele = sys.bdyL[|seleNDX]
						
					} else if(kbPGDp) {
						
						// Get Next in Index/First if none
						if(seleNDX == noone) seleNDX = sz-1
						else {
							
							// Loop/Iterate
							if(seleNDX <= 0) seleNDX = sz-1
							else seleNDX -= 1
							
						}
						
						// Apply
						sele = sys.bdyL[|seleNDX]
						
					}
					
				#endregion
				
				#region System Exit Msg
					
					if(sysEx and exTxt == noone) {
						
						// Make Exit Text
						exTxt    = instance_create_layer(0,0,"GUI1",oText)
						exTxt.xy = [M.ww*d3,M.wh*d16,M.ww*p67,M.wh*(d16*3)]
						exTxt.xypct  = [d3,d16,p67,d16*3]
						exTxt.str    = "Press Tab to Initiate"
							+"\nPre-Warp Protocols."
						exTxt.inRoom = rSystem
						exTxt.gui = t
						exTxt.active = t
						
					} else if(tranWarpIn and !is(exTxt,oText,f)) {
						
						// Make Exit Text
						exTxt    = instance_create_layer(0,0,"GUI1",oText)
						exTxt.xy = [M.ww*d3,M.wh*d16,M.ww*p67,M.wh*(d16*3)]
						exTxt.xypct  = [d3,d16,p67,d16*3]
						exTxt.str = "Dewarp Underway, Stand By- Operatour."
						exTxt.inRoom = rSystem
						exTxt.gui = t
						exTxt.active = t
						
					} else if(!sysEx and exTxt != noone and !tranWarpIn) {
						
						instance_destroy(exTxt)
						exTxt = noone
						
					}
					M.DBGstr1 += "Exit Msg Inst: " + string(exTxt) + "\n"
					
				#endregion
				
				#region Sys Exit & (Un)Warp Logic
					
					// Init
					var sysDist = point_distance(sys.cenx,sys.ceny,x,y)
					
					// Set Sys Ex
					if(sysDist >= sys.exRad) sysEx = t
					else sysEx = f
					M.DBGstr1 += "Dist from Center: " + string(sysDist) + "\n"
					M.DBGstr1 += "Exit Radius: " + string(sys.exRad) + "\n"
					if(sysEx) M.DBGstr1 += "Can Exit\n"
					
					if(tranWarpIn) {
						
						#region Warp In (UnWarp)
							
							if(tranWarpDeli >= tranWarpDel and tranWarpLeni > 0) {
								
								exTxt.str = "Dewarp Underway, Stand By- Operatour."
								tranWarpLeni--
								
							} else {
								
								tranWarpDeli--
								exTxt.str = "Despooling Warp Drives, Stand By- Operatour."
									+string(floor((1-(tranWarpDeli/tranWarpDel))*100))+"%"
								
								// Pitch Ship Engine SFX
								var pct = tranWarpDeli/tranWarpDel
								if(audio_is_playing(ambShipPres))
										audio_sound_pitch(list_find_sound(M.ambL,"ambShipPres"),1+pct)
								
								// Done Despooling/DeWarping
								if(tranWarpDeli <= 0) {
									
									tranWarpFX = f
									tranWarpIn = f
									tranWarp = f
									tranWarpCancel = f
									tranWarpDeli = noone
									tranWarpLeni = noone
									instance_destroy(exTxt)
									exTxt = noone
									
								}
								
							}
							
						#endregion
						
					} else {
						
						#region Warp Out
							
							// Pre-Warp Stop
							if(tranWarp and (!stopped or abs(delta_dir(dirTGT,dirFromCen)) > 15)) {
								
								stop = t
								velTGT = 0
								if(abs(delta_dir(dirTGT,dirFromCen)) > 15)
									dirTGT = dirFromCen+random_range(-10,10)
								
							// Do Warp
							} else {
								
								// Engage Warp
								if(kbTABp and sysEx and !tranWarp and !auto) {
									
									tranWarp = t
									tranWarpDeli = 0
									tranWarpLeni = 0
									exTxt.str = "Aligning to Warp Vector."
										+"\nPress Backspace to Disengage"
										+"\n-Operatour"
									
								} else if(tranWarp) {
									
									if(tranWarpDeli >= tranWarpDel and !tranWarpCancel) {
										
										exTxt.str = "Warp Drive Ready. Press Tab to Warp."
											+"\nPress Backspace to Disengage"
											+"\n-Operatour"
										
										if(alarm[3] == -1) {
											
											if(kbTABp) {
												
												// DO WARP
												alarm[3] = tranWarpLen
												
											} else if(kbBCKSPCp) {
												
												tranWarpCancel = t
												tranWarpLeni = noone
												exTxt.str = "Despooling Warp Drives "
													+string((1-(tranWarpDeli/tranWarpDel))*100)+"% -Operatour."
												
											}
											
										} else tranWarpLeni++
										
										if(tranWarpLeni >= tranWarpLen-4)
											M.exZ = t
										
									} else {
										
										if(abs(delta_dir(dir,dirFromCen)) > 15
											or !stopped) {
											
											exTxt.str = "Aligning to Warp Vector."
												+"\nPress Backspace to Disengage"
												+"\n-Operatour"
											
										} else if(!tranWarpCancel) {
											
											tranWarpDeli++
											exTxt.str = "Spooling Warp Drives T-"+string(ceil((tranWarpDel-tranWarpDeli)/room_speed))
												+"\nPress Backspace to Disengage- Operatour."
											
										} else {
											
											tranWarpDeli--
											exTxt.str = "Despooling Warp Drives "
												+string(floor((1-(tranWarpDeli/tranWarpDel))*100))+"% -Operatour"
											
										}
										
										// Pitch Ship Engine SFX
										var pct = tranWarpDeli/tranWarpDel
										if(audio_is_playing(ambShipPres))
												audio_sound_pitch(list_find_sound(M.ambL,"ambShipPres"),1+pct)
										
										if(kbBCKSPCp and !tranWarpCancel) {
											
											tranWarpCancel = t
											tranWarpLeni = noone
											dirTGT = dir
											exTxt.str = "Despooling Warp Drives "
												+string(floor((1-(tranWarpDeli/tranWarpDel))*100))+"% -Operatour"
											
										}
										
										// Done Despooling
										if(tranWarpDeli <= 0 and tranWarpCancel) {
											
											tranWarp = f
											tranWarpCancel = f
											tranWarpDeli = noone
											tranWarpLeni = noone
											exTxt.str    = "Warp Drives Disengaged."
												+"\nPress Tab to Re-Engage -Operatour"
											
										}
										
									}
								
							}
							
						}
						
					#endregion
					
				}
				
			}
			
		}
		
	#endregion
	
	#region Galaxy
		
		if(M.galaxy != noone) {
			
			if(M.galaxy.state == _mode.main and M.galaxy.active) {
				
				#region View Panning
					
					if(mbr) {
						
						M.galaxy.xx += -MXD
						M.galaxy.yy += -MYD
						
					}
					
				#endregion
				
				#region Velocity Control
					
					// Galaxy Movement
					var x2 = 0
					var y2 = 0
					if(curr != noone) {
						
						// Init
						var pdist = point_distance(x,y,curr.gx+M.galaxy.xx,curr.gy+M.galaxy.yy)
						
						if(vel == 0 and pdist > sprite_width/4 and kbNTRp)
							vel = 12 // Go
						
						var pdir = point_direction(x,y,curr.gx+M.galaxy.xx,curr.gy+M.galaxy.yy)
						dir = pdir
						x2 = cos2(pdir,vel/spdOrig)
						y2 = sin2(pdir,vel/spdOrig)
						
						if(vel != 0 and kbBCKSPCp)
							vel = 0 // Stop
						else if(vel == 0 and kbBCKSPCp) {
							
							curr = noone // Cancel Current
							currNDX = noone
							
						}
						
					}
					
					// Apply
					gx += x2
					gy += y2
					x = gx+(M.galaxy.xx)
					y = gy+(M.galaxy.yy)
					
				#endregion
				
				#region System Enter
					
					if(curr != noone) {
						
						// Init
						var pdist = point_distance(x,y,curr.gx+M.galaxy.xx,curr.gy+M.galaxy.yy)
						
						if(pdist <= sprite_width/4) {
							
							// Stop
							velTGT = 0
							vel = 0
							instance_activate_object(curr)
							
							// Entrance Message
							if(ntrTxt == noone) {
								
								// Make Enter Text
								ntrTxt= instance_create_layer(0,0,"GUI1",oText)
								ntrTxt.xy = [M.ww*d3,M.wh*d16,M.ww*p67,M.wh*(d16*3)]
								ntrTxt.xypct = [d3,d16,p67,d16*3]
								ntrTxt.str = "Press Enter to Enter System"
								ntrTxt.inRoom = room
								ntrTxt.gui = t
								ntrTxt.active = t
								
							}
							
							if(kbNTRp) {
								
								// Pause Galaxy
								M.galaxy.state = _mode.pause
								
								// Destroy Enter Msg
								if(ntrTxt != noone) {
									
									instance_destroy(ntrTxt)
									ntrTxt = noone
									
								}
								
								// Set Sys
								sys = curr
								
								// Clear pointers
								curr = noone
								currNDX = noone
								prev = noone
								prevNDX = noone
								sele = noone
								seleNDX = noone
								
								// Goto System...
								if(sys.init_done)
									alarm[1] = 1
								
							}
							
						} else if(ntrTxt != noone) {
							
							// Destroy Enter Msg
							instance_destroy(ntrTxt)
							ntrTxt = noone
							
						}
						
					}
					
				#endregion
				
			}
			
		}
		
	#endregion
	
	// Adjust Sprite Angle
	if (!orbit) image_angle = dir+90
	else        image_angle = dir*-orbitPol
	
}