///InitializeAi(Owner, Name, Type, AttackAnim, IdleAnim, DeathAnim,Ability1Anim,Ability2Anim,AttackReturnAnim,VictoryAnim,HurtAnim,PassThrough,StunnedAnim)
StopAbilities = false;
State = "Idle";

BodyIsWhole = true;

Owner = string(argument0);

flash = 0;
flashTim = 0.15;
flashElapsed = 0;

gridX = 0;
gridY = 0;

Name = string(argument1);

PartyNumber = noone;

//Abilities
WipedNodes = false;


//Actor's attack 
Type = string(argument2);
Target = noone;
Attacked = false;
UsingAbilities = false;

//Actor's attackers stats
Damage = 0;
SpecialDamageTaken = 0;
DamageMultiplier = 1;

//Variables related to pathing
MovementPath = path_add();
path_set_kind(MovementPath, 2);
path_set_closed(MovementPath, false);
MoveSpeed = 220*DELTA_TIME;


//Stuff Related to animation timing
State = "Idle";
Timer = 0;
//AnimationSpeed = 12*DELTA_TIME;
Attack = argument3;
Idle = argument4;
DeathAnimation = argument5;
Ability1Animation = argument6;
Ability2Animation = argument7;
Return = argument8;
AnimationTime = 0;
Victory = argument9;
Hurt = argument10;

//When we're hit by an attack our sprite will "Shake" 
Shake = false;
SpriteShakeAmount = 0;
//The duration which the sprite will shake (in seconds)
ShakeDuration = 1;
ShakeTime = 0;
ShakeDir = 1;


//Ability cooldowns and what ability animation we're currently using
AbilityCooldown1 = 0;
AbilityCooldown2 = 0;
TeamAbilityCooldown =0;
AbilityAnimation = noone;


//Stuff exclusively used by the AI but im putting here because im lazy
CheckNeighborTimer = 0;
//LastDirectionWeMovedIn n/a = not assigned HZ = Horizontal VT = Vertical
LastDirectionWeMovedIn = "n/a"

var i;
i = 0;
repeat(4){
    ThreatArray[i,0] = 0
    ThreatArray[i,1] = noone;
    ThreatArray[i,2] = 0;
    ThreatArray[i,3] = 0;
    i += 1;

}


//Whether bullets hurt this enemy or not. (if they dont they just pass through on to the next tile).
PassThrough = argument11;



Stunned = argument12;
//Pausing
PreviousState = noone;
AttackTimerPaused = 0;
MovementTimerPaused = 0;
AnimationFrame = noone;



//Boss AoE damage related 
CanTakeDamage = true;
TimeToTakeDamageMax = 5;
Timer = 0;





MaxDepth = 20;

//Stuff related to the new pathfinding stuff
PreviousTile = noone;
MoveScore = 0;
MoveDirection = "No";


Move = "No";

StunDuration = 0;

deadest = false;


