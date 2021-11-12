///load_switches(filename)
var switchFile, switchMap, f_path;
f_path = load_path + argument[0] + ".txt";
switchFile = file_text_open_read(f_path);
switchMap = ds_map_create();
ds_map_read(switchMap, base64_decode(file_text_read_string(switchFile)));
file_text_close(switchFile);
for (var i = 0; i < ds_map_size(switchMap); i += 1) {
    ds_list_replace(obj_GUI.Switches, i, ds_map_find_value(switchMap, string(i)));
}
file_text_close(switchFile);
