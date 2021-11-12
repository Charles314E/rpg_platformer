///load_room(room)
r_current = argument[0];
load_path = obj_GUI.env_path + "room\";
if directory_exists(load_path)
{
    if room_exists(r_next)
    {
        if file_exists(load_path + room_get_name(room) + ".txt")
        {
            var roomFile;
            roomFile = file_text_open_read(load_path + room_get_name(room) + ".txt");
            roomMap = ds_map_create();
            ds_map_read(roomMap, base64_decode(file_text_read_string(roomFile)));
            if instance_exists(obj_Chest)
            {
                show_debug_message("[DBG]: There are " + string(instance_number(obj_Chest)) + " chests in the room.")
            }
            for (var i = 0; i < instance_count; i += 1)
            {
                var inst = instance_id[i];
                if not (inst.object_index = obj_Block or inst.object_index = obj_WorldFloor or inst.object_index = obj_SlopeTL or inst.object_index = obj_EnemyFlame or inst.object_index = obj_PillarSink or object_is_ancestor(inst.object_index, par_ToggleBarrier) or object_is_ancestor(inst.object_index, obj_SlopeTL) or object_is_ancestor(inst.object_index, par_HUDObject) or object_is_ancestor(inst.object_index, par_Event) or object_is_ancestor(inst.object_index, par_Entity) or object_is_ancestor(inst.object_index, par_Object) or object_is_ancestor(inst.object_index, obj_EnemyFlame))
                {
                    with inst
                    {
                        var key, coord;
                        key = ds_map_find_first(other.roomMap);
                        if not is_undefined(ds_map_find_value(other.roomMap, string(id)))
                        {
                            for (var ii = 0; ii < ds_map_size(other.roomMap); ii += 1)
                            {
                                if string(id) = key
                                {
                                    coord = string_split(ds_map_find_value(other.roomMap, key), "-");
                                    switch object_index
                                    {
                                        case obj_ActivationOrb:
                                            show_debug_message("[SKP]: Skipped " + object_get_name(object_index) + " " + string(id));
                                        case obj_ToggleBarrierOrb:
                                            show_debug_message("[SKP]: Skipped " + object_get_name(object_index) + " " + string(id));
                                        case obj_ActivateElevatorOrb:
                                            show_debug_message("[SKP]: Skipped " + object_get_name(object_index) + " " + string(id));
                                        case obj_Elevator:
                                            show_debug_message("[SKP]: Skipped " + object_get_name(object_index) + " " + string(id));
                                        case obj_Chest:
                                            Opened = bool(int64(ds_list_find_value(coord, 2)));
                                            Emptied = Opened;
                                            show_debug_message("[DBG]: Opened chest " + string(id)); 
                                            break;
                                        default:
                                            x = int64(ds_list_find_value(coord, 0));
                                            y = int64(ds_list_find_value(coord, 1));
                                            show_debug_message("[DBG]: Created " + object_get_name(object_index) + " " + string(id));
                                            break;
                                    }
                                }
                                key = ds_map_find_next(other.roomMap, key);
                            }
                        }
                    }
                }
            }
            ds_map_destroy(roomMap);
            file_text_close(roomFile);
        }
        show_debug_message("[LDF]: Loaded room " + room_get_name(room) + ".");
        room_goto(r_next);
        return room;
    }
    else
    {
        return -1;
    }
}
else
{
    return -1;
}
