///save_switches(filename)
var switchMap, switchFile, switchString, f_path;
switchMap = ds_map_create();
for (var i = 0; i < ds_list_size(obj_GUI.Switches); i += 1)
{
    ds_map_add(switchMap, string(i), ds_list_find_value(obj_GUI.Switches, i));
}
f_path = save_path + argument[0] + ".txt";
file_delete(f_path);
switchFile = file_text_open_write(f_path);
show_debug_message("[SAV]: " + f_path);
switchString = ds_map_write(switchMap);
file_text_write_string(switchFile, base64_encode(switchString));
file_text_close(switchFile);
