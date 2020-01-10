///MoveXRanged(Direction);

//Negative number = move left, Positive number = move right


Direction = argument0;
DirectionMoving = sign(Direction);
        


map[gridX,gridY].occupant = noone;
gridX += DirectionMoving;
map[gridX,gridY].occupant = id;
MovementTimer = MovementTime;
x = map[gridX,gridY].x;

 
