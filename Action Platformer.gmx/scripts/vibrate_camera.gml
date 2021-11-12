///vibrate_camera(magnitude, fade)
magnitude = argument[0];
fade = argument[1];

view_xview = max(0, min(view_xview + random_range(-magnitude, magnitude * 0.5), room_width - view_wview));
if (not is_battle_room())
{
    view_yview = max(0, min(view_yview + random_range(-magnitude, magnitude * 0.5), room_height - view_hview));
}

switch abs(magnitude) > fade
{
    case true: return -magnitude * fade; break;
    case false: return 0; break;
}
