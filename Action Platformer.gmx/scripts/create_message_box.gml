///create_message_box(msg, back, w, h, g, a, [x, y])
MessageString = argument[0];
Background = argument[1];
Width = argument[2];
Height = argument[3];
Grid = argument[4];
Alpha = argument[5];
if argument_count > 6
{
    mx = argument[6];
    my = argument[7];
    yo = my;
    ls = mx;
    rs = mx + (Width * 16);
}
else
{
    yo = view_hport[view_current] - ((Height + 2) * 16);
    hw = view_wport[view_current];
    wb = ((Width - 1) / 2) * 16;
    ls = (hw / 2) - (wb + 16);
    rs = (hw / 2) + (wb + 16);
}
draw_set_alpha(Alpha);

Line = 1;
CharX = 0;
MessageListSize = 0;
if Width > 1 and Height > 1
{
    //Top-Left Corner
    draw_sprite(Background, 0, ls, yo);
    //Top-Right Corner
    draw_sprite(Background, 4, rs - 16, yo);
    //Bottom-Left Corner
    draw_sprite(Background, 5, ls, yo + (Height * 16) - 16);
    //Bottom-Right Corner
    draw_sprite(Background, 9, rs - 16, yo + (Height * 16) - 16);
    
    if Height > 2
    {
        //Vertical Sides
        for (yy = yo + 16; yy < yo + (Height * 16) - 16; yy += 16)
        {
            //Vertical Sides
            draw_sprite(Background, 13, ls, yy);
            draw_sprite(Background, 10, rs - 16, yy);
            for (xx = ls + 16; xx <= rs - 32; xx += 16)
            {
                if yy = yo + 16
                {
                    //Horizontal Sides
                    draw_sprite(Background, 1, xx, yo);
                    draw_sprite(Background, 6, xx, yo + (Height * 16) - 16);
                }
                //Fill
                draw_sprite(Background, 16, xx, yy);
            }
        }
    }
    else
    {
        for (xx = ls + 16; xx <= rs - 32; xx += 16)
        {
            //Horizontal Sides
            if argument_count > 6
            {
                draw_sprite(Background, 1, xx, my);
                draw_sprite(Background, 6, xx, my + ((Height - 1) * 16));
            }
            else
            {
                draw_sprite(Background, 1, xx, yo);
                draw_sprite(Background, 6, xx, hw);
            }
        }
    }
}
else
{
    if Width = 1 and Height = 1
    {
        draw_sprite(Background, 23, ls, yo);
    }
    else if Height = 1
    {
        draw_sprite(Background, 20, ls, yo);
        for (xx = ls + 16; xx <= rs - 32; xx += 16)
        {
            draw_sprite(Background, 21, xx, yo);
        }
        draw_sprite(Background, 22, xx, yo);
    }
    else if Width = 1
    {
        draw_sprite(Background, 17, ls, yo);
        for (yy = yo + 16; yy < yo + (Height * 16) - 16; yy += 16)
        {
            draw_sprite(Background, 18, ls, yy);
        }
        draw_sprite(Background, 19, ls, yy);
    }
}

