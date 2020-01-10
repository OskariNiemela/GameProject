TargetArray[0] = oCursor.Party[0];
TargetArray[1] = oCursor.Party[1];
TargetArray[2] = oCursor.Party[2];

if CurrentAction = oDecapitate{
    TargetVariableIndex = choose(1,2);
    if instance_exists(TargetArray[TargetVariableIndex]) and TargetArray[TargetVariableIndex].BodyIsWhole{
        Target = TargetArray[TargetVariableIndex];
    }else{
        //if Target is decapitated, check the others
        var NumberOfViableTargets;
        NumberOfViableTargets = 2;
        TargetVariableIndex = 1;
        
        for(i=1;i=3;i+=1){
            if instance_exists(TargetArray[i]) and TargetArray[i].BodyIsWhole{
                Target = TargetArray[i]
                break;
            }
            if i = 2{
                //If no viable targets are found, put the boss in a waiting state for 5 seconds.
                State = "Waiting";
                WaitingTime = 5;
                break;
            }
        
        }
    }

}else{
    TargetVariableIndex = choose(0,1,2);
    if instance_exists(TargetArray[TargetVariableIndex]) and TargetArray[TargetVariableIndex].BodyIsWhole{
        Target = TargetArray[TargetVariableIndex];
    }else{
        //if Target is decapitated, check the others
        var NumberOfViableTargets, Index;
        NumberOfViableTargets = 3;
        TargetVariableIndex = 0;
        Index = 0;
        for(i=0;i<=3;i+=1){
            if instance_exists(TargetArray[Index]) and TargetArray[Index].BodyIsWhole{
                Target = TargetArray[Index]
                break;
            }
            if i = 2{
                //If no viable targets are found, put the boss in a waiting state for 5 seconds.
                State = "Waiting";
                WaitingTime = 5;
            }
        
        }
        
        
        
       
    }
}










