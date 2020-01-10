//Loads the save file and copies the information on it to the oGame object, so that the player can continue their game


//Open the save file
SaveFile = file_text_open_read("Player_Data.sav");
ds_map_destroy(PlayerParty2);
ds_map_destroy(abilityData);
//1st line
file_text_readln(SaveFile);
//Begin next line

//Create a variable to go through the EncountersAccessor with
var EncounterMap, EncountersArray, b,EncounterArray,EncountersSize, is;
EncounterMap = ds_map_find_first(encounters_accessor);
EncounterArray = noone;
//Loop through the oGame EncountersAccessor map
for(i=0;i<ds_map_size(encounters_accessor);i+=1){
    //Now loop through the array that we've accessed through the EncountersAccessor
    EncounterArray = encounters_accessor[? EncounterMap];
    EncountersSize = array_height_2d(EncounterArray);

    for(b=0;b<EncountersSize;b+=1){
        is = file_text_read_real(SaveFile);
        file_text_readln(SaveFile);
        
        EncounterArray[@ b,0] = is;        
    }
    if !is_undefined(ds_map_find_next(encounters_accessor,EncounterMap)){
        EncounterMap = ds_map_find_next(encounters_accessor,EncounterMap);
    }
    else
    {
        break;
    }
}


file_text_readln(SaveFile);

var PartySize, ability, activeAbilities,allAbilities,at,guyArr;
PlayerParty2 = ds_map_create();
PartySize = array_height_2d(PlayerParty);
//Read the player data
for(p=0;p<PartySize;p+=1){
    PlayerParty[p,0] = file_text_read_real(SaveFile);
    file_text_readln(SaveFile);
    PlayerParty[p,1] = file_text_read_real(SaveFile);
    file_text_readln(SaveFile);
    PlayerParty[p,2] = file_text_read_real(SaveFile);
    file_text_readln(SaveFile);
    ability = file_text_read_string(SaveFile);
    file_text_readln(SaveFile);
    at = 0;
    if(ability != "!")
    {
        guyArr = ds_list_create();
        activeAbilities = ds_list_create();
        while(ability != "!")
        {
            activeAbilities[| at] = real(ability);
            ability = file_text_read_string(SaveFile);
            file_text_readln(SaveFile);
            at++;
        }
        guyArr[| 0] = activeAbilities;
        at=0;
        allAbilities = ds_list_create();
        ability = file_text_read_string(SaveFile);
        file_text_readln(SaveFile);
        while(ability != "!")
        {
            allAbilities[| at] = real(ability);
            ability = file_text_read_string(SaveFile);
            file_text_readln(SaveFile);
            at++;
        }
        guyArr[| 1] = allAbilities;
        
        PlayerParty2[? PlayerParty[p,0]] = guyArr;
    }
    else
    {
        file_text_readln(SaveFile);
    }
}

file_text_readln(SaveFile);
RoomToFadeTo = file_text_read_real(SaveFile);
file_text_readln(SaveFile);

OverworldPosX = file_text_read_real(SaveFile);
file_text_readln(SaveFile);
OverworldPosY = file_text_read_real(SaveFile);
file_text_readln(SaveFile);

file_text_readln(SaveFile);
Seconds = file_text_read_real(SaveFile);
file_text_readln(SaveFile);
Minutes = file_text_read_real(SaveFile);
file_text_readln(SaveFile);
Hours = file_text_read_real(SaveFile);

file_text_readln(SaveFile);
file_text_readln(SaveFile);
var eventKey, eventVal;
eventKey = file_text_read_string(SaveFile);
file_text_readln(SaveFile);
while(eventKey!="#")
{
    eventVal = file_text_read_real(SaveFile);
    file_text_readln(SaveFile);
    if(eventVal==0)
    {
        ds_map_replace(global.eventFlagsMap,eventKey,false);
    }
    else
    {
        ds_map_replace(global.eventFlagsMap,eventKey,true);
    }
    eventKey = file_text_read_string(SaveFile);
    file_text_readln(SaveFile);
}
var ability,desc,abilitySprite,abilityIn;
desc = file_text_read_string(SaveFile);
file_text_readln(SaveFile);
abilityData = ds_map_create();

while(desc!="#")
{
    abilityIn = ds_list_create();
    abilitySprite = file_text_read_real(SaveFile);
    file_text_readln(SaveFile);
    ability = file_text_read_real(SaveFile);
    file_text_readln(SaveFile);
    abilityIn[| 0] = desc;
    abilityIn[| 1] = abilitySprite;
    
    abilityData[? ability] = abilityIn;
    
    desc = file_text_read_string(SaveFile);
    file_text_readln(SaveFile);
}

var show, dickboi, ineex, fuckGM;
ineex = 0;
show = file_text_read_string(SaveFile);
file_text_readln(SaveFile);
while(show != "%")
{
    fuckGM = real(show)
    if(fuckGM > 0)
    {
        ShowPlayer[ineex] = true;
    }   
    else
    {
        ShowPlayer[ineex] = false;
    }
    ineex += 1;
    show = file_text_read_string(SaveFile);
    file_text_readln(SaveFile);
}

FadingTransitionFromRoomToRoom(RoomToFadeTo,OverworldPosX,OverworldPosY,true,false);

file_text_close(SaveFile);
