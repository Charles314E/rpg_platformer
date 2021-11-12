///initialize_room(map_type, [encounter, field_map/[cutscene, switch])
map_type = argument[0];
intro = 0;
loop = 0;
for (i = 1; i < argument_count; i += 1)
{
    switch i
    {
        case 1: encounter = argument[i]; break;
        case 2:
            switch encounter
            {
                case "Random": field_map = argument[i]; break;
                case "Arena": cutscene = argument[i]; break;
            }
            break;
        case 3:
            if argument[1] = "Arena"
            {
                if get_switch(argument[i])
                {
                    with obj_Enemy
                    {
                        instance_destroy();
                    }
                    with obj_EnemyFlame
                    {
                        instance_destroy();
                    }
                }
            }
            break;
    }
}
if not instance_exists(obj_Controller)
{
    with instance_create(0, 0, obj_Controller)
    {
        MapType = other.map_type;
        if argument_count > 1
        {
            Encounter = other.encounter;
            if argument_count > 2
            {
                switch Encounter
                {
                    case "Random": FieldMap = other.field_map; break;
                    case "Arena": Cutscene = other.cutscene; break;
                }
            }
        }
    }
}
if not instance_exists(obj_GUI)
{
    instance_create(0, 0, obj_GUI);
}
