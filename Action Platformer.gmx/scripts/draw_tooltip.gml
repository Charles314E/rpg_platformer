///draw_tooltip(mouse_x, mouse_y, alpha)
var sx, sy, a, i, tw, th, str, atk, wep, hp, mp, sp, xp;
sx = argument[0];
sy = argument[1];
a = argument[2];
tw = 0;
hp = string(obj_Player.statHealth) + "/" + string(obj_Player.statMaxHealth) + " Health";
mp = string(obj_Player.statMana) + "/" + string(obj_Player.statMaxMana) + " Mana";
sp = string(obj_Player.statStamina) + "/" + string(obj_Player.statMaxStamina) + " Stamina (";
xp = string(obj_Player.EXP) + "/" + string(obj_Player.ToNextLevel) + " Experience";
switch sign(obj_Player.statEndurance)
{
    case 1:  cEndurance = c_lime; sEndurance = "+"; break;
    case 0:  cEndurance = c_white; sEndurance = ""; break;
    case -1: cEndurance = c_orange; sEndurance = "-"; break;
}
if tooltipName != ""
{
    tw = (string_width(tooltipName) * 0.1625);
    switch tooltipName
    {
        case "Health": tw = (string_width(hp) * 0.1625); tooltipName = hp; break;
        case "Mana": tw = (string_width(mp) * 0.1625); tooltipName = mp; break;
        case "Stamina": tw = (string_width(sp + sEndurance + string(obj_Player.statEndurance) + ")") * 0.1625); tooltipName = sp; break;
        case "Experience": tw = (string_width(xp) * 0.1625); tooltipName = xp; break;
    }
}
th = 16;
for (i = 0; i < ds_list_size(tooltipDescription); i += 1)
{
    str = string_width(ds_list_find_value(tooltipDescription, i));
    th += 16 * ceil((str * 0.1625) / 320);
    if tw < (str * 0.1625)
    {
        tw = min(str * 0.1625, 320);
    }
}
draw_set_alpha(a * 0.64);
draw_rectangle_colour(sx - 2, sy - 2, sx + tw + 2, sy + th + 2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(a);
draw_text_transformed_colour(sx, sy, tooltipName, 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, a);
var cHealth, cStamina, rStamina, gStamina;
rHealth = min(1, (((obj_Player.statMaxHealth - obj_Player.statHealth) * 2) / obj_Player.statMaxHealth)) * 255;
gHealth = min(1, ((obj_Player.statHealth * 2) / obj_Player.statMaxHealth)) * 255;
cHealth = make_colour_rgb(rHealth, gHealth, 0);
rMana = min(1, (((obj_Player.statMaxMana - obj_Player.statMana) * 2) / obj_Player.statMaxMana)) * 255;
gMana = min(1, ((obj_Player.statMana * 2) / obj_Player.statMaxMana)) * 255;
cMana = make_colour_rgb(rMana, gMana, 0);
rStamina = min(1, (((obj_Player.statMaxStamina - obj_Player.statStamina) * 2) / obj_Player.statMaxStamina)) * 255;
gStamina = min(1, ((obj_Player.statStamina * 2) / obj_Player.statMaxStamina)) * 255;
cStamina = make_colour_rgb(rStamina, gStamina, 0);
switch tooltipName
{
    case hp: draw_text_transformed_colour(sx, sy, obj_Player.statHealth, 0.1625, 0.1625, 0, cHealth, cHealth, cHealth, cHealth, 1);
             break;
    case mp: draw_text_transformed_colour(sx, sy, obj_Player.statMana, 0.1625, 0.1625, 0, cMana, cMana, cMana, cMana, 1);
             break;
    case sp: draw_text_transformed_colour(sx, sy, obj_Player.statStamina, 0.1625, 0.1625, 0, cStamina, cStamina, cStamina, cStamina, 1);
             draw_text_transformed_colour(sx + (string_width(tooltipName) * 0.1625), sy, sEndurance + string(obj_Player.statEndurance), 0.1625, 0.1625, 0, cEndurance, cEndurance, cEndurance, cEndurance, 1);
             draw_text_transformed_colour(sx + (string_width(tooltipName + sEndurance + string(obj_Player.statEndurance)) * 0.1625), sy, ")", 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, 1);
             break;
    case xp: break;
}
i = ds_list_find_index(obj_Inventory.dbWeapons, tooltipName);
if i != -1
{
    wep = ds_list_find_index(obj_Inventory.weaponTypes, ds_list_find_value(obj_Inventory.dbWeapons, i + 4));
    draw_sprite(sht_WeaponIcons, wep, sx + tw - 14, sy + 4)
}
for (i = 0; i < ds_list_size(tooltipDescription); i += 1)
{
    if ds_list_find_value(tooltipDescription, i) = "Stats"
    {
        atk = ds_list_find_value(tooltipStats, 0);
        switch sign(atk)
        {
            case 1:  aColour = c_lime;
                     attackString = "+" + string(atk);
                break;
            case 0:  aColour = c_gray;
                     attackString = "+" + string(atk);
                break;
            case -1: aColour = c_orange;
                     attackString = "-" + string(atk);
                break;
        }
        draw_text_transformed_colour(sx, sy + (16 * (i + 1)), attackString, 0.1625, 0.1625, 0, aColour, aColour, aColour, aColour, a);
        draw_text_transformed_colour(sx + (string_width(attackString) * 0.1625), sy + (16 * (i + 1)), " Attack", 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, a);
    }
    else
    {
        draw_text_ext_transformed_colour(sx, sy + (16 * (i + 1)), ds_list_find_value(tooltipDescription, i), 16 / 0.1625, 320 / 0.1625, 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, a);
    }
}
