/// @description New Task

if(aiMode != _ai.simple) {
	
	if(aiMode == noone) {
		
		// TODO: Pick Mode
		aiMode = _ai.moveTo
		
	}
	
	switch(aiMode) {
		
		case _ai.moveTo: {
			
			if(xyTGT == noone) {
				
				xyTGT = [0,0]
				var tDir = random(360)
				var tDist = (sys.w*M.z)*random_range(.1,.9)
				xyTGT[0] = sys.cenx+cos2(tDir,tDist)
				xyTGT[1] = sys.ceny+sin2(tDir,tDist)
				
			}
			
			break
			
		}
		
		case _ai.patrolParent: {
			
			if(xyTGT == noone) {
				
				xyTGT = [0,0]
				var tDir = random(360)
				var tDist = (par.patrolDist)*random_range(.1,.9)
				var pdist = point_distance(x,y,par.x,par.y)
				xyTGT[0] = par.x+cos2(tDir,tDist)
				xyTGT[1] = par.y+sin2(tDir,tDist)
				if(relTGT) {
					
					relTGTDir = tDir
					relTGTDist = tDist
					
				} else velTGT = spd*(random(1)+max(.2,pdist/(par.patrolDist)))
				
			}
			
			break
			
		}
		
		case _ai.exitParent: break
		
	}
	
}
