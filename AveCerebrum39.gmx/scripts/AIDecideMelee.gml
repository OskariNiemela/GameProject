///AIDecideMelee(AbilityPositionX,AbilityPositionY);

AbilityPositionX = argument0;
AbilityPositionY = argument1;

//Since our attack attacks all the surrounding tiles, we check them for enemies, and if we find one we attack
if AttackTimer <= 0{
    CheckNeighbors();
    
}
//Check the ability cooldown, if its equal to or less than zero mark our ability as ready(this changes the AI's movement in such a way, that it tries to get to the ideal position to use its ability instead of just trying to hit a normal attack).
if AbilityCooldown <= 0{
    AbilityReady = true;
    if instance_exists(Target){
        CheckTargetPosition(AbilityPositionX,AbilityPositionY);
    }
}
//
if AttackTimer <= 0 and EnemiesNextTo and State ="Idle" {
    State = "Attack";
}else if MovementTimer <= 0 and State ="Idle"{
    State = "Assess";
}
