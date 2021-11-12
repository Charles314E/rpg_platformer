///create_choice_box(choices, back, w, g, a, [x, y, align])
var ChoiceList, Background, Width, Grid, Alpha, Height;
ChoiceList = argument[0];
Background = argument[1];
Width = argument[2];
Height = floor(ds_list_size(ChoiceList) / 2) + 1;
Grid = argument[3];
Alpha = argument[4];
alignment = "<";
if argument_count > 5
{
    switch argument[5]
    {
        case "x": mx = (view_wport / 2) - ((Width / 2) * 16); break;
        default: mx = argument[5]; break;
    }
    switch argument[6]
    {
        case "y": my = (view_hport - 16) - (ds_list_size(ChoiceList) * 16); break;
        default: my = argument[6]; break;
    }
    create_message_box("", Background, Width, Height, Grid, Alpha, mx, my);
    if argument_count > 7
    {
        alignment = argument[7];
    }
}
else
{
    mx = (view_wport / 2) - ((Width / 2) * 16);
    my = (view_hport - 16) - (ds_list_size(ChoiceList) * 16);
    create_message_box("", Background, Width, Height, Grid, Alpha, mx, my);
}
draw_set_font(fnt_SystemFont);
for (var i = 0; i < floor(ds_list_size(ChoiceList) / 2); i += 1)
{
    switch alignment
    {
        case "<":
            if choiceOption = i
            {
                draw_sprite(ani_ChoiceArrow, round(Subimage), 10 + mx, my + (i * 16) + 16);
                if Subimage >= 0 and Subimage < (sprite_get_number(ani_ChoiceArrowGemGleam) * (ImageSpeed / 0.5))
                {
                    draw_sprite(ani_ChoiceArrowGemGleam, round((Subimage * 0.5) / ImageSpeed), 13 + mx + GemOffset, my + (i * 16) + 16);
                }
                draw_text_transformed_colour(36 + mx - choiceBackOffset, my + (i * 16) + 4 + choiceBackOffset, ds_list_find_value(ChoiceList, i * 2), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, Alpha * choiceBackAlpha);
            }
            draw_text_transformed_colour(36 + mx, my + (i * 16) + 4, ds_list_find_value(ChoiceList, i * 2), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, Alpha);
            break;
        case "^":
            draw_set_halign(fa_center);
            if choiceOption = i
            {
                draw_sprite(ani_ChoiceArrow, round(Subimage), -26 + mx + ((Width * 16) / 2) - (string_width(ds_list_find_value(ChoiceList, i * 2)) * 0.1625 / 2), my + (i * 16) + 16);
                if Subimage >= 0 and Subimage < (sprite_get_number(ani_ChoiceArrowGemGleam) * (ImageSpeed / 0.5))
                {
                    draw_sprite(ani_ChoiceArrowGemGleam, round((Subimage * 0.5) / ImageSpeed), -23 + mx + ((Width * 16) / 2) - (string_width(ds_list_find_value(ChoiceList, i * 2)) * 0.1625 / 2) + GemOffset, my + (i * 16) + 16);
                }
                draw_text_transformed_colour(mx + ((Width * 16) / 2) - choiceBackOffset, my + (i * 16) + 4 + choiceBackOffset, ds_list_find_value(ChoiceList, i * 2), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, Alpha * choiceBackAlpha);
            }
            draw_text_transformed_colour(mx + ((Width * 16) / 2), my + (i * 16) + 4, ds_list_find_value(ChoiceList, i * 2), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, Alpha);
            break;
        case ">":
            draw_set_halign(fa_right); 
            if choiceOption = i
            {
                draw_sprite(ani_ChoiceArrow, round(Subimage), 10 + mx + (Width * 16) - (string_width(ds_list_find_value(ChoiceList, i * 2)) * 0.1625) - 48, my + (i * 16) + 16);
                if Subimage >= 0 and Subimage < (sprite_get_number(ani_ChoiceArrowGemGleam) * (ImageSpeed / 0.5))
                {
                    draw_sprite(ani_ChoiceArrowGemGleam, round((Subimage * 0.5) / ImageSpeed), 13 + mx + (Width * 16) - (string_width(ds_list_find_value(ChoiceList, i * 2)) * 0.1625) - 48 + GemOffset, my + (i * 16) + 16);
                }
                draw_text_transformed_colour(mx + (Width * 16) - choiceBackOffset - 8, my + (i * 16) + 4 + choiceBackOffset, ds_list_find_value(ChoiceList, i * 2), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, Alpha * choiceBackAlpha);
            }
            draw_text_transformed_colour(mx + (Width * 16) - 8, my + (i * 16) + 4, ds_list_find_value(ChoiceList, i * 2), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, Alpha);
            break;
    }
    draw_set_halign(fa_left);
}
draw_set_font(fnt_SystemFont);
