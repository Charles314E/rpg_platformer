///set_statistics(entity, init?)
var entity, init;
entity = argument[0];
init = argument[1];

with entity
{
    statAttack = statStrength + ceil(statDexterity * 0.1);
    statDefense = statFortitude + ceil(statDexterity * 0.1);
    statKnockback = sqrt(statStrength * 0.1) * (Weight * 0.5);
    statResistance = sqrt(statFortitude * 0.1) * (Weight * 0.5);
    statEndurance = sqrt(statVitality * 0.1) + sqrt(statStrength * 0.1) * 2;
    if instance_exists(obj_WeaponSwitcher) and object_is_ancestor(object_index, obj_Player)
    {
        if is_string(ds_list_find_value(obj_WeaponSwitcher.WeaponsList, obj_WeaponSwitcher.Weapon))
        {
            switch obj_WeaponSwitcher.Weapon
            {
                case 0: statMinAttack = (0.5 * statAttack); 
                        statMaxAttack = (statMinAttack * 1.5) + 1;
                        statMinKnockback = 2 * statKnockback;
                        statMaxKnockback = 2 * (statKnockback + (statKnockback * SwordComboAmount * 0.1)) + 1;
                        break;
                case 1: statMinAttack = (0.5 * statAttack); 
                        statMaxAttack = statMinAttack * 1.6;
                        statMinKnockback = 2 * statKnockback;
                        statMaxKnockback = 2 * statKnockback;
                        break;
                case 2: statMinAttack = floor(1.5 * statAttack); 
                        statMaxAttack = floor(1.5 * statAttack);
                        statMinKnockback = 4 * statKnockback;
                        statMaxKnockback = 4 * statKnockback;
                        break;
                case 4: statMinAttack = 2; 
                        statMaxAttack = 8;
                        statMinKnockback = 1.5;
                        statMaxKnockback = 6;
                        break;
                case 5: statMinAttack = floor(0.2 * statAttack); 
                        statMaxAttack = floor(0.2 * statAttack);
                        statMinKnockback = 2 * statKnockback;
                        statMaxKnockback = 2 * statKnockback;
                        break;
                case 7: statMinAttack = floor(0.8 * statAttack); 
                        statMaxAttack = floor(0.8 * statAttack);
                        statMinKnockback = 3 * statKnockback;
                        statMaxKnockback = 3 * statKnockback;
                        break;
                default:
                        statMinAttack = 0;
                        statMaxAttack = 0;
                        statMinKnockback = 0;
                        statMaxKnockback = 0;
                        break;
            }
            statAttack += obj_WeaponSwitcher.weaponAttack;
        }
        else
        {
            statMinAttack = 0;
            statMaxAttack = 0;
            statMinKnockback = 0;
            statMaxKnockback = 0;
        }
    }
    else
    {
        statMinAttack = 0;
        statMaxAttack = 0;
        statMinKnockback = 0;
        statMaxKnockback = 0;
    }
    statMaxHealth = statVitality + ceil(statMagic * 0.1);
    statMaxMana = floor((statMagic + ceil(statWisdom * 0.1)) * 0.8);
}

if init
{
    with entity
    { 
        statHealth = statMaxHealth;
        statMana = statMaxMana;
        if object_is_ancestor(entity, obj_Player)
        {
            statMaxHealth += Level - 1;
            statHealth = statMaxHealth;
            statStamina = statMaxStamina;
            obj_GUI.BackingHealth = (statHealth / statMaxHealth) * 100;
            obj_GUI.BackingMana = (statMana / statMaxMana) * 100;
            obj_GUI.BackingStamina = (statStamina / statMaxStamina) * 100;
        }
        else if object_is_ancestor(entity, obj_Enemy)
        {
            BackingHealth = (statHealth / statMaxHealth) * 100;
        }
    }
}
