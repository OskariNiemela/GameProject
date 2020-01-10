///GoIntoEncounter(OverworldPosX,OverworldPosY,OverworldRoom,EncounterMet) 
                                
var i;
i = 0;
//First lets store all the values we need to pass on to BattlescreenPrep and oGame.
//Remember our current position in the overworld;
oGame.OverworldPosX = argument0;
oGame.OverworldPosY = argument1;
//Remember which room we entered battle from.
oGame.OverworldRoom = argument2;
EncounterWeMet      = argument3;
//How many enemies are there in this encounter?
EnemyCount = array_height_2d(EncounterWeMet.Encounter);
//Which room will the battle take place in?
EncounterRoom = EncounterWeMet.Room;
//Remember which Encounter in the encounter table we're facing off against (This is so we can disable this encounter if we defeat it)
oBattleScreenPrep.EncounterNumber = EncounterWeMet.EncounterNumber;
//Let the Battlescreen know how many enemies there are in this encounter.
oBattleScreenPrep.EncounterSize = array_height_2d(EncounterWeMet.Encounter);

//Let's store all the information of the various enemies in the encounter so we can pass that on to BattlescreenPrep
repeat(EnemyCount){
    //First store the object id of the enemy
    oBattleScreenPrep.EncounterSpawnTable[i, 0] = EncounterWeMet.Encounter[i, 0];
    //Then store the X and Y coordinates respectively
    oBattleScreenPrep.EncounterSpawnTable[i, 1] = EncounterWeMet.Encounter[i, 1];
    oBattleScreenPrep.EncounterSpawnTable[i, 2] = EncounterWeMet.Encounter[i, 2];
    //Onward top the next enemy (if there is one)
    i += 1;
}
oGame.State = "TransferIntoBattle";

//Disable the encounter so that it wont spawn again.
if ds_map_exists(oGame.encounters_accessor,room)
{
    EncounterArray = oGame.encounters_accessor[? room];
    while(array_height_2d(EncounterArray)==0)
    {
    
    }
    EncounterArray[@ oBattleScreenPrep.EncounterNumber,0] = false;
}
//Once we've given the prerequisite information, move to the encounter room itself.
oGame.RoomToFadeTo = EncounterRoom;
