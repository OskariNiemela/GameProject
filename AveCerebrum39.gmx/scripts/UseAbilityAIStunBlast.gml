///UseAbilityAIStunBlast(Animation)
Animation = argument0;



if sprite_index != Animation{
    image_index  = 0;
    sprite_index = Animation;
    
    
    Timer = 0;
    
    AnimationTime = image_number*DELTA_TIME / image_speed;
}

Timer = Timer + DELTA_TIME;


if Timer >= AnimationTime{
    instance_create(x,y,oStunBlastAI);
    var b, i, Length;
    i = 0;
    b = 2;
    Length = 2;
    if gridX > 1 and instance_exists(map[gridX-1,gridY].occupant) and map[gridX-1,gridY].occupant.Owner != Owner{
        //If there is a opponent directly infront of us give em some damage
        map[gridX-1,gridY].occupant.State = "Stunned";
        map[gridX-1,gridY].occupant.StunDuration = 8;
    }
    repeat(Length){
        if gridX-b >= 0 and gridY >= 1 and instance_exists(map[gridX-b,gridY-1].occupant) and map[gridX-b,gridY-1].occupant.Owner != Owner{
            map[gridX-b,gridY-1].occupant.State ="Stunned";
            map[gridX-b,gridY-1].occupant.StunDuration = 5;
        
        }
        if gridX-b >= 0 and instance_exists(map[gridX-b,gridY].occupant) and map[gridX-b,gridY].occupant.Owner != Owner{
            map[gridX-b,gridY].occupant.State ="Stunned";
            map[gridX-b,gridY].occupant.StunDuration = 5;
        
        }
        if gridY <= oCursor.MapHeight and gridX-b >= 0 and instance_exists(map[gridX-b,gridY+1].occupant) and map[gridX-b,gridY+1].occupant.Owner != Owner{
            map[gridX-b,gridY+1].occupant.State ="Stunned";
            map[gridX-b,gridY+1].occupant.StunDuration = 5;
        }
        b += 1;
    }
    
    
    State = "ReturnAbil";
    AnimationTime = 0;
    Timer = 0;
    AbilityCooldown = AbilityCooldownMax
    AbilityReady = false;




}
