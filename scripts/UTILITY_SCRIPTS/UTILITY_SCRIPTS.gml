// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_set_hvalign(hvalign) {
	
	draw_set_halign(hvalign[0])
	draw_set_valign(hvalign[1])
	
}

function mouse_in_rectangle(xy) {
	
	return (MX > xy[0] and MX < xy[2]
		and MY > xy[1] and MY < xy[3])
	
}

function mouse_in_gui_rectangle(xy) {
	
	return (WMX > xy[0] and WMX < xy[2]
		and WMY > xy[1] and WMY < xy[3])
	
}

function round2(val,dec) {

    // Prepare Calc
    var base = 1
    repeat(dec) base = base*10

    // Return result
    return round(val*base)/base
	
}

function sin2(deg,val) {
	
	return (-sin(degtorad(deg)))*val
	
}

function cos2(deg,val) {
	
	return cos(degtorad(deg))*val
	
}

function add_to_image_angle(inst,val) {
	
	inst.image_angle += val
	if(val > 0 and inst.image_angle >= 360) inst.image_angle -= 360
	else if(val < 0 and inst.image_angle < 0) inst.image_angle += 360
	
}

function instance_scale_update4(inst) {
		
	with(inst) {
		
		if(update4) {
		
			try {
			
				if(ww != M.ww or wh != M.wh) {
				
					xy = [M.ww*xypct[0],M.wh*xypct[1],M.ww*xypct[2],M.wh*xypct[3]]
					ww = M.ww
					wh = M.wh
				
				}
			
			} catch(_ex) {
				
				show_debug_message(_ex)
				ww = M.ww
				wh = M.wh
				
			}
			xypct = [xy[0]/M.ww,xy[1]/M.wh,xy[2]/M.ww,xy[3]/M.wh]
		
		} else {
			
			ww = M.ww
			wh = M.wh
		}
		
	}
	
}

function instance_scale_update2(inst) {
		
	with(inst) {
		
		if(update2) {
		
			try {
			
				if(M.ww != M.ww or M.wh != M.wh) {
				
					xx = M.ww*xxpct
					yy = M.wh*yypct
					var rwho = M.ww+M.wh
					var rwh = M.ww+M.wh
					var rwhdpct = rwh/rwho
					scl *= rwhdpct
					image_xscale *= scl
					image_yscale *= scl
					ww = M.ww
					wh = M.wh
				
				}
			
			} catch(_ex) {
				
				show_debug_message(_ex)
				ww = M.ww
				wh = M.wh
				
			}
			xxpct = xx/M.ww
			yypct = yy/M.wh
		
		} else {
			
			image_xscale *= scl
			image_yscale *= scl
			ww = M.ww
			wh = M.wh
			
		}
		
	}
	
}


// Update Relative Velocity & Direction of (inst)ance from (P)layer
function update_relVelDir(inst) {
	
	with(inst) {
		
		try {
			
			// Get Rel Vel & Dir from (P)layer
			vel = abs(P.vel) // Only player uses negative velocity in logic
			if(P.vel < 0) dir = P.dir
			else dir = P.dir+180 // +180 because when going forward everything else moves in opposite dir
			
			// Loop Dir
			if(dir < 0) dir += 360
			else if(dir >= 360) dir -= 360
			
		} catch(_ex) show_debug_message(_ex)
		
	}
	
}

// Apply Relative Velocity & Direction to (inst)ance from (P)layer
function apply_relVelDir(inst) {
	
	with(inst) {
		
		x += cos2(dir,(vel*relMod)*M.z)
		y += sin2(dir,(vel*relMod)*M.z)
		
	}
	
}

// Apply Relative Velocity & Direction to (inst)ance from (P)layer
function apply_relVelDir2(inst) {
	
	with(inst) {
		
		relx += cos2(dir,(vel*relMod)*M.z)
		rely += sin2(dir,(vel*relMod)*M.z)
		
	}
	
}

function flip(n) {
	return irandom(n)
}

function chance(pct) {
	return (pct >= max(random(100),0.00001))
}

// surfL element is array: [surface,xy,wh] == sArr
function open_surface(inst,xy) {
	
	// Sanity
	if(!list_is(inst.surfL))
		inst.surfL = ds_list_create()
		
	// Init wh
	var w,h
	w = xy[2]-xy[0]
	h = xy[3]-xy[1]
	
	// Make Surface Array (sArr: surface,xy,wh)
	ds_list_add(inst.surfL,[surface_create(max(w,1),max(h,1)),xy,[w,h]])
	var ret = list_pop(inst.surfL)
	
	// Set Target + Return
	surface_set_target(ret[0])
	return ret
	
}

