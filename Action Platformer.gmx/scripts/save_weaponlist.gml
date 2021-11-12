///save_weaponlist(weapon_list, filename)
var weapon_list, slot, weaponMap, wpnFile, weaponString, f_path;
weapon_list = argument[0];
weaponMap = ds_map_create();
for (var i = 0; i < ds_list_size(weapon_list); i += 1) {
    slot = ds_list_find_value(weapon_list, i);
    if (is_string(slot)) {
        ds_map_add(weaponMap, string(i), string(slot));
        show_debug_message("[SAV]: " + string(i) + "-" + string(slot));
    }
}
f_path = save_path + argument[1] + ".txt";
file_delete(f_path);
wpnFile = file_text_open_write(f_path);
show_debug_message("[SAV]: " + f_path);
weaponString = ds_map_write(weaponMap);
file_text_write_string(wpnFile, base64_encode(weaponString));
file_text_close(wpnFile);
