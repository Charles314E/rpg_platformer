///load_files()
game_path = "";
loadedFile = -1;
if (instance_exists(obj_GUI)) {
    game_path = obj_GUI.env_path;
}
env_path = environment_get_variable("APPDATA") + "\Action_Platformer\";
if (not (game_path = "" or game_path = env_path)) {
    loadedFile = int64(string_copy(game_path, string_length(game_path) - 1, 1)) - 1;
    show_debug_message("[DBG]: File " + string(loadedFile + 1) + " is loaded.");
}
fileList = ds_list_create();
for (var i = 0; i < ds_list_size(fileNumber); i += 1) {
    var key, statFile, fileMap, fileStatList, vit, wis, mag;
    fileStatList = ds_list_create();
    show_debug_message("[LDF]: Loaded file " + string(i + 1) + ".");
    if (file_exists(env_path + string(i + 1) + "\save\stat.txt")) {
        statFile = file_text_open_read(env_path + string(i + 1) + "\save\stat.txt");
        statMap = ds_map_create();
        ds_map_read(statMap, base64_decode(file_text_read_string(statFile)));
        file_text_close(statFile);
        for (var ii = 0; ii < ds_list_size(statList); ii += 1) {
            key = ds_list_find_value(statList, ii);
            switch (key) {
                case "vit": vit = ds_map_find_value(statMap, key);
                case "wis": wis = ds_map_find_value(statMap, key);
                case "mag": mag = ds_map_find_value(statMap, key);
            }
            ds_list_add(fileStatList, ds_map_find_value(statMap, key));
            show_debug_message("[LDF]: " + string_upper(key) + "-" + string(ds_map_find_value(statMap, key)));
        }
        ds_list_add(fileStatList, vit + ceil(mag * 0.1));
        ds_list_add(fileStatList, floor((mag + ceil(wis * 0.1)) * 0.8));
        show_debug_message("[DBG]: " + string(vit) + " + " + string(ceil(mag * 0.1)) + " = " + string(ds_list_find_value(fileStatList, ds_list_size(fileStatList) - 2)));
        show_debug_message("[DBG]: " + string(mag) + " + " + string(ceil(wis * 0.1)) + " = " + string(ds_list_find_value(fileStatList, ds_list_size(fileStatList) - 1)));
    }
    ds_list_add(fileList, fileStatList);
    fileWeaponList = ds_list_create();
    if (file_exists(env_path + string(i + 1) + "\save\weapon.txt")) {
        weaponFile = file_text_open_read(env_path + string(i + 1) + "\save\weapon.txt");
        weaponMap = ds_map_create();
        ds_map_read(weaponMap, base64_decode(file_text_read_string(weaponFile)));
        file_text_close(weaponFile);
        var key, n, weapon, slot;
        key = ds_map_find_first(weaponMap);
        for (var i = 0; i < ds_map_size(weaponMap); i += 1) {
            n = int64(key);
            weapon = string(ds_map_find_value(weaponMap, key));
            slot = ds_list_create();
            ds_list_add(slot, n, weapon);
            ds_list_add(fileWeaponList, slot);
            show_debug_message("[LDF]: " + key + " " + weapon);
            key = ds_map_find_next(weaponMap, key);
        }
    }
    ds_list_add(fileList, fileWeaponList);
}
