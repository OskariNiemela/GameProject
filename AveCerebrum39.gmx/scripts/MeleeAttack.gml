///MeleeAttack(AttackStat,Animation)
AttackStat = argument0;
Animation  = argument1;

if sprite_index != Animation{
    sprite_index = Animation
    image_index = 0;
    Timer = 0;
    image_speed = AnimationSpeed
    AnimationTime = image_number*DELTA_TIME / image_speed;
}

Timer += DELTA_TIME

if Timer >= AnimationTime{
    audio_play_sound_on(oSFX.SFXEmitter,AttackSound,false,8);
    var Neighbors, i, Neighbor;
    NeighborsSize = ds_list_size(map[gridX,gridY].neighbors);
    i = 0;
    repeat(NeighborsSize){
       Neighbor = ds_list_find_value(map[gridX,gridY].neighbors,i);
       if instance_exists(Neighbor.occupant) and Neighbor.occupant.Owner != Owner{
            GiveDamage(Neighbor.occupant,AttackStat,5);
       }
       i += 1;
    }
    State = "Return";
    

    AnimationTime = 0;
}
