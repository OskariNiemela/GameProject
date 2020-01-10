///CheckTargetPosition(PositionX,PositionY);

//Subtracting our gridX from the Targets gridX (plus the distance we want the target to be from us) should equal 0, same with Y, if the other position doesnt matter, just input it as 0.
PositionX = argument0;
PositionY = argument1;


if PositionX = 0 and PositionY = 0 and State = "Idle"{
    State = "UseAbility";
}
