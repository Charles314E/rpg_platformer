///set_battle_map(tile, level)
var tile, lvl;
tile = argument[0];
lvl = argument[1];
switch lvl
{
    case 0:
        switch tile
        {
            case "ts_WorldForest": 
                        return choose_encounter(btl_Forest_Rime1, 1.0);
                        break;
            default: 
                        return set_battle_map_default(lvl);
                        break;
        }
    case 1:
        switch tile
        {
            case "ts_WorldForest": 
                        return choose_encounter(btl_Forest_Rime2, 0.6,
                                                btl_Forest_Spider1, 0.3,
                                                btl_Forest_Rime2_Slime2, 0.1);
                        break;
            case "ts_WorldMountains": 
                        return choose_encounter(btl_Mountains_ManaGolem1, 0.6,
                                                btl_Mountains_ManaGolem1_Rime1, 0.4);
                        break;
            default: 
                        return set_battle_map_default(lvl);
                        break;
        }
    case 2:
        switch tile
        {
            case "ts_WorldForest": 
                        return choose_encounter(btl_Forest_Rime4, 0.7,
                                                btl_Forest_Spider3, 0.3);
                        break;
            case "ts_WorldMountains": 
                        return choose_encounter(btl_Mountains_ManaGolem1_Rime2, 0.6,
                                                btl_Mountains_ManaGolem2_Rime1, 0.4);
                        break;
            default: 
                        return set_battle_map_default(lvl);
                        break;
        }
    default:
        return set_battle_map_default(0);
        break;
}
