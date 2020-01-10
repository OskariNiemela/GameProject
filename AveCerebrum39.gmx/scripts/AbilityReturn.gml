if sprite_index != AbilityReturnAnimation{
    sprite_index = AbilityReturnAnimation;
    image_index = 0;
    Timer = 0;
    AnimationTime = image_number*DELTA_TIME / image_speed;
    image_speed = AnimationSpeed;
}
Timer += DELTA_TIME;
if Timer >= AnimationTime{
    State = "Idle";
    sprite_index = Idle;
}
