///load_statistics(filename)
var inst, statFile, statMap, f_path;
inst = obj_Player;
f_path = load_path + argument[0] + ".txt";
statFile = file_text_open_read(f_path);
statMap = ds_map_create();
ds_map_read(statMap, base64_decode(file_text_read_string(statFile)));
file_text_close(statFile);
var key;
key = ds_map_find_first(statMap);
for (var i = 0; i < ds_map_size(statMap); i += 1) {
    var val = ds_map_find_value(statMap, key);
    switch (key) {
        case "str": inst.statStrength = val; break;
        case "dex": inst.statDexterity = val; break;
        case "vit": inst.statVitality = val; break;
        case "for": inst.statFortitude = val; break;
        case "wis": inst.statWisdom = val; break;
        case "mag": inst.statMagic = val; break;
        case "hp": inst.statHealth = val; break;
        case "mp": inst.statMana = val; break;
        case "stat": inst.StatPoints = val; break;
        case "skill": inst.SkillPoints = val; break;
        case "lvl": inst.Level = val; break;
        case "exp": inst.EXP = val; break;
        case "gld": obj_GUI.Gold = val; break;
        case "rxy": var rxy = string_split(val, "-");
                    obj_GUI.SaveRoom = asset_get_index(ds_list_find_value(rxy, 0));
                    obj_GUI.SaveX = int64(ds_list_find_value(rxy, 1));
                    obj_GUI.SaveY = int64(ds_list_find_value(rxy, 2)); 
                    break;
    }
    show_debug_message("[LDF]: " + string_upper(key) + "-" + string(ds_map_find_value(statMap, key)));
    key = ds_map_find_next(statMap, key);
}
set_statistics(inst, false);
with (obj_GUI) {
    BackingHealth = inst.statHealth / inst.statMaxHealth * 100;
    BackingMana = inst.statMana / inst.statMaxMana * 100;
    BackingStamina = inst.statStamina / inst.statMaxStamina * 100;
}
inst.ToNextLevel = power((inst.Level + 2), 2);
