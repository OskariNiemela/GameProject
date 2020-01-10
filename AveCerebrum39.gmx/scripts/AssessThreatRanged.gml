var Index, NumberOfCandidates;
Index = 0;
NumberOfCandidates = 0;

repeat(array_length_1d(oCursor.Party)){
    if instance_exists(oCursor.Party[Index]){
        ThreatCandidate[NumberOfCandidates] = oCursor.Party[Index];
        NumberOfCandidates += 1;
    }
    Index += 1;
}

    

var i, TargetThreat;
//Determine our target by checking for the highest ThreatLevel
i = 0;
TargetThreat = 0;
repeat(NumberOfCandidates){
    if  ThreatCandidate[i].Threat > TargetThreat{
        TargetThreat = ThreatCandidate[i].Threat;
        Target = ThreatCandidate[i];
    }
    i += 1;
}
