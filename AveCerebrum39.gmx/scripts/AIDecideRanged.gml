///AIDecideRanged(AbilityPositionX,AbilityPositionY)

if State != "Paused"{
    AbilityPositionX = argument0;
    AbilityPositionY = argument1;
    
    if AttackTimer  <= 0{
        CheckYPlane();
         if AbilityCooldown <= 0{
        AbilityReady = true;
        if instance_exists(Target){
            CheckTargetPosition(AbilityPositionX,AbilityPositionY);
            }
        }
    
    }
    
    
    if AttackTimer <= 0 and EnemiesOnRow and State = "Idle" {
        State = "Attack";
    }else if MovementTimer <= 0 and State ="Idle"{
        State = "Assess";
    }
}
