
abilityData = ds_map_create();

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Fires a fireball in a straight line that explodes on contact with an enemy or at the edge of the map.";
abilityInfo[| 1] = sFireBallData;

abilityData[? oFireball] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Fires multiple projectiles in a cone";
abilityInfo[| 1] = sShotgunData;

abilityData[? oShotgun] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Throws a stun grenade at target location, stunning any who stand next to the explosion";
abilityInfo[| 1] = sStunGrenadeData;

abilityData[? oStunGrenade] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Heals allies in a radius around the caster";
abilityInfo[| 1] = sHealData;

abilityData[? oHeal] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Increases allies attack in a radius around the caster";
abilityInfo[| 1] = sAttackBuffData;

abilityData[? oAttackBuff] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Shortens allied movement and attack times in a radius around the caster";
abilityInfo[| 1] = sHasteData;

abilityData[? oHaste] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Creates a shield infront of the caster, that blocks ranged attacks and certain abilities";
abilityInfo[| 1] = sShieldData;

abilityData[? oShield] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Pushes enemies infront of the caster back by 4 tiles";
abilityInfo[| 1] = sPushData;

abilityData[? oPush] = abilityInfo;

abilityInfo = ds_list_create();
abilityInfo[| 0] = "Roots enemies into place in a radius infront of the caster";
abilityInfo[| 1] = sRootData;

abilityData[? oRootings] = abilityInfo;


abilityInfo = ds_list_create();
abilityInfo[| 0] = "Causes a debuff that knocksback enemies who take damage while the debuff is active";
abilityInfo[| 1] = sPushData;

abilityData[? oKnockback] = abilityInfo;

