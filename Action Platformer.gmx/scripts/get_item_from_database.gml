///get_item_from_database(db, item)
var db = argument[0];
var item = argument[1];
wi = ds_list_find_index(db, item);
if (wi != -1) {
    itemSprite = ds_list_find_value(db, wi + 1);
    itemSubimage = ds_list_find_value(db, wi + 2);
    itemDescription = ds_list_find_value(db, wi + 4);
    return true;
}
return false;
