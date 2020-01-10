//Open the save file
SaveFile = file_text_open_read("Player_Data.sav");


var line;
line = file_text_read_string(SaveFile);
file_text_readln(SaveFile);
while(line!="?")
{
    line = file_text_read_string(SaveFile);
    file_text_readln(SaveFile);
}


oSaveMenu.SecondsOnSaveFile = round(file_text_read_real(SaveFile));
file_text_readln(SaveFile);
oSaveMenu.MinutesOnSaveFile = file_text_read_real(SaveFile);
file_text_readln(SaveFile);
oSaveMenu.HoursOnSaveFile = file_text_read_real(SaveFile);




file_text_close(SaveFile);





