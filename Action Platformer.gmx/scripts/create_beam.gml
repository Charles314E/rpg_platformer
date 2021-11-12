///create_beam(beam, source, target, target_x, target_y, length, contraction, duration, recursion_alarm, recursion_speed, cancel_alarm, cancel_speed)
var beam, target_x, target_y, length, contraction, duration, r_alarm, r_speed, c_alarm, c_speed;
beam = argument[0];
source = argument[1];
target = argument[2];
target_x = argument[3];
target_y = argument[4];
length = argument[5];
contraction = argument[6];
duration = argument[7];
r_alarm = argument[8];
r_speed = argument[9];
c_alarm = argument[10];
c_speed = argument[11];
if not obj_GUI.GameFrozen
{
    Section += 1;
    var Angle, ax, ay;
    Angle = point_direction(x, y, target_y, target_x) + 90;
    ax = (16 * sin(Angle * pi / 180)) * Section;
    ay = (16 * cos(Angle * pi / 180)) * Section;
    Firing = true;
    LockedOn = false;
    if Section > length + contraction + duration
    {
        Section = 0;
        BeamCollided = false;
        with beam
        {
            State = 3;
        }
        alarm[c_alarm] = room_speed * c_speed;
    }
    else
    {
        if Section <= length
        {
            LockedOn = true;
            with instance_create(x + ax, y + ay, beam)
            {
                Target = other.target;
                Source = other.source;
                Angle = point_direction(Source.x, Source.y, Source.TargetX, Source.TargetY) + 90;
                Section = other.Section;
                Length = 16;
                State = 0;
                beam_check_collision();
            }
        }
        else
        {
            if Section <= length + contraction
            {
                with beam
                {
                    State = 1;
                }
            }
        }
        alarm[r_alarm] = room_speed * r_speed;
    }
}
else
{
    alarm[r_alarm] = room_speed * r_speed;
}
var beam_list;
beam_list = ds_list_create();
ds_list_add(beam_list, Firing, LockedOn, duration);
return beam_list;
