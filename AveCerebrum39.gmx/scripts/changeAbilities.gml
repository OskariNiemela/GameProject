///changeAbilities(ActiveAbility,AbilityChange)

abilityActive = argument0;
abilityChange = argument1;

//Go through the activeAbilities and check that the abilityChange isnt already in there
pepThis = oGame.PlayerParty2[? characterKey];
activ = pepThis[| 0];
allAb = pepThis[| 1];

var change;
change = true;

for(c=0;c<3;c++)
{
    if(activeAbilities[| c] = abilityChange)
    {
        change = false;
        break;
    }
}



if change
{
    activ[| activeIndex] = allAb[| abilityIndex];
    activeAbilities[| activeIndex] = abilityChange;
}

select1 = undefined;
select2 = undefined;
