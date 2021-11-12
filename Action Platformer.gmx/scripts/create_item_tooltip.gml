///create_item_tooltip(slot, db, x, y, slot_w, slot_h, border_w, border_h)
var slot, db, xx, yy, sx, sy, bw, bh;
slot = argument[0];
db = argument[1];
xx = argument[2];
yy = argument[3];
sw = argument[4];
sh = argument[5];
bw = argument[6];
bh = argument[7];
if (obj_GUI.cursor_x == min(max(xx + (bw - 1), obj_GUI.cursor_x), xx + sh - bw) and obj_GUI.cursor_y == min(max(yy + (bh - 1), obj_GUI.cursor_y), yy + sh - bh)) {
    slotHover = true;
    tooltipShown = true;
    tooltipName = slot;
    tooltipDescription = ds_list_create();
    tooltipStats = ds_list_create();
    i = ds_list_find_index(db.dbItems, tooltipName);
    if (i != -1) {
        ds_list_add(tooltipDescription, ds_list_find_value(db.dbItems, i + 4));
    }
    else {
        i = ds_list_find_index(db.dbWeapons, tooltipName);
        if (i != -1) {
            ds_list_add(tooltipDescription, "Stats");
            ds_list_add(tooltipDescription, ds_list_find_value(db.dbWeapons, i + 7));
            ds_list_add(tooltipStats, ds_list_find_value(db.dbWeapons, i + 6));
            ds_list_add(tooltipStats, ds_list_find_value(db.dbWeapons, i + 5));
            ds_list_add(tooltipStats, ds_list_find_value(db.dbWeapons, i + 4));
        }
    }
    return true;
}
return false;
