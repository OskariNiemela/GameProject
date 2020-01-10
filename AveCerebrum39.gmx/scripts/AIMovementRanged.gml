









    //If our target is below our Y plane.
    if Target.gridY > gridY{
        if map[gridX,gridY+1].occupant = noone{
            //Move one Y down
            MoveYRanged(1);
        }else{
            MovementTimer = 0.2;
            State = "Idle";
        
        
        }
            //If we cant move one Y down then move one X to either side
    
    }
    //If our target is above our Y plane.
    else if Target.gridY < gridY{
        if map[gridX,gridY-1].occupant = noone{
            //Move one Y up
            MoveYRanged(-1);
        }else{
            MovementTimer = 0.2;
            State = "Idle";
        
        }
            //If we cant move one Y up (something is blocking us from doing so) move one X to either side
    
    }
    //If our target is on the same Y plane as us.
    else if Target.gridY = gridY and gridX < oCursor.MapWidth {
        //Move one x tile back if we're able
        MoveXRanged(1);
    
    }
    //If our target is on the same Y plane as us and we cant move back anymore, just reset the movement timer to 0.2 seconds
    else if Target.gridY = gridY and gridX >= oCursor.MapWidth{
        MovementTimer = 0.2;
        State = "Idle";
    
    
    }











State = "Idle";
