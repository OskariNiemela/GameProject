if(gridY > (oBattleScreen.mapHeight/2-1))
{
    //If we're in the lower half of the map
    var XX,YY;
    jumpX = gridX;
    XX = gridX;
    YY = gridY-4;

    for(a=4; a>0; a--)
    {
        if(map[XX,YY].occupant = noone)
        {
            jumpX = XX;
            jumpY = YY;
            break;
        }
        YY++;
    }
    jumpXPlace = map[jumpX,jumpY].x;
    jumpYPlace = map[jumpX,jumpY].y;
    jumpXStart = x;
    jumpYStart = y;
    jumpXPeak = jumpXPlace+70;
    jumpYPeak = jumpYPlace+abs(jumpYStart-jumpYPlace)/2;
    jumpTimer = 0;

}
else
{
    //If we're in the upper half of the map
    var XX,YY;
    jumpX = gridX;
    XX = gridX;
    YY = gridY+4;

    for(a=4; a>0; a--)
    {
        if(map[XX,YY].occupant = noone)
        {
            jumpX = XX;
            jumpY = YY;
            break;
        }
        YY--;
    }
    jumpXPlace = map[jumpX,jumpY].x;
    jumpYPlace = map[jumpX,jumpY].y;
    jumpXStart = x;
    jumpYStart = y;
    jumpXPeak = jumpXPlace+70;
    jumpYPeak = jumpYStart+abs(jumpYStart-jumpYPlace)/2;
    jumpTimer = 0;
    
}



