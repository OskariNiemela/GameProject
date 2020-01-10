if sprite_index != Teleport{
    sprite_index = Teleport;
    image_index = 0;
    AnimationTime = image_number*DELTA_TIME/image_speed;
    Timer = 0;
}
Timer += DELTA_TIME;

if Timer >= AnimationTime{
    sprite_index = Fly;
    map[gridX,gridY].occupant = noone;
    State = "FlyAway";
    Timer = 0;
}
