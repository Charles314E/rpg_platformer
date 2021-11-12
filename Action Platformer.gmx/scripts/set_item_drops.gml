///set_item_drops([item, chance, number] 1...n)
ds_list_destroy(lootDrops);
lootDrops = ds_list_create();
for (i = 0; i < argument_count; i += 1)
{
    ds_list_add(lootDrops, argument[i]);
}
