///TransferRooms(RoomToGoTo,x,y)


//The room we're going in
RoomToGoTo = argument0;
//The x position we will spawn the player in
XCoordinate = argument1;
//The y position we will spawn the player in
YCoordinate = argument2;


oGame.OverworldPosX = XCoordinate;
oGame.OverworldPosY = YCoordinate;


oGame.Room = RoomToGoTo;
room_goto(RoomToGoTo);
oGame.State = "Initialize";
