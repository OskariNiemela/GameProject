///InitializeStats(Attack, Mdef, Rdef, Crit%, Speed, HP,ResurrectTime)

//character statistics


AttackStats = argument0;
MeleeDefence = argument1;
RangedDefence = argument2;
CriticalStrikeChance = argument3;
//Doesnt matter for player characters, but for AI speed stat will determine the time inbetween each movement&attack
Speed = argument4;
MinAttack = 1 + floor(AttackStats/1.5);

MaxHitPoints = argument5;
HitPoints = MaxHitPoints;

Heal = 0;
ResurrectTime = argument6;

setBack = 2;
