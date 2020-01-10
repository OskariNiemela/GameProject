///MoveYMelee(Direction);
//Negative numbers = go up, Positive numbers = go down.
Direction = argument0;
DirectionMoving = sign(Direction);




map[gridX,gridY].occupant = noone;
gridY += DirectionMoving;
map[gridX,gridY].occupant = id;
MovementTimer = MovementTime;
y = map[gridX,gridY].y;
LastDirectionWeMovedIn = "VT";

