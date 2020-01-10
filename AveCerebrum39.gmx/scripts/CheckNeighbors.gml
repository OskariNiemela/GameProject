










EnemiesNextTo = false;


var Neighbors, i, Neighbor, NeighborsSize;
NeighborsSize = ds_list_size(map[gridX,gridY].neighbors);
i = 0;
repeat(NeighborsSize){
    Neighbor = ds_list_find_value(map[gridX,gridY].neighbors,i);
    if instance_exists(Neighbor.occupant) and Neighbor.occupant.Owner = "Player" {
       EnemiesNextTo = true;
    }
    i += 1;
}
if EnemiesNextTo = false{
        AttackTimer = 0.05;
    
}
    
   



