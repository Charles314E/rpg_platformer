///damage_enemy(damage, source, sufferer, conduit, x2Attack?, projectile?, [element])
Damage = argument[0];
Source = argument[1];
Sufferer = argument[2];
Conduit = argument[3];
x2Attack = argument[4];
Projectile = argument[5];
if argument_count > 6
{
    Element = argument[6];
}
if not Invulnerable
{
    if Damage = noone
    {
        Damage = round(max(1, Source.Damage - (Sufferer.statDefense * 0.75)));
        CritChance = round(random_range(1, 100));
        if CritChance > 90
        {
            Damage = round(max(1, Source.Damage - (Sufferer.statDefense * 0.075)));
            Sufferer.CanCrit = true;
            show_debug_message("[DBG]: Attacked " + enemyName + " (" + string(Sufferer.id) + "). Critical Hit! Dealt " + string(Damage) + " damage. / " + string(CritChance) + "%");
        }
        else
        {
            Sufferer.CanCrit = false;
            show_debug_message("[DBG]: Attacked " + enemyName + " (" + string(Sufferer.id) + "). Dealt " + string(Damage) + " damage. / " + string(CritChance) + "%");
        }
    }
    else
    {
        Damage = round(Damage);
    }

    if x2Attack != noone
    {
        Sufferer.DoubleAttacked = x2Attack;
        Sufferer.x2AttackDamage = Damage;
    }
    if Sufferer.NoGravity and Sufferer.CanFall
    {
        Sufferer.DamageTaken += Damage;
        if Sufferer.DamageTaken >= Sufferer.statMaxHealth * 0.2
        {
            Sufferer.Vulnerable = true;
            Sufferer.DamageTaken = 0;
            Sufferer.NoGravity = false;
            Sufferer.alarm[2] = room_speed * Source.StunDuration;
            Sufferer.alarm[3] = room_speed * 5;
            if not Conduit.Immovable
            {
                var kb = (max(0.5, abs(floor(Source.statKnockback) - floor(Sufferer.statResistance))) * 0.5);
                Conduit.hSpeed = obj_Player.dir * kb;
                Conduit.vSpeed = -1;
            }
        }
        else
        {
            if not Conduit.Immovable
            {
                var kb = (max(0.5, abs(floor(Source.statKnockback) - floor(Sufferer.statResistance))) * 0.2);
                Conduit.hSpeed = obj_Player.dir * kb;
            }
        }
    }
    else
    {
        if not Conduit.Immovable
        {
            var kb = (max(0.5, abs(floor(Source.statKnockback) - floor(Sufferer.statResistance))) * 0.5);
            Conduit.hSpeed = obj_Player.dir * kb;
            if Sufferer.traitLevitating = false
            {
                Conduit.vSpeed = -1;
            }
        }
    }
    Conduit.Invulnerable = true;
    Sufferer.DamageStack += Damage;
    if argument_count > 6
    {
        Sufferer.DamageElement = Element;
    }
    else
    {
        Sufferer.DamageElement = "";
    }
    if Sufferer.DamageStacking = false
    {
        Sufferer.DamageStacking = true;
        Sufferer.alarm[11] = room_speed * 0.1;
    }
    Conduit.alarm[1] = room_speed * Source.StunDuration;
    if Projectile
    {
        with Source
        {
            instance_destroy();
        }
    }    
}
