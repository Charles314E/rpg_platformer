///save_inventory(inventory, filename)
var inventory, slot, coord, n, item, inventoryMap, invFile, inventoryString, f_path;
inventory = argument[0];
inventoryMap = ds_map_create();
for (var yy = 0; yy < ds_grid_height(inventory); yy += 1)
{
    for (var xx = 0; xx < ds_grid_width(inventory); xx += 1)
    {
        slot = ds_grid_get(inventory, xx, yy);
        if not slot = 0
        {
            coord = string(xx) + "-" + string(yy);
            n = ds_list_find_value(slot, 0);
            item = ds_list_find_value(slot, 1);
            ds_map_add(inventoryMap, coord, string(n) + "-" + string(item));
            show_debug_message("[SAV]: " + coord + " " + string(n) + "-" + string(item));
        }
    }
}
f_path = save_path + argument[1] + ".txt";
file_delete(f_path);
invFile = file_text_open_write(f_path);
show_debug_message("[SAV]: " + f_path);
inventoryString = ds_map_write(inventoryMap);
file_text_write_string(invFile, base64_encode(inventoryString));
file_text_close(invFile);
