///draw_title(title, glyph)
draw_set_font(fnt_TitleFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_ext_transformed_colour(view_wport[view_current] / 2, 32, argument[0], 0, 480, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_set_font(fnt_Designs);
draw_text_ext_transformed_colour(view_wport[view_current] / 2, 32, argument[1], 0, 480, 0.8, 0.8, 0, c_white, c_white, c_white, c_white, 0.25);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
