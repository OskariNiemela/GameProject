currentLine = "Split";

if(effect)
{   
    effectLines = Messages[1,2];
    for(a=0;a<array_length_1d(effectLines);a++)
    {
        if(MessageCurrent==effectLines[a])
        {
            effectInstance = instance_create(x,y,Messages[1,1]);
            effectInstance.Owner = id;
            effectInstance.line = Messages[2,MessageCurrent];
            currentLine = "Effect";
            break;
        }
    }
}

