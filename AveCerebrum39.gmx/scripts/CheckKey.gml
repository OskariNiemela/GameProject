key = argument0;


if(ds_map_find_value(global.eventFlagsMap, key))
{
    return true;
}
return false;
