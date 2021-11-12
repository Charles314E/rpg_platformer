///equip_weapon(weapon_list, weapon, w_type)
var weapon, i, wi, weaponSlot;
weapon_list = argument[0];
weapon = argument[1];
i = argument[2];

checkedSlot = ds_list_find_value(weapon_list, i);
ds_list_replace(weapon_list, i, weapon);
if is_string(checkedSlot)
{
    obj_Inventory.InventoryList = inventory_add(obj_Inventory.InventoryList, checkedSlot, 1);
}
if obj_WeaponSwitcher.Weapon = i
{
    weaponSlot = ds_list_find_value(weapon_list, i);
    if is_string(weaponSlot)
    {
        wi = ds_list_find_index(obj_Inventory.dbItems, weaponSlot);
        obj_WeaponSwitcher.weaponSprite = ds_list_find_value(obj_Inventory.dbItems, wi + 1);
        obj_WeaponSwitcher.weaponSubimage = ds_list_find_value(obj_Inventory.dbItems, wi + 2);
    }
}

return weapon_list;
