///collate_damage(id)
textInstance = argument[0];
for (i = 0; i < instance_number(txt_Damage); i += 1)
{
    if not instance_find(txt_Damage, i) = textInstance
    {
        if instance_find(txt_Damage, i).Origin = textInstance.Origin
        {
            if sign(textInstance.Damage) = sign(instance_find(txt_Damage, i).Damage)
            {
                textInstance.Damage += instance_find(txt_Damage, i).Damage;
                with instance_find(txt_Damage, i)
                {
                    instance_destroy();
                }
            }
        }
    }
}
