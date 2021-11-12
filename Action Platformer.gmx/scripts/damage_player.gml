///damage_player(damage, source, projectile?, [element])
Damage = argument[0];
Source = argument[1];
Projectile = argument[2];
if argument_count > 3
{
    Element = argument[3];
}
obj_GUI.PlayerDamageCounter += 1;
DamageSource = argument[1];
if Damage = noone and Source != noone
{
    if Projectile
    {
        Source = Source.Origin;
    }
    Damage = round(max(1, Source.statAttack - (obj_Player.statDefense * 0.75)));
}

if not obj_Player.Dashing
{
    if not obj_Player.Invulnerable
    {
        if obj_Player.NoGravity
        {
            obj_Player.DamageTaken += Damage;
            if obj_Player.DamageTaken >= obj_Player.statMaxHealth * 0.2
            {
                obj_Player.Vulnerable = true;
                obj_Player.DamageTaken = 0;
                obj_Player.NoGravity = false;
                obj_Player.alarm[2] = room_speed * DamageSource.StunDuration;
                obj_Player.alarm[3] = room_speed * 5;
                if not obj_Player.Immovable and Source != noone
                {
                    obj_Player.iSpeed = sign(DamageSource.hSpeed) * (max(1, abs(floor(Source.statKnockback) - floor(obj_Player.statResistance))));
                    obj_Player.vSpeed = -2;
                }
            }
            else
            {
                if not obj_Player.Immovable and Source != noone
                {
                    obj_Player.iSpeed = sign(DamageSource.hSpeed) * (max(1, abs(floor(Source.statKnockback) - floor(obj_Player.statResistance))));
                }
            }
        }
        else
        {
            if not obj_Player.Immovable and Source != noone
            {
                obj_Player.iSpeed = sign(DamageSource.hSpeed) * (max(1, abs(floor(Source.statKnockback) - floor(obj_Player.statResistance))));
                obj_Player.vSpeed = -2;
            }
        }
        obj_Player.Invulnerable = true;
        obj_Player.DamageStack += Damage;
        if argument_count <= 3
        {
            Element = "";
        }
        if Element != obj_Player.DamageElement
        {
            obj_Player.DamageElement = Element;
            with instance_create(x, y, txt_Damage)
            {
                Damage = obj_Player.DamageStack;
                Origin = obj_Player;
                Critical = obj_Player.CanCrit;
                Element = other.Element;
                if Element != ""
                {
                    IconSprite = sht_Elements;
                    IconSubimage = ds_list_find_index(obj_GUI.Elements, string_flupper(Element));
                }
            }
            obj_Player.DamageStack = 0;
        }
        else
        {
            if obj_Player.DamageStacking = false
            {
                obj_Player.DamageStacking = true;
                obj_Player.alarm[11] = room_speed * 0.2;
            }
        }
        obj_Player.alarm[1] = room_speed * 1;
        if Source != noone
        {
            if Source.hitSound != noone
            {
                audio_play_sound(Source.hitSound, 1, false);
            }
        }
    }
}
