///set_volume(listener, emitter)
listener = argument[0];
emitter = argument[1];

if instance_exists(listener)
{
    dist = point_distance(emitter.x, emitter.y, listener.x, listener.y) / (TileDimensions * 16);
    if dist > 0
    {
        return min(1, 1 / power(dist, 2));
    }
    else
    {
        return 1;
    }
}
else
{
    return 1;
}
