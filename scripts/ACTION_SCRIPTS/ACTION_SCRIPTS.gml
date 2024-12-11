// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button_action(inst){
	
	switch(inst.action) {
		
		#region Menu
			
			case _act.resume : {
				
				if(tfd <= 0) {
					
					M.state = _mode.gameMain
					room_goto(M.room_prev)
					
				}
				break
				
			}
			
			case _act.newGame: {
				
				M.state = _mode.init
				room_goto(rMain)
				break
				
			}
			
			case _act.saveGame : {
				
				// TODO
				break
				
			}
			
			case _act.loadGame : {
				
				// TODO
				break
				
			}
			
			case _act.settings : {
				
				// TODO
				break
				
			}
			
			case _act.quit: {
				
				game_end()
				break
				
			}
			
		#endregion
		
		#region Universal
			
			case _act.close: {
				
				if(par != noone) {
					
					try {
						
						instance_destroy(par)
						
					} catch (_ex) {
						
						show_debug_message("Couldn't Close Parent Properly!")
						show_debug_message(_ex)
						
					}
					
				}
				break
				
			}
			
			case _act.minimize: {
				
				
				break
				
			}
			
		#endregion
		
		#region Locales
			
			#region Trade Hub
				
				case _act.account: {
					
					if(is(par,oLocale,t)) {
						
						if(par.locale.typ == _locale.tradeHub) {
							
							try {
								
								if(!par.locale.account) {
									
									par.locale.account = t
									fgc = [1,cNeonBlue,cNeonBlue,cBlue,cBlue]
									strc = inv_ac_arr(fgc)
									
								} else {
									
									par.locale.account = f
									fgc = [1,cLtGrey,cLtGrey,cGrey,cGrey]
									strc = inv_ac_arr(fgc)
									
								}
								
							} catch (_ex) {
								
								show_debug_message("Couldn't Toggle Account!")
								show_debug_message(_ex)
								
							}
							
						}
						
					}
					
					break
					
				}
				
				case _act.postings: {
					
					if(is(par,oLocale,t)) {
						
						if(par.locale.typ == _locale.tradeHub) {
							
							try {
								
								if(!par.locale.postings) {
									
									par.locale.postings = t
									fgc = [1,cNeonBlue,cNeonBlue,cBlue,cBlue]
									strc = inv_ac_arr(fgc)
									
								} else {
									
									par.locale.postings = f
									fgc = [1,cLtGrey,cLtGrey,cGrey,cGrey]
									strc = inv_ac_arr(fgc)
									
								}
								
							} catch (_ex) {
								
								show_debug_message("Couldn't Toggle Postings!")
								show_debug_message(_ex)
								
							}
							
						}
						
					}
					
					break
					
				}
				
				case _act.streams: {
					
					if(is(par,oLocale,t)) {
						
						if(par.locale.typ == _locale.tradeHub) {
							
							try {
								
								if(!par.locale.streams) {
									
									par.locale.streams = t
									fgc = [1,cNeonBlue,cNeonBlue,cBlue,cBlue]
									strc = inv_ac_arr(fgc)
									
								} else {
									
									par.locale.streams = f
									fgc = [1,cLtGrey,cLtGrey,cGrey,cGrey]
									strc = inv_ac_arr(fgc)
									
								}
								
							} catch (_ex) {
								
								show_debug_message("Couldn't Toggle Streams!")
								show_debug_message(_ex)
								
							}
							
						}
						
					}
					
					break
					
				}
				
				case _act.metrics: {
					
					if(is(par,oLocale,t)) {
						
						if(par.locale.typ == _locale.tradeHub) {
							
							try {
								
								if(!par.locale.metrics) {
									
									par.locale.metrics = t
									fgc = [1,cNeonBlue,cNeonBlue,cBlue,cBlue]
									strc = inv_ac_arr(fgc)
									
								} else {
									
									par.locale.metrics = f
									fgc = [1,cLtGrey,cLtGrey,cGrey,cGrey]
									strc = inv_ac_arr(fgc)
									
								}
								
							} catch (_ex) {
								
								show_debug_message("Couldn't Toggle Metrics!")
								show_debug_message(_ex)
								
							}
							
						}
						
					}
					
					break
					
				}
				
				case _act.exchange: {
					
					if(is(par,oLocale,t)) {
						
						if(par.locale.typ == _locale.tradeHub) {
							
							try {
								
								if(!par.locale.exchange) {
									
									par.locale.exchange = t
									fgc = [1,cNeonBlue,cNeonBlue,cBlue,cBlue]
									strc = inv_ac_arr(fgc)
									
								} else {
									
									par.locale.exchange = f
									fgc = [1,cLtGrey,cLtGrey,cGrey,cGrey]
									strc = inv_ac_arr(fgc)
									
								}
								
							} catch (_ex) {
								
								show_debug_message("Couldn't Toggle Exchange!")
								show_debug_message(_ex)
								
							}
							
						}
						
					}
					
					break
					
				}
				
				#region Exchange Sub-Buttons
					
					// Buy/Sell Toggle
					case _act.exbtn0: {
						
						if(is(par,oLocale,t)) {
							
							if(par.locale.typ == _locale.tradeHub) {
								
								try {
									
									if(par.locale.exBtn0.state == _state.buy) {
										
										par.locale.exBtn0.str = "Sell:"
										par.locale.exBtn0.fgc = [1,cNeonRed,cNeonRed,cRed,cRed]
										par.locale.exBtn0.strc = inv_ac_arr(par.locale.exBtn0.fgc)
										par.locale.exBtn0.state = _state.sell
										
									} else {
										
										par.locale.exBtn0.str = "Buy:"
										par.locale.exBtn0.fgc = [1,cNeonGreen,cNeonGreen,cGreen,cGreen]
										par.locale.exBtn0.strc = inv_ac_arr(par.locale.exBtn0.fgc)
										par.locale.exBtn0.state = _state.buy
										
									}
									
								} catch (_ex) {
									
									show_debug_message("Exception: exBtn0!")
									show_debug_message(_ex)
									
								}
								
							}
							
						}
						
						break
						
					}
					
					// Buy/Sell x1
					case _act.exbtn1: {
						
						if(is(par,oLocale,t)) {
							
							var loc = par.locale
							
							if(loc.typ == _locale.tradeHub) {
								
								try {
									
									// Init References
									var ei = par.sele
									var state = loc.exBtn0.state
									var sys = par.par
									var es = sys.ES[$ ei]
									var crg = P.cargo
									var te = D.TOE.L[| ei]
									
									if(state == _state.buy) {
										
										// Buying...
										// Credits -> Market; Elements -> Vessel
										if(crg.credit >= es[$ _TOEk.val]
											and es[$ _TOEk.amt] > 0) {
											
											// Init Delta
											var e = noone
											
											// Cargo Element Ref Init
											if(variable_struct_exists(crg.e,ei))
												e = crg.e[$ ei] // Get Ref
											else {
												
												// Make Cargo Sub-Struct & Get Ref
												crg.e[$ ei] = {}
												e = crg.e[$ ei]
												e[$ _TOEk.amt] = 0
												
											}
											
											#region Cargo/Market Exchange Calcs
												
												// Calc Refs
												var pwa = crg.weight_limit-crg.weight_used // Weight Ava
												var psa = crg.size_limit-crg.size_used // Size Ava
												// Calcs
												var O = qty(es[$ _TOEk.amt],-1) // Get Order From Market
												var OC = abs(O[2])*es[$ _TOEk.val] // Order Cost
												var OA = abs(O[2])*(min(crg.credit,OC)/OC) // Order Affordable
												var OW = OA*te[$ _TOEk.MAS] // Order (Rem) Weight
												var OWA = OA*(min(pwa,OW)/OW) // Order Weight, Affordable
												// TODO: Size, account for cargo temp, sol/liq/gas mods
												// TODO: Size, account for unknown densities
												var OSW = OWA*abs(toe_get_density(P,ei)) // Order (Rem) Size
												var OSWA = OWA*(min(psa,OSW)/OSW) // Order Size, Weight, Afforded
												if(is_nan(OSWA)) break // Can't afford anymore!
												
											#endregion
											
											// Finally, Apply Exchange Calcs
											// Remove from Market
											es[$ _TOEk.amt] -= OSWA
											// Add to Cargo
											e[$ _TOEk.amt] += OSWA
											// Remove Credits
											crg.credit -= es[$ _TOEk.val]*OSWA
											// Update Cargo Weight/Size
											crg.weight_used = qty_lim(crg.weight_used,
												OSWA*te[$ _TOEk.MAS],0,crg.weight_limit)[0]
											crg.size_used = qty_lim(crg.size_used,
												OSWA*abs(toe_get_density(P,ei)),0,crg.size_limit)[0]
											// Regen Market Value
        									es[$ _TOEk.val] = toe_gen_value(sys.ES,ei,sys.exMod)
											
										}
										
										
									} else {
										
										// Selling...
										// Credits -> Vessel; Elements -> Market
										if(variable_struct_exists(crg.e,ei)) {
											
											if(crg.e[$ ei][$ _TOEk.amt] > 0) {
												
												// Init Cargo Ref
												var e = crg.e[$ ei] // Element
												
												#region Cargo/Market Exchange Calcs
													
													// Calc Refs
													var pwa = crg.weight_limit-crg.weight_used // Weight Ava
													var psa = crg.size_limit-crg.size_used // Size Ava
													// Calcs
													var O = qty(e[$ _TOEk.amt],-1) // Get Order From Vessel
													var OV = abs(O[2])*es[$ _TOEk.val] // Order Value
													var OW = abs(O[2])*te[$ _TOEk.MAS] // Order Weight
													// TODO: Size, account for cargo temp, sol/liq/gas mods
													// TODO: Size, account for unknown densities
													var OS = abs(O[2])*abs(toe_get_density(P,ei)) // Order Size
													
												#endregion
												
												// Finally, Apply Exchange Calcs
												// Remove from Cargo
												e[$ _TOEk.amt] -= abs(O[2])
												// Add to Market
												es[$ _TOEk.amt] += abs(O[2])
												// Add Credits
												crg.credit += OV*(1-(sys.exTax/100))
												// Update Cargo Weight/Size
												crg.weight_used = qty_lim(crg.weight_used,-OW,0,crg.weight_limit)[0]
												crg.size_used = qty_lim(crg.size_used,-OS,0,crg.size_limit)[0]
												// Regen Market Value
	        									es[$ _TOEk.val] = toe_gen_value(sys.ES,ei,sys.exMod)
												
											}
											
										}
										
									}
									
								} catch (_ex) {
									
									show_debug_message("Exception: exBtn1!")
									show_debug_message(_ex)
									
								}
								
							}
							
						}
						
						break
						
					}
					
					// Buy/Sell x10
					case _act.exbtn2: {
						
						if(is(par,oLocale,t)) {
							
							var loc = par.locale
							
							if(loc.typ == _locale.tradeHub) {
								
								try {
									
									// Init References
									var ei = par.sele
									var state = loc.exBtn0.state
									var sys = par.par
									var es = sys.ES[$ ei]
									var crg = P.cargo
									var te = D.TOE.L[| ei]
									
									if(state == _state.buy) {
										
										// Buying...
										// Credits -> Market; Elements -> Vessel
										if(crg.credit >= es[$ _TOEk.val]
											and es[$ _TOEk.amt] > 0) {
											
											// Init Delta
											var e = noone
											
											// Cargo Element Ref Init
											if(variable_struct_exists(crg.e,ei))
												e = crg.e[$ ei] // Get Ref
											else {
												
												// Make Cargo Sub-Struct & Get Ref
												crg.e[$ ei] = {}
												e = crg.e[$ ei]
												e[$ _TOEk.amt] = 0
												
											}
											
											#region Cargo/Market Exchange Calcs
												
												// Calc Refs
												var pwa = crg.weight_limit-crg.weight_used // Weight Ava
												var psa = crg.size_limit-crg.size_used // Size Ava
												// Calcs
												var O = qty(es[$ _TOEk.amt],-10) // Get Order From Market
												var OC = abs(O[2])*es[$ _TOEk.val] // Order Cost
												var OA = abs(O[2])*(min(crg.credit,OC)/OC) // Order Affordable
												var OW = OA*te[$ _TOEk.MAS] // Order (Rem) Weight
												var OWA = OA*(min(pwa,OW)/OW) // Order Weight, Affordable
												// TODO: Size, account for cargo temp, sol/liq/gas mods
												// TODO: Size, account for unknown densities
												var OSW = OWA*abs(toe_get_density(P,ei)) // Order (Rem) Size
												var OSWA = OWA*(min(psa,OSW)/OSW) // Order Size, Weight, Afforded
												if(is_nan(OSWA)) break // Can't afford anymore!
												
											#endregion
											
											// Finally, Apply Exchange Calcs
											// Remove from Market
											es[$ _TOEk.amt] -= OSWA
											// Add to Cargo
											e[$ _TOEk.amt] += OSWA
											// Remove Credits
											crg.credit -= es[$ _TOEk.val]*OSWA
											// Update Cargo Weight/Size
											crg.weight_used = qty_lim(crg.weight_used,
												OSWA*te[$ _TOEk.MAS],0,crg.weight_limit)[0]
											crg.size_used = qty_lim(crg.size_used,
												OSWA*abs(toe_get_density(P,ei)),0,crg.size_limit)[0]
											// Regen Market Value
        									es[$ _TOEk.val] = toe_gen_value(sys.ES,ei,sys.exMod)
											
										}
										
										
									} else {
										
										// Selling...
										// Credits -> Vessel; Elements -> Market
										if(variable_struct_exists(crg.e,ei)) {
											
											if(crg.e[$ ei][$ _TOEk.amt] > 0) {
												
												// Init Cargo Ref
												var e = crg.e[$ ei] // Element
												
												#region Cargo/Market Exchange Calcs
													
													// Calc Refs
													var pwa = crg.weight_limit-crg.weight_used // Weight Ava
													var psa = crg.size_limit-crg.size_used // Size Ava
													// Calcs
													var O = qty(e[$ _TOEk.amt],-10) // Get Order From Vessel
													var OV = abs(O[2])*es[$ _TOEk.val] // Order Value
													var OW = abs(O[2])*te[$ _TOEk.MAS] // Order Weight
													// TODO: Size, account for cargo temp, sol/liq/gas mods
													// TODO: Size, account for unknown densities
													var OS = abs(O[2])*abs(toe_get_density(P,ei)) // Order Size
													
												#endregion
												
												// Finally, Apply Exchange Calcs
												// Remove from Cargo
												e[$ _TOEk.amt] -= abs(O[2])
												// Add to Market
												es[$ _TOEk.amt] += abs(O[2])
												// Add Credits
												crg.credit += OV*(1-(sys.exTax/100))
												// Update Cargo Weight/Size
												crg.weight_used = qty_lim(crg.weight_used,-OW,0,crg.weight_limit)[0]
												crg.size_used = qty_lim(crg.size_used,-OS,0,crg.size_limit)[0]
												// Regen Market Value
	        									es[$ _TOEk.val] = toe_gen_value(sys.ES,ei,sys.exMod)
												
											}
											
										}
										
									}
									
								} catch (_ex) {
									
									show_debug_message("Exception: exBtn1!")
									show_debug_message(_ex)
									
								}
								
							}
							
						}
						
						break
						
					}
					
					// Buy/Sell x100
					case _act.exbtn3: {
						
						if(is(par,oLocale,t)) {
							
							var loc = par.locale
							
							if(loc.typ == _locale.tradeHub) {
								
								try {
									
									// Init References
									var ei = par.sele
									var state = loc.exBtn0.state
									var sys = par.par
									var es = sys.ES[$ ei]
									var crg = P.cargo
									var te = D.TOE.L[| ei]
									
									if(state == _state.buy) {
										
										// Buying...
										// Credits -> Market; Elements -> Vessel
										if(crg.credit >= es[$ _TOEk.val]
											and es[$ _TOEk.amt] > 0) {
											
											// Init Delta
											var e = noone
											
											// Cargo Element Ref Init
											if(variable_struct_exists(crg.e,ei))
												e = crg.e[$ ei] // Get Ref
											else {
												
												// Make Cargo Sub-Struct & Get Ref
												crg.e[$ ei] = {}
												e = crg.e[$ ei]
												e[$ _TOEk.amt] = 0
												
											}
											
											#region Cargo/Market Exchange Calcs
												
												// Calc Refs
												var pwa = crg.weight_limit-crg.weight_used // Weight Ava
												var psa = crg.size_limit-crg.size_used // Size Ava
												// Calcs
												var O = qty(es[$ _TOEk.amt],-100) // Get Order From Market
												var OC = abs(O[2])*es[$ _TOEk.val] // Order Cost
												var OA = abs(O[2])*(min(crg.credit,OC)/OC) // Order Affordable
												var OW = OA*te[$ _TOEk.MAS] // Order (Rem) Weight
												var OWA = OA*(min(pwa,OW)/OW) // Order Weight, Affordable
												// TODO: Size, account for cargo temp, sol/liq/gas mods
												// TODO: Size, account for unknown densities
												var OSW = OWA*abs(toe_get_density(P,ei)) // Order (Rem) Size
												var OSWA = OWA*(min(psa,OSW)/OSW) // Order Size, Weight, Afforded
												if(is_nan(OSWA)) break // Can't afford anymore!
												
											#endregion
											
											// Finally, Apply Exchange Calcs
											// Remove from Market
											es[$ _TOEk.amt] -= OSWA
											// Add to Cargo
											e[$ _TOEk.amt] += OSWA
											// Remove Credits
											crg.credit -= es[$ _TOEk.val]*OSWA
											// Update Cargo Weight/Size
											crg.weight_used = qty_lim(crg.weight_used,
												OSWA*te[$ _TOEk.MAS],0,crg.weight_limit)[0]
											crg.size_used = qty_lim(crg.size_used,
												OSWA*abs(toe_get_density(P,ei)),0,crg.size_limit)[0]
											// Regen Market Value
        									es[$ _TOEk.val] = toe_gen_value(sys.ES,ei,sys.exMod)
											
										}
										
										
									} else {
										
										// Selling...
										// Credits -> Vessel; Elements -> Market
										if(variable_struct_exists(crg.e,ei)) {
											
											if(crg.e[$ ei][$ _TOEk.amt] > 0) {
												
												// Init Cargo Ref
												var e = crg.e[$ ei] // Element
												
												#region Cargo/Market Exchange Calcs
													
													// Calc Refs
													var pwa = crg.weight_limit-crg.weight_used // Weight Ava
													var psa = crg.size_limit-crg.size_used // Size Ava
													// Calcs
													var O = qty(e[$ _TOEk.amt],-100) // Get Order From Vessel
													var OV = abs(O[2])*es[$ _TOEk.val] // Order Value
													var OW = abs(O[2])*te[$ _TOEk.MAS] // Order Weight
													// TODO: Size, account for cargo temp, sol/liq/gas mods
													// TODO: Size, account for unknown densities
													var OS = abs(O[2])*abs(toe_get_density(P,ei)) // Order Size
													
												#endregion
												
												// Finally, Apply Exchange Calcs
												// Remove from Cargo
												e[$ _TOEk.amt] -= abs(O[2])
												// Add to Market
												es[$ _TOEk.amt] += abs(O[2])
												// Add Credits
												crg.credit += OV*(1-(sys.exTax/100))
												// Update Cargo Weight/Size
												crg.weight_used = qty_lim(crg.weight_used,-OW,0,crg.weight_limit)[0]
												crg.size_used = qty_lim(crg.size_used,-OS,0,crg.size_limit)[0]
												// Regen Market Value
	        									es[$ _TOEk.val] = toe_gen_value(sys.ES,ei,sys.exMod)
												
											}
											
										}
										
									}
									
								} catch (_ex) {
									
									show_debug_message("Exception: exBtn1!")
									show_debug_message(_ex)
									
								}
								
							}
							
						}
						
						break
						
					}
					
				#endregion
				
			#endregion
			
		#endregion
		
		default: break
		
	}
	
}

																																														