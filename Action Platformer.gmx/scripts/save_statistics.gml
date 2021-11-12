///save_statistics(filename)
var inst, statMap, statFile, statString, f_path;
inst = obj_Player;
statMap = ds_map_create();

ds_map_add(statMap, "str", inst.statStrength);
ds_map_add(statMap, "dex", inst.statDexterity);
ds_map_add(statMap, "vit", inst.statVitality);
ds_map_add(statMap, "for", inst.statFortitude);
ds_map_add(statMap, "wis", inst.statWisdom);
ds_map_add(statMap, "mag", inst.statMagic);
ds_map_add(statMap, "hp", inst.statHealth);
ds_map_add(statMap, "mp", inst.statMana);
ds_map_add(statMap, "stat", inst.StatPoints);
ds_map_add(statMap, "skill", inst.SkillPoints);
ds_map_add(statMap, "lvl", inst.Level);
ds_map_add(statMap, "exp", inst.EXP);
ds_map_add(statMap, "gld", obj_GUI.Gold);
ds_map_add(statMap, "rxy", room_get_name(room) + "-" + string(inst.x) + "-" + string(inst.y));

f_path = save_path + argument[0] + ".txt";
file_delete(f_path);
statFile = file_text_open_write(f_path);
show_debug_message("[SAV]: " + f_path);
statString = ds_map_write(statMap);
file_text_write_string(statFile, base64_encode(statString));
file_text_close(statFile);
file_delete(save_path + "coord.txt");
statFile = file_text_open_write(save_path + "coord.txt");
file_text_write_string(statFile, room_get_name(room) + "-" + string(inst.x) + "-" + string(inst.y));
file_text_close(statFile);
