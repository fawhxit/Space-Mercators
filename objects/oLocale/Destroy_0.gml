/// @description Destroy Childs

// Destroy Buttons
if(list_is(btnL)) {
    
    var sz = ds_list_size(btnL)
    for(var i = 0; i < sz; i++)
        if(is(btnL[|i],oButton,f))
            instance_destroy(btnL[|i])
    ds_list_destroy(btnL)

}