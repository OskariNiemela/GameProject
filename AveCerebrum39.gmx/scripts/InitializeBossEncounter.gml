///InitializeBossEncounter()
PassThrough = false;

gridX = 0;
gridY = 0;

Owner = "Enemy";


AnimationTime = 0;

//Abilities
WipedNodes = false;

//Actor's attack 
Target = noone;



//Actor's attackers stats
Damage = 0;
SpecialDamageTaken = 0;
DamageMultiplier = 1;



//Stuff Related to animation timing
Timer = 0;
//AnimationSpeed = 12*DELTA_TIME;


//When we're hit by an attack our sprite will "Shake" 
Shake = false;
SpriteShakeAmount = 0;
//The duration which the sprite will shake (in seconds)
ShakeDuration = 1;
ShakeTime = 0;
ShakeDir = 1;


//Stuff exclusively used by the AI but im putting here because im lazy

//LastDirectionWeMovedIn n/a = not assigned HZ = Horizontal VT = Vertical
LastDirectionWeMovedIn = "n/a"

var i;
i = 0;
repeat(3){
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





MaxDepth = 20;

flashTim = 0.15;
flashElapsed = 0;
flash = 0;


AttackTimer = 0;
AttackTime = 0;
MovementTimer = 0;
MovementTime = 0;

WaitBetweenAbilities = 0;



