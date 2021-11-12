///set_battle_map_default(level)
var lvl;
lvl = argument[0];
switch lvl
{
    case 0:
        return choose_encounter(btl_Plains_Slime1, 0.75, 
                                btl_Plains_Slime2, 0.25);
        break;
    case 1:
        return choose_encounter(btl_Plains_Slime2, 0.6, 
                                btl_Plains_Rime1, 0.4);
        break;
    case 2:
        return choose_encounter(btl_Plains_Rime1, 0.6, 
                                btl_Plains_Rime1_Slime2, 0.4);
        break;
    default:
        return noone;
}
