//Figure Out which of the possible tiles we can move into has the highest MoveScore (16-DistanceToTargetTile)
var TargetGridX,TargetGridY,MoveScoreTemp,CalculatingGridX,CalculatingGridY;
TargetGridX = TargetTile.gridX;
TargetGridY = TargetTile.gridY;
MoveScoreTemp = 0;
CalculatingGridX = 0;
CalculatingGridY = 0;

//Lets start with the tile right infront of us.

if gridX > 0 and map[gridX-1,gridY].occupant = noone{
    CalculatingGridX = gridX-1;
    CalculatingGridY = gridY;
    if map[CalculatingGridX,CalculatingGridY] = TargetTile{
        MoveScore = 10000;
        MoveDirection = "Left";
    }
    //First calculate the tiles score
    MoveScoreTemp = 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-TargetGridY);
    if instance_exists(PreviousTile) and PreviousTile = map[CalculatingGridX,CalculatingGridY]{
        MoveScoreTemp -= 16;
    }
    //Now that we've calculated that, add the scores of all the accessable tiles next to that tile.
    //Check if there is a tile "Above" our select tile
    if CalculatingGridY > 0 and map[CalculatingGridX,CalculatingGridY-1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY-1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Left";
        }
    }
    if CalculatingGridY < oCursor.MapHeight and map[CalculatingGridX,CalculatingGridY+1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY+1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY+1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Left";
        }
    }
    if CalculatingGridX > 0 and map[CalculatingGridX-1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX-1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Left";
        }
    }
    if CalculatingGridX < oCursor.MapWidth and map[CalculatingGridX+1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX+1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX+1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Left";
        }
    }
    
    if MoveScoreTemp > MoveScore{
        MoveScore = MoveScoreTemp;
        MoveDirection = "Left";
    }
    MoveScoreTemp = 0;
}

if gridY > 0 and map[gridX,gridY-1].occupant = noone{
    CalculatingGridX = gridX;
    CalculatingGridY = gridY-1;
    //First calculate the tiles score
    if map[CalculatingGridX,CalculatingGridY] = TargetTile{
        MoveScore = 10000;
        MoveDirection = "Up";
    }
    MoveScoreTemp = 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-TargetGridY);
    if instance_exists(PreviousTile) and PreviousTile = map[CalculatingGridX,CalculatingGridY]{
        MoveScoreTemp -= 16;
    }
    //Now that we've calculated that, add the scores of all the accessable tiles next to that tile.
    //Check if there is a tile "Above" our select tile
    if CalculatingGridY > 0 and map[CalculatingGridX,CalculatingGridY-1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY-1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Up";
        }
    }
    if CalculatingGridY < oCursor.MapHeight and map[CalculatingGridX,CalculatingGridY+1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY+1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY+1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Up";
        }
    }
    if CalculatingGridX > 0 and map[CalculatingGridX-1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX-1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Up";
        }
    }
    if CalculatingGridX < oCursor.MapWidth and map[CalculatingGridX+1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX+1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX+1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Up";
        }
    }
    
    if MoveScoreTemp > MoveScore{
        MoveScore = MoveScoreTemp;
        MoveDirection = "Up";
    }
    MoveScoreTemp = 0;
}

if gridX < oCursor.MapWidth and map[gridX+1,gridY].occupant = noone{
    CalculatingGridX = gridX+1;
    CalculatingGridY = gridY;
    //First calculate the tiles score
    if map[CalculatingGridX,CalculatingGridY] = TargetTile{
        MoveScore = 10000;
        MoveDirection = "Right";
    }
    MoveScoreTemp = 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-TargetGridY);
    if instance_exists(PreviousTile) and PreviousTile = map[CalculatingGridX,CalculatingGridY]{
        MoveScoreTemp -= 16;
    }
    //Now that we've calculated that, add the scores of all the accessable tiles next to that tile.
    //Check if there is a tile "Above" our select tile
    if CalculatingGridY > 0 and map[CalculatingGridX,CalculatingGridY-1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY-1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Right";
        }
    }
    if CalculatingGridY < oCursor.MapHeight and map[CalculatingGridX,CalculatingGridY+1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY+1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY+1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Right";
        }
    }
    if CalculatingGridX > 0 and map[CalculatingGridX-1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX-1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Right";
        }
    }
    if CalculatingGridX < oCursor.MapWidth and map[CalculatingGridX+1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX+1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX+1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Right";
        }
    }
    
    if MoveScoreTemp > MoveScore{
        MoveScore = MoveScoreTemp;
        MoveDirection = "Right";
    }
    MoveScoreTemp = 0;
}

if gridY < oCursor.MapHeight and map[gridX,gridY+1].occupant = noone{
    CalculatingGridX = gridX;
    CalculatingGridY = gridY+1;
    //First calculate the tiles score
    if map[CalculatingGridX,CalculatingGridY] = TargetTile{
        MoveScore = 10000;
        MoveDirection = "Down";
    }
    MoveScoreTemp = 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-TargetGridY);
    if instance_exists(PreviousTile) and PreviousTile = map[CalculatingGridX,CalculatingGridY]{
        MoveScoreTemp -= 16;
    }
    //Now that we've calculated that, add the scores of all the accessable tiles next to that tile.
    //Check if there is a tile "Above" our select tile
    if CalculatingGridY > 0 and map[CalculatingGridX,CalculatingGridY-1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY-1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY-1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Down";
        }
    }
    if CalculatingGridY < oCursor.MapHeight and map[CalculatingGridX,CalculatingGridY+1].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-TargetGridX)-abs(CalculatingGridY+1-TargetGridY);
        if map[CalculatingGridX,CalculatingGridY+1] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Down";
        }
    }
    if CalculatingGridX > 0 and map[CalculatingGridX-1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX-1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX-1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Down";
        }
    }
    if CalculatingGridX < oCursor.MapWidth and map[CalculatingGridX+1,CalculatingGridY].occupant = noone{
        MoveScoreTemp += 16-abs(CalculatingGridX+1-TargetGridX)-abs(CalculatingGridY-TargetGridY);
        if map[CalculatingGridX+1,CalculatingGridY] = TargetTile{
            MoveScore = 10000;
            MoveDirection = "Down";
        }
    }
    
    if MoveScoreTemp > MoveScore{
        MoveScore = MoveScoreTemp;
        MoveDirection = "Down";
    }
    MoveScoreTemp = 0;
}
