///calculate_gold_drop(value)
Value = argument[0];
if argument_count > 1
{
    lh = argument[1];
    uh = argument[2];
    lv = argument[3];
    uv = argument[4];
}
while Value > 0
{
    if Value >= 10
    {
        if argument_count = 1
        {
            instance_create(x, y, gld_LargeCoin);
        }
        else
        {
            with instance_create(x, y, gld_LargeCoin)
            {
                hSpeed = random_range(other.lh, other.uh);
                vSpeed = random_range(other.lv, other.uv);
            }
        }
        Value -= 10;
    }
    else if Value >= 5
    {
        if argument_count = 1
        {
            instance_create(x, y, gld_MediumCoin);
        }
        else
        {
            with instance_create(x, y, gld_MediumCoin)
            {
                hSpeed = random_range(other.lh, other.uh);
                vSpeed = random_range(other.lv, other.uv);
            }
        }
        Value -= 5;
    }
    else
    {
        if argument_count = 1
        {
            instance_create(x, y, gld_SmallCoin);
        }
        else
        {
            with instance_create(x, y, gld_SmallCoin)
            {
                hSpeed = random_range(other.lh, other.uh);
                vSpeed = random_range(other.lv, other.uv);
            }
        }
        Value -= 1;
    }
}
