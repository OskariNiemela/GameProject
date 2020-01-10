

if MovementTimer <= 0 and State = "Idle"{
    /*if MovementQueue[0] != noone{
        Move = MovementQueue[0];
        MovementQueue[0] = noone;
    }*/
    switch Move{
        case "Up":
            if gridY>0 and map[gridX,gridY-1].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridY -= 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                y = map[gridX,gridY].y;
                
            }
            
            Move = "No"
        break;
        
        case "Down":
            if  gridY < oCursor.MapHeight and map[gridX,gridY+1].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridY += 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                y = map[gridX,gridY].y;
                
            }
            Move = "No"
        break;
        
        
        case"Right":
            if  gridX < oCursor.MapWidth and map[gridX+1,gridY].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridX += 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                x = map[gridX,gridY].x;
                
            }
            Move = "No"
        
        break;
        
        case"Left":
            if  gridX > 0 and map[gridX-1,gridY].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridX -= 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                x = map[gridX,gridY].x;
                Move = "No"
            }
            Move = "No"
        
        break;
    }
}
/*else{
    MovevementQueue[0] = Move;
    Move = "No";
}*/
