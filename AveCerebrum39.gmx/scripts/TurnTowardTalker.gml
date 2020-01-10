var angle;
//Check where the player is in relation to us, and change our sprite accordingly
angle = point_direction(x,y,oPlayerWorld.x,oPlayerWorld.y);
angle = round(angle);
//Turn right
if((45>=angle and angle >=0) or (360 >= angle and angle >= 325))
{
    sprite_index = IdleRight;
}
//Turn UP
else if ( 135>= angle and angle > 45)
{
    sprite_index = IdleUp;
}
//Turn left
else if ( 225>= angle and angle > 135)  
{
    sprite_index = IdleLeft;
}
//Turn down
else
{
    sprite_index = IdleDown;
}
