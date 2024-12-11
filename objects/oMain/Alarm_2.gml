/// @description Surface Resize
surface_resize(application_surface,ww,wh)
camera_set_view_size(view_camera[0],ww,wh)
camera_set_view_target(view_camera[0],oPlayer)
camera_set_view_border(view_camera[0],ww/2,wh/2)
if(!init_done) init_done = t
if(room_init) room_init2 = t
if(fullscreen_toggled and alarm[4] == -1) alarm[4] = 4