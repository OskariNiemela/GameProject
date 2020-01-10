///OverworldCharacterInitialize(MoveRight,MoveLeft,MoveUp,MoveDown,IdleUp,IdleRight,IdleLeft,IdleDown)
MySpeed = 200*DELTA_TIME;
Animating = false;
State = "Idle";
Event = "Idle";
Move = "Ver";
dir = -1;
image_speed = AnimationSpeed;
AnimationTime = 0;
Animation = noone;
AnimationTimer = 0;
AnimatingTime = 0;
Moved = false;
Dialogues = false;
MoveToPlayer = false;

MaxDepth = 60;

Interactable = noone;
interInstance = noone;

xCoordinateMove = 0;
yCoordinateMove = 0;

//Animations
MoveRight = argument0;
MoveLeft  = argument1;
MoveUp    = argument2;
MoveDown  = argument3;
IdleUp = argument4;
IdleRight = argument5;
IdleLeft = argument6;
IdleDown = argument7;
/*
TalkingUp = argument5;
TalkingDown = argument6;
TalkingRight = argument7;
TalkingLeft = argument8;
*/

textSound = sndText;

textPortrait = sBlankPortrait;
