///record_gamestate(instance_list)
var instance_list, inst, instance_attr;
instance_list = argument[0];
for (i = 0; i < instance_count; i += 1)
{
    inst = instance_id[i];
    if instance_exists(inst)
    {
        if object_is_ancestor(inst.object_index, par_Entity)
        {
            instance_attr = ds_list_create();
            show_debug_message("[TIME]: " + string(instance_attr) + " was recorded.")
            ds_list_add(instance_attr, inst, inst.x, inst.y, inst.hSpeed, inst.vSpeed, inst.sprite_index, inst.image_index, inst.image_speed);
            ds_list_add(instance_list, instance_attr);
        }
        else if inst.object_index = obj_Camera
        {
            instance_attr = ds_list_create();
            show_debug_message("[TIME]: " + string(instance_attr) + " was recorded.")
            ds_list_add(instance_attr, inst, inst.x, inst.y, inst.hSpeed, inst.vSpeed);
            ds_list_add(instance_list, instance_attr);        
        }
        else
        {
            show_debug_message("[TIME]: none.")
            ds_list_add(instance_list, noone);
        }
    }
}
return instance_list;
