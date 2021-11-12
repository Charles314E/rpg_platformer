///apply_status(effect, sufferer, duration[, damage])
var Effect, Sufferer, Duration, Damage;
Effect = argument[0];
Sufferer = argument[1];
Duration = argument[2];
if argument_count > 3
{
    Damage = argument[3];
}

if ds_list_find_index(obj_GUI.Statuses, string_flupper(Effect)) != -1
{
    var si;
    si = ds_list_find_index(Sufferer.Statuses, Effect);
    if si != -1
    {
        ds_list_replace(Sufferer.Statuses, si + 1, Duration);
        if argument_count > 3
        {
            ds_list_replace(Sufferer.Statuses, si + 3, Damage);
        }
    }
    else
    {
        ds_list_add(Sufferer.Statuses, Effect, Duration, Duration, noone);
        if argument_count > 3
        {
            ds_list_replace(Sufferer.Statuses, ds_list_size(Sufferer.Statuses) - 1, Damage);
        }
    }
    show_debug_message("[DBG]: " + string(id) + "/" + object_get_name(object_index) + "/" + string(event_type));
}
