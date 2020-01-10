
file = "events.txt";
file = "Events\"+file;

textu = file_exists(file);


if !file_exists(file)
{
    error_message = object_get_name(id);
    error_message += " UR EVENTS AINT FOUIND VOBIIIIIIIIIII";
    show_error(error_message,true);
    return false;
}

global.eventFlagsMap = ds_map_create();

Text = file_text_open_read(file);
line = file_text_read_string(Text);

while(line!="%")
{
    var key, bol;
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }

    key = line;
    
    file_text_readln(Text);
    bol = file_text_read_real(Text);
    
    if(bol == 0)
    {
        ds_map_add(global.eventFlagsMap,key,false);
    }
    else
    {
        ds_map_add(global.eventFlagsMap,key,true);
    }
    
    file_text_readln(Text);
    line = file_text_read_string(Text);
    
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    
}


