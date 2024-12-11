/// @description Init

active = f
state = _mode.init
xx = 0
yy = 0

w = 100
h = 100

radMn = w*(1/8)
radMx = (w/2)*(.8)

var startSys = D.sys.L[|0]
startSys.gx = (M.ww/2)
startSys.gy = (M.wh/2)
P.gx = 0
P.gy = 0

xy = [(M.ww/2)-(w/2),(M.wh/2)-(h/2),(M.ww/2)+(w/2),(M.wh/2)+(h/2)]
hum = [irandom_range(xy[0],xy[2]),irandom_range(xy[1],xy[3]),50,c_aqua]
sau = [irandom_range(xy[0],xy[2]),irandom_range(xy[1],xy[3]),30,c_lime]
nov = [irandom_range(xy[0],xy[2]),irandom_range(xy[1],xy[3]),30,c_red]
xen = [irandom_range(xy[0],xy[2]),irandom_range(xy[1],xy[3]),20,c_fuchsia]

for(var iy = xy[1]; iy < xy[3]; iy++) {
	
	for(var ix = xy[0]; ix < xy[2]; ix++) {
		
		var cenDist = point_distance(ix,iy,M.ww/2,M.wh/2)
		var cenDir = point_direction(ix,iy,M.ww/2,M.wh/2)
		
		if(cenDist > radMn and cenDist < radMx and chance(5)) {
			
			// Create Sys
			var s = instance_create_layer(ix,iy,"Logic",oLocalSystem)
			s.persistent = t
			s.gx = cos2(cenDir,cenDist*15)+M.ww/2
			s.gy = sin2(cenDir,cenDist*15)+M.wh/2
			s.ndx = ds_list_size(D.sys.L)
			ds_list_add(D.sys.L,s)
			var humRng = (point_distance(hum[0],hum[1],ix,iy) <= hum[2])
			var sauRng = (point_distance(sau[0],sau[1],ix,iy) <= sau[2])
			var novRng = (point_distance(nov[0],nov[1],ix,iy) <= nov[2])
			var xenRng = (point_distance(xen[0],xen[1],ix,iy) <= xen[2])
			if(humRng and chance(67)) {
				s.faction = _faction.humans
				s.image_blend = hum[3]
			} else if(sauRng and chance(50)) {
				s.faction = _faction.saurians
				s.image_blend = sau[3]
			} else if(novRng and chance(50)) {
				s.faction = _faction.novans
				s.image_blend = nov[3]
			} else if(xenRng and chance(33)) {
				s.faction = _faction.xenos
				s.image_blend = xen[3]
			} else x.image_blend = cWhite
			s.alarm[2] = 4
			
		}
		
	}
	
}
