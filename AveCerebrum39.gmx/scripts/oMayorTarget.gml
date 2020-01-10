TargetArray[0] = oCursor.Party[0];
TargetArray[1] = oCursor.Party[1];
target = noone;
var woop;
woop = false;

TargetVariableIndex = choose(0,1);

// TO DO - MAKE THE POWERBOMB ABILITY ONLY TARGET ACTORS WHO HAVENT YET BEEN POWERBOMBED


if instance_exists(TargetArray[TargetVariableIndex]){
    if(CurrentAction = oPowerbomb)
    {
        while(target = noone)
        {
            
            if(TargetArray[TargetVariableIndex].State != "Dead" and TargetArray[TargetVariableIndex].State != "Grounded")
            {
                target = TargetArray[TargetVariableIndex];
                break;
            }
            else
            {
                switch TargetVariableIndex
                {
                    case 0:
                        TargetVariableIndex = 1;
                    break;
                    
                    case 1:
                        TargetVariableIndex = 0;
                    break;                
                }
                
                    
            }
            
            if woop
            {
                target = noone;
                break;
            }
            woop = true;
            
        }
    
    }
    else
    {
        target = TargetArray[TargetVariableIndex];
    }
    
}else{

    var NumberOfViableTargets;
    NumberOfViableTargets = 2;
    TargetVariableIndex = 1;
    
    for(i=0;i<2;i+=1)
    {
        if instance_exists(TargetArray[i])
        {
            target = TargetArray[i]
            break;
        }   
    }
}

