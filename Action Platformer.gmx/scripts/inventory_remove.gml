///inventory_remove(inventory, item, n)
var inventory, item, n, xx, yy, slot;
inventory = argument[0];
item = argument[1];
n = argument[2];

for (yy = 0; yy < ds_grid_height(inventory); yy += 1)
{
    for (xx = 0; xx < ds_grid_width(inventory); xx += 1)
    {
        //Record the Selected Slot
        var selectedSlot, selectedItemID, selectedItemNumber;
        selectedSlot = ds_grid_get(inventory, xx, yy);
        if not selectedSlot = 0
        {
            selectedItemID = ds_list_find_value(selectedSlot, 0);
            selectedItemNumber = ds_list_find_value(selectedSlot, 1);
            if selectedItemID = item
            {
                if selectedItemNumber = n
                {
                    ds_grid_set(inventory, xx, yy, 0);
                }
                else
                {
                    ds_list_replace(selectedSlot, 1, selectedItemNumber - n);
                    ds_grid_set(inventory, xx, yy, selectedSlot);
                }
                return true;
            }
        }
    }
}
return false;
