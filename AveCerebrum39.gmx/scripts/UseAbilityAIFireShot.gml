///UseAbilityAIFireShot(Animation,Damage)


//Take all the needed information as arguments for this script
Animation  = argument0;
DamageDone = argument1;


ProjectileHit = oFireDoT;
ProjectileMiss = oFireGround;



//Change our sprite to the animation we need to do
if sprite_index != Animation{
    image_index  = 0;
    sprite_index = Animation;
    
    
    Timer = 0;
    
    AnimationTime = image_number*DELTA_TIME / image_speed;
}

Timer = Timer + DELTA_TIME;

if Timer >= AnimationTime{
    //Go through all the tiles directly infront of our character, and deal damage to any enemies standing on them
    
    //Calculate the number of tiles from our current position to the edge of the map

    //Set i to 1 so we start with the tile directly infront of us, not the one we're standing on, that would be wasteful.
    
    for(i=1; i<=gridX;i+=1){
        if instance_exists(map[gridX-i,gridY].occupant) and map[gridX-i,gridY].occupant.Owner != Owner{
            var HitTarget, Fire;
            HitTarget = map[gridX-i,gridY].occupant;
            HitTarget.Damage += DamageDone;
            HitTarget.Shake  =  true;
            HitTarget.SpriteShakeAmount = 5;
            HitTarget.ShakeTime =   0;
            State = "Idle";
            sprite_index = Idle
            AbilityCooldown = AbilityCooldownMax
            AnimationTime = 0;
            Fire = instance_create(HitTarget.x,HitTarget.y,oFireDoT)
            Fire.Target = HitTarget
            break;
        }else if gridX-i = 0{
            var Fire;
            Fire = instance_create(map[0,gridY].x,map[0,gridY].y,ProjectileMiss);
            Fire.gridX = 0;
            AbilityCooldown = AbilityCooldownMax
            Fire.gridY = gridY;
            State = "Idle";
            sprite_index = Idle;
            break;
        }
   }
   
}












