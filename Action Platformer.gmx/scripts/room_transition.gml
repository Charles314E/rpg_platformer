///room_transition(room, room_type, x, y, sprite_index, image_speed, dir, [elevator?, floor, floor_h, floor_l, hsp, vsp])
//var roomID, roomType, xx, yy, sprite, sprite_speed;
roomID = argument[0];
roomType = argument[1];
xx = argument[2];
yy = argument[3];
sprite = argument[4];
sprite_speed = argument[5];
pDir = argument[6];
switch instance_exists(obj_RoomTransition)
{
    case true:  inst = obj_RoomTransition; break;
    case false: inst = instance_create(x, y, obj_RoomTransition); break;
}
with inst
{
    sprite_index = other.sprite;
    image_speed = other.sprite_speed;
    Map = other.roomID;
    MapType = other.roomType;
    X = other.xx;
    Y = other.yy;
    pDir = other.pDir;
    if argument_count > 7
    {
        elevatorTransition = argument[7];
        if argument_count > 8
        { 
            Floor = argument[8];
            HighestFloor = argument[9];
            LowestFloor = argument[10];
            elevatorHSpeed = argument[11];
            elevatorVSpeed = argument[12];
        }
    }
}
