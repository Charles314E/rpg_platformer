///check_room_name(previous_room, next_room, compare?)
var pr, pn, mr, nn, compare;
pr = argument[0];
pn = ds_map_find_value(obj_GUI.roomNames, room_get_name(pr));
nr = argument[1];
nn = ds_map_find_value(obj_GUI.roomNames, room_get_name(nr));
compare = argument[2];
show_debug_message("[DBG]: " + object_get_name(object_index) + "/" + string(id));
show_debug_message("[DBG]: check_room_name(" + room_get_name(pr) + ", " + room_get_name(nr) + ")");
show_debug_message("[DBG]: check_room_name(" + string(pn) + ", " + string(nn) + ")");
if not is_undefined(nn)
{
    if not (pn = nn and compare)
    {
        show_debug_message("[DBG]: Name found.");
        return nn;
    }
    else
    {
        show_debug_message("[DBG]: Invalid comparison.");
        return "";
    }
}
else
{
    var nns, pns, n_title, p_title;
    nns = string_split(room_get_name(nr), "_");
    pns = string_split(room_get_name(pr), "_");
    n_title = ds_list_find_value(nns, 1);
    p_title = ds_list_find_value(pns, 1);
    nn = ds_map_find_value(obj_GUI.roomNames, n_title);
    pn = ds_map_find_value(obj_GUI.roomNames, p_title);
    show_debug_message("[DBG]: check_room_name(" + string(p_title) + ", " + string(n_title) + ")");
    if not is_undefined(nn)
    {
        if not (pn = nn and compare)
        {
            show_debug_message("[DBG]: Name found.");
            return nn;
        }
        else
        {
            show_debug_message("[DBG]: Invalid comparison.");
            return "";
        }
    }
    else
    {
        show_debug_message("[DBG]: Cannot find name.");
        return "";
    }
}
