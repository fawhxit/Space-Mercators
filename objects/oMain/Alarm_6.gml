/// @description Init Main Objs
// Fade Objs
mainFade = instance_create_layer(0,0,"FadeAll",oRectangle)
mainFade.persistent = t

// Stars Obj
mainStars = instance_create_layer(0,0,"Parallax3",oStarField)
mainStars.persistent = t

/* DISABLED DISABLED DISABLED DEBUG DEBUG DEBUG TOOLS TOOLS TOOLS

// Debug Parallax1 Tile 2
dbgTile = instance_create_layer(0,0,"Parallax3",oParallaxTile3)
dbgTile.sprite_index = sprTile3
dbgTile.persistent = t
dbgTile.image_blend = c_yellow
dbgTile.image_alpha = 1/4
dbgTile.relMod = 1/3

// Debug Parallax1 Tile 2
dbgTile1 = instance_create_layer(0,0,"Parallax2",oParallaxTile2)
dbgTile1.sprite_index = sprTile2
dbgTile1.persistent = t
dbgTile1.image_blend = c_red
dbgTile1.image_alpha = 1/3
dbgTile1.relMod = 2/3

// Debug Parallax1 Tile 2
dbgTile2 = instance_create_layer(0,0,"Parallax1",oParallaxTile)
dbgTile2.sprite_index = sprTile1
dbgTile2.persistent = t
dbgTile2.image_blend = c_aqua
dbgTile2.image_alpha = 1/2
dbgTile2.relMod = 1

// Debug Galaxy 2
dbgGal2 = instance_create_layer(ww*.75,wh*.25,"ParallaxBG",oStaticAnim)
dbgGal2.sprite_index = sprGalaxy2
dbgGal2.persistent = t
dbgGal2.image_blend = c_orange
dbgGal2.image_xscale = 20
dbgGal2.image_yscale = 20
dbgGal2.image_alpha = 1/3
dbgGal2.relMod = .1

// Debug Star
dbgStar = instance_create_layer(-ww/2,-wh/2,"FG1",oStaticAnim)
dbgStar.sprite_index = sprStar
dbgStar.persistent = t
dbgStar.image_blend = c_red
dbgStar.image_xscale = 10
dbgStar.image_yscale = 10

// Debug Hole
dbgHole = instance_create_layer(ww*.75,wh*.75,"FG1",oStaticAnim)
dbgHole.sprite_index = sprBlackHole
dbgHole.persistent = t
dbgHole.image_blend = c_aqua
dbgHole.image_xscale = 2
dbgHole.image_yscale = 2
*/

// Debug Galaxy 1
/*
dbgGal1 = instance_create_layer(ww*.25,wh*.75,"FG1",oStaticAnim)
dbgGal1.sprite_index = sprGalaxy1
dbgGal1.persistent = t
dbgGal1.image_blend = c_lime
dbgGal1.image_xscale = 1.5
dbgGal1.image_yscale = 1.5
*/

// Debug Asteroid
/*
dbgAst = instance_create_layer(ww*.25,wh*.25,"FG1",oStaticAnim)
dbgAst.sprite_index = sprAsteroid1
dbgAst.persistent = t
dbgAst.image_blend = c_white
dbgAst.image_xscale = 2
dbgAst.image_yscale = 2
dbgAst.rotVel = -1
*/