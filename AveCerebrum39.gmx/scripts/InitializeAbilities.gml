///InitializeAbilities(Ability1,Ability2,Ability3,TeamAbility,AbilityIcon1,AbilityIcon2,AbilityIcon3,AbilityCooldown1,AbilityCooldown2,AbilityCooldown3,TargetedAbility1,TargetedAbility2,TargetedAbility3)

//Ability array
var i;
i = 1
repeat(i+1){
    Abilities[i] = noone;
    i -=1

}
Abilities[0] = argument0;
Abilities[1] = argument1;
Abilities[2] = argument2;

TeamAbility[0] = argument3;

AbilityIcon[0] = argument4;
AbilityIcon[1] = argument5;
AbilityIcon[2] = argument6;

UsingAbility = noone;
BuffedSpeed = false;
BuffedHealth = false;


AbilityCooldown1Max = argument7;
AbilityCooldown2Max = argument8;
AbilityCooldown3Max = argument9;


for(i=0;i<3;i+=1){
    AbilitiesLockedOut[i] = false;
}

//Ability cooldowns and what ability animation we're currently using
AbilityCooldown1 = 0;
AbilityCooldown2 = 0;
AbilityCooldown3 = 0;
TeamAbilityCooldown =0;
AbilityAnimation = noone;



TargetedAbility1 = argument10;
TargetedAbility2 = argument11;
TargetedAbility3 = argument12;


TargetedAbilityAnims[0] = 0;
TargetedAbilityAnims[1] = 0;
TargetedAbilityAnims[2] = 0;
