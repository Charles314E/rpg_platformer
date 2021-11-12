///decrease_health(entity, amount);
entity = argument[0];
damage = argument[1];
with entity
{
    statHealth -= other.damage;
    if object_index = pc_Player
    {
        obj_GUI.HealthDraining = true;
        obj_GUI.alarm[0] = room_speed * 0.2;
    }
    else
    {
        alarm[10] = room_speed * 0.2;
    }
}
