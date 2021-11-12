///load_inventory(filename)
var weaponList, weaponFile, weaponMap, f_path;
f_path = load_path + argument[0] + ".txt";
weaponFile = file_text_open_read(f_path);
weaponMap = ds_map_create();
ds_map_read(weaponMap, base64_decode(file_text_read_string(weaponFile)));
file_text_close(weaponFile);
weaponList = ds_list_create();
for (i = 0; i < 10; i += 1) {
    ds_list_add(weaponList, 0);
}
var key, n, weapon;
key = ds_map_find_first(weaponMap);
for (var i = 0; i < ds_map_size(weaponMap); i += 1) {
    n = int64(key);
    weapon = string(ds_map_find_value(weaponMap, key));
    ds_list_replace(weaponList, n, weapon);
    show_debug_message("[LDF]: " + key + " " + weapon);
    key = ds_map_find_next(weaponMap, key);
}
return weaponList;
