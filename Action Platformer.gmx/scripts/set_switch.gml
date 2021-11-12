///set_switch(id, val)
with obj_GUI
{
    var s = get_switch(argument[0]);
    ds_list_replace(Switches, argument[0], argument[1]);
    show_debug_message("[DBG]: Set switch " + string(argument[0]) + " from " + string(s) + " to " + string(argument[1]) + ".");
}
