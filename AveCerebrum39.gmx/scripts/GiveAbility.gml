///GiveAbility(Actor,Ability,desc,menuSprite)

actor = argument0;
ability = argument1;
desc = argument2;
menu = argument3;

arr = oGame.PlayerParty2[? actor];
allAb = arr[| 1];

ds_list_add(allAb,ability);

data = ds_list_create();
data[| 0] = desc;
data[| 1] = menu;

abilityData = oGame.abilityData;

abilityData[? ability] = data;


