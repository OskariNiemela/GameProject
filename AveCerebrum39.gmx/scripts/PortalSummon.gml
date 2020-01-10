
//Look for an opening next to us
var Index,Neighbours,Neighbour;
Index = 0;
Neighbours = ds_list_size(map[gridX,gridY].neighbors);

for(i=0;i<Neighbours;i+=1){
    Neighbour = ds_list_find_value(map[gridX,gridY].neighbors,Index);
    Index += 1;
    if Neighbour.occupant = noone{
        var CritterSpawned;
        CritterSpawned = instance_create(Neighbour.x,Neighbour.y,Critter);
        CritterSpawned.gridX = Neighbour.gridX;
        CritterSpawned.gridY = Neighbour.gridY;
        Neighbour.occupant = CritterSpawned
        break;
    }
    
}
