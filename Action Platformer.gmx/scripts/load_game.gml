///load_game(file)
load_path = get_filepath(argument[0]);
if file_exists(load_path + "inv.txt")
{
    obj_Inventory.InventoryList = load_inventory("inv");
}
if file_exists(load_path + "weapon.txt")
{
    obj_WeaponSwitcher.WeaponsList = load_weaponlist("weapon");
}
if file_exists(load_path + "stat.txt")
{
    load_statistics("stat");
}
if file_exists(load_path + "switch.txt")
{
    load_switches("switch");
}
show_debug_message("[LDS]: Loaded player.");
obj_GUI.loadingRoom = true;
