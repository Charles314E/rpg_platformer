///collide(entity, axis) #Deprecated
var mSpeed, entity, axis;
entity = argument[0];
axis = argument[1];
switch axis
{
    case "x": mSpeed = entity.hSpeed; break;
    case "y": mSpeed = entity.vSpeed; break;
}
if mSpeed != 0
{
    var colSide, colBlock;
    if axis = "x"
    {
        switch sign(mSpeed)
        {
            case -1: colSide = entity.bbox_left; break;
            case 1: colSide = entity.bbox_right; break;
        }
    }
    else
    {
        switch sign(mSpeed)
        {
            case -1: colSide = entity.bbox_top; break;
            case 1: colSide = entity.bbox_bottom; break;
        }
    }
    switch axis
    {
        case "x": colBlock = collision_rectangle(colSide+sign(mSpeed), entity.bbox_top, colSide+mSpeed, entity.bbox_bottom, obj_Block, false, false); break;
        case "y": colBlock = collision_rectangle(entity.bbox_left, colSide+sign(mSpeed), entity.bbox_right, colSide+mSpeed, obj_Block, false, false); break;
    }
    if colBlock
    {
        if axis = "x"
        {
            switch sign(mSpeed)
            {
                case -1: colBlockSide = colBlock.bbox_right; break;
                case 1: colBlockSide = colBlock.bbox_left; break;
            }
        }
        else
        {
            switch sign(mSpeed)
            {
                case -1: colBlockSide = colBlock.bbox_bottom; break;
                case 1: colBlockSide = colBlock.bbox_top; break;
            }
        }
        switch axis
        {
            case "x": entity.x += sign(mSpeed) * (abs(colSide - colBlockSide) - 2); break;
            case "y": entity.y += sign(mSpeed) * (abs(colSide - colBlockSide)); break;
        }
        return 0;
    }
}
return mSpeed;
