if(endY < startY)
{
    midY = startY - 200;
    
}
else
{
    midY = endY - 200;
}

if(endX > startX)
{
    midX = startX + abs(startX-endX)/2;
}
else
{
    midX = endX +abs(startX-endX)/2;
}