function apply_surface(inst,sArr) {
	
	try {
		
		// Draw Surface to Application Surface
		surface_reset_target()
		draw_set_alpha(1)
		draw_surface(sArr[0],sArr[1][0],sArr[1][1])
		
		// Free and Finish
		surface_free(sArr[0])
		return t
		
	} catch(_ex) {
		
		try {
			
			// Ensure Surface Freed
			surface_free(sArr[0])
			
		} catch(_ex) {}
		
		// Exception Print
		show_debug_message("Unable to apply surface!")
		show_debug_message(_ex)
		return f
		
	}
	
}

function random_sys_body() {
	
	var d = D.sys
	var sz = array_length(d.bodyArr)
	switch(d.bodyArr[flip(sz-1)]) {
		
		case _sysBody.dry		: return d.dry
		case _sysBody.gas1		: return d.gas1
		case _sysBody.gas2		: return d.gas2
		case _sysBody.ice		: return d.ice
		case _sysBody.island	: return d.island
		case _sysBody.lava		: return d.lava
		case _sysBody.moon		: return d.moon
		case _sysBody.ring		: return d.ring
		case _sysBody.smooth	: return d.smooth
		case _sysBody.terran	: return d.terran
		default: return d.terran
		
	}
	
}

function on_screen(inst) {
	
	var xx = camera_get_view_x(view_camera[0])
	var yy = camera_get_view_y(view_camera[0])
	with(inst)
		return (x > xx and x < xx+M.ww and y > yy and y < yy+M.wh)
	
}

function random_rgb_color() {
	return make_color_rgb(random(255),random(255),random(255))
}

function is(inst,object,init) {
	
	try {
		
		if(!is_undefined(inst)) {
			
			if(inst != noone) {
				
				if(inst.object_index == object) {
					
					if((init and inst.init_done) or !init)
						return t
					
				}
				
			}
			
		}
		
	} catch(_ex) {}
		
	return f
	
}


function is_any(val,init) {
	
	try {
		
		if(!is_undefined(inst)) {
			
			if(inst != noone) {
				
				if((init and inst.init_done) or !init)
					return t
				
			}
			
		}
		
	} catch(_ex) {}
		
	return f
	
}
function list_is(l) {
	
	try {
		
		if(!is_undefined(l))
			if(l != noone)
				if(ds_exists(l,ds_type_list))
					return t
		
	} catch(_ex) {}
	
	return f
	
}

function iterate_enum(i,SZ) {
	
	if(i >= SZ-1) return 0	// Loop Enum
	else return i+1			// Return Next
	
}

function inv_ac_arr(carr) {
	
	return [carr[0],carr[4],carr[3],carr[2],carr[1]]
	
}

function surface_destroy_list(surfL) {
	
	if(list_is(surfL)) {
		
		var sz = ds_list_size(surfL)
		for(var i = 0; i < sz; i++)
			try surface_free(surfL[|i])
			catch (_ex) show_debug_message("Couldn't Destroy Surface in List!",string(_ex))
		ds_list_destroy(surfL)
		
	}
	
}

function button_draw(inst,sxy) {
	
	// Surface Adjust?
	if(sxy == noone or !is_array(sxy))
		sxy = [0,0,0,0]
	
	with(inst) {
		
		// BG
		if(active) draw_set_alpha(bgc[0])
		else draw_set_alpha(bgc[0]/2)
		draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
			bgc[1],bgc[2],bgc[3],bgc[4],f)
		
		// Highlight & Action (Adjust for Surface if defined)
		var xy2 = [sxy[0]+xy[0],sxy[1]+xy[1],
			sxy[0]+xy[2],sxy[1]+xy[3]]
		if(mouse_in_gui_rectangle(xy2) and active) {
			
			// Hilight
			if(mbl) draw_set_alpha(fgc[0]*(.1))
			else draw_set_alpha(fgc[0]*(1/3))
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				fgc[4],fgc[3],fgc[2],fgc[1],f)
			
			if(mblr) button_action(id)
			
		}
		
		// FG1
		if(active) draw_set_alpha(fgc[0])
		else draw_set_alpha(fgc[0]/2)
		draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
			fgc[1],fgc[2],fgc[3],fgc[4],t)
		
		// Label
		draw_set_hvalign(strhva)
		var fo = draw_get_font()
		draw_set_font(strf)
		var xx = lerp(xy[0],xy[2],.5)
		var yy = lerp(xy[1],xy[3],.5)
		if(active) draw_text_transformed_color(xx,yy,str,M.fSclx,M.fScly,0,strc[1],strc[2],
			strc[3],strc[4],strc[0])
		else draw_text_transformed_color(xx,yy,str,M.fSclx,M.fScly,0,strc[1],strc[2],
			strc[3],strc[4],strc[0]/2)
		draw_set_font(fo)
		
	}
	
}

