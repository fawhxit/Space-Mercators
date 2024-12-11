/// @description Check Parallax1

// Scale Update
instance_scale_update2(id)

// Copy on the Left?
if(BBL >= 0 and !position_meeting(BBL-1,BBY,oParallaxTile2)) {
	
	var e = instance_create_layer(BBL-sprite_width,BBT,layer,oParallaxTile2)
	e.sprite_index = sprite_index
	e.persistent = persistent
	e.image_blend = image_blend
	e.image_alpha = image_alpha
	e.image_xscale = image_xscale
	e.image_yscale = image_yscale
	e.depth = depth
	e.scl = scl
	e.relMod = relMod
	
}

// Copy on the Top?
if(BBT >= 0 and !position_meeting(BBX,BBT-1,oParallaxTile2)) {
	
	var e = instance_create_layer(BBL,BBT-sprite_height,layer,oParallaxTile2)
	e.sprite_index = sprite_index
	e.persistent = persistent
	e.image_blend = image_blend
	e.image_alpha = image_alpha
	e.image_xscale = image_xscale
	e.image_yscale = image_yscale
	e.depth = depth
	e.scl = scl
	e.relMod = relMod
	
}

// Copy on the Right?
if(BBR <= M.ww and !position_meeting(BBR+1,BBY,oParallaxTile2)) {
	
	var e = instance_create_layer(BBR,BBT,layer,oParallaxTile2)
	e.sprite_index = sprite_index
	e.persistent = persistent
	e.image_blend = image_blend
	e.image_alpha = image_alpha
	e.image_xscale = image_xscale
	e.image_yscale = image_yscale
	e.depth = depth
	e.scl = scl
	e.relMod = relMod
	
}

// Copy on the Bottom?
if(BBB <= M.wh and !position_meeting(BBX,BBB+1,oParallaxTile2)) {
	
	var e = instance_create_layer(BBL,BBB,layer,oParallaxTile2)
	e.sprite_index = sprite_index
	e.persistent = persistent
	e.image_blend = image_blend
	e.image_alpha = image_alpha
	e.image_xscale = image_xscale
	e.image_yscale = image_yscale
	e.depth = depth
	e.scl = scl
	e.relMod = relMod
	
}