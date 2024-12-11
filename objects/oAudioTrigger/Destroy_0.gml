/// @description Start Audio

if(init_done) {
    
    switch(audioType) {
        
        case _fx.sfx: {
            
            list_sfx_add(audio_play_sound_on(emt,soundid,loops,priority),pitch)
            break
            
        }
        
    }
    
}