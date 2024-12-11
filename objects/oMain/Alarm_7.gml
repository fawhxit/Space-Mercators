/// @description Toggle Pause

if(state == _mode.gameMain) {
	
	M.state = _mode.pause
	room_goto(rMenu)
	
} else if(state == _mode.pause) {
	
	M.state = _mode.gameMain
	room_goto(room_prev)
	
}