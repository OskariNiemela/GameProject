EnemyInFront = false;
if gridX-1 > 0 and State = "Idle"{
    if instance_exists(map[gridX-1,gridY].occupant) and map[gridX-1,gridY].occupant.Owner = "Player"{
        EnemyInFront = true;
        State = "Attack"
    }

}
