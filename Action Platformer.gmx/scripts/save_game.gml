///save_game()
save_path = obj_GUI.env_path + "save\";
save_inventory(obj_Inventory.InventoryList, "inv");
save_weaponlist(obj_WeaponSwitcher.WeaponsList, "weapon");
save_statistics("stat");
save_switches("switch");
with obj_GUI
{
    r_current = room_first;
    roomFirst = room;
    savingRoom = true;
}
with obj_Camera
{
    target = obj_Player;
}
