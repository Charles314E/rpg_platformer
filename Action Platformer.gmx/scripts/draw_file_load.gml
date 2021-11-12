///draw_file_load(n, ny, x, y)
i = argument[0];
iy = argument[1];
var xx = argument[2];
var yy = argument[3];
fileColour = c_white;
if (loadedFile == i) {
    fileColour = c_yellow;
}
if (fileSelected == i) {
    create_message_box("", sht_Box, fileNumberWidth, fh, noone, textAlpha, xx - textOffset, yy + (iy * ((fh * 16) + 8)) + textOffset);
    create_message_box("", sht_Box, fw - fileNumberWidth, fh, noone, textAlpha, xx + (fileNumberWidth * 16) - textOffset, yy + (iy * ((fh * 16) + 8)) + textOffset);
    draw_set_font(fnt_MenuFont);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_text_ext_transformed_colour(xx + (fileNumberWidth * 8) - textOffset, yy + (fh * iy * 16) + (8 * (iy + (fh * (2/3)))) + textOffset, i + 1, 32, 480, 0.75, 0.75, 0, c_white, c_white, c_white, c_white, textAlpha);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}
create_message_box("", sht_Box, fileNumberWidth, fh, noone, 1, xx, yy + (iy * ((fh * 16) + 8)));
create_message_box("", sht_Box, fw - fileNumberWidth, fh, noone, 1, xx + (fileNumberWidth * 16), yy + (iy * ((fh * 16) + 8)));
draw_set_font(fnt_MenuFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_ext_transformed_colour(xx + (fileNumberWidth * 8), yy + (fh * iy * 16) + (8 * (iy + (fh * (2/3)))), i + 1, 32, 480, 0.75, 0.75, 0, fileColour, fileColour, fileColour, fileColour, 1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_SystemFont);
var fileAttr = ds_list_find_value(fileList, i * 2);
var fileWeapon = ds_list_find_value(fileList, (i * 2) + 1);
if (ds_list_size(fileAttr) > 0) {
    for (var ii = 0; ii < 2; ii += 1) {
        var tx, ty, currentStat, maxStat;
        tx = (xx + (fw * 16)) - 256 + ((ii mod 2) * 128);
        ty = (yy + 16) + (iy * ((fh * 16) + 8)) + (floor(ii / 2) * 24);
        currentStat = ds_list_find_value(fileAttr, ii);
        maxStat = ds_list_find_value(fileAttr, ii + 10);
        statPercentage = currentStat / maxStat;
        shader_set(shd_GreyedOut);
        draw_sprite_ext(sht_FileStatIcons, ii, tx, ty, 1.5, 1.5, 0, c_white, 1);
        shader_reset();
        draw_sprite_ext(sht_FileStatIcons, ii, tx, ty, 1.5, 1.5, 0, c_white, statPercentage);
        draw_text_transformed_colour(tx + 32, ty, string(currentStat) + " / " + string(maxStat), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, 1);
    }
    for (var ii = 2; ii < 4; ii += 1) {
        var tx, ty;
        tx = (xx + (fw * 16)) - 256 + ((ii mod 2) * 128);
        ty = (yy + 16) + (iy * ((fh * 16) + 8)) + (floor(ii / 2) * 24);
        draw_sprite_ext(sht_FileStatIcons, ii, tx, ty, 1.5, 1.5, 0, c_white, 1);
        draw_text_transformed_colour(tx + 32, ty, ds_list_find_value(fileAttr, ii), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, 1);
    }
    for (var ii = 0; ii < 6; ii += 1) {
        var tx, ty;
        tx = (xx + (fw * 16)) - 384 + ((ii mod 3) * 128);
        ty = (yy + 64) + (iy * ((fh * 16) + 8)) + (floor(ii / 3) * 24);
        draw_sprite_ext(sht_Attributes, ii, tx, ty, 1.5, 1.5, 0, c_white, 1);
        draw_text_transformed_colour(tx + 32, ty, ds_list_find_value(fileAttr, ii + 4), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, 1);
    }
    for (var ii = 0; ii < ds_list_size(weaponTypes); ii += 1) {
        var wx = (xx + ((fileNumberWidth + 1) * 16)) + (ii * 32);
        draw_set_alpha(0.15);
        draw_rectangle_colour(wx + 2, ty + 2, wx + 14, ty + 14, c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1);
    }
    for (var ii = 0; ii < ds_list_size(fileWeapon); ii += 1) {
        var slot = ds_list_find_value(fileWeapon, ii);
        get_item_from_database(dbWeapons, ds_list_find_value(slot, 1));
        show_debug_message("[ITM/CHK]: " + string(ds_list_find_value(slot, 0)) + " " + ds_list_find_value(slot, 1));
        var wx = (xx + ((fileNumberWidth + 1) * 16)) + (ds_list_find_value(slot, 0) * 32);
        draw_sprite(itemSprite, itemSubimage, wx, ty);
    }
}
