///get_item(item)
if (not get_item_from_database(obj_Inventory.dbItems, item)) {
    get_item_from_database(obj_Inventory.dbWeapons, item);
}
