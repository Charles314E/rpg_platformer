///inventory_add(inventory, item, n)
var inventory, item, n, xx, yy, slot;
inventory = argument[0];
item = argument[1];
n = argument[2];

for (yy = 0; yy < ds_grid_height(inventory); yy += 1)
{
    for (xx = 0; xx < ds_grid_width(inventory); xx += 1)
    {
        slot = ds_grid_get(inventory, xx, yy);
        if not slot = 0
        {
            if ds_list_find_value(slot, 0) = item
            {
                if ds_list_size(slot) = 2
                {
                    ds_list_replace(slot, 1, ds_list_find_value(slot, 1) + n);
                }
                else
                {
                    ds_list_add(slot, n);
                }
                ds_grid_set(inventory, xx, yy, slot);
                create_item_text(obj_Player, item);
                return inventory;
            }
        }
    }
}

for (yy = 0; yy < ds_grid_height(inventory); yy += 1)
{
    for (xx = 0; xx < ds_grid_width(inventory); xx += 1)
    {
        slot = ds_grid_get(inventory, xx, yy);
        if slot = 0
        {
            slot = ds_list_create();
            ds_list_add(slot, item);
            ds_list_add(slot, n);
            ds_grid_set(inventory, xx, yy, slot);
            create_item_text(obj_Player, item);
            return inventory;
        }
    }
}

return inventory;