for (c = 0; c < string_length(MessageString); c += 1)
{
    CurrentCharacter = string_char_at(MessageString, c + 1);
    MessageList[c] = ds_list_create();
    ds_list_add(MessageList[c], CurrentCharacter);
    if CurrentCharacter = "#"                       { CurrentCharacter = 0.1 }
    else if CurrentCharacter = " "                  { CurrentCharacter = 0 }
    else if CurrentCharacter = "a"                  { CurrentCharacter = 1 }
    else if CurrentCharacter = "b"                  { CurrentCharacter = 2 }
    else if CurrentCharacter = "c"                  { CurrentCharacter = 3 }
    else if CurrentCharacter = "d"                  { CurrentCharacter = 4 }
    else if CurrentCharacter = "e"                  { CurrentCharacter = 5 }
    else if CurrentCharacter = "f"                  { CurrentCharacter = 6 }
    else if CurrentCharacter = "g"                  { CurrentCharacter = 7 }
    else if CurrentCharacter = "h"                  { CurrentCharacter = 8 }
    else if CurrentCharacter = "i"                  { CurrentCharacter = 9 }
    else if CurrentCharacter = "j"                  { CurrentCharacter = 10 }
    else if CurrentCharacter = "k"                  { CurrentCharacter = 11 }
    else if CurrentCharacter = "l"                  { CurrentCharacter = 12 }
    else if CurrentCharacter = "m"                  { CurrentCharacter = 13 }
    else if CurrentCharacter = "n"                  { CurrentCharacter = 14 }
    else if CurrentCharacter = "o"                  { CurrentCharacter = 15 }
    else if CurrentCharacter = "p"                  { CurrentCharacter = 16 }
    else if CurrentCharacter = "q"                  { CurrentCharacter = 17 }
    else if CurrentCharacter = "r"                  { CurrentCharacter = 18 }
    else if CurrentCharacter = "s"                  { CurrentCharacter = 19 }
    else if CurrentCharacter = "t"                  { CurrentCharacter = 20 }
    else if CurrentCharacter = "u"                  { CurrentCharacter = 21 }
    else if CurrentCharacter = "v"                  { CurrentCharacter = 22 }
    else if CurrentCharacter = "w"                  { CurrentCharacter = 23 }
    else if CurrentCharacter = "x"                  { CurrentCharacter = 24 }
    else if CurrentCharacter = "y"                  { CurrentCharacter = 25 }
    else if CurrentCharacter = "z"                  { CurrentCharacter = 26 }
    else if CurrentCharacter = "0"                  { CurrentCharacter = 27 }
    else if CurrentCharacter = "1"                  { CurrentCharacter = 28 }
    else if CurrentCharacter = "2"                  { CurrentCharacter = 29 }
    else if CurrentCharacter = "3"                  { CurrentCharacter = 30 }
    else if CurrentCharacter = "4"                  { CurrentCharacter = 31 }
    else if CurrentCharacter = "5"                  { CurrentCharacter = 32 }
    else if CurrentCharacter = "6"                  { CurrentCharacter = 33 }
    else if CurrentCharacter = "7"                  { CurrentCharacter = 34 }
    else if CurrentCharacter = "8"                  { CurrentCharacter = 35 }
    else if CurrentCharacter = "9"                  { CurrentCharacter = 36 }
    else if CurrentCharacter = "A"                  { CurrentCharacter = 37 }
    else if CurrentCharacter = "B"                  { CurrentCharacter = 38 }
    else if CurrentCharacter = "C"                  { CurrentCharacter = 39 }
    else if CurrentCharacter = "D"                  { CurrentCharacter = 40 }
    else if CurrentCharacter = "E"                  { CurrentCharacter = 41 }
    else if CurrentCharacter = "F"                  { CurrentCharacter = 42 }
    else if CurrentCharacter = "G"                  { CurrentCharacter = 43 }
    else if CurrentCharacter = "H"                  { CurrentCharacter = 44 }
    else if CurrentCharacter = "I"                  { CurrentCharacter = 45 }
    else if CurrentCharacter = "J"                  { CurrentCharacter = 46 }
    else if CurrentCharacter = "K"                  { CurrentCharacter = 47 }
    else if CurrentCharacter = "L"                  { CurrentCharacter = 48 }
    else if CurrentCharacter = "M"                  { CurrentCharacter = 49 }
    else if CurrentCharacter = "N"                  { CurrentCharacter = 50 }
    else if CurrentCharacter = "O"                  { CurrentCharacter = 51 }
    else if CurrentCharacter = "P"                  { CurrentCharacter = 52 }
    else if CurrentCharacter = "Q"                  { CurrentCharacter = 53 }
    else if CurrentCharacter = "R"                  { CurrentCharacter = 54 }
    else if CurrentCharacter = "S"                  { CurrentCharacter = 55 }
    else if CurrentCharacter = "T"                  { CurrentCharacter = 56 }
    else if CurrentCharacter = "U"                  { CurrentCharacter = 57 }
    else if CurrentCharacter = "V"                  { CurrentCharacter = 58 }
    else if CurrentCharacter = "W"                  { CurrentCharacter = 59 }
    else if CurrentCharacter = "X"                  { CurrentCharacter = 60 }
    else if CurrentCharacter = "Y"                  { CurrentCharacter = 61 }
    else if CurrentCharacter = "Z"                  { CurrentCharacter = 62 }
    else if CurrentCharacter = "."                  { CurrentCharacter = 63 }
    else if CurrentCharacter = ","                  { CurrentCharacter = 64 }
    else if CurrentCharacter = "-"                  { CurrentCharacter = 65 }
    else if CurrentCharacter = ":"                  { CurrentCharacter = 66 }
    else if CurrentCharacter = ";"                  { CurrentCharacter = 67 }
    else if CurrentCharacter = "!"                  { CurrentCharacter = 68 }
    else if CurrentCharacter = "?"                  { CurrentCharacter = 69 }
    ds_list_add(MessageList[c], CurrentCharacter);
    MessageListSize += 1;
}
for (c = 0; c < MessageListSize; c += 1)
{
    if MessageList[c] = 0.1
    {
        Line += 1;
        CharX = -1;
    }
    draw_set_font(fnt_SystemFont);
    draw_text_transformed_colour(CharX+(ls+16), (Line*20)+yo, ds_list_find_value(MessageList[c], 0), 0.1625, 0.1625, 0, c_white, c_white, c_white, c_white, 1);
    CharX += string_width(ds_list_find_value(MessageList[c], 0)) * 0.1625 + 1;
}
