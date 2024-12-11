// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sys_get_dest(sys,from,adjacent,dev_ndx,star,to) {
	
	#region Get Random Destination in System
		
		// System exists and is init'd?
		if(is(sys,oLocalSystem,t)) {
			
			// Init
			var sz = ds_list_size(sys.bdyL)-1
			var ret = noone
			var done = f
			
			// Init Loop Timeout Iterator
			var toi = 0
			
			// Do Timeout Loop
			while(!done) {
				
				// Timeout
				if(toi > to) break
				
				// Pick
				ret = irandom(sz)
				
				// Iterate Timeout
				toi += 1
				
				#region Conditions
					
					// Init
					var tgt = sys.bdyL[|ret]
					
					// Exclude Adjacents?
					if(!adjacent and (ret == from-1 or ret == from+1))
						continue
						
					// Exclude Stars?
					if(!star and tgt.typ == _sysBody.star)
						continue
					
					// Dev Index Minimum?
					if(dev_ndx != noone) {
						
						if(tgt.dev.ndx < dev_ndx)
							continue
						
					}
					
				#endregion
				
				// Finish Loop
				done = t
				
			}
			
			// Return Result if Success
			if(done) return ret
			
		}
		
		// Return Nothing if Failed
		return noone
		
	#endregion
	
}