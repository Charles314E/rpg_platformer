///inventory_count(inventory, item)
var inventory, item, count, slot, slotItem, slotCount;
inventory = argument[0];
item = argument[1];
count = 0;
for (yy = 0; yy < obj_Inventory.invH; yy += 1)
{
    for (xx = 0; xx < obj_Inventory.invW; xx += 1)
    {
        slot = ds_grid_get(inventory, xx, yy);
        if slot != 0
        {
            slotItem = ds_list_find_value(slot, 0);
            slotCount = ds_list_find_value(slot, 1);
            if slotItem = item
            {
                count += slotCount;
            }
        }
    }
}
return count
