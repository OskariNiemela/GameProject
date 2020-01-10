//Resets oGame event-,spawn flags and party roster, when going back to the main menu

with oGame{
    //Spawning flags
    rCabinInTheWoodsEncounters();
    rForestEncounters();
    rCabinInteriorEncounters();
    //Event Flags
    global.TestEventTrigger = true;
}











