///set_gamestate(instance_list)
var instance_list, inst, instance_attr;
instance_list = argument[0];
for (i = 0; i < ds_list_size(instance_list); i += 1)
{
    instance_attr = ds_list_find_value(instance_list, i);
    if instance_attr != noone
    {
        inst = ds_list_find_value(instance_attr, 0);
        if instance_exists(inst)
        {
            if not is_undefined(inst)
            {
                if object_is_ancestor(inst.object_index, par_Entity)
                {
                    inst.x = ds_list_find_value(instance_attr, 1);
                    inst.y = ds_list_find_value(instance_attr, 2);
                    inst.hSpeed = ds_list_find_value(instance_attr, 3);
                    inst.vSpeed = ds_list_find_value(instance_attr, 4);
                    inst.sprite_index = ds_list_find_value(instance_attr, 5);
                    inst.image_index = ds_list_find_value(instance_attr, 6);
                    inst.image_speed = ds_list_find_value(instance_attr, 7);
                }
                else if inst.object_index = obj_Camera
                {
                    inst.x = ds_list_find_value(instance_attr, 1);
                    inst.y = ds_list_find_value(instance_attr, 2);
                    inst.hSpeed = ds_list_find_value(instance_attr, 3);
                    inst.vSpeed = ds_list_find_value(instance_attr, 4);
                }
            }
        }
    }
}
