if sprite_index != Return{
    sprite_index = Return
    image_index  = 0;

    
    
    Timer = 0;
    
    AnimationTime = image_number*DELTA_TIME / image_speed;

}

Timer += DELTA_TIME;


if Timer >= AnimationTime{
    State = "Idle";
    sprite_index = Idle;


}
