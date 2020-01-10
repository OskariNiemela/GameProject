
//Variables needed to go through the oCursor party array
var Index, NumberOfCandidates;
Index = 0;
NumberOfCandidates = 0;


//Store all the relevant information about the potential targets in this loop
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






//Now take the distance of the node in to consideration
var i,BaseThreat;
i = 0;

while ThreatArray[i,1] != noone{
    BaseThreat = ThreatArray[i,0];
    //Divide the base threat by the total distance to the target to get the actual threat of the target.
    ThreatArray[i,0] = BaseThreat/(round(((abs(gridX-ThreatArray[i,2])+abs(gridY-ThreatArray[i,3]))/3)+1));
    i += 1;
}



    

var b, TargetThreat;
//Determine our target by checking for the highest Threat
b = 0;
TargetThreat = 0;
repeat(NumberOfCandidates){
    if  ThreatArray[b,0] > TargetThreat{
        TargetThreat = ThreatArray[b,0];
        Target = ThreatArray[b,1];
    }
    b += 1;
}




