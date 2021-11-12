///move_camera(x, y, [pause])
with obj_Camera
{
    TargetX = argument[0];
    TargetY = argument[1];
    target = noone;
    if argument_count > 2
    {
        pause = argument[2];
    }
    else
    {
        pause = 0;
    }
    waiting = false;
}
