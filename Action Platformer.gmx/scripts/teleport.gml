///teleport(room, map_type, [dir, x, y])
Map = argument[0];
MapType = argument[1];
if argument_count > 2
{
    Dir = argument[2];
}
if not is_undefined(Map)
{
    room_goto(Map);
    if argument_count > 4
    {
        xx = argument[3];
        yy = argument[4];
        switch MapType
        {
            case "Field": xo = -6; yo = -8;
                    obj_Player.hSpeed = 0;
                    obj_Player.vSpeed = 0;
                    if argument_count > 2
                    {
                        switch Dir
                        {
                            case 0:
                                obj_Player.hdir = 0;
                                obj_Player.vdir = -1; 
                                break;
                            case 90:
                                obj_Player.hdir = 1;
                                obj_Player.vdir = 0; 
                                break;
                            case 180:
                                obj_Player.hdir = 0;
                                obj_Player.vdir = 1; 
                                break;
                            case 270:
                                obj_Player.hdir = -1;
                                obj_Player.vdir = 0; 
                                break;
                        }
                    }
                    break;
            case "Platform": xo = 6; yo = 8;
                    if argument_count > 2
                    {
                        switch Dir
                        {
                            case 90:
                                obj_Player.dir = 1;
                                break;
                            case 270:
                                obj_Player.dir = -1;
                                break;
                        }
                    }
                    break;
            default: xo = 0; yo = 0; 
                    break;
        }
        posX = xx + xo;
        posY = yy + yo;
        
        obj_Player.x = posX;
        obj_Player.y = posY + obj_Player.sprite_yoffset;
        
        obj_Camera.x = posX;
        obj_Camera.y = posY;
        
        obj_GUI.RoomStartX = posX;
        obj_GUI.RoomStartY = posY;
    }
}
