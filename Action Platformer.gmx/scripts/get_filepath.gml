///get_filepath(file)
if (instance_exists(obj_GUI)) {
    var path = obj_GUI.env_path + "save\";
}
else {
    var path = environment_get_variable("APPDATA") + "\Action_Platformer\" + string(argument[0]);
    if (room != rm_TitleScreen) {
        with (instance_create(0, 0, obj_GUI)) {
            env_path = other.path;
        }
    }
    path = path + "\save\";
}
show_debug_message("[DBG]: " + path);
return path;
