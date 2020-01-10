///RangedAttack(AttackStat,Animation,Projectile,Direction)


//Take all the needed information as arguments for this script
AttackStat = argument0;
Animation  = argument1;
Projectile = argument2;

//Direction 1 = right -1 = left
Direction  = argument3;


//Change our sprite to the animation we need to do
if sprite_index != Animation{
    image_index  = 0;
    sprite_index = Animation;
    
    
    Timer = 0;
    
    AnimationTime = image_number*DELTA_TIME / image_speed;
}

Timer = Timer + DELTA_TIME;

if Timer >= AnimationTime{
    //Create a projectile
    audio_play_sound_on(oSFX.SFXEmitter,AttackSound,false,8);
    //SpawnProjectile(oBullet,map[gridX,gridY].x,map[gridX,gridY].y,Direction);
    //Go through all the tiles directly infront of our character, and deal damage to any enemies standing on them
    var i, DistanceToMapEdge;
    //Calculate the number of tiles from our current position to the edge of the map

    //Set i to 1 so we start with the tile directly infront of us, not the one we're standing on, that would be wasteful.
    i = 1;
    if Direction > 0{
        DistanceToMapEdge = oCursor.MapWidth - gridX;
        repeat(DistanceToMapEdge){
            if instance_exists(map[gridX+i,gridY].occupant) and map[gridX+i,gridY].occupant.Owner != Owner and map[gridX+i,gridY].occupant.PassThrough = false{
                GiveDamage(map[gridX+i,gridY].occupant,AttackStat,5);
                break;
            }
            i += 1;
        }
    }else if Direction < 0{
        DistanceToMapEdge = gridX;
        repeat(DistanceToMapEdge){
            if instance_exists(map[gridX-i,gridY].occupant) and map[gridX-i,gridY].occupant.Owner != Owner{
                GiveDamage(map[gridX-i,gridY].occupant,AttackStat,5);
            }
            i += 1;
        }
    }
        
    
    
    AnimationTime = 0;
    State = "Return";
    
    
    
}










