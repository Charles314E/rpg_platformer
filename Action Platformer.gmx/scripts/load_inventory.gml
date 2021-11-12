///load_inventory(filename)
var inventory, invFile, inventoryMap, f_path;
f_path = load_path + argument[0] + ".txt";
invFile = file_text_open_read(f_path);
inventoryMap = ds_map_create();
ds_map_read(inventoryMap, base64_decode(file_text_read_string(invFile)));
file_text_close(invFile);
var key, coord, xx, yy, slot, n, item;
key = ds_map_find_first(inventoryMap);
inventory = ds_grid_create(obj_Inventory.invW, obj_Inventory.invH);
for (var i = 0; i < ds_map_size(inventoryMap); i += 1) {
    coord = string_split(key, "-");
    xx = int64(ds_list_find_value(coord, 0));
    yy = int64(ds_list_find_value(coord, 1));
    slot = string_split(ds_map_find_value(inventoryMap, key), "-");
    item = string(ds_list_find_value(slot, 0));
    n = int64(ds_list_find_value(slot, 1));
    slot = ds_list_create();
    ds_list_add(slot, item, n);
    ds_grid_add(inventory, xx, yy, slot);
    show_debug_message("[LDF]: " + key + " " + ds_map_find_value(inventoryMap, key));
    key = ds_map_find_next(inventoryMap, key);
}
return inventory;
