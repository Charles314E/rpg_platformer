///erase_game(file)
var erase_path = get_filepath(argument[0]);
if directory_exists(erase_path) {
    directory_destroy(erase_path);
}
