//calculate_item_drop(drops)
var drops = argument[0];
show_debug_message("# " + object_get_name(object_index) + " # " + string(ds_list_size(drops)) + " #");
/*for (i = 0; i < ds_list_size(drops); i += 1)
{
    show_debug_message(ds_list_find_value(drops, i));
}*/
for (var i = 0; i < ds_list_size(drops); i += 3)
{
    var item, chance, number;
    item = ds_list_find_value(drops, i);
    show_debug_message(object_get_name(item));
    if object_is_ancestor(item, par_Item)
    {
        var dropChance, threshold, maximum, number;
        dropChance = random(1);
        threshold = ds_list_find_value(drops, i + 1);
        maximum = ds_list_find_value(drops, i + 2);
        show_debug_message(string(i) + " : (" + object_get_name(item) + ", " + string(maximum) + ") / " + string(threshold * 100) + "%");
        number = round(random_range(0.5, ds_list_find_value(drops, i + 2) + 0.45));
        if threshold > dropChance
        {
            for (var ii = 0; ii < number; ii += 1)
            {
                instance_create(x, y - 8, item);
            }
            //show_debug_message(string(i) + " : " + string(dropChance * 100) + "% (" + object_get_name(item) + ", " + string(number) + ") / " + string(threshold * 100) + "%");
        }
        else
        {
            //show_debug_message(string(i) + " : " + string(dropChance * 100) + "% / " + string(threshold * 100) + "%");
        }
    }
}
