///MakingAnEvent(sequenceArray,EventTrigger,ActorsArray,PlayersID);




sequenceArray = argument0;
EventTrigger = argument1;
ActorsArray = argument2;
PlayersID = argument3;
//Create the eventmanager object, which will give all the instructions to the actors on what to do in the event
Event = instance_create(x,y,oEventManager);
//Pass on all the event information to the event manager object
var NumberOfAnimations, NumberOfDialogue,AnimationIndex,DialogueIndex, NumberOfThings, IndexOfThings,NumberOfActors,ActorsIndex;
NumberOfActors = array_length_1d(ActorsArray);
ActorsIndex = 0;
Player.ManagingEvent = Event;
repeat(NumberOfActors){

    if(instance_exists(ActorsArray[ActorsIndex]))
    {
        ActorsArray[ActorsIndex].State = "Event";
        ActorsArray[ActorsIndex].ManagingEvent = Event;
        Event.Actors[ActorsIndex] = ActorsArray[ActorsIndex];
        
    }
    ActorsIndex += 1;
}

Event.sequenceList = sequenceArray;
ds_map_replace(global.eventFlagsMap,EventTrigger,false);
