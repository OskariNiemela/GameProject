///AIDecideMelee(AbilityPositionX,AbilityPositionY);

AbilityPositionX = argument0;
AbilityPositionY = argument1;



if instance_exists(Target){
    CheckTargetPosition(AbilityPositionX,AbilityPositionY);
}

if MovementTimer <= 0 and State ="Idle"{
    State = "Assess";
}
