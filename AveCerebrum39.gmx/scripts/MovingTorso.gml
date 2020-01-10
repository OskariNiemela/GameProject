if State = "Idle"{
    switch Move{
        
        case "Up":
            if  gridY > 0 and map[gridX,gridY-1].occupant = noone or map[gridX,gridY-1] == map[OwnerX,OwnerY]{
                map[gridX,gridY].occupant = noone;
                if  map[gridX,gridY-1] == map[OwnerX,OwnerY]{
                    State = "FuseBack";
                
                }else{
                    gridY -= 1;
                    map[gridX,gridY].occupant = id;
                    State = "MoveUp"
                }
                
                
            }
            Move = "No";
        break;
        
        case "Down":
            if  gridY < oCursor.MapHeight and map[gridX,gridY+1].occupant = noone or map[gridX,gridY+1] == map[OwnerX,OwnerY]{
                map[gridX,gridY].occupant = noone;
                if  map[gridX,gridY+1] == map[OwnerX,OwnerY]{
                    State = "FuseBack";
                
                }else{
                    gridY += 1;
                    map[gridX,gridY].occupant = id;
                    State = "MoveDown"
                }
                
            }
            Move = "No";
        break;
        
        
        case"Right":
            if  gridX < oCursor.MapWidth  and map[gridX+1,gridY].occupant = noone or map[gridX+1,gridY] == map[OwnerX,OwnerY]{
                map[gridX,gridY].occupant = noone;
                if map[gridX+1,gridY] == map[OwnerX,OwnerY]{
                    State = "FuseBack";
                
                }else{
                    gridX += 1;
                    map[gridX,gridY].occupant = id;
                    State = "MoveRight"
                }
                
            }
            Move = "No";
        
        break;
        
        case"Left":
            if  gridX > 0 and map[gridX-1,gridY].occupant = noone or map[gridX-1,gridY] == map[OwnerX,OwnerY]{
                map[gridX,gridY].occupant = noone;
                if map[gridX-1,gridY] == map[OwnerX,OwnerY]{
                    State = "FuseBack";
                
                }else{
                    gridX -= 1;
                    map[gridX,gridY].occupant = id;
                    State = "MoveLeft"
                }
               
            }
        
            Move = "No";
        break;
    }
}else{
    Move = "No";

}
