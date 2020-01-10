var Index, NumberOfCandidates;
Index = 0;
NumberOfCandidates = 0;


//Stoe all the relevant information about the potential targets in this loop
repeat(array_length_1d(oCursor.Party)){
    if instance_exists(oCursor.Party[Index]){
        //If the index exists, store the relevant information (BaseThreat,id,X coordinate,Y coordinate), and also add one to the count of how many target candidates we have.
        ThreatArray[NumberOfCandidates,0] = oCursor.Party[Index].Threat;
        ThreatArray[NumberOfCandidates,1] = oCursor.Party[Index].id;
        ThreatArray[NumberOfCandidates,2] = oCursor.Party[Index].gridX;
        ThreatArray[NumberOfCandidates,3] = oCursor.Party[Index].gridY;
        NumberOfCandidates += 1;
    }
    Index += 1;
}


var targNum;
targNum = irandom(NumberOfCandidates-1);

Target = ThreatArray[targNum,1];

if(Target.targeted = true)
{
    Target = noone;
    var threet;
    threet = 0;
    repeat(array_height_2d(ThreatArray))
    {
        if(ThreatArray[threet,1] != noone)
        {
            if(!ThreatArray[threet,1].targeted)
            {
                Target = ThreatArray[threet,1];
                break;
            }
        }

        threet++;
    }    


}






