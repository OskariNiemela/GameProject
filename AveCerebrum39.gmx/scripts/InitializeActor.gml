///InitializeActor(Owner, Name, Type, AttackAnim, IdleAnim, DeathAnim,Ability1Anim,Ability2Anim,Ability3Anim,AttackReturnAnim,VictoryAnim,HurtAnim,Portrait,Feet,Torso)
StopAbilities = false;
State = "Idle";

BodyIsWhole = true;

Owner = string(argument0);

gridX = 0;
gridY = 0;
queueX = 0;
queueY = 0;

Name = string(argument1);

PartyNumber = noone;

//Abilities
WipedNodes = false;

flashTim = 0.15;
flashElapsed = 0;
flash = 0;


//Actor's attack 
Type = string(argument2);
Target = noone;
Attacked = false;
UsingAbilities = false;

//Actor's attackers stats
Damage = 0;
SpecialDamageTaken = 0;
DamageMultiplier = 1;



//Stuff Related to animation timing
State = "Idle";
Timer = 0;
//AnimationSpeed = 12*DELTA_TIME;
Attack = argument3;
Idle = argument4;
DeathAnimation = argument5;
Ability1Animation = argument6;
Ability2Animation = argument7;
Ability3Animation = argument8;
Return = argument9;
AnimationTime = 0;
Victory = argument10;
Hurt = argument11;

//When we're hit by an attack our sprite will "Shake" 
Shake = false;
SpriteShakeAmount = 0;
//The duration which the sprite will shake (in seconds)
ShakeDuration = 1;
ShakeTime = 0;
ShakeDir = 1;

CharacterPortrait = argument12;


//Cut in half
Feet = argument13;
Torso = argument14;


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





//Pausing
PreviousState = noone;
AttackTimerPaused = 0;
MovementTimerPaused = 0;
AnimationFrame = noone;



//Boss AoE damage related 
CanTakeDamage = true;
TimeToTakeDamageMax = 5;
Timer = 0;


PassThrough = false;


MaxDepth = 20;

// Action queueu stuff
actionQueue = ds_queue_create();
currentAction = noone;
queuePainter = instance_create(x,y,oActorActions);
queuePainter.Owner = id;
targeted = false;

//Movement
Move = "No";
MovementQueue[0] = noone;

TargetedGridX = 0;
TargetedGridY = 0;

AbilityReturnAnimation = noone;

StunDuration = 0;
