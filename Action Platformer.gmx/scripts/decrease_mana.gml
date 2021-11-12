///decrease_mana(entity, amount);
entity = argument[0];
cost = argument[1];
with entity
{
    statMana -= other.cost;
    if object_index = pc_Player
    {
        obj_GUI.ManaDraining = true;
        obj_GUI.alarm[1] = room_speed * 0.2;
    }
}
