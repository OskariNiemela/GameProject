//Saves the players location, party arrangement, event- and spawnflags so that the game can be saved/loaded
//Open the save file
SaveFile = file_text_open_write("Player_Data.sav");
//Write a line of text
//1st line

//Begin next line

file_text_writeln(SaveFile);
//Create a variable to go through the EncountersAccessor with
var EncounterMap, EncountersArray, b,EncounterArray,EncountersSize;
EncounterMap = ds_map_find_first(encounters_accessor);
EncounterArray = noone;
//Loop through the oGame EncountersAccessor map
for(i=0;i<ds_map_size(encounters_accessor);i+=1){
    //Now loop through the array that we've accessed through the EncountersAccessor
    EncounterArray = encounters_accessor[? EncounterMap];
    EncountersSize = array_height_2d(EncounterArray);
    for(b=0;b<EncountersSize;b+=1){
        file_text_write_real(SaveFile,EncounterArray[@ b, 0]);
        file_text_writeln(SaveFile);
    }
    if !is_undefined(ds_map_find_next(encounters_accessor,EncounterMap)){
        EncounterMap = ds_map_find_next(encounters_accessor,EncounterMap);
    }
    else
    {
        break;
    }
}


file_text_write_string(SaveFile,"#");
file_text_writeln(SaveFile);

var PartySize, abilities;
PartySize = array_height_2d(PlayerParty);
//Write the player party info next.
for(p=0;p<PartySize;p+=1){
    file_text_write_real(SaveFile,PlayerParty[p,0]);
    file_text_writeln(SaveFile);
    file_text_write_real(SaveFile,PlayerParty[p,1]);
    file_text_writeln(SaveFile);
    file_text_write_real(SaveFile,PlayerParty[p,2]);
    file_text_writeln(SaveFile);
    
    if(PlayerParty[p,0] !=noone)
    {
        abilities = oGame.PlayerParty2[? PlayerParty[p,0]];
        allAbilities = abilities[| 1];
        activeAbilities = abilities[| 0];
        
        for(a=0;a<ds_list_size(activeAbilities);a++)
        {
            file_text_write_real(SaveFile,activeAbilities[| a]);
            file_text_writeln(SaveFile);
        }
        file_text_write_string(SaveFile,"!");
        file_text_writeln(SaveFile);
        for(b=0;b<ds_list_size(allAbilities);b++)
        {
            file_text_write_real(SaveFile,allAbilities[| b]);
            file_text_writeln(SaveFile);
        }
        file_text_write_string(SaveFile,"!");
        file_text_writeln(SaveFile);
    }
    else
    {
        file_text_write_string(SaveFile,"!");
        file_text_writeln(SaveFile);
        file_text_write_string(SaveFile,"!");
        file_text_writeln(SaveFile);
    }
}
file_text_write_string(SaveFile,"#");
//Room & location unt the playtime
file_text_writeln(SaveFile);
file_text_write_real(SaveFile,room);
file_text_writeln(SaveFile);

file_text_write_real(SaveFile,oPlayerWorld.x);
file_text_writeln(SaveFile);
file_text_write_real(SaveFile,oPlayerWorld.y);
file_text_writeln(SaveFile);
file_text_write_string(SaveFile,"?");
file_text_writeln(SaveFile);
file_text_write_real(SaveFile,Seconds);
file_text_writeln(SaveFile);
file_text_write_real(SaveFile,Minutes);
file_text_writeln(SaveFile);
file_text_write_real(SaveFile,Hours);
file_text_writeln(SaveFile);

//Event/Dialogue flagsu
file_text_write_string(SaveFile,"#");
file_text_writeln(SaveFile);
var eventKey = ds_map_find_first(global.eventFlagsMap);
var eventVal;
while(!is_undefined(eventKey))
{
    eventVal = ds_map_find_value(global.eventFlagsMap,eventKey);
    file_text_write_string(SaveFile,eventKey);
    file_text_writeln(SaveFile);
    if(eventVal)
    {
        eventVal = 1;
    }
    else
    {
        eventVal = 0;
    }
    file_text_write_real(SaveFile,eventVal);
    file_text_writeln(SaveFile);
    
    eventKey = ds_map_find_next(global.eventFlagsMap,eventKey);
    
}
file_text_write_string(SaveFile,"#");
file_text_writeln(SaveFile);
//Write all the abilities data (desc/dataSprite) here
var abil, abilList;
abil = ds_map_find_first(oGame.abilityData);
while(!is_undefined(abil))
{
    abilList = oGame.abilityData[? abil];
    file_text_write_string(SaveFile,abilList[| 0]);
    file_text_writeln(SaveFile);
    file_text_write_real(SaveFile,abilList[| 1]);
    file_text_writeln(SaveFile);
    file_text_write_real(SaveFile,abil);
    file_text_writeln(SaveFile);
    abil = ds_map_find_next(oGame.abilityData,abil);
}
file_text_write_string(SaveFile,"#");
file_text_writeln(SaveFile);

var PartySee;
PartySee = array_length_1d(ShowPlayer);
for(w=0;w<PartySee;w+=1){
    file_text_write_string(SaveFile,ShowPlayer[w]);
    file_text_writeln(SaveFile);
    
}
file_text_write_string(SaveFile,"%");

file_text_close(SaveFile);
