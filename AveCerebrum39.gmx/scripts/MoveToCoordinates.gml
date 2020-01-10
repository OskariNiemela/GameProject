//If we're above the intended yCoordinateMove
image_speed = AnimationSpeed;

//Move Vertically
    
if floor(y) < floor(yCoordinateMove)
{
    if sprite_index != MoveDown{
    sprite_index = MoveDown;
    }
    if(abs(y-yCoordinateMove)<=MySpeed)
    {
        y = floor(yCoordinateMove);
        vspeed = 0;
    }
    else
    {
        vspeed = MySpeed;
    }
}
else if floor(y) > floor(yCoordinateMove)
{
    if sprite_index != MoveUp{
        sprite_index = MoveUp
    }
    if(abs(y-yCoordinateMove)<=MySpeed)
    {
        y = floor(yCoordinateMove);
        vspeed = 0;
    }
    else
    {
        vspeed = -MySpeed;
    }
}   
else if floor(x) < floor(xCoordinateMove)
{
    if sprite_index != MoveRight{
        sprite_index = MoveRight    
    }
    
    if(abs(x-xCoordinateMove) <= MySpeed)
    {
        x = floor(xCoordinateMove);
        hspeed = 0;
    }
    else
    {
        hspeed = MySpeed;
    }
    //If we're to the left of our intended xCoordinateMove
}
else if floor(x) > floor(xCoordinateMove)
{
    if sprite_index != MoveLeft{
        sprite_index = MoveLeft;
    
    }
    
    if(abs(x-xCoordinateMove) <= MySpeed)
    {
        x = floor(xCoordinateMove);
        hspeed = 0;
    }
    else
    {
        hspeed = -MySpeed;
    }
}

    
            
        
        
    

