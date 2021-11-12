///beam_check_collision()
var centerCollide, leftCollide, rightCollide;
centerCollide = collision_point(x, y, obj_Block, true, false);
leftCollide = collision_point(bbox_left, bbox_top, obj_Block, true, false);
rightCollide = collision_point(bbox_left, bbox_bottom, obj_Block, true, false);
px = x - (Length * sin((Angle * pi) / 180));
py = y - (Length * cos((Angle * pi) / 180));
previousBeam = instance_place(px, py, object_index)
Collided = false;
if (centerCollide and leftCollide and rightCollide)
{
    Collided = true;
}

if previousBeam
{
    if previousBeam.Collided
    {
        Collided = true;
    }
}
