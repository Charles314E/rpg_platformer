///in_range(val, min, max)
var val, min_val, max_val;
val = argument[0];
min_val = argument[1];
max_val = argument[2];
if min(max(min_val, val), max_val) = val
{
    return true;
}
else
{
    return false;
}
