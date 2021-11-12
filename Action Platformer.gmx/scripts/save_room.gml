///save_room(room)
load_path = obj_GUI.env_path + "room\";
if not directory_exists(load_path)
{
    directory_create(load_path);
}

if room_exists(r_next)
{
    if room_persistent and room_get_name(room) != "rm_WorldMap"
    {
        show_debug_message("[SAV]: Saving room " + room_get_name(room) + ".");
        instance_activate_all();
        var roomFile, roomMap;
        roomFile = file_text_open_write(load_path + room_get_name(room) + ".txt");
        roomMap = ds_map_create();
        for (var ii = 0; ii < instance_count; ii += 1)
        {
            var inst = instance_id[ii];
            if not (inst.object_index = obj_Block or inst.object_index = obj_SlopeTL or object_is_ancestor(inst.object_index, obj_SlopeTL) or object_is_ancestor(inst.object_index, par_HUDObject) or object_is_ancestor(inst.object_index, par_Event) or object_is_ancestor(inst.object_index, par_Entity))
            {
                if object_is_ancestor(inst.object_index, par_PushableObject)
                {
                    if inst.Pushable
                    {
                        ds_map_add(roomMap, string(inst.id), string(inst.x) + "-" + string(inst.y));
                    }
                }
                else
                {
                    switch inst.object_index
                    {
                        case obj_Chest:     ds_map_add(roomMap, string(inst.id), string(inst.x) + "-" + string(inst.y) + "-" + string(inst.Opened));
                                            show_debug_message("[DBG]: Chest " + string(inst.id) + " (" + string(inst.x) + "-" + string(inst.y) + "-" + string(inst.Opened) + ")");
                                            break;
                        default:            ds_map_add(roomMap, string(inst.id), string(inst.x) + "-" + string(inst.y));
                                            show_debug_message("[DBG]: " + object_get_name(inst) + " " + string(inst.id) + " (" + string(inst.x) + "-" + string(inst.y) + ")");
                                            break;
                    }
                }
            }
        }
        file_text_write_string(roomFile, base64_encode(ds_map_write(roomMap)));
        file_text_close(roomFile);
        show_debug_message("[SAV]: Saved room " + room_get_name(room) + ".");
    }
    room_goto(r_next);
    return room;
}
else
{
    return -1;
}
