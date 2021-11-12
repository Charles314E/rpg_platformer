///draw_menu(options, n, x, y, [exclusions])
var list = argument[0];
var n = argument[1];
var xx = argument[2];
var yy = argument[3];
if (argument_count == 5) {
    exclusions = argument[4];
}
else {
    exclusions = ds_list_create();
}
var greyedOut, oColour;
for (var i = 0; i < ds_list_size(list); i += 1) {
    greyedOut = false;
    oColour = c_white;   
    if (ds_list_find_index(exclusions, i) > -1) {
        greyedOut = true;
        oColour = c_gray;
    }
    if (n == i) {
        if (!greyedOut) {
            draw_set_font(fnt_MenuFont);
            draw_text_ext_transformed_colour((xx + menuOffset) - textOffset, yy + (i * 80) + textOffset, ds_list_find_value(list, i), 0, 480, 0.75, 0.75, 0, oColour, oColour, oColour, oColour, textAlpha);
            draw_set_font(fnt_RuneFont);
            draw_text_ext_transformed_colour((xx + menuOffset) - textOffset, (yy + 66) + (i * 80) + (textOffset * 0.5), ds_list_find_value(list, i), 0, 480, 0.1625, 0.1625, 0, oColour, oColour, oColour, oColour, textAlpha * 0.5);
        }
    }
    draw_set_font(fnt_MenuFont);
    draw_text_ext_transformed_colour(xx + menuOffset, yy + (i * 80), ds_list_find_value(list, i), 0, 480, 0.75, 0.75, 0, oColour, oColour, oColour, oColour, 1);
    draw_set_font(fnt_RuneFont);
    draw_text_ext_transformed_colour(xx + menuOffset, (yy + 66) + (i * 80), ds_list_find_value(list, i), 0, 480, 0.1625, 0.1625, 0, oColour, oColour, oColour, oColour, 0.5);
}
draw_set_font(fnt_SystemFont);
draw_sprite_ext(ani_MenuOptionSelect, cursorSubimage, menuOffset, (yy + 42) + (n * 80), 1, 1, 0, c_white, cursorAlpha);
