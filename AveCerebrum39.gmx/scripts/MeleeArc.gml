///MeleeArc(AttackStat,Animation)
AttackStat = argument0;
Animation  = argument1;

if sprite_index != Animation{
    sprite_index = Animation
    image_index = 0;
    Timer = 0;
    //image_speed = AnimationSpeed
    AnimationTime = image_number*DELTA_TIME / image_speed;
}

Timer += DELTA_TIME


if Timer >= AnimationTime{
    audio_play_sound_on(oSFX.SFXEmitter,AttackSound,false,8);
    var b, i, Length, Target;
    i = 0;
    b = 2;
    Length = 2;
    if gridX+1 <= oCursor.MapWidth and instance_exists(map[gridX+1,gridY].occupant) and map[gridX+1,gridY].occupant.Owner != Owner{
        GiveDamage(map[gridX+1,gridY].occupant,AttackStat,5)
        
    }
    repeat(Length){
        if gridY-1 >= 0 and gridX+b <= oCursor.MapWidth and instance_exists(map[gridX+b,gridY-1].occupant) and map[gridX+b,gridY-1].occupant.Owner != Owner{
            GiveDamage(map[gridX+b,gridY-1].occupant,AttackStat,5)
        
        }
        if gridX+b <= oCursor.MapWidth and instance_exists(map[gridX+b,gridY].occupant) and map[gridX+b,gridY].occupant.Owner != Owner{
            GiveDamage(map[gridX+b,gridY].occupant,AttackStat,5)
        
        }
        if gridX+b <= oCursor.MapWidth and gridY+1 <= oCursor.MapHeight and instance_exists(map[gridX+b,gridY+1].occupant) and map[gridX+b,gridY+1].occupant.Owner != Owner{
            GiveDamage(map[gridX+b,gridY+1].occupant,AttackStat,5)
        
        }
        b += 1;
    }
    
    
    State = "Return";
    //sprite_index = Idle;
    AnimationTime = 0;
}

