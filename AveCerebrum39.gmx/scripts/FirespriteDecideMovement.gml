var MoveTileAmount;
MoveTileAmount = 0;
if gridX-1 >= 0{
    for(i=0;i<=4;i+=1){
            if gridY-2+i <= oCursor.MapHeight and gridY-2+i >= 0 and instance_exists(map[gridX-1,gridY-2+i]){
                if instance_exists(map[gridX-1,gridY-2+i].occupant) and map[gridX-1,gridY-2+i].occupant.Owner = "Player"{
                    TargetTile = map[gridX-1,gridY-2+i];
                    break;
                }
                MoveTiles[MoveTileAmount] = map[gridX-1,gridY-2+i];
                MoveTileAmount += 1;
                PossibleTiles += 1;
            }
        
        }
}
if gridX-2 >= 0{
    for(b=0;b<=4;b+=1){
        if gridY-2+b <= oCursor.MapHeight and gridY-2+b >= 0 and instance_exists(map[gridX-2,gridY-2+b]){
            if  instance_exists(map[gridX-2,gridY-2+b].occupant) and map[gridX-2,gridY-2+b].occupant.Owner = "Player"{
                TargetTile = map[gridX-2,gridY-2+b];
                break;
            }
            if instance_exists(TargetTile){
                break;
            }
            MoveTiles[MoveTileAmount] = map[gridX-2,gridY-2+b];
            MoveTileAmount += 1;
            PossibleTiles += 1;
        
        }
    
    }
}
//If we've got a tile with a player character on it, proceed there.
if instance_exists(TargetTile){
    DestinationX = TargetTile.x;
    DestinationY = TargetTile.y;
    PossibleTiles = 0;
    State = "Move";
    MovementTimer = MovementTime;
//If not choose one of the tiles to go to
}else if gridX > 0{
    var RandomMove;
    RandomMove = round(random_range(0,PossibleTiles-1));
    TargetTile = MoveTiles[RandomMove];
    PossibleTiles = 0;
    DestinationX = TargetTile.x;
    DestinationY = TargetTile.y;
    State = "Move";
    MovementTimer = MovementTime;
}else if gridX <= 0{
    State = "Fizzle";
}










