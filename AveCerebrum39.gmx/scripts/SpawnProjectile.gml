///SpawnProjectile(ProjectileToSpawn,xCoordinate,yCoordinate,Direction)
ProjectileToSpawn = argument0;

xCoordinate = argument1;
yCoordinate = argument2;

//Direction 1 = right -1 = left
Direction = argument3;

with instance_create(ProjectileToSpawn,xCoordinate,yCoordinate){
    Direction = Direction;
}





