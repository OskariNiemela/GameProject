
//Figure out which room we came from, and disable the encounter we just defeated moved to GoIntoEncounter script


oGame.SoundCutOff = false;
oBackgroundMusic.State = "ExitingEncounter";
FadingTransitionFromRoomToRoom(oGame.OverworldRoom,oGame.OverworldPosX,oGame.OverworldPosY,true,false);

oBackgroundMusic.RoomToGoTo = oGame.OverworldRoom;
oPlayerPar.State = "Quit";





