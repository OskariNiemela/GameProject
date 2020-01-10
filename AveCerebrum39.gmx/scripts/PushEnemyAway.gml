///PushEnemyAway(Pushee,PushLength)
CanPush = false;
Pushee = argument0;
PushLength = argument1;
var TileToPushTo, xTo,xFrom,yTo,yFrom, Pushy;
var whati;
xTo = Pushee.gridX;
Pushy = Pushee;
yTo = Pushee.gridY;
xFrom = xTo;
yFrom = yTo
TileToPushTo = map[Pushee.gridX,Pushee.gridY];
//If our push would push the pushee out of the map, just set their X coordinate to MapWidth
for(i=1;i<=PushLength;i+=1){
        Pushee = Pushy
        whati = i
        if Pushee.gridX+i <= oCursor.MapWidth
        {
            if map[Pushee.gridX+i,Pushee.gridY].occupant != noone
            {
                if(PushEnemyAway(map[Pushee.gridX+i,Pushee.gridY].occupant, PushLength-i+1))
                {
                    i = whati;
                    whati = i;
                    Pushee = Pushy;
                    xTo = Pushee.gridX+i;
                    TileToPushTo = map[xTo,Pushee.gridY];
                    CanPush = true;
                }
                else
                {
                    break;
                }
            }
            else
            {
                Pushee = Pushy;
                xTo = Pushee.gridX+i;
                TileToPushTo = map[xTo,Pushee.gridY];
                CanPush = true;
            }

        }else{
            break;
        }
}

if TileToPushTo != map[Pushee.gridX,Pushee.gridY]{
    Pushee = Pushy;
    map[Pushee.gridX,Pushee.gridY].occupant = noone;
    Pushee.gridX = TileToPushTo.gridX;
    Pushee.gridY = TileToPushTo.gridY;
    Pushee.x = TileToPushTo.x;
    Pushee.y = TileToPushTo.y;
    TileToPushTo.occupant = Pushee;
}
return CanPush;
