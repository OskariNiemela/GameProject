EnemiesOnRow = false;


//Go through all the tiles directly infront of our character, and deal damage to any enemies standing on them
    var i, DistanceToMapEdge;
    //Calculate the number of tiles from our current position to the edge of the map

    //Set i to 1 so we start with the tile directly infront of us, not the one we're standing on, that would be wasteful.
    i = 0;
   
DistanceToMapEdge = gridX;
repeat(DistanceToMapEdge){
    if instance_exists(map[gridX+i,gridY].occupant) and map[gridX+i,gridY].occupant.Owner != Owner{
         EnemiesOnRow = true;
         break
    }
    i -= 1;
}





