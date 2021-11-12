///create_tooltip(text, x, y, slot_w, slot_h, border_w, border_h)
var text, xx, yy, sx, sy, bw, bh;
text = argument[0];
xx = argument[1];
yy = argument[2];
sw = argument[3];
sh = argument[4];
bw = argument[5];
bh = argument[6];
if obj_GUI.cursor_x = min(max(xx + (bw - 1), obj_GUI.cursor_x), xx + sw - bw) and obj_GUI.cursor_y = min(max(yy + (bh - 1), obj_GUI.cursor_y), yy + sh - bh)
{
    slotHover = true;
    tooltipShown = true;
    tooltipDescription = ds_list_create();
    if is_string(text)
    {
        tooltipName = text;
    }
    else
    {
        tooltipName = ds_list_find_value(text, 0);
        for (i = 0; i < ds_list_size(text) - 1; i += 1)
        {
            ds_list_add(tooltipDescription, ds_list_find_value(text, i + 1));
        }
    }
}
