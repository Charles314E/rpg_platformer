///draw_lightning(x1, y1, x2, y2, min_width, max_width, step, debug, damaging?, [col, a, w]);
var x1, y1, x2, y2, w_min, w_max, step, debug, col, a;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
w_min = argument[4];
w_max = argument[5];
step = argument[6];
debug = argument[7];
damaging = argument[8];
w = 1;
if argument_count > 9
{
    col = argument[9];
    draw_set_colour(col);
    if argument_count > 10
    {
        a = argument[10];
        draw_set_alpha(a);
        if argument_count > 11
        {
            w = argument[11];
        }
    }
}
var i, length, aside, xx, yy, xx_aside, yy_aside, xx_next, yy_next, xx_aside_next, yy_aside_next, theta;
i = 0;
length = line_length(x1, y1, x2, y2);
aside = choose(-1, 1);
xx = x1;
yy = y1;
xx_aside = xx;
yy_aside = yy;
xx_next = xx;
yy_next = yy;
xx_aside_next = xx_aside;
yy_aside_next = yy_aside;
theta = ((point_direction(x1, y1, x2, y2) + 90) * pi) / 180;
while point_distance(xx, yy, x2, y2) >= step
{
    aside = (sign(aside) * -1) * round(random_range(-step, step));
    if aside = 0
    {
        aside += choose(-1, 1);
    }
    xx_aside_next = xx + (step * sin(theta)) + (aside * sin(theta + (0.5 * pi)))
    yy_aside_next = yy + (step * cos(theta)) + (aside * cos(theta + (0.5 * pi)))
    xx_next = xx + (step * sin(theta));
    yy_next = yy + (step * cos(theta));
    if point_distance(xx, yy, x2, y2) = step
    {
        draw_line_width(xx_aside, yy_aside, x2, y2, w);
    }
    else
    {
        draw_line_width(xx_aside, yy_aside, xx_aside_next, yy_aside_next, w);
    }
    if debug
    {
        draw_set_alpha(1);
        draw_circle(xx_aside_next, yy_aside_next, 2, false);
        draw_set_colour(c_black);
        draw_set_alpha(0.5);
        draw_circle(xx_aside_next, yy_aside_next, 2, true);
        draw_set_colour(col);
        draw_set_alpha(a);
    }
    if damaging
    {
        inst = collision_line(xx_aside, yy_aside, x2, y2, obj_Enemy, false, true);
        if inst
        {
            with inst
            {
                if not Invulnerable
                {
                    damage_enemy(other.Damage, other, self, self, false, false, "LIGHTNING");
                    apply_status("PARALYZE", self, 300);
                }
            }
        }
    }
    xx = xx_next;
    yy = yy_next;
    xx_aside = xx_aside_next;
    yy_aside = yy_aside_next;
}
draw_set_colour(c_white);
draw_set_alpha(1);
