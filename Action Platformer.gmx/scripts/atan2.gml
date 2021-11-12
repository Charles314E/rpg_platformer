///atan2(x, y)
xx = argument[0];
yy = argument[1];
if sign(xx) > 0
{
    return arctan(yy / xx);
}
else if xx < 0 and yy >= 0
{
    return arctan(yy / xx) + pi;
}
else if xx < 0 and yy < 0
{
    return arctan(yy / xx) - pi;
}
else if xx = 0 and yy > 0
{
    return +(pi / 2);
}
else if xx = 0 and yy < 0
{
    return -(pi / 2);
}
else if xx = 0 and yy = 0
{
    return noone;
}
