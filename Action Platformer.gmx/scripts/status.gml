///status(id, [inst])
if argument_count > 1
{
    if instance_exists(argument[1])
    {
        var statusID = ds_list_find_index(argument[1].Statuses, argument[0]);
        switch statusID
        {
            case -1: return statusID; break;
            default: return ds_list_find_value(argument[1].Statuses, statusID + 1); break;
        }
    }
}
else
{
    var statusID = ds_list_find_index(Statuses, argument[0]);
    switch statusID
    {
        case -1: return statusID; break;
        default: return ds_list_find_value(Statuses, statusID + 1); break;
    }
}
