///is_battle_room()
return (ds_list_find_value(string_split(room_get_name(room), "_"), 0) == "btl");
