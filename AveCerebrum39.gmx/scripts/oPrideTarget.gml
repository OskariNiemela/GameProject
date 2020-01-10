TargetArray[0] = oCursor.Party[0];
TargetArray[1] = oCursor.Party[1];
target = noone;
var woop;
woop = false;

TargetVariableIndex = choose(0,1);

// TO DO - MAKE THE POWERBOMB ABILITY ONLY TARGET ACTORS WHO HAVENT YET BEEN POWERBOMBED
//Choose the closest one if pissed
if pissed
{
    var first,second;
    
    first = TargetArray[0];
    second = TargetArray[1];
    
    if first!=noone and second != noone
    {
        var firstDis, secondDis;
        
        firstDis = abs(first.gridX-gridX)+abs(first.gridY-gridY);  
        
        secondDis = abs(second.gridX-gridX)+abs(second.gridY-gridY);
        
        if firstDis>secondDis
        {
            target = second;
        }
        else
        {
            target = first;
        }
    }
    else if first == noone
    {
        target = second;
    }
    else if second == noone
    {
        target = first;   
    }
}
else
{
    if instance_exists(TargetArray[TargetVariableIndex]){
        target = TargetArray[TargetVariableIndex];
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
}

