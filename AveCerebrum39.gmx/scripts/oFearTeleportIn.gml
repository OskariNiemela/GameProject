
if sprite_index != sFearAppear{
    image_index = 0;
    sprite_index = sFearAppear;
    AnimationTime = image_number*DELTA_TIME/image_speed;
    Timer = 0;
    gridX = DestinationGridX;
    gridY = DestinationGridY;
    map[gridX,gridY].occupant = id;
    x = map[gridX,gridY].x;
    y = map[gridX,gridY].y;
}

Timer += DELTA_TIME;


if Timer >= AnimationTime{
    State = StateToGoTo;

}
