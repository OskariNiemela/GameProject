///MoveInBezierCurve(time,startPos,midPos,endPos)

// 1>=time>=0 time needs to be between 1 and 0;
time = argument0;
startPos = argument1;
midPos = argument2;
endPos = argument3;
if (time > 1)
{
    time = 1;
}
return(sqr(1-time)*startPos+2*(1-time)*time*midPos+sqr(time)*endPos);
