switch MoveDirection{
    case "Up":
        if gridY>0 and map[gridX,gridY-1].occupant = noone{
            map[gridX,gridY].occupant = noone;
            PreviousTile = map[gridX,gridY];
            gridY -= 1;
            MovementTimer = MovementTime;
            map[gridX,gridY].occupant = id;
            y = map[gridX,gridY].y;
        }
        MoveDirection = "No"
    break;
    
    case "Down":
        if  gridY < oCursor.MapHeight and map[gridX,gridY+1].occupant = noone{
            map[gridX,gridY].occupant = noone;
            PreviousTile = map[gridX,gridY];
            gridY += 1;
            MovementTimer = MovementTime;
            map[gridX,gridY].occupant = id;
            y = map[gridX,gridY].y;
        }
        MoveDirection = "No"
    break;
    
    
    case"Right":
        if  gridX < oCursor.MapWidth and map[gridX+1,gridY].occupant = noone{
            map[gridX,gridY].occupant = noone;
            PreviousTile = map[gridX,gridY];
            gridX += 1;
            MovementTimer = MovementTime;
            map[gridX,gridY].occupant = id;
            x = map[gridX,gridY].x;
        }
        MoveDirection = "No"
    
    break;
    
    case"Left":
        if  gridX > 0 and map[gridX-1,gridY].occupant = noone{
            map[gridX,gridY].occupant = noone;
            PreviousTile = map[gridX,gridY];
            gridX -= 1;
            MovementTimer = MovementTime;
            map[gridX,gridY].occupant = id;
            x = map[gridX,gridY].x;
            MoveDirection = "No"
        }
        MoveDirection = "No"
    
    break;
}
MoveScore = 0;
State = "Idle";

