//If we've selected a target
if instance_exists(Target){
    //Figure out which of the tiles in the primary directions is the one that is both open and closest to us
    var i, DistanceCandidate, DistanceTarget;
        DistanceTarget = 50000;
        
        if Target.gridY > 0 and map[Target.gridX,Target.gridY-1].occupant = noone{
            DistanceTarget = point_distance(x,y,map[Target.gridX,Target.gridY-1].x,map[Target.gridX,Target.gridY-1].y);
            TargetTile = map[Target.gridX,Target.gridY-1];
        }
        if Target.gridX > 0 and map[Target.gridX-1,Target.gridY].occupant = noone{
            DistanceCandidate = point_distance(x,y,map[Target.gridX-1,Target.gridY].x,map[Target.gridX-1,Target.gridY].y);
            if DistanceCandidate <= DistanceTarget{
                DistanceTarget = DistanceCandidate
                TargetTile = map[Target.gridX-1,Target.gridY];
            }
        }
            
        if Target.gridX < oCursor.MapWidth and map[Target.gridX+1,Target.gridY].occupant = noone{
            DistanceCandidate = point_distance(x,y,map[Target.gridX+1,Target.gridY].x,map[Target.gridX+1,Target.gridY].y);
            if DistanceCandidate <= DistanceTarget{
                DistanceTarget = DistanceCandidate
                TargetTile = map[Target.gridX+1,Target.gridY];
            }
        }
        
        if Target.gridY < oCursor.MapHeight and map[Target.gridX,Target.gridY+1].occupant = noone{
            DistanceCandidate = point_distance(x,y,map[Target.gridX,Target.gridY+1].x,map[Target.gridX,Target.gridY+1].y);
            if DistanceCandidate <= DistanceTarget{
                DistanceTarget = DistanceCandidate
                TargetTile = map[Target.gridX,Target.gridY+1];
            }
        }
    

}
