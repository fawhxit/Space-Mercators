/// @description Init Alarm

// Sprite
sprite_index = spr
x = sprx
y = spry
xypct = [sprx/WW,spry/WH]
image_blend = sprBlend
image_xscale = sprSclW
image_yscale = sprSclH
image_speed = 0
image_index = 0
image_alpha = fgc[0]

switch(locale) {
    
    case _locale.tradeHub: {
        
        #region Buttons
            
            btnL = ds_list_create()
            
            #region Exit Button
                
                var e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "X"
                e.xypct = [.93,.02,.98,.07]
                e.fgc = [1,cNeonRed,cNeonRed,cRed,cRed]
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.close
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
            #region Minimize Button
                
                e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "_"
                e.xypct = [.87,.02,.92,.07]
                e.fgc = [1,cNeonYellow,cNeonYellow,cYellow,cYellow]
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.minimize
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
            #region Account Button
                
                var e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "Account"
                e.xypct = [.02,1/11,.15,2/11]
                e.fgc = fgc
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.account
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
            #region Postings Button
                
                e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "Postings"
                e.xypct = [.02,3/11,.15,4/11]
                e.fgc = fgc
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.postings
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
            #region Streams Button
                
                var e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "Streams"
                e.xypct = [.02,5/11,.15,6/11]
                e.fgc = fgc
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.streams
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
            #region Metrics Button
                
                e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "Metrics"
                e.xypct = [.02,7/11,.15,8/11]
                e.fgc = fgc
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.metrics
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
            #region Exchange Button
                
                e = instance_create_layer(0,0,layer,oButton)
                e.par = id
                e.gui = t
                e.str = "Exchange"
                e.xypct = [.02,9/11,.15,10/11]
                e.fgc = fgc
                e.strc = inv_ac_arr(fgc)
                e.bgc = bgc
                e.active = t
                e.inRoom = room
                e.action = _act.exchange
                e.depth = depth-1
                ds_list_add(btnL,e)
                
            #endregion
            
        #endregion
        
        #region Convert Locale to Struct
            
            locale = {
                
                typ: _locale.tradeHub,
                account: f,
                postings: f,
                streams: f,
                metrics: f,
                exchange: f,
                exScrly : 0,
                xypct: [.17,.09,.98,10/11],
                exBtn0 : instance_create_layer(0,0,other.layer,oButton),
                exBtn1 : instance_create_layer(0,0,other.layer,oButton),
                exBtn2 : instance_create_layer(0,0,other.layer,oButton),
                exBtn3 : instance_create_layer(0,0,other.layer,oButton)
                
                
            }
            // Exchange Sell Buttons Init
            // x1
            locale.exBtn0.par = id
            locale.exBtn0.str = "Buy"
            locale.exBtn0.fgc = [1,cNeonGreen,cNeonGreen,cGreen,cGreen]
            locale.exBtn0.strc = inv_ac_arr(locale.exBtn0.fgc)
            locale.exBtn0.action = _act.exbtn0
            locale.exBtn0.state = _state.buy
            locale.exBtn0.gui = t
            locale.exBtn0.hide = t
            locale.exBtn0.depth -= 2
            locale.exBtn0.dOverride = t
            // x1
            locale.exBtn1.par = id
            locale.exBtn1.str = "x1 mt"
            locale.exBtn1.action = _act.exbtn1
            locale.exBtn1.gui = t
            locale.exBtn1.hide = t
            locale.exBtn1.depth -= 2
            locale.exBtn1.dOverride = t
            // x10
            locale.exBtn2.par = id
            locale.exBtn2.str = "x10 mt"
            locale.exBtn2.action = _act.exbtn2
            locale.exBtn2.gui = t
            locale.exBtn2.hide = t
            locale.exBtn2.depth -= 2
            locale.exBtn2.dOverride = t
            // x100
            locale.exBtn3.par = id
            locale.exBtn3.str = "x100 mt"
            locale.exBtn3.action = _act.exbtn3
            locale.exBtn3.gui = t
            locale.exBtn3.hide = t
            locale.exBtn3.depth -= 2
            locale.exBtn3.dOverride = t
            
        #endregion
        
        break
        
    }
    
}

init_done = t