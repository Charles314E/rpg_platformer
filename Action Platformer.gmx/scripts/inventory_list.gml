///inventory_list(inventory)
inventory = argument[0];
invList = ds_list_create();
for (yy = 0; yy < ds_grid_height(inventory); yy += 1)
{
    for (xx = 0; xx < ds_grid_width(inventory); xx += 1)
    {
        slot = ds_grid_get(inventory, xx, yy);
        if slot != 0
        {
            ds_list_add(invList, ds_grid_get(inventory, xx, yy));
        }
    }
}
return invList;