// Change quantities based on inventory
// Returns: [new_inv, old_inv, inv_delta]
function qty(val,chng) {
	
	var o = val
	var ret = clamp(val+chng,0,val+abs(chng))
	var d = ret-o
	return [ret,o,d]
	
}

// Change quantities based on inventory (w/ Limits)
// Returns: [new_inv, old_inv, inv_delta]
function qty_lim(val,chng,ll,ul) {
	
	var o = val
	var ret = clamp(val+chng,ll,ul)
	var d = ret-o
	return [ret,o,d]
	
}

function compress_val(val,valmn,valmx,ll,ul) {
	
	var pct = (val-valmn)/(valmx-valmn)
	return ((ul-ll)*pct)+ll
	
}

function list_has_inst(l,inst) {
	
	// Incase mismatch or undefined...
	try {
		
		if(list_is(l)) {
			
			// Init
			var sz = ds_list_size(l)
			
			// Search List for inst...
			for(var i = 0; i < sz; i++) {
				
				// Init
				var e = l[|i]
				
				// Check
				if(e == inst or e.id == inst.id)
					return t // Found
				
			}
			
		}
		
	} catch(_ex) {
		
		// Exception
		show_debug_message("Instance in List Exception!")
		show_debug_message(_ex)
		
	}
	
	// Not Found
	return f
	
}

function list_mv_up_inst(l,inst) {
	
	// Incase mismatch or undefined...
	try {
		
		// Init
		var sz = ds_list_size(l)
		
		// Search List for inst...
		for(var i = 0; i < sz; i++) {
			
			// Init
			var e = l[|i]
			
			// Check
			if(e == inst or e.id == inst.id) {
				
				if(i > 0) {
					
					var eo = l[|i-1]
					l[|i-1] = e
					l[|i] = eo
					return t
					
				}
				
				return f
				
			}
			
		}
		
	} catch(_ex) {
		
		// Exception
		show_debug_message("Move Instance in List Up Exception!")
		show_debug_message(_ex)
		
	}
	
	// Not Found
	return f
	
}

function list_sanity(l) {
	
	if(list_is(l)) {
		
		// Clean Refs...
		for(var i = 0; i < ds_list_size(l); i++)
			if(!is(l[|i],oNPC,f) and !is(l[|i],oPlayer,f)) {
				ds_list_delete(l,i)
				--i
			}
		
		// Empty? Destroy
		if(ds_list_empty(l)){
			
			ds_list_destroy(l)
			l = noone
			
		}
		
		return l
		
	} return noone
	
}

function touching(inst1,inst2) {
	
	try {
		
		// Any Bounds overlapping?
		if((inst1.bbox_right >= inst2.bbox_left and inst1.bbox_left <= inst2.bbox_right)
			and (inst1.bbox_bottom >= inst2.bbox_top and inst1.bbox_top <= inst2.bbox_bottom))
			return t
		
	} catch(_ex) {
		
		show_debug_message("Touch Exception!")
		show_debug_message(_ex)
		
	}
	
	return f
	
}

