/// @description Set Entrance Vector

// Init
var dir = P.dir+180

// Loop Rotation
if(dir >= 360) dir -= 360
else if(dir < 0) dir += 360

// Init
P.dirTGT = P.dir
P.sysx = cenx+cos2(dir,w*M.z)
P.sysy = ceny+sin2(dir,h*M.z)
P.x = P.sysx
P.y = P.sysy

// Finish
startPos = t