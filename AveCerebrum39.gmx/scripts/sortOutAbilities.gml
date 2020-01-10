
for(a=0;a<ds_list_size(Abilities);a++)
{
    anims = abilityAnims[? Abilities[| a]];    
    AbilityIcon[a] = anims[| 4];
    
    
    //If ability is targeted
    if(anims[| 0])
    {
        TargetedAbilityAnims[a] = anims[| 6];
        switch a
        {
            case 0:
                AbilityCooldown1Max = anims[| 3];
                Ability1Animation = anims[| 1];
                Ability1ReturnAnimation = anims[| 2];
                TargetedAbility1 = anims[| 0];
                Ability1Sound = anims[| 5];
            break;
            
            
            case 1:
                AbilityCooldown2Max = anims[| 3];
                Ability2Animation = anims[| 1];
                Ability2ReturnAnimation = anims[| 2];
                TargetedAbility2 = anims[| 0];
                Ability2Sound = anims[| 5];
            break;
            
            
            case 2:
                AbilityCooldown3Max = anims[| 3];
                Ability3Animation = anims[| 1];
                Ability3ReturnAnimation = anims[| 2];
                TargetedAbility3 = anims[| 0];
                Ability3Sound = anims[| 5];
            break;
        
        
        
        }        
    
    
    }
    //If ability is not targeted
    else
    {
        switch a
        {
            case 0:
                AbilityCooldown1Max = anims[| 3];
                Ability1Animation = anims[| 1];
                Ability1ReturnAnimation = anims[| 2];
                TargetedAbility1 = anims[| 0];
                Ability1Sound = anims[| 5];
            break;
            
            
            case 1:
                AbilityCooldown2Max = anims[| 3];
                TargetedAbility2 = anims[| 0];
                Ability2ReturnAnimation = anims[| 2];
                Ability2Animation = anims[| 1];
                Ability2Sound = anims[| 5];
            break;
            
            
            case 2:
                AbilityCooldown3Max = anims[| 3];
                Ability3Animation = anims[| 1];
                Ability3ReturnAnimation = anims[| 2];
                TargetedAbility3 = anims[| 0];
                Ability3Sound = anims[| 5];
            break;
        
        
        
        }     
    
    }

}