function touching_body(inst) {
	
	try {
		
		if(is(inst.sys,oLocalSystem,t)) {
			
			var l = inst.sys.bdyL
			for(var i = 0; i < ds_list_size(l); i++)
				if(touching(inst,l[|i])) return i
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Touch Body Exception!")
		show_debug_message(_ex)
		
	}
	
	return noone
	
}

function list_account_inst(l,inst) {
	
	if(!list_is(l)) {
		
		// Start List w/ Inst
		l = ds_list_create()
		ds_list_add(l,inst)
		
	} else if(!list_has_inst(l,inst))
		ds_list_add(l,inst) // Add to list if not had
	
	// Return List
	return l
	
}

function string_cap(str) {
	
	var char = string_upper(string_char_at(str,1))
	return string(char+string_copy(str,2,string_length(str)))
	
}

function string_capAll(str) {
	
	var ret = ""
	var arr = string_split(str," ")
	for(var i = 0; i < array_length(arr); i ++) {
		var e = arr[i]
		if(e == "") continue
		var char = string_upper(string_char_at(e,1))
		if(string_length(e) > 1)
			ret += string(char+string_copy(e,2,string_length(e)))+" "
		else ret += char+" "
	}
	
	return string_trim(ret)
	
}

// Get Last Element in List
function list_pop(l) {
	
	return l[|ds_list_size(l)-1]
	
}

function list_find_sound(l,soundName) {
	
	try {
		
		for(var i = 0; i < ds_list_size(l); ++i)
			if(audio_get_name(l[|i]) == soundName)
				return l[|i]
		
	} catch(_ex) {
		
		show_debug_message("Can't find Sound in List!")
		show_debug_message(_ex)
		
	}
	
	return noone
	
}

function list_sfx_add(soundid,pitch) {
	
	audio_sound_gain(soundid,M.sfxVol,0)
	audio_sound_pitch(soundid,pitch)
	ds_list_add(M.sfxL,soundid)
	
}

function is_active(inst,state) {
	
	try {
		
		if(inst.active) {
			
			if(state) {
				
				if(inst.state == _mode.main) return t
				
			} else return t
			
		}
		
	} catch (_ex) {
		
		show_debug_message("Cant get instance state!")
		show_debug_message(_ex)
		
	}
	
	return f
	
}

function is_active_game(inst,init,state) {
	
	try {
		
		if(M.state == _mode.gameMain) {
			
			if(is_any(inst,init)) {
				
				if(inst.active) {
					
					if(state) {
						
						if(inst.state == _mode.main) return t
						
					} else return t
					
				}
				
			} else return t
			
		}
			
		
	} catch (_ex) {
		
		show_debug_message("Cant get instance game state!")
		show_debug_message(_ex)
		
	}
	
	return f
	
}

function get_relDirs(inst) {
	
	try {
		
		if(is(inst,oLocalSystem,t)) {
			
			// Inst is System?
			dirToCen = point_direction(x,y,inst.cenx,inst.ceny)
			dirFromCen = point_direction(inst.cenx,inst.ceny,x,y)
			return t
			
		} else if(is(inst,oSystemBody,f)) {
			
			// Inst is Body?
			if(id == P) {
				
				// For Player?
				if(inst == P.curr) {
					
					// Current
					dirToCurr = point_direction(x,y,inst.x,inst.y)
					dirFromCurr = point_direction(inst.x,inst.y,x,y)
					
				} else if(inst == P.sele) {
					
					// Selection
					dirToSele = point_direction(x,y,inst.x,inst.y)
					dirFromSele = point_direction(inst.x,inst.y,x,y)
					
				} else if(inst == P.prev) {
					
					// Previous
					dirToPrev = point_direction(x,y,inst.x,inst.y)
					dirFromPrev = point_direction(inst.x,inst.y,x,y)
					
				}
				
			} else {
				
				// For Non-Player?
				dirToBdy = point_direction(x,y,inst.x,inst.y)
				dirFromBdy = point_direction(inst.x,inst.y,x,y)
				
			}
			
			return t
			
		} else {
			
			// Inst is Not Body or System...
			dirToTGT = point_direction(x,y,inst.x,inst.y)
			dirFromTGT = point_direction(inst.x,inst.y,x,y)
			return t
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Unable to update relDirs!")
		show_debug_message(_ex)
		
	}
	
	return f
	
}

function update_relDiros() {
	
	if(id == P) {
		
		// For Player?
		//  System
		dirToCeno = dirToCen
		dirFromCeno = dirFromCen
		
		// Body
		dirToCurro = dirToCurr
		dirFromCurro = dirFromCurr
		dirToSeleo = dirToSele
		dirFromSeleo = dirFromSele
		dirToPrevo = dirToPrev
		dirFromPrevo = dirFromPrev
		
		// Not Body or System
		dirToTGTo = dirToTGT
		dirFromTGTo = dirFromTGT
		return t
		
	} else {
		
		// For Non-Player?
		//  System
		dirToCeno = dirToCen
		dirFromCeno = dirFromCen
		
		// Body
		dirToBdyo = dirToBdy
		dirFromBdyo = dirFromBdy
		
		// Not Body or System
		dirToTGTo = dirToTGT
		dirFromTGTo = dirFromTGT
		return t
		
	}
	
	return f
	
}

function delta(minu,subtra) {
	
	return minu-subtra
	
}

function delta2(minu,subtra) {
	
	return abs(minu-subtra)
	
}

function delta_dir(src,dst) {
	
	return angle_difference(dst,src)
	
}

function rot_dir(src,dst,rot) {
	
	var dlt = delta_dir(src,dst)
	if(abs(dlt) <= rot) return dst
	else if(dlt < 0)
		if(src-rot < 0) return src-rot+360
		else  return src-rot // Negative (Clockwise)
	else if(dlt > 0)
		if(src+rot >= 360) return src+rot-360
		else  return src+rot // Negative (Clockwise)
	
}

function acc_vel(src,dst,acc) {
	
	var dlt = delta(src,dst)
	if(abs(dlt) < acc) return dst
	else if(dlt < 0)
		return src+acc // Gain
	else if(dlt > 0)
		return src-acc // Loss
	
}